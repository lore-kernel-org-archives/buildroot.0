Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6B8606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 22:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BgQqYPaz;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=CoI9Qsxj
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DA03407E7;
	Wed, 28 Oct 2026 22:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Dp7Ovi07R6K; Wed, 28 Oct 2026 22:29:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 828FC40786
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793226599;
	b=YYgnXBH6wGcWawBAh/ZK715jI19l1q1cPKUAc511f1ZLixKqYa02eiqGHdAXv0ny9v9V
	 r6R+n+RFIPRASg/nPItOB6Gkh8gTkeIVIQ/HcK7h04cVonRoo8pb/uE8qHiaciVweRt65
	 qIX/u6OBaC/3j25ebfmsQOTtKz6k+Y77+ucGcsaIOGBHqkSlilN7O14TgW6v1gWVHzLvB
	 SF2KjKPe3hOluAkPt5ZhoPLBkb2oWwhie5pLJ611oO2jISNSfd8uwZ/C+1dt6x3L4r9ME
	 G0GBwlC24qlDdN4vvPrY9iwj5AaHdnecMohRPCZhEvn6Okm0fraF6Vc6TmUgD8scpbw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793226599;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7l9UWnOXbpTcFpcT9oyVkUi3CQJswHf0VBpWF1k2Jno=;
	b=AeakmPzMhFEcZiCbgHStW1upHDZOQYxMN4igoD8HaillRVx43b15+CAEbphyG+EBDeZY
	 OqyqAYPYCkhQkCsUkkrVR4tFPJ7dUuNegxjCaP21vOonwf2Ppwj8gW6o+yBsR/MBhtNIV
	 /pmQL4XcSVQbwL3YADHVcEdOgDOtWeHu8Gvlm7lwtz2vO+S35ywGuv890DCQTPFwskbNF
	 RFfSYKXi6tJkiYuILWQ6aJoJoex91CY4hAzc+BMor2sNNIAUE8u5pH7/Byi9w1sRROVfN
	 VIZInztWj84LKBokrk6+rzXr1qAFYfCLRfPlGBEXef/2Rn1pgsUtPWYrwDbcHSqbtdw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793226599;
	bh=7l9UWnOXbpTcFpcT9oyVkUi3CQJswHf0VBpWF1k2Jno=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BgQqYPazTx25yaKtUijfTBiJrRsCTKxZW/csEu+RcEhP2Gyr7Q0ka+A9lDCip7YOd
	 JCAU/ChMrlcZvCS9MCjUMZJ3+4XkNInPjdfdCu5Pj2+QGVGzClyyGfqEO8f1T45FYF
	 plESA9BgP2A8kH1Ft9DICeBPUfZvb+QrUTkLNf9h80nKoXkfBIkbDoVMCvD9ZxRQe1
	 A/kedpsEb5ubK5sanP6CKtTmqN1is/dWEi+i2e904WRT7CCayMwkiYVBiq5PAj0QNW
	 7DXQL/QZKiaBmQoFWQdUfw1lq0GemYZ4G93AR3n/UCh6gcNCyJU6WUYC0emfC2Q3Rr
	 3+hOFocHgafYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 828FC40786;
	Wed, 28 Oct 2026 22:29:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 90BEA2A8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82D0680F80
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:29:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PuPeodbV9eLv for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 22:29:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7B1CC80F6E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793226598;
 b=FLDqakqKpo1jlS7jGnq+CCDnMBjnmzNWboGol5RWpWLGA6DE7pKLYvAC5WLSBaHb6brp
 Iohs2RJMnNzSuVcFlgwaEKgwjNlhI8MxyE2kqWc7AQt6smrQdaKlEugGXbVr3q28/m+D3
 DxWNQVNG8fQrRc81clpBEuci/hl8oTdDX7dCFkAY4YpGHHT9IovJLqgsK0qZyJAEaZ6Dr
 2xtKbIzlpj9QsSM/GBKjeKO9UJJ9Wyflu2AZjxOfsgsaadeWu1poiukOmv1O1zgIKSpIW
 UywNvNTwm0nW9D4m4QM5NSLVKckQ44tqoMVriiTdNeJa8clcfq6d030lJ2gp+80It0g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793226598;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=UOpsnj157ropW5BGZmwwcIJqJjF3MMwYl97kPgnjNrc=;
 b=TcxGzmqBbpC/LisNvOJA7/E+gHoOq4KqXlKv1F8KSruKkK+kCl8KGTsBplvPIo5su8zV
 jWYd+bb63gG6LIRXf4ARUzMjV8/lP0HOyeE8nfQzE+DAT5PMIihET0iXXP96vI0vQR5aG
 msfG/MhX2HB9eZXa9uPSMpY260I8OLrJcQBrWPv6mu90IAnxjIBUQvUicucNXauQtOG+d
 KFqjpJuK+fbvXm1/7RT/kGrt+PtBuaRubxxajYHkAf8thfutswABuczf7ceVVzBWFUGqq
 q2k1dGn17xwvIKQbujGCxduz3hPObSqliLGbiZZvyCmDgvmTJ8l5IwtADimS//hWxGg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=CoI9Qsxj; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=CoI9Qsxj
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B1CC80F6E
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793226542;
 bh=UOpsnj157ropW5BGZmwwcIJqJjF3MMwYl97kPgnjNrc=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=CoI9QsxjcdnRyXpPptIgm5MWNyzGXLTD5BLRqz+fxfb0NFmHfewlA2fYXU09fF6hE
 kCcytxe4qaSliScM6sOftmvLHT/LEIhJVe/T1Olxc7QikgvzBPcLqLLxy8izfRemhC
 MoXL/q/Zv0faFTR05LdooLI1IxXMuYO3pVV9qElKqttRvNiLvPVLFdShDHXeX1eH7M
 4BSFxkiAa2z6qJogFGiRcRS0qzgTiIUzg7jKf4Fwl2cEQB+Rxwzx4zTceEPy3wwZWZ
 xNpHmy+X8ln47dQeBVKAp3PrMOUtx1KVgQpWI7TjT/8QVSGpmmv13Uw9/uPzstMNNT
 3/GAfkrkoosPw==
