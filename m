Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348F4C433F5
	for <buildroot@archiver.kernel.org>; Thu,  7 Apr 2022 16:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1102612A9;
	Thu,  7 Apr 2022 16:41:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5-LIlvF1EwKC; Thu,  7 Apr 2022 16:41:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF328612A6;
	Thu,  7 Apr 2022 16:41:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11B251BF312
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 16:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00DFD84128
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 16:41:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uuuwsAf7u8XI for <buildroot@lists.busybox.net>;
 Thu,  7 Apr 2022 16:41:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F23CF840F1
 for <buildroot@buildroot.org>; Thu,  7 Apr 2022 16:41:46 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id r7so3941636wmq.2
 for <buildroot@buildroot.org>; Thu, 07 Apr 2022 09:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tYU9ckFSNwFsLTaPCgDlloceAhfkGtYRbod/kDrGsHY=;
 b=J8hciHA+4BZy/ZQd5NSkeZUToOCX1fCdmDyVxlhMgW63qvwRTyLI3ecKxuZAXJork8
 f8T2hQjkeaa8d9oFavMsI1XJqYEJ5zcxLc41OVYOXVGLILdGW0IzrxqRlE75dnnk49BA
 iVGRB7WiaY2WhtryNmfTsxK9Qz446ochCv0+IdRWB49yaBoJjPqEanFD6c3LWXVz2bW1
 v+pt8Ej6uLAdRGbD7fd9xV2voIgLzp/HGQMCNLB1SlrRLn0gNbkHsNPPAbd6ry9Ok+tb
 QhpHt9mcud5ipjlCHC7AEHwGdE6NgIbJfn3l1uBMgoUVoetqpfifRcBIUt3JutN1w6tQ
 Ocrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tYU9ckFSNwFsLTaPCgDlloceAhfkGtYRbod/kDrGsHY=;
 b=K2rJ4fQjYe+rr1S/qmoaZu8l8TLAYzDHW9TkoJuN7cz8EugFpr7pFh3+Bvl4NFD62P
 ixNARPeri4ngMTvPR1N+hOjE46mew9KfwGFYG9BZws3dpJHE7onMKH0r7Umu2UYHVO29
 w+IUstaEZ5bBYoNTFVXcFl8L+qnbVrQzS0UCAA2t+XInow6/zeT1T4f2ilg+d/gO9gNt
 iW0Ujsw9yf6x5TTbt3gKj6u2bwqzYWdILj1qYVFMoxI/Ptvp/K2E0KNy7j3K9CFhXXev
 Ehx7ZVi2i/ReJu2W/7GSjEJpVSv1pukc/ojQFJa++9Q/w0sFLqPtYEKqK6+QWbzbNy7E
 4V1Q==
X-Gm-Message-State: AOAM530cRX6OpAPa2B+Kgn2cVYyAEOS8/0pAppLIdFd2MZ9svp3Yb/ro
 nEyB9QjARkKwbVzO21qyxhB+vx0jhtA=
X-Google-Smtp-Source: ABdhPJxusBbpdfeEYvuMcrLKNi/uH6wLpYOpsB/2SnX6X4pKUqT2vmRJNDBEQxiArAi+WjkvgvB3SQ==
X-Received: by 2002:a05:600c:4f46:b0:38c:d4cd:ee31 with SMTP id
 m6-20020a05600c4f4600b0038cd4cdee31mr13088436wmq.16.1649349704679; 
 Thu, 07 Apr 2022 09:41:44 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a05600c500f00b0038cfb1a43d6sm8109008wmr.24.2022.04.07.09.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 09:41:43 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  7 Apr 2022 18:39:47 +0200
Message-Id: <20220407163947.1024467-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/systemd: doesn't build with libressl
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

