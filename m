From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 14:19:07 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_xedit: bump version to
	1.2.2, add hash
Message-ID: <20150315132246.A065B807CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=09601180e4e1c44d81ae1830253296a9a51405ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xedit/xapp_xedit.hash |    3 +++
 package/x11r7/xapp_xedit/xapp_xedit.mk   |    6 ++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_xedit/xapp_xedit.hash b/package/x11r7/xapp_xedit/xapp_xedit.hash
new file mode 100644
index 0000000..5aedfb7
--- /dev/null
+++ b/package/x11r7/xapp_xedit/xapp_xedit.hash
@@ -0,0 +1,3 @@
+# From http://lists.x.org/archives/xorg-announce/2015-February/002535.html
+sha1	f37b5d0f8ec461955f0419dbb1890d8cf63d179d				xedit-1.2.2.tar.bz2
+sha256	69aa42885dfc06332ca22eb01cc7187e49206e6d65b74113a8ee4cc345fc2927	xedit-1.2.2.tar.bz2
diff --git a/package/x11r7/xapp_xedit/xapp_xedit.mk b/package/x11r7/xapp_xedit/xapp_xedit.mk
index f180ad2..0f42e2c 100644
--- a/package/x11r7/xapp_xedit/xapp_xedit.mk
+++ b/package/x11r7/xapp_xedit/xapp_xedit.mk
@@ -4,11 +4,13 @@
 #
 ################################################################################
 
-XAPP_XEDIT_VERSION = 1.2.0
+XAPP_XEDIT_VERSION = 1.2.2
 XAPP_XEDIT_SOURCE = xedit-$(XAPP_XEDIT_VERSION).tar.bz2
 XAPP_XEDIT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XEDIT_LICENSE = MIT
 XAPP_XEDIT_LICENSE_FILES = COPYING
-XAPP_XEDIT_DEPENDENCIES = xlib_libXaw 
+XAPP_XEDIT_DEPENDENCIES = xlib_libXaw
+
+XAPP_XEDIT_CONF_OPTS = --disable-selective-werror
 
 $(eval $(autotools-package))
