Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B451C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 19:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A88E940186;
	Sun,  6 Feb 2022 19:17:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LKnwvSpi_B_J; Sun,  6 Feb 2022 19:17:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60E4440191;
	Sun,  6 Feb 2022 19:17:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 653361BF384
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 19:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 544C1402AC
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 19:17:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jU0THcIX3ZY5 for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 19:17:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9641A401EF
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 19:17:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9865682BCC; Sun,  6 Feb 2022 19:10:14 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 20:16:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b42e87772a995b19913822b810f876a5890d2369
X-Git-Newrev: 3621918d1bc1ddc9312dd1cc8dec6db61e712fe2
X-Patchwork-Hint: ignore
Message-Id: <20220206191014.9865682BCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ace: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3621918d1bc1ddc9312dd1cc8dec6db61e712fe2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ACE is an open-source framework that provides many components and
patterns for developing high-performance, distributed real-time
and embedded systems. It provides powerful, yet efficient abstractions
for sockets, demultiplexing loops, threads, synchronization primitives.

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                      |  1 +
 package/Config.in               |  1 +
 package/ace/Config.in           | 12 ++++++++
 package/ace/ace.hash            |  3 ++
 package/ace/ace.mk              | 61 +++++++++++++++++++++++++++++++++++++++++
 package/ace/platform_macros.GNU | 14 ++++++++++
 6 files changed, 92 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c52cb35b60..1d1cf99898 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1868,6 +1868,7 @@ F:	board/qemu/ppc64-e5500/
 F:	configs/freescale_p*
 F:	configs/freescale_t*
 F:	configs/qemu_ppc64_e5500_defconfig
+F:	package/ace/
 F:	package/argp-standalone/
 F:	package/aufs/
 F:	package/aufs-util/
diff --git a/package/Config.in b/package/Config.in
index e4ca195beb..43ce9013c6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1924,6 +1924,7 @@ menu "Networking"
 endmenu
 
 menu "Other"
+	source "package/ace/Config.in"
 	source "package/apr/Config.in"
 	source "package/apr-util/Config.in"
 	source "package/argp-standalone/Config.in"
diff --git a/package/ace/Config.in b/package/ace/Config.in
new file mode 100644
index 0000000000..226e34df32
--- /dev/null
+++ b/package/ace/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_ACE
+	bool "ace"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_STATIC_LIBS
+	help
+	  The ADAPTIVE Communication Environment (ACE(TM))
+	  An OO Network Programming Toolkit in C++.
+
+	  http://www.dre.vanderbilt.edu/~schmidt/ACE.html
+
+comment "ACE needs a glibc toolchain, dynamic library"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS
diff --git a/package/ace/ace.hash b/package/ace/ace.hash
new file mode 100644
index 0000000000..92fd42e131
--- /dev/null
+++ b/package/ace/ace.hash
@@ -0,0 +1,3 @@
+# Locally Computed:
+sha256  a28339750620c70cd29a8a7088a4bc6ebaf1ff7ba667498a0279ac97f0e32e01  ACE-7.0.1.tar.gz
+sha256  687bf9d16119e0caf6fb5c18214928fd6ea0da10df91e906255b7613af8061d8  COPYING
diff --git a/package/ace/ace.mk b/package/ace/ace.mk
new file mode 100644
index 0000000000..b6b4cfbc24
--- /dev/null
+++ b/package/ace/ace.mk
@@ -0,0 +1,61 @@
+################################################################################
+#
+# ace
+#
+################################################################################
+
+ACE_VERSION = 7.0.1
+ACE_SOURCE = ACE-$(ACE_VERSION).tar.gz
+ACE_SITE = http://download.dre.vanderbilt.edu/previous_versions
+ACE_LICENSE = DOC
+ACE_LICENSE_FILES = COPYING
+ACE_INSTALL_STAGING = YES
+ACE_CPE_ID_VENDOR = vanderbilt
+ACE_CPE_ID_PRODUCT = adaptive_communication_environment
+
+# Note: We are excluding examples, apps and tests
+# Only compiling ACE libraries (no TAO)
+ACE_LIBARIES = ace ACEXML Kokyu netsvcs protocols/ace
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ACE_LIBARIES += ace/SSL
+ACE_DEPENDENCIES += openssl
+define ACE_CONFIGURE_SSL
+	echo "ssl = 1" >> $(@D)/include/makeinclude/platform_macros.GNU
+endef
+endif
+
+# configure the target build
+# refer: http://www.dre.vanderbilt.edu/~schmidt/DOC_ROOT/ACE/ACE-INSTALL.html#unix
+define ACE_CONFIGURE_CMDS
+	# create a config file
+	echo ' #include "ace/config-linux.h" ' >> $(@D)/ace/config.h
+
+	# Create platform/compiler-specific Makefile configurations
+	$(INSTALL) -m 0644 package/ace/platform_macros.GNU $(@D)/include/makeinclude/
+
+	$(ACE_CONFIGURE_SSL)
+endef
+
+define ACE_BUILD_CMDS
+	$(foreach lib,$(ACE_LIBARIES), \
+		$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/$(lib) ACE_ROOT="$(@D)" all
+	)
+endef
+
+define  ACE_LIBARIES_INSTALL
+	mkdir -p $(1)/usr/share/ace
+	$(foreach lib,$(ACE_LIBARIES), \
+		$(MAKE) -C $(@D)/$(lib) ACE_ROOT="$(@D)" DESTDIR=$(1) install
+	)
+endef
+
+define  ACE_INSTALL_TARGET_CMDS
+	$(call ACE_LIBARIES_INSTALL,$(TARGET_DIR))
+endef
+
+define  ACE_INSTALL_STAGING_CMDS
+	$(call ACE_LIBARIES_INSTALL,$(STAGING_DIR))
+endef
+
+$(eval $(generic-package))
diff --git a/package/ace/platform_macros.GNU b/package/ace/platform_macros.GNU
new file mode 100644
index 0000000000..ab5ec25a1b
--- /dev/null
+++ b/package/ace/platform_macros.GNU
@@ -0,0 +1,14 @@
+# help: http://www.dre.vanderbilt.edu/~schmidt/DOC_ROOT/ACE/ACE-INSTALL.html#unix
+
+# create a platform macros file
+include $(ACE_ROOT)/include/makeinclude/platform_linux.GNU
+
+# disable RPATH
+install_rpath = 0
+
+# set the installation prefix
+INSTALL_PREFIX = /usr
+
+# fix link error with ARM EABI tools
+# http://list.isis.vanderbilt.edu/pipermail/ace-users/2008-January/002742.html
+no_hidden_visibility = 1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
