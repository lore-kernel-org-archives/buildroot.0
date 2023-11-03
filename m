Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02044C4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 18:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F528408E5;
	Fri,  3 Nov 2023 18:28:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F528408E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EZi8BnmD0pn8; Fri,  3 Nov 2023 18:27:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7392408E8;
	Fri,  3 Nov 2023 18:27:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7392408E8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 21F131BF57C
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 18:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED33B40232
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 18:27:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED33B40232
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nsyED6Nr91wi for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 18:27:50 +0000 (UTC)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B8EEE40124
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 18:27:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8EEE40124
Received: by mail-pf1-x442.google.com with SMTP id
 d2e1a72fcca58-6c396ef9a3dso341734b3a.1
 for <buildroot@buildroot.org>; Fri, 03 Nov 2023 11:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699036070; x=1699640870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cRE/qLkebrX0pon+8VHUkXjXDCLGhwvnw5h/++emFo4=;
 b=YWu+nThKbPrhknEJJ3Uajt98WdAPjYB1NVwkFkvjpQMoK3CYBxe7M/Ni6W5Pj1uXEw
 jeB8n2cjI0sYm6IVeRHGYbgj/ynWO4Hu/iRRqYFaRjokvOOgKAD897VX9dFUTb8eaQxZ
 LMjQGFjdxOiToqQDaS5tHu9rP3daqH4TU8Cq7hPl4seuOQ2WLzVse/hmiKq/wzdxOYL/
 Ac5+/uoEkyeqxNuU6i8+7D9NbdH4aeqvIE8YZLT7oSNO/mzOUzdjLj8Y42cevN2a649O
 fMt4CsmL5BCaz0Hd9XYlb1PITqQycPInlIbeMOL2uXG6wj0eEjAmaO5IigfOuy6CVu1B
 tycg==
X-Gm-Message-State: AOJu0YzOnefMBRaCkmI5PaQj9HHi8E2L8z4fCIUhpLEZ3Sok0oE71aGR
 qljYqwXkhka66S2bz2oJ8LhHGcT7NTEvOmNtnRAA8VK50oM=
X-Google-Smtp-Source: AGHT+IHgByfZRPuZrJ4ibfBlHJ5X1QXpR42D/47MMF9AkxfWoW2kxM112bXRJQVxrncqYI9o60xy9A==
X-Received: by 2002:a05:6a21:3e14:b0:180:d01b:ba77 with SMTP id
 bk20-20020a056a213e1400b00180d01bba77mr13618940pzc.60.1699036069549; 
 Fri, 03 Nov 2023 11:27:49 -0700 (PDT)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a636505000000b005b7e3eddb87sm1602164pgb.61.2023.11.03.11.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 11:27:48 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  3 Nov 2023 12:27:43 -0600
Message-ID: <20231103182745.903344-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231103182745.903344-1-adam.duskett@amarulasolutions.com>
References: <20231103182745.903344-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699036070; x=1699640870;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cRE/qLkebrX0pon+8VHUkXjXDCLGhwvnw5h/++emFo4=;
 b=jkN7shxrPRNZH6AAsnVR+f+MzVACEONGC7O9cax758NCTr788muOX3bD0bRL5sDBQF
 lY6TkFnx7LHYWFYh8lzc/ufvuiuFYOm37ACL6JDX247lQJwlnc4op59G7Q1uKkj7t5aW
 4lDudtv9gNy2oGkQeB69HSWUX3V5hlTQUigHY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=jkN7shxr
Subject: [Buildroot] [PATCH 1/3] Makefile: add tainting support
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Packages that may harm the build reproducibility or licensing of a build
should declare the ${PKG_NAME}_TAINTS variable. If a package taints the build,
add its name to a list of tainting packages. The build ends with a warning
message if the tainting packages list is not empty. Moreover, legal info will
show a warning in the presence of a tainting package.

However, as pointed out by Yann, a user may be using a local repository for
their packages (I.E., NPM). Below are three examples:

BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL="http://myserver/node-mods/VERSION/foo"
  - The user manages the repository and guarantees that it is reproducible.

BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL="$(BR2_EXTERANL_MY_TREE_PATH)/mods/foo"
  - Reproducible by way of being in a git-versioned br2-external tree.

BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL="foo@1.2.3"
  - Reproducible because the version is specified.

As there is no way of reading a user's mind, we introduce a new option:
BR2_DISABLE_TAINT_CHECKING, which does what the option name suggests: The
option allows a user to explicitly turn off taint checking if they want to do
so.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 Config.in              |  9 +++++++++
 Makefile               | 17 +++++++++++++++++
 package/pkg-generic.mk | 19 +++++++++++++++++++
 3 files changed, 45 insertions(+)

