From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2016 15:02:01 +0100
Subject: [Buildroot] [git commit] webkitgtk24: add https option
Message-ID: <20160319153125.074477FCCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b3e749c0667f6b80a36f577b69de6b90ad101c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a BR2_PACKAGE_WEBKITGTK24_HTTPS to pull in required dependencies for
HTTPS protocol support.
This is almost essentially the same as using midori with HTTPS enabled,
however Midori's HTTPS support is based on glib-networking, and webkit
via libsoup-ssl (for MiniBrowser, it doesn't affect midori's support).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/webkitgtk24/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/webkitgtk24/Config.in b/package/webkitgtk24/Config.in
index 02d6791..e95a851 100644
--- a/package/webkitgtk24/Config.in
+++ b/package/webkitgtk24/Config.in
@@ -51,6 +51,13 @@ config BR2_PACKAGE_WEBKITGTK24
 
 if BR2_PACKAGE_WEBKITGTK24
 
+config BR2_PACKAGE_WEBKITGTK24_HTTPS
+	bool "HTTPS support"
+	select BR2_PACKAGE_CA_CERTIFICATES # runtime
+	select BR2_PACKAGE_LIBSOUP_SSL
+	help
+	  Enable HTTPS protocol support.
+
 config BR2_PACKAGE_WEBKITGTK24_MULTIMEDIA
 	bool "multimedia support"
 	select BR2_PACKAGE_GSTREAMER1
