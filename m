From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 12 Mar 2012 13:00:32 +0100
Subject: [Buildroot] [PATCH v2 1/1] libgsl : new package The GNU Scientific
	Library
In-Reply-To: <1331553632-509-1-git-send-email-sagaert.johan@skynet.be>
References: <1331553632-509-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <1331553632-509-2-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/Config.in        |    1 +
 package/libgsl/Config.in |    5 +++++
 package/libgsl/gsl.mk    |   11 +++++++++++
 3 files changed, 17 insertions(+)
 create mode 100644 package/libgsl/Config.in
 create mode 100644 package/libgsl/gsl.mk

diff --git a/package/Config.in b/package/Config.in
index 4838edc..b7255fb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -380,6 +380,7 @@ source "package/libevent/Config.in"
 source "package/libev/Config.in"
 source "package/libffi/Config.in"
 source "package/libglib2/Config.in"
+source "package/libgsl/Config.in"
 source "package/libical/Config.in"
 source "package/libnspr/Config.in"
 source "package/libsigc/Config.in"
diff --git a/package/libgsl/Config.in b/package/libgsl/Config.in
new file mode 100644
index 0000000..4af94bd
--- /dev/null
+++ b/package/libgsl/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_LIBGSL
+	bool "libgsl"
+	help
+	  The gnu scientific library 
+	  http://www.gnu.org/software/gsl
diff --git a/package/libgsl/gsl.mk b/package/libgsl/gsl.mk
new file mode 100644
index 0000000..53c3ea2
--- /dev/null
+++ b/package/libgsl/gsl.mk
@@ -0,0 +1,11 @@
+#############################################################
+#
+# gnu gsl
+#
+#############################################################
+LIBGSL_VERSION = 1.15
+LIBGSL_SOURCE = gsl-$(LIBGSL_VERSION).tar.gz
+LIBGSL_SITE = $(BR2_GNU_MIRROR)/gsl
+LIBGSL_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.9.3