diff --git a/Config.in b/Config.in
index 556b6c2575..3fc2d67bd9 100644
--- a/Config.in
+++ b/Config.in
@@ -685,6 +685,15 @@ config BR2_GLOBAL_PATCH_DIR
 
 menu "Advanced"
 
+config BR2_DISABLE_TAINT_CHECKING
+	bool "Disable taint checking"
+	help
+	  By default, selecting and using package managers such as NPM sets
+	  the tainted build flag and display a warning message; however, if
+	  you are confident that what you are building is from a trusted
+	  source, such as a local package repository, then this option
+	  disables taint checking.
+
 config BR2_FORCE_HOST_BUILD
 	bool "Force the building of host dependencies"
 	help
diff --git a/Makefile b/Makefile
index 3e85d5ef09..053924c7c8 100644
--- a/Makefile
+++ b/Makefile
@@ -807,6 +807,18 @@ endif # merged /usr
 
 	touch $(TARGET_DIR)/usr
 
+.PHONY: check-tainted
+check-tainted:
+ifneq ($(BR2_DISABLE_TAINT_CHECKING),y)
+ifneq ($(BR2_TAINTED_BY),)
+	@echo "Your buildroot configuration is tainted by: $(BR2_TAINTED_BY)"
+else
+	@echo "Your buildroot configuration is not tainted"
+endif
+else
+	@echo "Taint checking disabled"
+endif
+
 # Note: this will run in the filesystem context, so will use a copy
 # of target/, not the real one, so the files are still available on
 # re-builds (foo-rebuild, etc...)
@@ -822,6 +834,10 @@ target-post-image: $(TARGETS_ROOTFS) target-finalize staging-finalize
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
 		$(call MESSAGE,"Executing post-image script $(s)"); \
 		$(EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
+ifneq ($(BR2_DISABLE_TAINT_CHECKING),y)
+	$(if $(BR2_TAINTED_BY), @echo "WARNING: Your buildroot configuration is tainted by: $(BR2_TAINTED_BY)!")
+endif
+
 
 .PHONY: source
 source: $(foreach p,$(PACKAGES),$(p)-all-source)
@@ -1188,6 +1204,7 @@ help:
 	@echo '  source                 - download all sources needed for offline-build'
 	@echo '  external-deps          - list external packages used'
 	@echo '  legal-info             - generate info about license compliance'
+	@echo '  check-tainted          - check if any selected package harms build reproducibility or licensing'
 	@echo '  show-info              - generate info about packages, as a JSON blurb'
 	@echo '  pkg-stats              - generate info about packages as JSON and HTML'
 	@echo '  printvars              - dump internal variables selected with VARS=...'
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 289fa552b4..7ffb544300 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1102,6 +1102,17 @@ else
 $(2)_KCONFIG_VAR = BR2_PACKAGE_$(2)
 endif
 
+ifneq ($(BR2_DISABLE_TAINT_CHECKING),y)
+ifdef $(2)_TAINTS
+ifeq ($$($$($(2)_KCONFIG_VAR)),y)
+BR2_TAINTED_BY+=$$($(2)_RAWNAME)
+endif
+ifeq ($$($(2)_TYPE),host)
+$$(error "Host package $(1) has $(2)_TAINTS set: not supported)
+endif
+endif
+endif
+
 # legal-info: declare dependencies and set values used later for the manifest
 ifneq ($$($(2)_LICENSE_FILES),)
 $(2)_MANIFEST_LICENSE_FILES = $$($(2)_LICENSE_FILES)
@@ -1141,6 +1152,14 @@ else
 	$(Q)$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$($(2)_BASENAME_RAW),$$($(2)_HASH_FILE),$$(F),$$($(2)_DIR)/$$(F),$$(call UPPERCASE,$(4)))$$(sep))
 endif # license files
 
+ifneq ($(BR2_DISABLE_TAINT_CHECKING),y)
+ifeq ($$(call qstrip,$$($(2)_TAINTS)),YES)
+ifeq ($$($$($(2)_KCONFIG_VAR)),y)
+	$(Q)$$(call legal-warning-pkg,$$($(2)_RAWNAME),unknown license for additional modules or dependencies)
+endif
+endif
+endif
+
 ifeq ($$($(2)_REDISTRIBUTE),YES)
 ifeq ($$($(2)_SITE_METHOD),local)
 # Packages without a tarball: don't save and warn
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
