From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue, 19 Jun 2012 07:56:03 +0100
Subject: [Buildroot] [PATCH RFC 1/2] Add configuration item for custom
	JavaScript install path
In-Reply-To: <1340088964-10630-1-git-send-email-spdawson@gmail.com>
References: <1340088964-10630-1-git-send-email-spdawson@gmail.com>
Message-ID: <1340088964-10630-2-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/Config.in            |    1 +
 package/javascript/Config.in |    5 +++++
 2 files changed, 6 insertions(+)
 create mode 100644 package/javascript/Config.in

diff --git a/package/Config.in b/package/Config.in
index 1044e9f..b60ba2b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -378,6 +378,7 @@ source "package/libv4l/Config.in"
 endmenu
 
 menu "Javascript"
+source "package/javascript/Config.in"
 source "package/explorercanvas/Config.in"
 source "package/flot/Config.in"
 source "package/jquery/Config.in"
diff --git a/package/javascript/Config.in b/package/javascript/Config.in
new file mode 100644
index 0000000..c837e9e
--- /dev/null
+++ b/package/javascript/Config.in
@@ -0,0 +1,5 @@
+config BR2_JAVASCRIPT_INSTALL_PATH
+	string "Target install path for JavaScript"
+	default "/var/www"
+	help
+	  Specify a target install path for JavaScript files
-- 
1.7.9.5
