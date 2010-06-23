From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 23 Jun 2010 11:27:29 +0200
Subject: [Buildroot] [git commit master 1/1] module-init-tools: don't build
	documentation
Message-ID: <20100623092837.E114981886@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=503f8c041d7791d89538b214a0df1a946c4f7586
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We don't have docbook2man in buildroot, and the build breaks if you
have it on the host, but in an incompatible version (like on my machine).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                        |    5 +++--
 package/module-init-tools/module-init-tools.mk |    2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index c06b3cc..5f84453 100644
--- a/CHANGES
+++ b/CHANGES
@@ -15,8 +15,9 @@
 
 	Updated/fixed packages: busybox, cdrkit, file, gawk,
 	gstreamer, intltool, ipsec-tools, iptables, libart, libidn,
-	lmbench, lrzsz, ncurses, netperf, ntfsprogs, openssl, php, qt,
-	sqlite, squashfs, tn5250, usbutils, xkeyboard-config
+	lmbench, lrzsz, ncurses, module-init-tools, netperf,
+	ntfsprogs, openssl, php, qt, sqlite, squashfs, tn5250,
+	usbutils, xkeyboard-config
 
 	Removed packages: modutils
 
diff --git a/package/module-init-tools/module-init-tools.mk b/package/module-init-tools/module-init-tools.mk
index ea7c014..5dfdaad 100644
--- a/package/module-init-tools/module-init-tools.mk
+++ b/package/module-init-tools/module-init-tools.mk
@@ -6,6 +6,7 @@
 MODULE_INIT_TOOLS_VERSION=3.11
 MODULE_INIT_TOOLS_SOURCE=module-init-tools-$(MODULE_INIT_TOOLS_VERSION).tar.bz2
 MODULE_INIT_TOOLS_SITE=$(BR2_KERNEL_MIRROR)/linux/utils/kernel/module-init-tools/
+MODULE_INIT_TOOLS_CONF_ENV = ac_cv_prog_DOCBOOKTOMAN=''
 MODULE_INIT_TOOLS_CONF_OPT = \
 	--disable-static-utils \
 	--disable-builddir \
@@ -15,6 +16,7 @@ MODULE_INIT_TOOLS_CONF_OPT = \
 # configure.ac and Makefile.am
 MODULE_INIT_TOOLS_AUTORECONF=YES
 HOST_MODULE_INIT_TOOLS_AUTORECONF=YES
+HOST_MODULE_INIT_TOOLS_CONF_ENV = ac_cv_prog_DOCBOOKTOMAN=''
 
 $(eval $(call AUTOTARGETS,package,module-init-tools))
 $(eval $(call AUTOTARGETS,package,module-init-tools,host))
-- 
1.7.1
