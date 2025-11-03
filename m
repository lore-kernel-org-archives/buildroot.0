Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362EECCFA03
	for <buildroot@archiver.kernel.org>; Mon,  3 Nov 2025 21:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 353FE60A62;
	Mon,  3 Nov 2025 21:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ASOyWHRQuItY; Mon,  3 Nov 2025 21:01:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EC3360A5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EC3360A5B;
	Mon,  3 Nov 2025 21:01:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F59B278
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9094A810F1
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RdKna6Zme3T5 for <buildroot@buildroot.org>;
 Mon,  3 Nov 2025 21:01:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50E0E810EF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50E0E810EF
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:01:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4057A83ACE; Mon,  3 Nov 2025 21:01:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Nov 2025 21:25:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 37d270262585709225a865c7a9ad6d7cd9008f39
X-Git-Newrev: 14a0169714cd5c35be40faadc066412f144bc1a6
X-Patchwork-Hint: ignore
Message-Id: <20251103210126.4057A83ACE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uboot-tools: Bump to version
 2025.10
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2161518304287934049=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2161518304287934049==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=14a0169714cd5c35be40faadc066412f144bc1a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- The mkeficapsule tools need gnutls to build, and the config dependency
  to build the tool has changed
- CONFIG_FIT_SIGNATURE need to be defined to build fit_check_sign
- CONFIG_FIT_PRINT does not need to be defined anymore
- Remove patch 2 and reorder patch files
- Include linux/kconfig.h to include/config.h to allow IS_ENABLED macro
  to be used in c files

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
[Julien: update .checkpackageignore to fix check-package errors]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  3 +-
 ...le-fix-C-LD-FLAGS-with-CROSS_BUILD_TOOLS.patch} |  0
 .../0002-tools-only-in-no-dot-config-targets.patch | 44 ----------------------
 package/uboot-tools/uboot-tools.hash               |  2 +-
 package/uboot-tools/uboot-tools.mk                 | 21 +++++++----
 5 files changed, 15 insertions(+), 55 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index f146382d34..efe5d54711 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1059,8 +1059,7 @@ package/tstools/0001-build-get-along-with-buildroot.patch lib_patch.Upstream
 package/tvheadend/0001-no-check_config.patch lib_patch.Upstream
 package/tvheadend/S99tvheadend Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/uboot-tools/0001-drop-configh-from-tools.patch lib_patch.Upstream
-package/uboot-tools/0002-tools-only-in-no-dot-config-targets.patch lib_patch.Upstream
-package/uboot-tools/0003-tools-Makefile-fix-C-LD-FLAGS-with-CROSS_BUILD_TOOLS.patch lib_patch.Upstream
+package/uboot-tools/0002-tools-Makefile-fix-C-LD-FLAGS-with-CROSS_BUILD_TOOLS.patch lib_patch.Upstream
 package/ubus/0001-Install-server-and-client-examples.patch lib_patch.Upstream
 package/uemacs/01-clear-ixon-termios-flag.patch lib_patch.Upstream
 package/uhd/0001-host-CMakeLists-add-boost-unit_test_framework-requir.patch lib_patch.Upstream
diff --git a/package/uboot-tools/0003-tools-Makefile-fix-C-LD-FLAGS-with-CROSS_BUILD_TOOLS.patch b/package/uboot-tools/0002-tools-Makefile-fix-C-LD-FLAGS-with-CROSS_BUILD_TOOLS.patch
similarity index 100%
rename from package/uboot-tools/0003-tools-Makefile-fix-C-LD-FLAGS-with-CROSS_BUILD_TOOLS.patch
rename to package/uboot-tools/0002-tools-Makefile-fix-C-LD-FLAGS-with-CROSS_BUILD_TOOLS.patch
diff --git a/package/uboot-tools/0002-tools-only-in-no-dot-config-targets.patch b/package/uboot-tools/0002-tools-only-in-no-dot-config-targets.patch
deleted file mode 100644
index 8557af499a..0000000000
--- a/package/uboot-tools/0002-tools-only-in-no-dot-config-targets.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 460646b3c4c1718860915c38586ee8d2fbda38e4 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Sun, 1 Feb 2015 21:53:47 +0100
-Subject: [PATCH] tools only in no dot config targets
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Revert upstream commit c7ad5cbb1ef2c33883f0fa7d0455095004fd306d:
-
-    Makefile: drop "tools-only" from no-dot-config-targets
-
-This indirectly pulls in a build-dependency on libssl-dev used for FIT
-image support, and possibly GPL/OpenSSL licensing incompatibility
-issues.
-
-Based on Debian patch from u-boot-tools:
-http://ftp.de.debian.org/debian/pool/main/u/u-boot/u-boot_2014.10+dfsg1-2.1.debian.tar.xz
-
-Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
-[fabio: adapt it to 2016.09]
-Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
-[Fabrice: adapt it to 2021.04]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 6aa08964ff..fcec83d183 100644
---- a/Makefile
-+++ b/Makefile
-@@ -486,7 +486,7 @@ defaultenv_h := include/generated/defaultenv_autogenerated.h
- 
- no-dot-config-targets := clean clobber mrproper distclean \
- 			 help %docs check% coccicheck \
--			 ubootversion backup tests check qcheck tcheck
-+			 ubootversion backup tests tools-only check qcheck tcheck
- 
- config-targets := 0
- mixed-targets  := 0
--- 
-2.20.1
-
diff --git a/package/uboot-tools/uboot-tools.hash b/package/uboot-tools/uboot-tools.hash
index 5a48926ebe..7b71e2d948 100644
--- a/package/uboot-tools/uboot-tools.hash
+++ b/package/uboot-tools/uboot-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  312b7eeae44581d1362c3a3f02c28d806647756c82ba8c72241c7cdbe68ba77e  u-boot-2021.07.tar.bz2
+sha256  b4f032848e56cc8f213ad59f9132c084dbbb632bc29176d024e58220e0efdf4a  u-boot-2025.10.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 1925047ccd..dcc9c08fd2 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_TOOLS_VERSION = 2021.07
+UBOOT_TOOLS_VERSION = 2025.10
 UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE = https://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPL-2.0+
