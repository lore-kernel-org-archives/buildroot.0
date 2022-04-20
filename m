Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B22C433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 12:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB13382425;
	Wed, 20 Apr 2022 12:14:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wba92vz8paPC; Wed, 20 Apr 2022 12:14:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DE7281A18;
	Wed, 20 Apr 2022 12:14:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B3CA21BF30D
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 12:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1A2081A18
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 12:14:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g4P6H03UVHZv for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 12:14:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F3DA81842
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 12:14:11 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id y21so1065739wmi.2
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 05:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nl6AiZ+5O3g8Y2RVw4AjeBKNPq7Joa/QGsuei4qSiSE=;
 b=bZXOj69qo2C0R5HIeEKPowBgtXbLZs/aOw7+cyukBIxeHnxiDKHDVWGUEBL6o/+tIs
 Gl1lRGp7pGruKnHnrRdMWhZIltMulsn0es2Lk5N4A8Di94jU2XfUq6Fw4/vAfdNpWQNM
 +ZwYyKdCD2u9mRWefUH6n9VQpAAlobAcrQiW3/RiwivXkbgdij1J+OYh/aYSbYvhJsqc
 xWp5HgZ7n7tX2TcD1ZJOeXNryHTHbvD1rIMM2GosETkRI0NQ8/yuCBvW91bxHbTLiftC
 iTh4BuEJVQSkhKxuRZDi6apb4ZCrkX6Qxvkjo1pj41Ifkef47snbnIRTw+inn1ebkelj
 2Axw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nl6AiZ+5O3g8Y2RVw4AjeBKNPq7Joa/QGsuei4qSiSE=;
 b=3CFELAYkFhgUdpvfXhhZs4lif+0JmNFeSSM95739+8HRCIOIqIHKNvdJ5gItwK49Di
 iLM8VBSrIzxdYS9QiWOPNcloHr8tubibpTQ/HrcjySHgk6pz/LUA5VJbeIzTD07ZYQGe
 wIj1Pk3MpCVWmxhXg3gd/jWb1CfLCBy0PlBi7tXsxo5tTwi+sZXm9Uu6+EoucHdRKa1U
 0a9p4347hZJ5MNxmzK3b/n7eXkLTcSRrDPfTB/guCXyxQOxeiPQmG9KCh92gaebX6Egf
 PF5ULkW2x21y4cUNc0yW0OdyuIukXh4V22o5AnwIMWTCElYuVzxoVSh/tEASpWglgyAV
 QjPA==
X-Gm-Message-State: AOAM533mXRyybQUXPr3c5bmP5N2nh4vHKg7dN6UdlT5eUBgHT6Cu3JDb
 nQYaUULxuENXOQ2jk4hcbMg7/aTaz1A=
X-Google-Smtp-Source: ABdhPJxYQoQwqC8EfIlXv1I3lzLHAkC2wl9XK377G0XOGxWsaCVoSV8pcXIa1968CMe69dI5QgdKbA==
X-Received: by 2002:a7b:cb84:0:b0:382:a9b9:2339 with SMTP id
 m4-20020a7bcb84000000b00382a9b92339mr3490900wmi.91.1650456849137; 
 Wed, 20 Apr 2022 05:14:09 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 j36-20020a05600c1c2400b0038ec526a0e3sm27260596wms.9.2022.04.20.05.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 05:14:08 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Apr 2022 14:12:02 +0200
Message-Id: <20220420121202.1074548-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/boost: drop tagged layout
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop boost tagged layout which raises the following build failure with
botan or libcpprestsdk:

/nvmedata/autobuild/instance-31/output-1/host/opt/ext-toolchain/bin/../lib/gcc/m68k-buildroot-linux-uclibc/11.2.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: cannot find -lboost_system

CMake Error at /usr/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:230 (message):
  Could NOT find Boost (missing: random system thread filesystem chrono
  atomic date_time regex) (found version "1.78.0")

While at it:
 - drop BR2_PACKAGE_BOOST_LAYOUT and BR2_PACKAGE_BOOST_LAYOUT_SYSTEM
 - move --layout=system, --ignore-site-config,
   --user-config=$(@D)/user-config.jam, -j$(PARALLEL_JOBS), -q and
   --prefix=$(HOST_DIR) to BOOST_OPTS and HOST_BOOST_OPTS
 - drop parentheses to avoid spawning a useless sub-shell
 - use b2 everywhere instead of mixing b2 and
   tools/build/src/engine/bjam
 - drop uneeded 'echo "" >> $(@D)/user-config.jam'

