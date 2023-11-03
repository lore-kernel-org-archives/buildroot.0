Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D404C4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 22:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D0BC82320;
	Fri,  3 Nov 2023 22:15:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D0BC82320
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DqyVOnXjr4Zb; Fri,  3 Nov 2023 22:15:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73E6382314;
	Fri,  3 Nov 2023 22:15:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73E6382314
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 324851BF5F8
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 22:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 183B360BD8
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 22:15:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 183B360BD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M48-XSXRqJhR for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 22:15:47 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E68B260BD1
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 22:15:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E68B260BD1
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4084b0223ccso18811515e9.2
 for <buildroot@buildroot.org>; Fri, 03 Nov 2023 15:15:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699049744; x=1699654544;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3VCxBHIHvQHKz1obN7TGg93yZnFsaB8DKzTvbUFK0Fc=;
 b=noBhQ8NJvEMMBVF3VI0buTWqMCUOjQ2zid13ZeJj5M5TQB38aYq5aZTSOjFI01pu4w
 e71vgKuKWkkn68zjDmc+RQTkoCLbym591qpDxKNMSQ+KtRsOLZ9Q8wce0XBZGEEdnhLy
 TDgY6zKXyuAdaAPFAuIAEzbAMgylsKoCG3EE0eTx5MKlqXYn1QlGXSdB0U+Jpj1a9uw0
 kB2t6Pidezk0syE2UH3xKncuGvVzXyywTOgtPkjXSmMGN6rx03ArO5AyHKUs1Wvs8Fle
 lF6TAIF+rUqK090HhCivGtTuYXc97N/oQoI1IWGk0aQ/BaaeyLm8FjBnzEBe1JJmLuSq
 Xp9A==
X-Gm-Message-State: AOJu0YzBaf3nDhhsbt+60YMs0MgILA1axOjL76pzRoLijfH5IhPV+8Z0
 Q/HHnR+TrVVVr27KPKTSsnrDzCpNi1k=
X-Google-Smtp-Source: AGHT+IE7uGO5E9demz8mopVLr0f3naX5zk46vTBOnQQKtY3/gJCcIHaBA1/xubSLVL7tG9IbBCgGQw==
X-Received: by 2002:a5d:61cc:0:b0:32d:bc26:6c73 with SMTP id
 q12-20020a5d61cc000000b0032dbc266c73mr15879131wrv.20.1699049743985; 
 Fri, 03 Nov 2023 15:15:43 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p12-20020adfe60c000000b0032d886039easm2816299wrm.14.2023.11.03.15.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 15:15:43 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Nov 2023 23:15:40 +0100
Message-ID: <20231103221540.43254-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699049744; x=1699654544; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3VCxBHIHvQHKz1obN7TGg93yZnFsaB8DKzTvbUFK0Fc=;
 b=WlVQ/L3WKzwz4cGroLdSgsrLRAcj3eQjiqNaHZg/PrbSFPnfEYIkIWkmQI1pba9fdt
 180joNpmLWnyAaCjvgPFJ4EoUGfIsSf8tDOfZxBAE2aXjDEgWx0XeP3J4witgqXj/g2L
 tR1Mb1NpE6iTHr4prazl55uvyL2gCat55gYHTSSpPovRtu18AAJOf5Op2FGMWlegxRAW
 L8owZ9DQo2t70bCj0wsHTKO9cxpHYU0aAl9AcHCT1yuZmwIyqaLrP++hpaNJpu0OMD0q
 bMCodPuT+eJSQp2VSOwqxSn5PuWB6Us331hPDMyFam7VEiEbQvQkD1JdLcKfDj9Gh/yN
 NNVQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WlVQ/L3W
Subject: [Buildroot] [PATCH 1/1] package/libgsm: bump to version 1.0.22
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Refresh patch

Thu Aug  4 18:47:10 2022	Jutta Degener (jutta@pobox.com)

	* Release 1.0 Patchlevel 22
	Remove unused, and occasionally out of date, VERSION variable
	from Makefile.

Sun Jul 31 16:17:59 2022	Jutta Degener (jutta@pobox.com)

	* Release 1.0 Patchlevel 21
	Use $(LN), not ln, in the Makefile rules for the installed binary
 	of untoast and tcat.
	(Thanks to Carlo Cabrera for pointing that out!)

Mon Jul  4 10:34:18 2022

	* Release 1.0 Patchlevel 20
	Use $(RMFLAGS) with the rms in the Makefile; add -f to $(RMFLAGS) to
        avoid spurious error messages during build.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-misc-fixes-from-archlinux.patch      | 82 +------------------
 package/libgsm/libgsm.hash                    |  2 +-
 package/libgsm/libgsm.mk                      |  2 +-
 3 files changed, 6 insertions(+), 80 deletions(-)

diff --git a/package/libgsm/0001-misc-fixes-from-archlinux.patch b/package/libgsm/0001-misc-fixes-from-archlinux.patch
index 86f4d42b66..11c529b509 100644
--- a/package/libgsm/0001-misc-fixes-from-archlinux.patch
+++ b/package/libgsm/0001-misc-fixes-from-archlinux.patch
@@ -9,6 +9,8 @@ Patch from:
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 Refresh for 1.0.17
+[Fabrice: refresh for 1.0.22]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  Makefile | 84 ++++++++++++++++++++++++++++++++--------------------------------
  1 file changed, 42 insertions(+), 42 deletions(-)
