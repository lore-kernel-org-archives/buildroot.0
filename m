Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57805C982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D15381008;
	Sun, 20 Sep 2026 14:54:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fEn7B31FqpsU; Sun, 20 Sep 2026 14:54:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5906180FB5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789916040;
	b=nKxmXaPv4d47loi00hvdr0jdN78fciYVy4ig9/0DjLkoAmDmm25JhnoC83VS2yPbm+wK
	 Yqn0n90hs9Zl7Di+aErOJQx1B5hqXZIO6v9g+dbAlGo1LBTMw9qcrnjPxfGlM8HV99e8L
	 BjPjqYnGxiqA0X4Nt4lmOhGxWWASFum28p35yOUjBstBsLuUO5qkN9y/50RepZoqtBIXq
	 8ECLRy2MO/fwlSFwQd2rASFuBeW9BH9OvDh0M45Yb3ABI+Q+p6b5lKzDfPpr0NLrjzroT
	 OXG/CxUe1ONp7zre5CuJOWBgEfiLKf4q3tYUhsAsS1tjU7/y4/2fNKJsu8v01aQ9xpg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789916040;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qiQKStrA40G4SArxLaN/JzI51Ew3tfCx7j06ahMPDKM=;
	b=FbGfS/Svi4s92wvgGyePVwnZINpT+M8vUmIBGcvtlLr/3tM1UOHokFbDwJ6k0rljM7Of
	 MozZ+QT4FSn/YcgA6uXqP5CEhSkEtOdNq1zjyhLFCJinnXtcO7QAbduRisuVr5Zjm0cTt
	 7yKY4iFA8Wh8/nscgL1tj2IrSYOTFophzdnN9XjfL+uz3AnzwsX28Jv27HrcrLrAPCvPM
	 dA5PkKgynomiafF0/8Yo9C9415EfC/kfuDF+OqmI6WueBeWiTmPKmQKRr4+IoZmGKh2Hz
	 5bE1AIBopPEI1FI6912zgIUFaO6itS4zskO6+KYunpOfXPos/Ssxayjzq+JX50czFXA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789916040;
	bh=qiQKStrA40G4SArxLaN/JzI51Ew3tfCx7j06ahMPDKM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qi52K6DeccshkqPfPpNatsTKIcgJ/Bju31Re4vHdYw39V9ST8DMXcK60oUhW0mK7p
	 sZx1yKotpxUMxOtYD7wDO852XY3hCnMI9qrHvbf8VeQB6xyoyjInHckdU0/EzMG7rw
	 lkUYcvVUkXEWaKteCdK8N6z4PvdnaDEOdFY5yIr9Jv4xBlN0yjzctFIClagr2Cvshe
	 rXOMGvBJ+awBmXNbd8y/MYCU7nEaOl1vfKiprHh00J/ZTLO7jTc31NB+Btl0e0VKNX
	 nrxzsSr9QPZw/bYp4xBOm2lx3ZGv0C++SydSZ1vEGTvtAAbbHABi+fc48tvhz3/ty9
	 1OiSABvdJfrsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5906180FB5;
	Sun, 20 Sep 2026 14:54:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BD5A537A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF2D560767
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:53:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IajeaCF64rhP for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:53:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BB95560BCB
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789916038;
 b=Fq9BVAgwfQHlhQuseQb22bxJLgO1H+yY95NvC2aKu3sSaKqSNYQb/javdtfqraoETB35
 MXWxF2nzHFzUP0Ihoqdeu4cXFK8gJmzYgzeE1+6rz+YaqQCPs3//PYfmUlI3MITQrBT6t
 vzvncKPjwlTSKVxa+yrF/c46+dsakB8YAeJmK+VUUT1pD88HQWQiIqvD0DujtqYoID94n
 ODq78y6xRlA/qVXOeCx1iQ96pyQtnr5YHHXinE1m22zQxOFkhN62t/ex85aA99+h0aNuU
 Dt+1VUYN3lEmjYtGRd1rz4Z0i1xMKIJory4T7nPE5INEUnXlMevxIcdzgMlHFqBr/4g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789916038;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=UZryQBhtYyydy4yNnfN5L/lXDnvcBV14QpvNULqux90=;
 b=Afrl12pwW1osGl3rU1l5IWGSIvpsxFT7saRXQvld1yLKCMDWzTeXDtVNoDkZmA2JyWFC
 /LxuFa5K7vohMAy6PU2ZIo2hLpQJEI8g4DODJnNa7uOLML0girsaXxuMrJmbleaFftV82
 JJhCSwnmmRyGu1Aro5BA/2AB0K9icA0gwFJtNwaSkqNttvZ1444KwIb3NIPs30VMorAug
 SyNUfqrIYegroXIYlJ4NKRw/WmohEWnMkDYdJeaOVeQOlnpqDqUDrMop1WUugSoKof/X2
 yEXQbVSBaiRGgxOyelfFLJBDWZirM7R4rt4xSOBWAYUCywHsyuoW5jcSpPHtIpzSKzg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=U11gnQV+; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=U11gnQV+
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB95560BCB
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915504;
 bh=UZryQBhtYyydy4yNnfN5L/lXDnvcBV14QpvNULqux90=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=U11gnQV+V7ZiRoIdM8Bud7ykEc5d7Uuoj8tFQcCkcLDRTFNDaNi80RzqueJeZBmcg
 yULLn3e65k8fk/yc98/H1GyUjVdxlqY9kTYtTeCGkgh4HXpFVtvGe+++mvU2u1n2n3
 MJ9Rabrz+GW7MKS74X2Q3NYxBfsYN/GXR2OZOZFWUA5KNaCS5zvXfwVtpjbgNlPJlw
 GuD1ocMnNa95w6YspinkzSKSrnjczfjuM5WhorJrM7w3W6c/Zx6xMZl9uSI+pUH4ZE
 rqlJ/z9djsSMRgo/I7YCtTJPkf0OWo7/TJntPd8OcVvi7NnzDaFU36qGP6hYUwK+hV
 lksAT6nWgQy3g==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:qHGhgzMqGrzyPksk4BLWt6qE0F5cwWVu+TWzUiXl/+ScEex7pjVmyAuC+dTK1U1Opnie8JJKQlBc3gsu+7aKleYkfnwlYiE9E3tw/0LEPTpZ00Nf13+rk8BUkdSlSmWN5A70TEMVnb26y+3/SWUTR4mPizSrz8t5VPka541XSZCFqU2jadVic5gqn763d5+BNpkT/hO8exF8IwPurq46YH0SRvY1S1WooGup7jeZPEcZCPGO8ReTvUeK5V7W/PBbpjyc4vxBxWhRB77A5ZyLnjfeA1U6sAT7LEOAIwo6/9wxJO73oHe1/vbFry8k1+nblM3icbmDqqkBqUjrfevikIIp85SxWZb9fCU/xeRg9Nfybwp7Iba2y/nR0dJspmMwIefHaqM+VJBmDrs2GAwRpHQYhMtGF/KYrUqsj03D0bw68j8FaKzjKBiz+7WxhXrEPVuYbTvkjR+oqjr5NgIEVvCKxuA5ajRJ0gHJ5+Gv1RgfC8GUj+ecaUCyE0W8RKIdgtmJ7y4VkQp27bGWiF389izhyjGGZ4RSxhB47/kZHIn0eeRWF8yElSR169PXvenRi+tiP5wMTHknG9cIzxKCfyL+MbiGBB8=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 984E6A4C48A2
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Iml-000000000hB-0nrM
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:44:08 +0200
Message-ID: <20260920144428.3009612-48-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v4 47/66] package/pkcs11-helper: Add support for
 OpenSSL 4.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...1-crypto-openssl-use-ASN1_TIME_to_tm.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/pkcs11-helper/0001-crypto-openssl-use-ASN1_TIME_to_tm.patch

