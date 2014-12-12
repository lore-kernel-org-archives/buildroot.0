From: Gregory Dymarek <gregd72002@gmail.com>
Date: Fri, 12 Dec 2014 15:42:42 +0000
Subject: [Buildroot] [PATCH v2 2/7] Adding gengetopt
In-Reply-To: <1418398967-2183-1-git-send-email-gregd72002@gmail.com>
References: <1418398967-2183-1-git-send-email-gregd72002@gmail.com>
Message-ID: <1418398967-2183-3-git-send-email-gregd72002@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gregory Dymarek <gregd72002@gmail.com>
---
 package/Config.in                |  1 +
 package/Config.in.host           |  1 +
 package/gengetopt/Config.in      |  6 ++++++
 package/gengetopt/Config.in.host |  6 ++++++
 package/gengetopt/gengetopt.hash |  1 +
 package/gengetopt/gengetopt.mk   | 16 ++++++++++++++++
 6 files changed, 31 insertions(+)
 create mode 100644 package/gengetopt/Config.in
 create mode 100644 package/gengetopt/Config.in.host
 create mode 100644 package/gengetopt/gengetopt.hash
 create mode 100644 package/gengetopt/gengetopt.mk

diff --git a/package/Config.in b/package/Config.in
index 9e3f11b..49fb8b3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -44,6 +44,7 @@ menu "Compressors and decompressors"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/gzip/Config.in"
 endif
+	source "package/gengetopt/Config.in"
 	source "package/infozip/Config.in"
 	source "package/lz4/Config.in"
 	source "package/lzip/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index 0b7bc36..dd89bd3 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -8,6 +8,7 @@ menu "Host utilities"
 	source "package/e2tools/Config.in.host"
 	source "package/genext2fs/Config.in.host"
 	source "package/genimage/Config.in.host"
+	source "package/gengetopt/Config.in.host"
 	source "package/genpart/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/mke2img/Config.in.host"
diff --git a/package/gengetopt/Config.in b/package/gengetopt/Config.in
new file mode 100644
index 0000000..41d9f75
--- /dev/null
+++ b/package/gengetopt/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_GENGETOPT
+	bool "gengetopt"
+	help
+	Adds GNU Gengetopt
+	Gengetopt is a tool to write command line option parsing code for C programs. 
+	http://www.gnu.org/software/gengetopt/gengetopt.html
diff --git a/package/gengetopt/Config.in.host b/package/gengetopt/Config.in.host
new file mode 100644
index 0000000..5be8312
--- /dev/null
+++ b/package/gengetopt/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_GENGETOPT
+	bool "host gengetopt"
+	help
+	Adds GNU Gengetopt
+	Gengetopt is a tool to write command line option parsing code for C programs. 
+	http://www.gnu.org/software/gengetopt/gengetopt.html
diff --git a/package/gengetopt/gengetopt.hash b/package/gengetopt/gengetopt.hash
new file mode 100644
index 0000000..5224cec
--- /dev/null
+++ b/package/gengetopt/gengetopt.hash
@@ -0,0 +1 @@
+sha256,30b05a88604d71ef2a42a2ef26cd26df242b41f5b011ad03083143a31d9b01f7
diff --git a/package/gengetopt/gengetopt.mk b/package/gengetopt/gengetopt.mk
new file mode 100644
index 0000000..692dfe1
--- /dev/null
+++ b/package/gengetopt/gengetopt.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# gengetopt
+#
+#############################################################
+GENGETOPT_VERSION = 2.22.6
+GENGETOPT_SITE = ftp://ftp.gnu.org/gnu/gengetopt/
+GENGETOPT_AUTORECONF = YES
+GENGETOPT_LICENSE = GPLv3 
+GENGETOPT_LICENSE_FILES = COPYING
+
+GENGETOPT_MAKE=$(MAKE1)
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
+
-- 
1.9.1