Fixes:
 - http://autobuild.buildroot.org/results/f237c9345faf8c28f3c73f7d8acb49271fe61780
 - http://autobuild.buildroot.org/results/a73225e40fa29bc3b24f36a86719e80c8e469d1f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in.legacy        | 13 ++++++++++
 package/boost/Config.in | 27 ---------------------
 package/boost/boost.mk  | 53 ++++++++++++++---------------------------
 3 files changed, 31 insertions(+), 62 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 27f19f14e7..a4811831f3 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,19 @@ endif
 
 comment "Legacy options removed in 2022.05"
 
+config BR2_PACKAGE_BOOST_LAYOUT_SYSTEM
+	bool "boost system layout removed"
+	select BR2_LEGACY
+	help
+	  Boost system layout is now the only supported layout.
+
+config BR2_PACKAGE_BOOST_LAYOUT_TAGGED
+	bool "boost tagged layout removed"
+	select BR2_LEGACY
+	help
+	  Boost tagged layout isn't handled by some packages (e.g. botan
+	  or libcpprestsdk).
+
 config BR2_PACKAGE_BOOST_LAYOUT_VERSIONED
 	bool "boost versioned layout removed"
 	select BR2_LEGACY
diff --git a/package/boost/Config.in b/package/boost/Config.in
index 9e96be7878..b99b01f22e 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -16,33 +16,6 @@ config BR2_PACKAGE_BOOST
 
 if BR2_PACKAGE_BOOST
 
-choice
-	prompt "Layout"
-	default BR2_PACKAGE_BOOST_LAYOUT_SYSTEM
-	help
-	  Selects the layout of Boost binary names
-
-config BR2_PACKAGE_BOOST_LAYOUT_SYSTEM
-	bool "system"
-	help
-	  Boost binary names do not include the Boost version number
-	  or the name and version number of the compiler.
-
-config BR2_PACKAGE_BOOST_LAYOUT_TAGGED
-	bool "tagged"
-	help
-	  Boost binary names include the encoded build properties such
-	  as variant and threading, but do not include compiler name
-	  and version, or Boost version. This option is useful if you
-	  build several variants of Boost, using the same compiler.
-
-endchoice
-
-config BR2_PACKAGE_BOOST_LAYOUT
-	string
-	default "system" if BR2_PACKAGE_BOOST_LAYOUT_SYSTEM
-	default "tagged" if BR2_PACKAGE_BOOST_LAYOUT_TAGGED
-
 config BR2_PACKAGE_BOOST_ATOMIC
 	bool "boost-atomic"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 032ba5c820..346d309777 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -76,7 +76,9 @@ BOOST_DEPENDENCIES += python3
 endif
 
 HOST_BOOST_OPTS += --no-cmake-config toolset=gcc threading=multi \
-	variant=release link=shared runtime-link=shared
+	variant=release link=shared runtime-link=shared -j$(PARALLEL_JOBS) -q \
+	--ignore-site-config --layout=system --prefix=$(HOST_DIR) \
+	--user-config=$(@D)/user-config.jam
 
 ifeq ($(BR2_MIPS_OABI32),y)
 BOOST_ABI = o32
@@ -90,7 +92,12 @@ BOOST_OPTS += --no-cmake-config \
 	toolset=gcc \
 	threading=multi \
 	abi=$(BOOST_ABI) \
-	variant=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release)
+	variant=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release) \
+	-j$(PARALLEL_JOBS) \
+	-q \
+	--ignore-site-config \
+	--layout=system \
+	--user-config=$(@D)/user-config.jam
 
 ifeq ($(BR2_sparc64),y)
 BOOST_OPTS += architecture=sparc instruction-set=ultrasparc
@@ -119,43 +126,29 @@ endif
 
 BOOST_WITHOUT_FLAGS_COMMASEPARATED += $(subst $(space),$(comma),$(strip $(BOOST_WITHOUT_FLAGS)))
 BOOST_FLAGS += $(if $(BOOST_WITHOUT_FLAGS_COMMASEPARATED), --without-libraries=$(BOOST_WITHOUT_FLAGS_COMMASEPARATED))