@@ -26,7 +28,7 @@ index d5c0c90..ef61bd5 100644
  
  LD 		= $(CC)
  
-@@ -96,11 +96,11 @@ TOAST_INSTALL_MAN = $(TOAST_INSTALL_ROOT)/man/man1
+@@ -96,7 +96,7 @@ TOAST_INSTALL_MAN = $(TOAST_INSTALL_ROOT)/man/man1
  #  Other tools
  
  SHELL		= /bin/sh
@@ -34,12 +36,7 @@ index d5c0c90..ef61bd5 100644
 +LN		= ln -s -f
  BASENAME 	= basename
  AR		= ar
- ARFLAGS		= cr
--RMFLAGS		=
-+RMFLAGS		= -f
- FIND		= find
- COMPRESS 	= compress
- COMPRESSFLAGS 	= 
+ ARFLAGS	= cr
 @@ -139,7 +139,7 @@ LFLAGS	= $(LDFLAGS) $(LDINC)
  
  # Targets
@@ -100,77 +97,6 @@ index d5c0c90..ef61bd5 100644
  
  
  # The local bin and lib directories
-@@ -351,53 +350,54 @@ toastuninstall:
- 		fi
- 
- $(TOAST_INSTALL_BIN)/toast:	$(TOAST)
--		-rm $@
-+		-rm $(RMFLAGS) $@
- 		cp $(TOAST) $@
- 		chmod 755 $@
- 
- $(TOAST_INSTALL_BIN)/untoast:	$(TOAST_INSTALL_BIN)/toast
--		-rm $@
--		ln $? $@
-+		-rm $(RMFLAGS) $@
-+		$(LN) toast $@
- 
- $(TOAST_INSTALL_BIN)/tcat:	$(TOAST_INSTALL_BIN)/toast
--		-rm $@
--		ln $? $@
-+		-rm $(RMFLAGS) $@
-+		$(LN) toast $@
- 
- $(TOAST_INSTALL_MAN)/toast.1:	$(MAN)/toast.1
--		-rm $@
-+		-rm $(RMFLAGS) $@
- 		cp $? $@
- 		chmod 444 $@
- 
- $(GSM_INSTALL_MAN)/gsm.3:	$(MAN)/gsm.3
--		-rm $@
-+		-rm $(RMFLAGS) $@
- 		cp $? $@
- 		chmod 444 $@
- 
- $(GSM_INSTALL_MAN)/gsm_option.3:	$(MAN)/gsm_option.3
--		-rm $@
-+		-rm $(RMFLAGS) $@
- 		cp $? $@
- 		chmod 444 $@
- 
- $(GSM_INSTALL_MAN)/gsm_explode.3:	$(MAN)/gsm_explode.3
--		-rm $@
-+		-rm $(RMFLAGS) $@
- 		cp $? $@
- 		chmod 444 $@
- 
- $(GSM_INSTALL_MAN)/gsm_print.3:	$(MAN)/gsm_print.3
--		-rm $@
-+		-rm $(RMFLAGS) $@
- 		cp $? $@
- 		chmod 444 $@
- 
- $(GSM_INSTALL_INC)/gsm.h:	$(INC)/gsm.h
--		-rm $@
--		cp $? $@
--		chmod 444 $@
--
--$(GSM_INSTALL_LIB)/libgsm.a:	$(LIBGSM)
--		-rm $@
-+		-rm $(RMFLAGS) $@
- 		cp $? $@
- 		chmod 444 $@
- 
-+$(GSM_INSTALL_LIB)/libgsm.so:	$(LIBGSMSO)
-+		-rm $(RMFLAGS) $@ $@.1 $@.1.0.13
-+		cp $?.1.0.13 $@.1.0.13
-+		chmod 755 $@.1.0.13
-+		$(LN) libgsm.so.1.0.13 $@
-+		$(LN) libgsm.so.1.0.13 $@.1
- 
- # Distribution
- 
 @@ -425,7 +425,7 @@ semi-clean:
  			-print | xargs rm $(RMFLAGS)
  
diff --git a/package/libgsm/libgsm.hash b/package/libgsm/libgsm.hash
index 88d2573f56..b3a4702152 100644
--- a/package/libgsm/libgsm.hash
+++ b/package/libgsm/libgsm.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4903652f68a8c04d0041f0d19b1eb713ddcd2aa011c5e595b3b8bca2755270f6  gsm-1.0.19.tar.gz
+sha256  f0072e91f6bb85a878b2f6dbf4a0b7c850c4deb8049d554c65340b3bf69df0ac  gsm-1.0.22.tar.gz
 sha256  81c68a3374937ed9b5e4929c709e81a2c4b35b5d1f450ecf8c473e2daea46ff6  COPYRIGHT
diff --git a/package/libgsm/libgsm.mk b/package/libgsm/libgsm.mk
index e3ebee4b11..1c7b860ece 100644
--- a/package/libgsm/libgsm.mk
+++ b/package/libgsm/libgsm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGSM_VERSION = 1.0.19
+LIBGSM_VERSION = 1.0.22
 LIBGSM_SOURCE = gsm-$(LIBGSM_VERSION).tar.gz
 LIBGSM_SITE = http://www.quut.com/gsm
 LIBGSM_LICENSE = gsm
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
