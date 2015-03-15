From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 15 Mar 2015 12:19:13 +0100
Subject: [Buildroot] [PATCH 04/14] package/x11r7/xapp_xedit: bump version to
	1.2.2, add hash
In-Reply-To: <1426418363-22738-1-git-send-email-bernd.kuhls@t-online.de>
References: <1426418363-22738-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1426418363-22738-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xedit/xapp_xedit.hash |    3 +++
 package/x11r7/xapp_xedit/xapp_xedit.mk   |    6 ++++--
 2 files changed, 7 insertions(+), 2 deletions(-)
 create mode 100644 package/x11r7/xapp_xedit/xapp_xedit.hash

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
-- 
1.7.10.4