-BOOST_LAYOUT = $(call qstrip, $(BR2_PACKAGE_BOOST_LAYOUT))
 
 # how verbose should the build be?
 BOOST_OPTS += $(if $(QUIET),-d,-d+1)
 HOST_BOOST_OPTS += $(if $(QUIET),-d,-d+1)
 
 define BOOST_CONFIGURE_CMDS
-	(cd $(@D) && ./bootstrap.sh $(BOOST_FLAGS))
+	cd $(@D) && ./bootstrap.sh $(BOOST_FLAGS)
 	echo "using gcc : `$(TARGET_CC) -dumpversion` : $(TARGET_CXX) : <cxxflags>\"$(BOOST_TARGET_CXXFLAGS)\" <linkflags>\"$(TARGET_LDFLAGS)\" ;" > $(@D)/user-config.jam
-	echo "" >> $(@D)/user-config.jam
 	sed -i "s/: -O.* ;/: $(TARGET_OPTIMIZATION) ;/" $(@D)/tools/build/src/tools/gcc.jam
 endef
 
 define BOOST_BUILD_CMDS
-	(cd $(@D) && $(TARGET_MAKE_ENV) ./tools/build/src/engine/bjam -j$(PARALLEL_JOBS) -q \
-	--user-config=$(@D)/user-config.jam \
-	$(BOOST_OPTS) \
-	--ignore-site-config \
-	--layout=$(BOOST_LAYOUT))
+	cd $(@D) && $(TARGET_MAKE_ENV) ./b2 $(BOOST_OPTS)
 endef
 
 define BOOST_INSTALL_TARGET_CMDS
-	(cd $(@D) && $(TARGET_MAKE_ENV) ./b2 -j$(PARALLEL_JOBS) -q \
-	--user-config=$(@D)/user-config.jam \
-	$(BOOST_OPTS) \
-	--prefix=$(TARGET_DIR)/usr \
-	--ignore-site-config \
-	--layout=$(BOOST_LAYOUT) install )
+	cd $(@D) && $(TARGET_MAKE_ENV) ./b2 $(BOOST_OPTS) \
+		--prefix=$(TARGET_DIR)/usr install
 endef
 
 define BOOST_INSTALL_STAGING_CMDS
-	(cd $(@D) && $(TARGET_MAKE_ENV) ./tools/build/src/engine/bjam -j$(PARALLEL_JOBS) -q \
-	--user-config=$(@D)/user-config.jam \
-	$(BOOST_OPTS) \
-	--prefix=$(STAGING_DIR)/usr \
-	--ignore-site-config \
-	--layout=$(BOOST_LAYOUT) install)
+	cd $(@D) && $(TARGET_MAKE_ENV) ./b2 $(BOOST_OPTS) \
+		--prefix=$(STAGING_DIR)/usr install
 endef
 
 # These hooks will help us to detect missing select in Config.in
@@ -177,26 +170,16 @@ endef
 BOOST_POST_INSTALL_TARGET_HOOKS += BOOST_CHECK_TARGET_LIBRARIES
 
 define HOST_BOOST_CONFIGURE_CMDS
-	(cd $(@D) && ./bootstrap.sh $(HOST_BOOST_FLAGS))
+	cd $(@D) && ./bootstrap.sh $(HOST_BOOST_FLAGS)
 	echo "using gcc : `$(HOST_CC) -dumpversion` : $(HOSTCXX) : <cxxflags>\"$(HOST_CXXFLAGS)\" <linkflags>\"$(HOST_LDFLAGS)\" ;" > $(@D)/user-config.jam
-	echo "" >> $(@D)/user-config.jam
 endef
 
 define HOST_BOOST_BUILD_CMDS
-	(cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q \
-	--user-config=$(@D)/user-config.jam \
-	$(HOST_BOOST_OPTS) \
-	--ignore-site-config \
-	--prefix=$(HOST_DIR) )
+	cd $(@D) && ./b2 $(HOST_BOOST_OPTS)
 endef
 
 define HOST_BOOST_INSTALL_CMDS
-	(cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q \
-	--user-config=$(@D)/user-config.jam \
-	$(HOST_BOOST_OPTS) \
-	--prefix=$(HOST_DIR) \
-	--ignore-site-config \
-	--layout=$(BOOST_LAYOUT) install )
+	cd $(@D) && ./b2 $(HOST_BOOST_OPTS) install
 endef
 
 $(eval $(generic-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
