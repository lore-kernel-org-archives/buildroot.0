From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  7 Jan 2016 11:32:37 -0300
Subject: [Buildroot] [PATCH v2 2/2] webkitgtk24: add https option
In-Reply-To: <1452177157-6029-1-git-send-email-gustavo@zacarias.com.ar>
References: <1452177157-6029-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1452177157-6029-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a BR2_PACKAGE_WEBKITGTK24_HTTPS to pull in required dependencies for
HTTPS protocol support.
This is almost essentially the same as using midori with HTTPS enabled,
however Midori's HTTPS support is based on glib-networking, and webkit
via libsoup-ssl (for MiniBrowser, it doesn't affect midori's support).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
Changes for v2: nothing.

 package/webkitgtk24/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/webkitgtk24/Config.in b/package/webkitgtk24/Config.in
index f89c3c1..f491e2b 100644
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
-- 
2.4.10
