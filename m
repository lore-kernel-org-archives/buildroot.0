Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38168C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 17:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE48E607F9;
	Sat,  8 Jan 2022 17:36:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wnr9QUjjlozY; Sat,  8 Jan 2022 17:36:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C16360A71;
	Sat,  8 Jan 2022 17:36:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB85C1BF2C6
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7BC381494
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:35:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fMdI8q8MBzrl for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 17:35:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC79E81493
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 17:35:45 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 x18-20020a7bc212000000b00347cc83ec07so2421864wmi.4
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 09:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3luxsQnKFyHz6IyCbBbUe1UGmJ9/XiQpVbu0zlYdfDo=;
 b=hAzk9HTCiwvJWfL3QQq/TMx+lrPNwQgZJJIxSkvZj8HYh5vXpSjvGKOwIRi31a+keX
 S+Pb+emx79egyWpBfhVif6HecV7cbf1fih5Q/ltW6d2UsRDduVJeMIfHT13z7wXurEFc
 f4FEPF6uZD1S8nwjcJaZ+tv7psKOdeZfezfde/Q92CbhXIulMLbGZRUEZl4cDJrE2AkX
 z83eqqCxr8awKoZHK5U0xXA5Nt4bmrOOVEcer8bREuLyYnamiMR+5nLRS+Poem5JBfi9
 fw6RWmZW4rX01DnZkFEbznw5HJ4q6KDnBbNQYPwJ1uL/2WsGk0KlL40nIEIgZhlvRK66
 qtAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3luxsQnKFyHz6IyCbBbUe1UGmJ9/XiQpVbu0zlYdfDo=;
 b=acSEcjAvF8tkeiPPC+zpaQuPPj/IKPsAcYjppAyTUoxlM1Z3Ln4bOn9QAiOJ92nKU3
 TXRhBhmcIx206rpo2fd9XAJMNQFzCO8aSrX3ZgY4csFNF+DO5MbiqKspOg1L1Ch0iX32
 bExECXkOv4mrKyIRz1DBA5YRLrgLLBC9lNLfX4zuxNSLkVbK8cOVK351Q8Mq3lyynTk9
 Xx9FWLjwaRzGJTCcGSDaIOHYLb34Pq53cGRAnV86P1GRbCxi9HdU37Ak2YsYDl6SlLyr
 b1cFpd8Bm0iDMkSK5dGsPdP3Eko1PAreW/seoAOXHIZc2cyy4TWTRoGtv+Vubxykybqa
 2yvw==
X-Gm-Message-State: AOAM530wI962/72GQlha6b04TTKbOG5aFuhTKDclewsNqTC0/LQvQP7p
 ufQHNLAVp/lqxKkT1S5fGsLKM7FjrV4=
X-Google-Smtp-Source: ABdhPJwy99is7dSKP+rqyseDLCqcxtubmLf2eqqzBHVgN4F6gnNHbT3zfdrUhd1JV92UoJ2GoncEPw==
X-Received: by 2002:a1c:f002:: with SMTP id a2mr15552915wmb.29.1641663344277; 
 Sat, 08 Jan 2022 09:35:44 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:4919:b1be:c8bf:308d])
 by smtp.gmail.com with ESMTPSA id p5sm2136752wma.16.2022.01.08.09.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 09:35:43 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 18:35:41 +0100
Message-Id: <91348c3073b0dcf57a8ea3227bae74c23a122713.1641663315.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1641663315.git.yann.morin.1998@free.fr>
References: <cover.1641663315.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] core/pkg-generic: fixup all PPD paths in a
 generic fashion
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
Cc: Andreas Naumann <anaumann@ultratronik.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Louis-Paul CORDIER <lpdev@cordier.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some files contain hard-coded absolute paths that point to the host
and/or staging directories.

With per-package directories (aka. PPD), these paths point to the PPD
of the package that created the files, when we want them to point to the
PPD of the package that uses them.

Up until now, we had two hooks that attempted to fix those files:

  - a libtool-specific hook that searches for all .la files and seds
    them with the proper PPD,

  - a python-specific hook that tweaks just the sysconfigdata and
    removes the byte-compiled version of the sysconfigdata.

