From: Gregory Dymarek <gregd72002@gmail.com>
Date: Fri, 12 Dec 2014 15:42:44 +0000
Subject: [Buildroot] [PATCH v2 4/7] Adding libsrtp
In-Reply-To: <1418398967-2183-1-git-send-email-gregd72002@gmail.com>
References: <1418398967-2183-1-git-send-email-gregd72002@gmail.com>
Message-ID: <1418398967-2183-5-git-send-email-gregd72002@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gregory Dymarek <gregd72002@gmail.com>
---
 package/Config.in            |  1 +
 package/libsrtp/Config.in    |  5 +++++
 package/libsrtp/libsrtp.hash |  1 +
 package/libsrtp/libsrtp.mk   | 13 +++++++++++++
 4 files changed, 20 insertions(+)
 create mode 100644 package/libsrtp/Config.in
 create mode 100644 package/libsrtp/libsrtp.hash
 create mode 100644 package/libsrtp/libsrtp.mk

diff --git a/package/Config.in b/package/Config.in
index e8c973e..501f505 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -843,6 +843,7 @@ menu "Networking"
 	source "package/libshairplay/Config.in"
 	source "package/libshout/Config.in"
 	source "package/libsoup/Config.in"
+	source "package/libsrtp/Config.in"
 	source "package/libstrophe/Config.in"
 	source "package/libtirpc/Config.in"
 	source "package/libtorrent/Config.in"
diff --git a/package/libsrtp/Config.in b/package/libsrtp/Config.in
new file mode 100644
index 0000000..b81e9cf
--- /dev/null
+++ b/package/libsrtp/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_LIBSRTP
+	bool "libsrtp"
+	help
+	Adds libsrtp
+	https://github.com/cisco/libsrtp
diff --git a/package/libsrtp/libsrtp.hash b/package/libsrtp/libsrtp.hash
new file mode 100644
index 0000000..18f3eea
--- /dev/null
+++ b/package/libsrtp/libsrtp.hash
@@ -0,0 +1 @@
+sha256,aefb6c068b201a051585976526e9795bb74d8540446657559622d31d0d755cbb
diff --git a/package/libsrtp/libsrtp.mk b/package/libsrtp/libsrtp.mk
new file mode 100644
index 0000000..7c76785
--- /dev/null
+++ b/package/libsrtp/libsrtp.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# libsrtp
+#
+#############################################################
+LIBSRTP_VERSION = v1.5.0
+LIBSRTP_SITE_METHOD = git
+#LIBSRTP_SITE = https://github.com/cisco/libsrtp/
+#LIBSRTP_AUTORECONF = YES
+LIBSRTP_INSTALL_STAGING = YES
+LIBSRTP_LICENSE = BSD-3c 
+
+$(eval $(autotools-package))
-- 
1.9.1
