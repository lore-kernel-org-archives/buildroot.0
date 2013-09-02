From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 Sep 2013 23:01:34 +0200
Subject: [Buildroot] [git commit] Remove references to module-init-tools
Message-ID: <20130902213322.20E839B6CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4ce8af8632894db3e4ed25d9d3230359a2cc640c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that it is replaced by kmod.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/faq-troubleshooting.txt |   15 ---------------
 package/kmod/kmod.mk                |    6 ++----
 2 files changed, 2 insertions(+), 19 deletions(-)

diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
index f91a8ef..4e0612b 100644
--- a/docs/manual/faq-troubleshooting.txt
+++ b/docs/manual/faq-troubleshooting.txt
@@ -27,21 +27,6 @@ configuration+, and modify +Port to run a getty (login prompt) on+ and
 +/etc/inittab+ file of the generated system so that a shell starts on
 the correct serial port.
 
-[[faq-module-init-tool-build-failure]]
-module-init-tools fails to build with 'cannot find -lc'
--------------------------------------------------------
-
-If the build of +module-init-tools+ for the host fails with:
-
-------------------------
-/usr/bin/ld: cannot find -lc
-------------------------
-
-then probably you are running a Fedora (or similar) distribution, and
-you should install the +glibc-static+ package. This is because the
-+module-init-tools+ build process wants to link statically against the
-C library.
-
 [[faq-no-compiler-on-target]]
 Why is there no compiler on the target?
 ---------------------------------------
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 649415f..9ac7731 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -42,10 +42,8 @@ ifeq ($(BR2_PACKAGE_KMOD_TOOLS),y)
 KMOD_LICENSE += GPLv2+
 KMOD_LICENSE_FILES += COPYING
 
-# take precedence over busybox / module-init-tools implementations
-KMOD_DEPENDENCIES += \
-	$(if $(BR2_PACKAGE_BUSYBOX),busybox) \
-	$(if $(BR2_PACKAGE_MODULE_INIT_TOOLS),module-init-tools)
+# take precedence over busybox implementation
+KMOD_DEPENDENCIES += $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 
 define KMOD_INSTALL_TOOLS
 	for i in depmod insmod lsmod modinfo modprobe rmmod; do \