@@ -15,14 +15,16 @@ UBOOT_TOOLS_INSTALL_STAGING = YES
 
 # u-boot 2020.01+ needs make 4.0+
 UBOOT_TOOLS_DEPENDENCIES = $(BR2_MAKE_HOST_DEPENDENCY)
-HOST_UBOOT_TOOLS_DEPENDENCIES = $(BR2_MAKE_HOST_DEPENDENCY)
+HOST_UBOOT_TOOLS_DEPENDENCIES = $(BR2_MAKE_HOST_DEPENDENCY) host-gnutls
 
 define UBOOT_TOOLS_CONFIGURE_CMDS
 	mkdir -p $(@D)/include/config
+	echo "#include <linux/kconfig.h>" > $(@D)/include/config.h
 	touch $(@D)/include/config/auto.conf
 	mkdir -p $(@D)/include/generated
-	touch $(@D)/include/generated/autoconf.h
-	echo $(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),'#define CONFIG_FIT_PRINT 1') >> $(@D)/include/generated/autoconf.h
+	echo "#define CONFIG_TOOLS_SHA256 1" >> $(@D)/include/generated/autoconf.h
+	echo "#define CONFIG_TOOLS_SHA1 1" >> $(@D)/include/generated/autoconf.h
+	echo $(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),'#define CONFIG_FIT_SIGNATURE 1') >> $(@D)/include/generated/autoconf.h
 	mkdir -p $(@D)/include/asm
 	touch $(@D)/include/asm/linkage.h
 endef
@@ -44,7 +46,8 @@ UBOOT_TOOLS_DEPENDENCIES += openssl host-pkgconf
 endif
 
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_MKEFICAPSULE),y)
-UBOOT_TOOLS_MAKE_OPTS += CONFIG_EFI_HAVE_CAPSULE_SUPPORT=y
+UBOOT_TOOLS_MAKE_OPTS += CONFIG_TOOLS_MKEFICAPSULE=y
+UBOOT_TOOLS_DEPENDENCIES += gnutls
 endif
 
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FIT_CHECK_SIGN),y)
@@ -109,10 +112,12 @@ endef
 
 define HOST_UBOOT_TOOLS_CONFIGURE_CMDS
 	mkdir -p $(@D)/include/config
+	echo "#include <linux/kconfig.h>" > $(@D)/include/config.h
 	touch $(@D)/include/config/auto.conf
 	mkdir -p $(@D)/include/generated
-	touch $(@D)/include/generated/autoconf.h
-	echo $(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),'#define CONFIG_FIT_PRINT 1') >> $(@D)/include/generated/autoconf.h
+	echo "#define CONFIG_TOOLS_SHA256 1" >> $(@D)/include/generated/autoconf.h
+	echo "#define CONFIG_TOOLS_SHA1 1" >> $(@D)/include/generated/autoconf.h
+	echo $(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),'#define CONFIG_FIT_SIGNATURE 1') >> $(@D)/include/generated/autoconf.h
 	mkdir -p $(@D)/include/asm
 	touch $(@D)/include/asm/linkage.h
 endef
@@ -120,7 +125,7 @@ endef
 HOST_UBOOT_TOOLS_MAKE_OPTS = HOSTCC="$(HOSTCC)" \
 	HOSTCFLAGS="$(HOST_CFLAGS)" \
 	HOSTLDFLAGS="$(HOST_LDFLAGS)" \
-	CONFIG_EFI_HAVE_CAPSULE_SUPPORT=y
+	CONFIG_TOOLS_MKEFICAPSULE=y
 
 ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),y)
 HOST_UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT=y CONFIG_MKIMAGE_DTC_PATH=dtc

--===============2161518304287934049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2161518304287934049==--
