From: kiwi <gregd72002@gmail.com>
Date: Tue,  9 Dec 2014 21:23:24 +0000
Subject: [Buildroot] [PATCH 4/8] Adding libsrtp
In-Reply-To: <1418160208-1569-1-git-send-email-gregd72002@gmail.com>
References: <1418160208-1569-1-git-send-email-gregd72002@gmail.com>
Message-ID: <1418160208-1569-4-git-send-email-gregd72002@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gregory Dymarek <gregd72002@gmail.com>

Signed-off-by: Gregory Dymarek <gregd72002@gmail.com>
---
 package/libsrtp/Config.in  |  6 ++++++
 package/libsrtp/libsrtp.mk | 12 ++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 package/libsrtp/Config.in
 create mode 100644 package/libsrtp/libsrtp.mk

diff --git a/package/libsrtp/Config.in b/package/libsrtp/Config.in
new file mode 100644
index 0000000..073f811
--- /dev/null
+++ b/package/libsrtp/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBSRTP
+	bool "libsrtp"
+	help
+	  Adds libsrtp - Secure RTP (SRTP) Reference Implementation
+
+	  https://github.com/cisco/libsrtp
diff --git a/package/libsrtp/libsrtp.mk b/package/libsrtp/libsrtp.mk
new file mode 100644
index 0000000..2af6a02
--- /dev/null
+++ b/package/libsrtp/libsrtp.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# libsrtp
+#
+#############################################################
+LIBSRTP_VERSION = v1.5.0
+LIBSRTP_SITE_METHOD = git
+LIBSRTP_INSTALL_STAGING = YES
+LIBSRTP_LICENSE = BSD-3c 
+LIBSRTP_LICENSE_FILE = LICENSE
+
+$(eval $(autotools-package))
-- 
1.9.1
