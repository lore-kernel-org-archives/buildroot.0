From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 11 Jul 2015 18:09:59 -0400
Subject: [Buildroot] [PATCH v2 1/3] util-linux: add more tool select options
In-Reply-To: <1436652601-2227-1-git-send-email-danomimanchego123@gmail.com>
References: <1436652601-2227-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1436652601-2227-2-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add more options to Config.in to optionally select or deselect
util-linux "line" and "tunelp" tools.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/util-linux/Config.in     |   11 +++++++++++
 package/util-linux/util-linux.mk |    2 ++
 2 files changed, 13 insertions(+)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 39df11c..e0a25bf 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -120,6 +120,11 @@ config BR2_PACKAGE_UTIL_LINUX_LAST
 	help
 	  Show a listing of last logged in users
 
+config BR2_PACKAGE_UTIL_LINUX_LINE
+	bool "line"
+	help
+	  Read one line
+
 config BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS
 	bool "login utilities"
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
@@ -230,6 +235,12 @@ config BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT
 	help
 	  Switch to another filesystem as the root of the mount tree
 
+config BR2_PACKAGE_UTIL_LINUX_TUNELP
+	bool "tunelp"
+	select BR2_PACKAGE_NCURSES
+	help
+	  Set various parameters for the lp device
+
 config BR2_PACKAGE_UTIL_LINUX_UL
 	bool "ul"
 	select BR2_PACKAGE_NCURSES
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 3ca147a..116596f 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -84,6 +84,7 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),--enable-libmount,--disable-libmount) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS),--enable-libsmartcols,--disable-libsmartcols) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBUUID),--enable-libuuid,--disable-libuuid) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LINE),--enable-line,--disable-line) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),--enable-last --enable-login --enable-runuser --enable-su --enable-sulogin,--disable-last --disable-login --disable-runuser --disable-su --disable-sulogin) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOSETUP),--enable-losetup,--disable-losetup) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MESG),--enable-mesg,--disable-mesg) \
@@ -103,6 +104,7 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_SETPRIV),--enable-setpriv,--disable-setpriv) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_SETTERM),--enable-setterm,--disable-setterm) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT),--enable-switch_root,--disable-switch_root) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_TUNELP),--enable-tunelp,--disable-tunelp) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_UL),--enable-ul,--disable-ul) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_UNSHARE),--enable-unshare,--disable-unshare) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_UTMPDUMP),--enable-utmpdump,--disable-utmpdump) \
-- 
1.7.9.5