X-KAS-Sym: v3:f51bdf72230551df:cTk2JoECzpqnGl/pf59mWisqZvMBXDYOA9XGs/chIxhpk
 tWelRTKRF/MM6j9c4LMiUUsl/7xnaot9wRDU7JV+E5sPbFnIbsth4GYwBy7SrVgIsDvKE6NeUR+
 ReiZDpU6m3mZXStAFKEkbGIqcXld4qyCPlISONxA0p1D1as1hnCqo5M4qV8BIt74q0d1pg+NXGo
 CwGP+VWPAHVhjYBPw8iTxRbcTiq8shEZiNVUGw3kIcW1sXWD66Pvc+KeoOHSLByVq85hA4A2C5a
 FlDr856MT8HS5m6OicpSpgJslOHnDDlK2Gcbl3hwTV3RSbZZMhMk/o6OaxvGf+5L7aVdVFXQ==:
 JgeGD5Ql+680QzuZTjZd0pSpFa42kiZ33K0dJbw6v7gPhk2m4W0AmObJnpb7/R7cVMmRV8tp1JT
 7y/aRQP06m1GESNaYoTHp0NPKLQ1236ugwDo3jF0fv+nC8IbayVVSSL/pI6DYSBNQc3oYUltDEe
 pSmVM/u0pBKKVUCTNUTSLp/q1UKFvVK/cJ/T2FBed4c/IDmEzTjr1jeThKzVudyovrIvPW4nzPd
 lpHE4gVJ+EjLMa5BXmqxOR/OzlK/fycpdPpM5J16FZ7RcQ92STJ6/W/R9+MFkFIZakt4g4vVrcM
 HCOCAGZDzt4AG0losnePAYRdtwAVouyUpaWrbukWDRAAllGqiLwRmzdPLAAkBYniBstWd8unDsU
 x+R9ts24850pxis+3zoGVGfM3ggTb05iHyXWTaQKVT+HhmNWQfLkQ0gSV6NsHFJtFiiMwNAB8to
 kuKu7KDLcEL3PyeWD/cjEUjH9AJYpR11pw3brTDYawKh9Oliyxc7NjHyDsSzZCET168rZocfe/R
 GPheFRaWigX9Ld/ZVBt7qk+DV15Bk9wx5U+7ejrw4NJsddqzIPnTerI2a1QFCs1ZGAuDqMPxS4N
 Z6+Y
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6549EA4C6FCC
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:29:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54844)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMC88-000000001Tt-2hEY
 for buildroot@buildroot.org; Wed, 28 Oct 2026 22:28:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 23:28:06 +0100
Message-ID: <20261028222822.490779-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028222822.490779-1-bernd@kuhls.net>
References: <20261028222822.490779-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 05/20] package/kodi-imagedecoder-*: mass version
 bump to Piers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash | 2 +-
 package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk   | 2 +-
 package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash   | 2 +-
 package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash
index f8bd74d0b2..9c821cd331 100644
--- a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash
+++ b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4502522c6e71439114a57cf51f444e38b32c7f786636ca6c361c94aaf5ffe066  kodi-imagedecoder-heif-21.0.3-Omega.tar.gz
+sha256  186539681e6067fa24ed3c0f526301224de30edbbda24e347af3d79569603cdd  kodi-imagedecoder-heif-22.1.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk
index 5114dad72b..66bbdb832b 100644
--- a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk
+++ b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_IMAGEDECODER_HEIF_VERSION = 21.0.3-Omega
+KODI_IMAGEDECODER_HEIF_VERSION = 22.1.3-Piers
 KODI_IMAGEDECODER_HEIF_SITE = $(call github,xbmc,imagedecoder.heif,$(KODI_IMAGEDECODER_HEIF_VERSION))
 KODI_IMAGEDECODER_HEIF_LICENSE = GPL-2.0+
 KODI_IMAGEDECODER_HEIF_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash
index 98adf46a9b..0b724e9383 100644
--- a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash
+++ b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  421812f6ca8d70e6736c920935461b43f1338ee04a919dcf7e5f7ce1879b54e2  kodi-imagedecoder-raw-21.0.2-Omega.tar.gz
+sha256  ee4692563acff8fce4d77ffd629778d9df3cb516825b7a74ffc80f25d902f419  kodi-imagedecoder-raw-22.1.1-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk
index 989742a901..ce5514cfcd 100644
--- a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk
+++ b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_IMAGEDECODER_RAW_VERSION = 21.0.2-Omega
+KODI_IMAGEDECODER_RAW_VERSION = 22.1.1-Piers
 KODI_IMAGEDECODER_RAW_SITE = $(call github,xbmc,imagedecoder.raw,$(KODI_IMAGEDECODER_RAW_VERSION))
 KODI_IMAGEDECODER_RAW_LICENSE = GPL-2.0+
 KODI_IMAGEDECODER_RAW_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
