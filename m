From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Apr 2015 23:00:39 +0200
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-input-void:
	bump version to 1.4.1 and mark as deprecated
Message-ID: <20150423210626.7403A803E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=67575a811ba2aa5c3a97eb23347cae9a193d02ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

http://lists.x.org/archives/xorg-announce/2015-April/002585.html
"The void driver is a dummy driver that does nothing and just fulfils
the requirements of really old servers that must have an input device.
It is just dead weight for any server released after 2007 or so. Don't use
it."

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xdriver_xf86-input-void/Config.in    |    4 ++++
 .../xdriver_xf86-input-void.hash                   |    4 ++--
 .../xdriver_xf86-input-void.mk                     |    2 +-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-void/Config.in b/package/x11r7/xdriver_xf86-input-void/Config.in
index d6fdef2..fd3a600 100644
--- a/package/x11r7/xdriver_xf86-input-void/Config.in
+++ b/package/x11r7/xdriver_xf86-input-void/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_VOID
 	bool "xf86-input-void"
+	# http://lists.x.org/archives/xorg-announce/2015-April/002585.html
+	# "It is just dead weight for any server released after 2007 or so.
+	#  Don't use it."
+	depends on BR2_DEPRECATED_SINCE_2015_05
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
diff --git a/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.hash b/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.hash
index 8dd55d3..a1b88c5 100644
--- a/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.hash
+++ b/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2011-May/001658.html
-sha1	49b462d3acb16337eaf78202d4074f19d5e20b29	xf86-input-void-1.4.0.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-April/002585.html
+sha256	f96e4f0a622821bf43a74bd419f2a18423343996c9d243c7e1430ba2d142339c	xf86-input-void-1.4.1.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk b/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
index cab3753..5baa528 100644
--- a/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
+++ b/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_VOID_VERSION = 1.4.0
+XDRIVER_XF86_INPUT_VOID_VERSION = 1.4.1
 XDRIVER_XF86_INPUT_VOID_SOURCE = xf86-input-void-$(XDRIVER_XF86_INPUT_VOID_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_VOID_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_VOID_LICENSE = MIT
