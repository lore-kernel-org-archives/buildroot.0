From: Anthony Viallard <viallard@syscom-instruments.com>
Date: Fri,  4 Jan 2013 15:47:35 +0100
Subject: [Buildroot] [PATCH] libgd : new package
Message-ID: <1357310855-31818-1-git-send-email-viallard@syscom-instruments.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Anthony Viallard <viallard@syscom-instruments.com>
---
 package/Config.in       |    1 +
 package/libgd/Config.in |    6 ++++++
 package/libgd/libgd.mk  |   10 ++++++++++
 3 files changed, 17 insertions(+), 0 deletion(-)
 create mode 100644 package/libgd/Config.in
 create mode 100644 package/libgd/libgd.mk

diff --git a/package/Config.in b/package/Config.in
index 2633997..eb18543 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -394,6 +394,7 @@ source "package/libdrm/Config.in"
 source "package/libexif/Config.in"
 source "package/libgail/Config.in"
 source "package/libgeotiff/Config.in"
+source "package/libgd/Config.in"
 source "package/libglade/Config.in"
 source "package/gdk-pixbuf/Config.in"
 source "package/libgtk2/Config.in"
diff --git a/package/libgd/Config.in b/package/libgd/Config.in
new file mode 100644
index 0000000..7049b42
--- /dev/null
+++ b/package/libgd/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBGD
+	bool "libgd"
+	help
+	  A graphics library for fast image creation
+
+	   https://bitbucket.org/pierrejoye/gd-libgd
diff --git a/package/libgd/libgd.mk b/package/libgd/libgd.mk
new file mode 100644
index 0000000..02b6f3a
--- /dev/null
+++ b/package/libgd/libgd.mk
@@ -0,0 +1,10 @@
+LIBGD_VERSION = 2.0.33
+LIBGD_SOURCE = GD_2_0_33.tar.gz
+LIBGD_SITE = https://bitbucket.org/pierrejoye/gd-libgd/get
+
+LIBGD_INSTALL_STAGING = YES
+LIBGD_INSTALL_TARGET = YES
+LIBGD_CONF_OPT = 
+LIBGD_SUBDIR = src
+
+$(eval $(autotools-package))
-- 
1.7.10.4
