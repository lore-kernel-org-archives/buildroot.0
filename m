Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC8EC982DA
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B297740D10;
	Sat, 19 Sep 2026 16:12:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rwy1Dh9F52It; Sat, 19 Sep 2026 16:12:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B25D040D12
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789834337;
	b=TSalrDStx3NEOpCmx7D7cwcmoBI4RcXnzJxu0OX44UHnxqtj0UihzmOQ8JRItuD9ldnn
	 fg09YTougFJBgP0bUlUtpsin3mvYiRO1nnmeRQ4OkqkX/cFYzraMKvXPnXmwt1oFkB354
	 L6OofPzn7nGdcuxDKFfHB2qVLtl3GrSI1DSjh1OD/sJ/FyAN3iwhMeon9UWerZ8i60Nna
	 7mIwT5obTsi13GOevDsTuUtFR6qUt14gMNHt+t8pm/LIl93xv+/xlY3SXq2eH5kS7fMU0
	 xSyZNdFUlwerpswo3RjdJRwwOFdUYIR2fuOk8kbmm8W3hbEc+oS+tTAzwV/gB0SQnqQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789834337;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qiQKStrA40G4SArxLaN/JzI51Ew3tfCx7j06ahMPDKM=;
	b=BcFjMdCHiINmViivtnOZcNBB9umJ1FwYwkryMLtlTExWDG9Is0gpiDajaTLAa847OGXy
	 dKW0AWYG2KK/9iUw0dIdj9W93UiL0c/Y5W8pdXXIRcqrYWj7uMstc6jQvs34pKos82Ebc
	 ts+kWq5rYM8KZINkzRr0ANebNbnngK0RY6bmldU0qmtoa3xqOTut43H2NTGb5PPJNGpqh
	 IelU3p2hhUknmwZ8/DJhk/m1mxfypdnToL7kHK9CgtT6z/W737ULVUZNbJlhg4I/QYh2E
	 Bs4oTPh0nGxJIGk0R5kPwgnowBvJpNRM+3wUafKVd6siovBJWz79UpfxjY0dqKj6s3w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789834337;
	bh=qiQKStrA40G4SArxLaN/JzI51Ew3tfCx7j06ahMPDKM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qg9ZHR6l7DKoHZToGjg7E06BlRIqrEzrnQSAasJKceOyvSs9Wr7W4eL6pYNQW5Uj6
	 1BaRS/umSDQEi7GT1qb3YRAZ/39vVg2/pCIJFVuulLd0OKztIhUpWxbFt9/koR738y
	 Y2WqqFNq0lqpl4l7OYkNCp2Ml7/zZEHWWNyUUGV29Aq85XzrchACFdZHfU7l8P5tpl
	 Bcv/FaMvtLP3nmUURQV6M3zG4qcom3I816dyUjAgCpsW+0Rt6GuapSGi0Qo7bI6N94
	 uWDhQExCFYtKDXp/3RaGWSESGlVSN95GQEugvv3G6zFKBrpDzEah+/OSfHZSV39cFM
	 /04xgw8aFjemg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B25D040D12;
	Sat, 19 Sep 2026 16:12:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A0BF333
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0052E606CC
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:12:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m-wjgijhki6a for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:12:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 056366065F
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789834335;
 b=OIx8DeMK+3Vlqd5RBDiT/lNNWZ966y5jr9HcJ9gQHbEf9zd19xpSuw4K3Glgmu+2kzDt
 P7AAzcJDp5hA/MLmbluj1wgnCsUiZ17VfGu40ML/WGeQgstZz83w21ijVdTJkX/+0C4+/
 6mhXt8cD0HLtBV/owb9/t84y+ysF3fX5WkFMFPLNKH0rBMXWgt0ygulgYiVdtt+LwADwy
 xSqfh9q0lHo60GWpHr1u4dPzqgVg6GMQGf3gi54qhuxUWTR0lJKxS31GACBaxRg9x+zsa
 TvI4OJP5PvhWkVwyKPMSOEAoZf/+15WYKWMQ9C/to94LjQYAjv5lLelPEz9qahS1w6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789834335;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=UZryQBhtYyydy4yNnfN5L/lXDnvcBV14QpvNULqux90=;
 b=I8Mh5Ag6Z98tlpJbDZOFKdthAGviL1bQv9LF2c+ujsBFA8mfvWfWfvnV5UKlfcm5+9PU
 zxEUkYGwTHKVeCacd3IScTWHEujOV21JmBCRWw5T5x1eLg8joKc68ke2P0XywPvVhwvA/
 L6qncItyawAKx9jSX6twa3pbhMokhKt7EOXjJu2tCGF+vE+N0nvnvV2kHr9edlUzDxYWl
 tSwtfNwXM8CagL2ALL5hh+/QcVs9gqKkkRCYcSTYLkTLttRoJldjTOZg9BTwnw29zmH5d
 40+JIS4CcfU8ozsXsWLwbPNVOhaPH1UBzcVukzX9saLhV2ux4g84Ux4IxBq9fe5/phQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=N48DXUzc; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=N48DXUzc
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 056366065F
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833555;
 bh=UZryQBhtYyydy4yNnfN5L/lXDnvcBV14QpvNULqux90=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=N48DXUzcDBvZdArw+zVHLYyahm3y+K1jkH2onb5wzY2u0lu28LUZU307lYVz9oghr
 Y/RdczN66SN4urCxLe1DKZkcosDvfvI2s51qVbjtzyU6b7LhtkpmO+OOgBLs6ZJhFN
 EkhPuCkuSkxFcr/IFPWnMOU2SLQbOC1nOkbb2J2IGqrGVyfLA9tNpbVexPN4iXSDE8
 HWlimyLCLbo/Ku0eDa19Bn5aKeDM7uz3zjH7q3hIlP3+zgjRuQyhD4wtclHUV8FLGw
 YRkMnAL3c4I/68l7aCLjtzurZWgLIE5q7g37N14GC7/GuWVnXf22h88aIjl+MVNEvc
 DSgdDvrYpmaxA==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:+/0PL+bDwoae4+EY3+b8RZ+wmkm2cCkVRfvtSoazXlHVtSE1vkVlF5aScBe3AiaXM9jHQUCJyOvibBTMoPzBtKFM5iphmxO4RegCZq4DIn4i0BrR5L+BE8AmdlNWsyk6HWS0UDphQpFppfglamB2lTeNWyHo9/XUeEAZ+ZGTOX+qcVVYKPoRpgchomJUw/RvfjM5cU+cqYtji2wWdG35YMBZt3JuFjvK3QamP6Q/qICoSxMSom8paofe2VeSLI0/NN7pN8GcxcDOzMky/EtaDG3AcbDxb55iTTuMJPf9EZSVj5rQKxKuvKSfosG9OOsH0kZShSK+/EkPXH8FRDEJBwqAm49YVTQGBcE1We0cHRMVDPiDzzfst5Bz+na+RnMWsbcvn0nKAN6U/eTNHFlIm7ufdgede7jWTRRKobgbsuwmYe5Jds6OIKI9NYlQoYnDqdgPQEuSZAxq2BZsNzEsNF9XZNd/H5/kkve0Sb1lqPjqisuUJQVSL8h8Y7q/vVe4qkbrkMZi/TdDGv+IOJZZjf32DP+Dw3BChoef+lY5TI7XVbWLPHekGDpdaqs09R+/7s3SbJMcU2IlXcMNeretKBHEk/7Jm54XTunkHa7cD0MrTR
 fvXP0Vchpf3Bi/q+MD4BLLBpZ2Jwz2GrVVsNAu/iDDAOFURUTpETXZ26T+5Ya9Sc2L+bTS
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2F276A4C4850;
 Sat, 19 Sep 2026 17:59:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSt-000000005Jx-3GX8;
 Sat, 19 Sep 2026 15:58:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:58:22 +0200
Message-ID: <20260919155845.5776-58-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v2 57/77] package/pkcs11-helper: Add support for
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, Marcin Bis <marcin@bis.org.pl>,
 Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
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
