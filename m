Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682CAC77B7A
	for <buildroot@archiver.kernel.org>; Sat, 10 Jun 2023 13:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F1DF60E8D;
	Sat, 10 Jun 2023 13:53:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F1DF60E8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8wwzXcL1FkLY; Sat, 10 Jun 2023 13:53:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AEEA60E63;
	Sat, 10 Jun 2023 13:53:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AEEA60E63
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC5171BF343
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 13:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95ED883B23
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 13:53:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95ED883B23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pD0O0K5VA8ln for <buildroot@lists.busybox.net>;
 Sat, 10 Jun 2023 13:53:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AFCF83B01
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2AFCF83B01
 for <buildroot@busybox.net>; Sat, 10 Jun 2023 13:53:25 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f7378a74faso20076945e9.0
 for <buildroot@busybox.net>; Sat, 10 Jun 2023 06:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686405203; x=1688997203;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bNFCa3O4Y+RiA1bYDdSq7rreeY3JRAXCzuTwmwsxuY8=;
 b=kZ8BAAotUH47guFPhhLlIvmWxYUAogkTAhLoKNOV2m+08yhOh2yLHayFfrOBPDWmQx
 UoCYMaD7B27F0n1p97K76sQ3P6vc/spwBFCS5P3ku0WsPYmeUh50r1VpFF+rJcu7jTqg
 lyz54frfCNvsI8D1AciW8X6qvBb2IuEa62rvMbCGCLS2v4rERjXJHMRgT90EHDd2Q2rT
 NZkMoDWS+smYEpTEIW3QV5RTDa5VYUNOwyIGyIY9uR5CBk6pU47tjh41UBPS+Kykwj75
 aZuJE5B3BVsVtG7hD5kE2QfRm5zixMCUXS0kOu7Lfu0OUB/XhlyrtpPZVQJ3vZk8JpMf
 xwMQ==
X-Gm-Message-State: AC+VfDxoRB3CwyHSA5OTUJMFH2qDKcZHzuWGG6bZ4RdQXv4adQLqcnQp
 GrurmXFaG0id3jYdpv+w1/xEMp0VXwo=
X-Google-Smtp-Source: ACHHUZ52Z7x7mHETIhfQaWckqLocd+CxvPvMRyOEcAYurLLv3VaXbm7m+C8om8Ds0+Hqs2ZCWncF4Q==
X-Received: by 2002:a05:600c:249:b0:3f8:1306:304a with SMTP id
 9-20020a05600c024900b003f81306304amr718311wmj.16.1686405203055; 
 Sat, 10 Jun 2023 06:53:23 -0700 (PDT)
Received: from vm.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 v13-20020adfebcd000000b00309382eb047sm7250721wrn.112.2023.06.10.06.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jun 2023 06:53:22 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 10 Jun 2023 15:53:18 +0200
Message-Id: <20230610135318.1721136-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686405203; x=1688997203;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bNFCa3O4Y+RiA1bYDdSq7rreeY3JRAXCzuTwmwsxuY8=;
 b=FPKeUwG8RFcVgsi3MBp9ZQedoLtdyJlyRPqbT28RZ1W4z84LYhFnzNRZLg8YhAIV8j
 5tZLahlrmlY1izFM3PKYY0GKoeUFtNRekVb3pA5mlnDXngmi/QN24XRJ65QBCQ8iOfVV
 d2W+HXMKcdRS2mIXOLcOYAj2icbuxGcLEMvmOFoAmewRpElRrfwR2fhoK34ERDE3TKv8
 67A8b6H5tGR3x7jBoL/xaZqOmQgqVDcTAWlAfog9gwLUYCkw8+6swVKGkB/Bk/LK4DaY
 xkdabtYpUptdkb85LNU74nONxUC6/R16Dl2Qt+THmDxHlvXvdSngEin36iYybdxDaZDn
 Bu0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=FPKeUwG8
Subject: [Buildroot] [PATCH] package/libgcrypt: bump to version 1.10.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../0001-configure.ac-add-an-option-to-disable-tests.patch    | 2 +-
 package/libgcrypt/libgcrypt.hash                              | 4 ++--
 package/libgcrypt/libgcrypt.mk                                | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch b/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch
index 5ddde9df1..2ba1bf8b1 100644
--- a/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch
+++ b/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch
@@ -44,7 +44,7 @@ diff --git a/configure.ac b/configure.ac
 index e8c8cd39..1a6b61e5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3231,6 +3231,16 @@ AC_ARG_ENABLE([doc], AC_HELP_STRING([--disable-doc],
+@@ -3248,6 +3248,16 @@ AC_ARG_ENABLE([doc], AC_HELP_STRING([--disable-doc],
  AM_CONDITIONAL([BUILD_DOC], [test "x$build_doc" != xno])
  
  
diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index 96f5e6b76..522d67283 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature
-# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.10.1.tar.bz2.sig
+# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.10.2.tar.bz2.sig
 # using key 6DAA6E64A76D2840571B4902528897B826403ADA
-sha256  ef14ae546b0084cd84259f61a55e07a38c3b53afc0f546bffcef2f01baffe9de  libgcrypt-1.10.1.tar.bz2
+sha256  3b9c02a004b68c256add99701de00b383accccf37177e0d6c58289664cce0c03  libgcrypt-1.10.2.tar.bz2
 sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LIB
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 9232debb3..4fffe5360 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.10.1
+LIBGCRYPT_VERSION = 1.10.2
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPL-2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