But now, we also have a few other kinds of files for which we need to
fix the PPD: .cmake, .pc, or .pri files, and probably a bunch of others
as well.

We solve this issue by just replacing any PPD in text files, with the
current package's PPD.

This is very similar to, and inspired from what is done when relocating
the SDK. However, we can't use the existing relocate-sdk script, because
that needs to know the original location, which we do not have when we
aggregate the PPD (we could store it, but we can easily do without it).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Louis-Paul CORDIER <lpdev@cordier.org>
Cc: Andreas Naumann <anaumann@ultratronik.de>
---
 package/pkg-generic.mk | 43 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 6a5fe5507b..1022062bcf 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -90,21 +90,24 @@ endif
 #######################################
 # Helper functions
 
-# Make sure .la files only reference the current per-package
-# directory.
-
-# $1: package name (lower case)
-# $2: staging directory of the package
 ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
-define fixup-libtool-files
-	$(Q)find $(2) \( -path '$(2)/lib*' -o -path '$(2)/usr/lib*' \) \
-		-name "*.la" -print0 | xargs -0 --no-run-if-empty \
-		$(SED) "s:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$(1)/:g"
+
+# Ensure files like .la, .pc, .pri, .cmake, and so on, point to the
+# proper staging and host directories for the current package: find
+# all text files that contain the PPD root, and replace it with the
+# current package's PPD.
+define PPD_FIXUP_PATHS
+	$(Q)grep -lrZ '$(PER_PACKAGE_DIR)/[^/]\+/' $(HOST_DIR) \
+	|while read -d '' f; do \
+		file -b --mime-type "$${f}" | grep -q '^text/' || continue; \
+		printf '%s\0' "$${f}"; \
+	done \
+	|xargs -0 --no-run-if-empty \
+		$(SED) 's:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g'
 endef
-endif
 
-# Make sure python _sysconfigdata*.py files only reference the current
-# per-package directory.
+# Remove python's pre-compiled "sysconfigdata", as it may contain paths to
+# the original staging or host dirs.
 #
 # Can't use $(foreach d, $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python*, ...)
 # because those directories may be created in the same recipe this macro will
@@ -113,19 +116,15 @@ endif
 # fail.
 # So we just use HOST_DIR as a starting point, and filter on the two directories
 # of interest.
-ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
 define FIXUP_PYTHON_SYSCONFIGDATA
 	$(Q)find $(HOST_DIR) \
 		\(    -path '$(HOST_DIR)/lib/python*' \
 		   -o -path '$(STAGING_DIR)/usr/lib/python*' \
 		\) \
-		\(    \( -name "_sysconfigdata*.pyc" -delete \) \
-		   -o \( -name "_sysconfigdata*.py" -print0 \) \
-		\) \
-	| xargs -0 --no-run-if-empty \
-		$(SED) 's:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g'
+		\( -name "_sysconfigdata*.pyc" -delete \)
 endef
-endif
+
+endif  # PPD
 
 # Functions to collect statistics about installed files
 
@@ -278,8 +277,6 @@ $(BUILD_DIR)/%/.stamp_configured:
 	@$(call pkg_size_before,$(STAGING_DIR),-staging)
 	@$(call pkg_size_before,$(BINARIES_DIR),-images)
 	@$(call pkg_size_before,$(HOST_DIR),-host)
-	$(call fixup-libtool-files,$(NAME),$(HOST_DIR))
-	$(call fixup-libtool-files,$(NAME),$(STAGING_DIR))
 	$(foreach hook,$($(PKG)_POST_PREPARE_HOOKS),$(call $(hook))$(sep))
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
 	$($(PKG)_CONFIGURE_CMDS)
@@ -836,7 +833,9 @@ $(2)_EXTRACT_CMDS ?= \
 		$$(TAR_OPTIONS) -)
 
 # pre/post-steps hooks
-$(2)_POST_PREPARE_HOOKS += FIXUP_PYTHON_SYSCONFIGDATA
+$(2)_POST_PREPARE_HOOKS += \
+	PPD_FIXUP_PATHS \
+	FIXUP_PYTHON_SYSCONFIGDATA
 
 ifeq ($$($(2)_TYPE),target)
 ifneq ($$(HOST_$(2)_KCONFIG_VAR),)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