diff --git a/package/pkcs11-helper/0001-crypto-openssl-use-ASN1_TIME_to_tm.patch b/package/pkcs11-helper/0001-crypto-openssl-use-ASN1_TIME_to_tm.patch
new file mode 100644
index 0000000000..d8149330e1
--- /dev/null
+++ b/package/pkcs11-helper/0001-crypto-openssl-use-ASN1_TIME_to_tm.patch
@@ -0,0 +1,48 @@
+From 59cc22b8d65669da599f1c435fdfe35d4e07db0e Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
+Date: Thu, 4 Jun 2026 12:49:44 +0200
+Subject: [PATCH] crypto-openssl: use ASN1_TIME_to_tm
+
+Introduced in openssl-1.1.1 and is required for openssl-4.
+
+Upstream: https://github.com/OpenSC/pkcs11-helper/commit/59cc22b8d65669da599f1c435fdfe35d4e07db0e
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/_pkcs11h-crypto-openssl.c | 16 +++++-----------
+ 1 files change, 5 insertions(+), 11 deletions(-)
+
+diff --git a/lib/_pkcs11h-crypto-openssl.c b/lib/_pkcs11h-crypto-openssl.c
+index 05af65e..aa58722 100644
+--- a/lib/_pkcs11h-crypto-openssl.c
++++ b/lib/_pkcs11h-crypto-openssl.c
+@@ -148,21 +148,15 @@ __pkcs11h_crypto_openssl_certificate_get_expiration (
+ 		notBefore != NULL &&
+ 		notAfter != NULL &&
+ 		X509_cmp_current_time (notBefore) <= 0 &&
+-		X509_cmp_current_time (notAfter) >= 0 &&
+-		notAfter->length >= 12
++		X509_cmp_current_time (notAfter) >= 0
+ 	) {
+ 		struct tm tm1;
+ 
+ 		memset (&tm1, 0, sizeof (tm1));
+-		tm1.tm_year = (notAfter->data[ 0] - '0') * 10 + (notAfter->data[ 1] - '0') + 100;
+-		tm1.tm_mon  = (notAfter->data[ 2] - '0') * 10 + (notAfter->data[ 3] - '0') - 1;
+-		tm1.tm_mday = (notAfter->data[ 4] - '0') * 10 + (notAfter->data[ 5] - '0');
+-		tm1.tm_hour = (notAfter->data[ 6] - '0') * 10 + (notAfter->data[ 7] - '0');
+-		tm1.tm_min  = (notAfter->data[ 8] - '0') * 10 + (notAfter->data[ 9] - '0');
+-		tm1.tm_sec  = (notAfter->data[10] - '0') * 10 + (notAfter->data[11] - '0');
+-
+-		*expiration = mktime (&tm1);
+-		*expiration += (int)(mktime (localtime (expiration)) - mktime (gmtime (expiration)));
++		if (ASN1_TIME_to_tm (notAfter, &tm1)) {
++			*expiration = mktime (&tm1);
++			*expiration += (int)(mktime (localtime (expiration)) - mktime (gmtime (expiration)));
++		}
+ 	}
+ 
+ cleanup:
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
