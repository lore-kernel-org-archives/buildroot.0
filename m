Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367FEC433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 21:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E576C404B0;
	Thu, 12 May 2022 21:49:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oeSfhg_hpQOI; Thu, 12 May 2022 21:49:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0781B40487;
	Thu, 12 May 2022 21:49:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D0DCE1BF3D4
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 21:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFDBB60B4F
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 21:49:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yXJfOa3wqqlT for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 21:49:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D928760634
 for <buildroot@buildroot.org>; Thu, 12 May 2022 21:49:14 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id m1so8996076wrb.8
 for <buildroot@buildroot.org>; Thu, 12 May 2022 14:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cHfTdrI+vq89XmPyYa6BGbaHaihfOVyETFStaFNsIts=;
 b=YkUW+DDd5NWQtDq18q400yKr6OqHaBTwY1MdUgOHbup8z5WbmeqMiDodP62xfzIoP8
 YENYzwpkoiYN6E2We5tK7T54N3p04HKDNdshI8PbQVXH+udjdfS36Tup1goUSpBlzsXK
 mQ5xoluZNK4oJroCY2js3WDh/CMrE5l356gaZWRqvph9ZNRdrfct0wCnwOZ12AQDqQHu
 yXBTr5hw/d70yqsKoVSOLLsVA3iZBt3TazHUfES3xnfdVgnoXS/6d6bLw9KYC5wtGh9X
 2YEfdmjnc8SpjkOg1m/9aYiknuhOh2IpZXpjd8LX3UtCdoahv7rOO2jVJv0DUXyrI4tw
 zpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cHfTdrI+vq89XmPyYa6BGbaHaihfOVyETFStaFNsIts=;
 b=X2TBr1FFe8s77WAVigq0jwb0GT44qR7j++wlkkPV8aHgwBckzcSodM0XtX/BKOsLok
 KUzErgZRWpRzEBk9M/hPtusUBVyfBks7L9UXHBkwzIkXpsFIpvZyU2KfAKpj9chwlMkj
 K61k7QDAKyRqnawgM9Kcv5Qgj6o30Ziof32Dm+l3SXlYAxU0AYnQucTfa7YMzogVSvCI
 OlOs8pVM0VM17mFGBnJQtgnO2KcJRhn+khiTgu3UoUhW2WHpaaswaqSCEmWjhlD45NAa
 wHDr1BRGr7/kinwR/EemxRYPCBnKnz/Op4XPTslQAqEMZzb2P6ppPO6cg8GpzMC93D84
 lo2A==
X-Gm-Message-State: AOAM530ZgY+2knhe7UTD1ZlKxQ9s/5eSGZFkjdm/JzNfEGK0KbIDLg9o
 ZgOKWecKBqu+s2Qs22Iu+wARXuFVTHA=
X-Google-Smtp-Source: ABdhPJzRuO9g7SmN9RPc01mzYiM6wb3dAeQy+LWVWUgq0JJokk9o/tP6apo6rHeb4rwF853hoepFqg==
X-Received: by 2002:a5d:680f:0:b0:20a:d858:f703 with SMTP id
 w15-20020a5d680f000000b0020ad858f703mr1363647wru.414.1652392152990; 
 Thu, 12 May 2022 14:49:12 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a05600c4a0600b003942a244f29sm3525525wmp.2.2022.05.12.14.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 14:49:12 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 23:49:05 +0200
Message-Id: <20220512214906.96815-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512214906.96815-1-romain.naour@gmail.com>
References: <20220512214906.96815-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] support/testing: test_zfs: add missing
 libelf dependency
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
Cc: Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2hpbGUgYnVpbGRpbmcgdGhlIGtlcm5lbCB0b29scywgbGliZWxmIGhlYWRlciBpcyBtaXNzaW5n
OgoKb3V0cHV0L1Rlc3RaZnNHbGliYy9idWlsZC9saW51eC01LjE1LjM1L3Rvb2xzL29ianRvb2wv
aW5jbHVkZS9vYmp0b29sL2VsZi5oOjEwOjEwOiBmYXRhbCBlcnJvcjogZ2VsZi5oOiBObyBzdWNo
IGZpbGUgb3IgZGlyZWN0b3J5CiAgIDEwIHwgI2luY2x1ZGUgPGdlbGYuaD4KClNlbGVjdCBCUjJf
TElOVVhfS0VSTkVMX05FRURTX0hPU1RfTElCRUxGIHRvIGJ1aWxkIGhvc3QtbGliZWxmLgoKRml4
ZXM6Cmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMjQy
OTAxNDAwOAoKU2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwu
Y29tPgpDYzogSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIDxzYWx2YWRvci5qb3NlbHVpc0BnbWFp
bC5jb20+Ci0tLQogc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF96ZnMucHkgfCAx
ICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3N1cHBvcnQv
dGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfemZzLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3Rz
L3BhY2thZ2UvdGVzdF96ZnMucHkKaW5kZXggZTM3ODRmN2Q3ZC4uNjg4YjYwZDdjNCAxMDA2NDQK
LS0tIGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF96ZnMucHkKKysrIGIvc3Vw
cG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF96ZnMucHkKQEAgLTE1LDYgKzE1LDcgQEAg
Y2xhc3MgVGVzdFpmc0Jhc2UoaW5mcmEuYmFzZXRlc3QuQlJUZXN0KToKICAgICAgICAgQlIyX0xJ
TlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNS4xNS4zNSIKICAgICAgICAgQlIyX0xJ
TlVYX0tFUk5FTF9VU0VfQ1VTVE9NX0NPTkZJRz15CiAgICAgICAgIEJSMl9MSU5VWF9LRVJORUxf
Q1VTVE9NX0NPTkZJR19GSUxFPSJib2FyZC9xZW11L3g4Nl82NC9saW51eC5jb25maWciCisgICAg
ICAgIEJSMl9MSU5VWF9LRVJORUxfTkVFRFNfSE9TVF9MSUJFTEY9eQogICAgICAgICBCUjJfUEFD
S0FHRV9aRlM9eQogICAgICAgICBCUjJfUEFDS0FHRV9QWVRIT04zPXkKICAgICAgICAgQlIyX1BB
Q0tBR0VfUFlUSE9OX0NGRkk9eQotLSAKMi4zNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