c3lzdGVtZCBkb2Vzbid0IHBsYW4gdG8gZml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSB3
aXRoIGxpYnJlc3NsCihodHRwczovL2dpdGh1Yi5jb20vc3lzdGVtZC9zeXN0ZW1kL2lzc3Vlcy8x
NDkyOCkgYW5kIEVEMjU1MTkgc3VwcG9ydAppcyBzdGlsbCBub3QgYXZhaWxhYmxlIGluIGxpYnJl
c3NsCihodHRwczovL2dpdGh1Yi5jb20vbGlicmVzc2wtcG9ydGFibGUvcG9ydGFibGUvaXNzdWVz
LzM5MyBvcGVuZWQgZm9yCm1vcmUgdGhhbiAzIHllYXJzKToKCi4uL3NyYy9ob21lL2hvbWVkLW1h
bmFnZXIuYzogSW4gZnVuY3Rpb24g4oCYbWFuYWdlcl9nZW5lcmF0ZV9rZXlfcGFpcuKAmToKLi4v
c3JjL2hvbWUvaG9tZWQtbWFuYWdlci5jOjEzOTM6MzU6IGVycm9yOiDigJhFVlBfUEtFWV9FRDI1
NTE54oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBt
ZWFuIOKAmEVWUF9QS0VZX0RTQTHigJk/CiAxMzkzIHwgICAgICAgICBjdHggPSBFVlBfUEtFWV9D
VFhfbmV3X2lkKEVWUF9QS0VZX0VEMjU1MTksIE5VTEwpOwogICAgICB8ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+CiAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIEVWUF9QS0VZX0RTQTEKCkZpeGVzOgogLSBodHRwOi8vYXV0
b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy80N2YzMWIzNmYxMjNjNGJlNDY2MWY0ZmRlMmQx
ZjczODVjNWQwZWQ1CgpTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5m
YWJyaWNlQGdtYWlsLmNvbT4KLS0tCiBwYWNrYWdlL3N5c3RlbWQvQ29uZmlnLmluICB8IDIgKysK
IHBhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLm1rIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3N5c3RlbWQv
Q29uZmlnLmluIGIvcGFja2FnZS9zeXN0ZW1kL0NvbmZpZy5pbgppbmRleCBjYzA3MzY1NjFlLi4w
MGM4MTcxNzJkIDEwMDY0NAotLS0gYS9wYWNrYWdlL3N5c3RlbWQvQ29uZmlnLmluCisrKyBiL3Bh
Y2thZ2Uvc3lzdGVtZC9Db25maWcuaW4KQEAgLTIzNCw2ICsyMzQsNyBAQCBjb25maWcgQlIyX1BB
Q0tBR0VfU1lTVEVNRF9IT01FRAogCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IRUFERVJTX0FU
X0xFQVNUXzRfMTIgIyBmc2NyeXB0X2tleQogCXNlbGVjdCBCUjJfUEFDS0FHRV9DUllQVFNFVFVQ
CiAJc2VsZWN0IEJSMl9QQUNLQUdFX09QRU5TU0wKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfT1BFTlNT
TF9GT1JDRV9MSUJPUEVOU1NMCiAJc2VsZWN0IEJSMl9QQUNLQUdFX1VUSUxfTElOVVhfTElCRkRJ
U0sKIAloZWxwCiAJICBzeXN0ZW1kLWhvbWVkIGlzIGEgc3lzdGVtIHNlcnZpY2UgdGhhdCBtYXkg
YmUgdXNlZCB0byBjcmVhdGUsCkBAIC00MTIsNiArNDEzLDcgQEAgY29uZmlnIEJSMl9QQUNLQUdF
X1NZU1RFTURfUkFORE9NU0VFRAogY29uZmlnIEJSMl9QQUNLQUdFX1NZU1RFTURfUkVQQVJUCiAJ
Ym9vbCAiZW5hYmxlIHJlcGFydCBzdXBwb3J0IgogCXNlbGVjdCBCUjJfUEFDS0FHRV9PUEVOU1NM
CisJc2VsZWN0IEJSMl9QQUNLQUdFX09QRU5TU0xfRk9SQ0VfTElCT1BFTlNTTAogCXNlbGVjdCBC
UjJfUEFDS0FHRV9VVElMX0xJTlVYX0xJQkZESVNLCiAJaGVscAogCSAgc3lzdGVtZC1yZXBhcnQg
Z3Jvd3MgYW5kIGFkZHMgcGFydGl0aW9ucyB0byBhIHBhcnRpdGlvbiB0YWJsZSwKZGlmZiAtLWdp
dCBhL3BhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLm1rIGIvcGFja2FnZS9zeXN0ZW1kL3N5c3RlbWQu
bWsKaW5kZXggOWZlZWQ5YzA4NC4uNThhMTM3NmI1MSAxMDA2NDQKLS0tIGEvcGFja2FnZS9zeXN0
ZW1kL3N5c3RlbWQubWsKKysrIGIvcGFja2FnZS9zeXN0ZW1kL3N5c3RlbWQubWsKQEAgLTQ5OCw3
ICs0OTgsNyBAQCBlbHNlCiBTWVNURU1EX0NPTkZfT1BUUyArPSAtRG5zcy1yZXNvbHZlPWZhbHNl
IC1EcmVzb2x2ZT1mYWxzZQogZW5kaWYKIAotaWZlcSAoJChCUjJfUEFDS0FHRV9PUEVOU1NMKSx5
KQoraWZlcSAoJChCUjJfUEFDS0FHRV9MSUJPUEVOU1NMKSx5KQogU1lTVEVNRF9DT05GX09QVFMg
Kz0gXAogCS1EZ251dGxzPWZhbHNlIFwKIAktRG9wZW5zc2w9dHJ1ZSBcCi0tIAoyLjM1LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
