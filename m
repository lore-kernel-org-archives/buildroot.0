Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF8BC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 14:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACCF440169;
	Tue,  2 Jan 2024 14:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACCF440169
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tPjYY1BDA8aQ; Tue,  2 Jan 2024 14:52:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2EDE408D8;
	Tue,  2 Jan 2024 14:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2EDE408D8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 41D4C1BF38E
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 14:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 171C4817AC
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 14:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 171C4817AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UaUv7BMgDhfH for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 14:52:13 +0000 (UTC)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F16E4817A2
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 14:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F16E4817A2
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5563944b3dfso1685056a12.3
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 06:52:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704207131; x=1704811931;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tstL0+QsPBrLajPkKf9X2CoTzuHmXhTbyh/xXNtb2XI=;
 b=cWrD1lFfI7cdFb67w7pSss1TGrI+/DqLwQCX7jJHLwB8B69AEKl7cPVnXlQN3vxIWU
 4YtdvqtRDXxo7MPhm49YLVcbSs8IFSlv6knlTqLx7Sy1VcTjnO1DRPvz7utDoJzsPOzZ
 LH+hS83xeT3MElA1rVhZCrM0WGTj7zTnnsAzPfwkML9XIOgAjKFF27Lt6/v+A2g14cMH
 zF7KonssAtA2zxh1p5BCKfhmt/GwljR4Z+0aYC4ds43XukOrWsStxupXt9r9rop2nTeQ
 RYFOX9pik5OHzQuvweC1suMs83vYF9rWbP8Jn9MAGJikVgHBLtrVzCFFvf28YStAy1gc
 aNCw==
X-Gm-Message-State: AOJu0YzEdY1d+u+cHn3gIq8wqHXBaR0lpzvRFbo2cGLjBYPDlz6REcQv
 2yDDlApIW13TQkALU1xm+AnZJoBTb7jKZFYZhMe4EqquDoD7MQ==
X-Google-Smtp-Source: AGHT+IFiJHgU/Fonm68S6StjKWX54DFtpx2dSpZbVitRDQT1f+VmWngmHgYT+LU9no5ACQHlAGvjqg==
X-Received: by 2002:a17:907:74d:b0:a27:5453:7bd6 with SMTP id
 xc13-20020a170907074d00b00a2754537bd6mr5617003ejb.1.1704207130828; 
 Tue, 02 Jan 2024 06:52:10 -0800 (PST)
