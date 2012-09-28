From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Sep 2012 22:08:39 +0200
Subject: [Buildroot] [git commit] input-tools: drop evtest from input-tools
	package
Message-ID: <20120929201754.A24819975D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d0c79aa9fa7635fdc91f889c6fa160aecd3d576
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Evtest is nowadays maintained as a seperate package by Peter Hutterer.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/input-tools/Config.in      |    7 -------
 package/input-tools/input-tools.mk |    1 -
 2 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/package/input-tools/Config.in b/package/input-tools/Config.in
index 489b130..08b3cbe 100644
--- a/package/input-tools/Config.in
+++ b/package/input-tools/Config.in
@@ -4,13 +4,6 @@ config BR2_PACKAGE_INPUT_TOOLS
 	  Tools for the Linux kernel input layer.
 	  http://linuxconsole.sourceforge.net/
 
-config BR2_PACKAGE_INPUT_TOOLS_EVTEST
-        bool "evtest"
-        depends on BR2_PACKAGE_INPUT_TOOLS
-        default y
-        help
-	  Input event interface test program.
-
 config BR2_PACKAGE_INPUT_TOOLS_INPUTATTACH
         bool "inputattach"
         depends on BR2_PACKAGE_INPUT_TOOLS
diff --git a/package/input-tools/input-tools.mk b/package/input-tools/input-tools.mk
index c73a193..b1cb093 100644
--- a/package/input-tools/input-tools.mk
+++ b/package/input-tools/input-tools.mk
@@ -8,7 +8,6 @@ INPUT_TOOLS_SOURCE  = joystick_$(INPUT_TOOLS_VERSION).orig.tar.gz
 INPUT_TOOLS_PATCH   = joystick_$(INPUT_TOOLS_VERSION)-5.diff.gz
 INPUT_TOOLS_SITE    = $(BR2_DEBIAN_MIRROR)/debian/pool/main/j/joystick/
 
-INPUT_TOOLS_TARGETS_$(BR2_PACKAGE_INPUT_TOOLS_EVTEST)      += evtest
 INPUT_TOOLS_TARGETS_$(BR2_PACKAGE_INPUT_TOOLS_INPUTATTACH) += inputattach
 INPUT_TOOLS_TARGETS_$(BR2_PACKAGE_INPUT_TOOLS_JSCAL)       += jscal
 INPUT_TOOLS_TARGETS_$(BR2_PACKAGE_INPUT_TOOLS_JSTEST)      += jstest