Received: from krabice.lan (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
 by smtp.gmail.com with ESMTPSA id
 fp21-20020a1709069e1500b00a26ade46619sm11048676ejc.121.2024.01.02.06.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 06:52:10 -0800 (PST)
From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 15:50:27 +0100
Message-Id: <20240102145029.242682-1-sairon@sairon.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sairon.cz; s=google; t=1704207131; x=1704811931; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tstL0+QsPBrLajPkKf9X2CoTzuHmXhTbyh/xXNtb2XI=;
 b=Kv4oksxzjPAQoEkM7AVxZrtJd0eBIHI7Qkf4ouYfV1uyYyapV7Tdf9JjuWDr9JCnZG
 7bQ70g/QM3cgp0X5gSxBzrMGMxLK/TXwyb/xtAIMzYBl4BF2991AV5wpqarO38cbtpj1
 ppbi5C+yor4qmyGcS/7+YhddUsUJ5PeRoEuV0Vokj9EfDdluGdPaiEsAEACoWfV6LF0x
 MeWN6DUyfMMsQ+mCinF6+Mr9FgCTVrPxnwxk0BE2q8gOFt3cr6APawQjD+foyvLr+qaC
 JpqEL85kcDKXVtJi3R/gown2e9cDXESw5V/0yG3cZxyrr0Q04ls2i5eSmVjaISfDBkU3
 b7ZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz
 header.a=rsa-sha256 header.s=google header.b=Kv4oksxz
Subject: [Buildroot] [PATCH 1/2] package/linux-firmware: add rtw89 firmware
 files
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>,
 Bernd Kuhls <bernd@kuhls.net>, "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIGZpbGVzIGZvciBydHc4OSBkcml2ZXIgYW5kIGV4dGVuZCBoZWxwIHRleHQgZm9yIHJ0dzg4
IG9wdGlvbiBhIGJpdC4KClNpZ25lZC1vZmYtYnk6IEphbiDEjGVybcOhayA8c2Fpcm9uQHNhaXJv
bi5jej4KLS0tCiBwYWNrYWdlL2xpbnV4LWZpcm13YXJlL0NvbmZpZy5pbiAgICAgICAgIHwgOCAr
KysrKysrLQogcGFja2FnZS9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZS5tayB8IDcgKysr
KysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9saW51eC1maXJtd2FyZS9Db25maWcuaW4gYi9wYWNrYWdlL2xp
bnV4LWZpcm13YXJlL0NvbmZpZy5pbgppbmRleCA1YmVmZTUwMTIyLi4xMjIxYTgwOTg0IDEwMDY0
NAotLS0gYS9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL2xp
bnV4LWZpcm13YXJlL0NvbmZpZy5pbgpAQCAtNDIyLDcgKzQyMiwxMyBAQCBjb25maWcgQlIyX1BB
Q0tBR0VfTElOVVhfRklSTVdBUkVfUlRMX1JUVzg4CiAJYm9vbCAiUmVhbHRlayBydHc4OCIKIAlo
ZWxwCiAJICBGaXJtd2FyZSBpbWFnZXMgc3VwcG9ydGVkIGJ5IFJlYWx0ZWsncyB3aXJlbGVzcwot
CSAgZHJpdmVyIHJ0dzg4LgorCSAgZHJpdmVyIHJ0dzg4ICg4MDIuMTFuL2FjIGNoaXBzZXRzKS4K
KworY29uZmlnIEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFX1JUTF9SVFc4OQorCWJvb2wgIlJl
YWx0ZWsgcnR3ODkiCisJaGVscAorCSAgRmlybXdhcmUgaW1hZ2VzIHN1cHBvcnRlZCBieSBSZWFs
dGVrJ3Mgd2lyZWxlc3MKKwkgIGRyaXZlciBydHc4OSAoODAyLjExYXggY2hpcHNldHMpLgogCiBj
b25maWcgQlIyX1BBQ0tBR0VfTElOVVhfRklSTVdBUkVfUkVEUElORV9SUzkxMTMKIAlib29sICJS
ZWRwaW5lIHJzOTExMyIKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGludXgtZmlybXdhcmUvbGludXgt
ZmlybXdhcmUubWsgYi9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlLm1rCmlu
ZGV4IDk2OTA1ZGQ5MDkuLmQwNjFjOWY0MDIgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGludXgtZmly
bXdhcmUvbGludXgtZmlybXdhcmUubWsKKysrIGIvcGFja2FnZS9saW51eC1maXJtd2FyZS9saW51
eC1maXJtd2FyZS5tawpAQCAtMTcxLDYgKzE3MSwxMyBAQCBMSU5VWF9GSVJNV0FSRV9GSUxFUyAr
PSBcCiBMSU5VWF9GSVJNV0FSRV9BTExfTElDRU5TRV9GSUxFUyArPSBMSUNFTkNFLnJ0bHdpZmlf
ZmlybXdhcmUudHh0CiBlbmRpZgogCisjIHJ0dzg5CitpZmVxICgkKEJSMl9QQUNLQUdFX0xJTlVY
X0ZJUk1XQVJFX1JUTF9SVFc4OSkseSkKK0xJTlVYX0ZJUk1XQVJFX0ZJTEVTICs9IFwKKwlydHc4
OS9ydHcqLmJpbgorTElOVVhfRklSTVdBUkVfQUxMX0xJQ0VOU0VfRklMRVMgKz0gTElDRU5DRS5y
dGx3aWZpX2Zpcm13YXJlLnR4dAorZW5kaWYKKwogIyBhcjMwMTEKIGlmZXEgKCQoQlIyX1BBQ0tB
R0VfTElOVVhfRklSTVdBUkVfQVIzMDExKSx5KQogTElOVVhfRklSTVdBUkVfRklMRVMgKz0gYXRo
M2stMS5mdwotLSAKMi4zNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
