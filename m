From: kiwi <gregd72002@gmail.com>
Date: Tue,  9 Dec 2014 21:23:22 +0000
Subject: [Buildroot] [PATCH 2/8] Adding gengetopt
In-Reply-To: <1418160208-1569-1-git-send-email-gregd72002@gmail.com>
References: <1418160208-1569-1-git-send-email-gregd72002@gmail.com>
Message-ID: <1418160208-1569-2-git-send-email-gregd72002@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gregory Dymarek <gregd72002@gmail.com>

Signed-off-by: Gregory Dymarek <gregd72002@gmail.com>
---
 package/gengetopt/Config.in      |  7 +++++++
 package/gengetopt/Config.in.host |  7 +++++++
 package/gengetopt/gengetopt.mk   | 16 ++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 package/gengetopt/Config.in
 create mode 100644 package/gengetopt/Config.in.host
 create mode 100644 package/gengetopt/gengetopt.mk

diff --git a/package/gengetopt/Config.in b/package/gengetopt/Config.in
new file mode 100644
index 0000000..6236029
--- /dev/null
+++ b/package/gengetopt/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_GENGETOPT
+	bool "gengetopt"
+	help
+	  Adds GNU Gengetopt
+	  Gengetopt is a tool to write command line option parsing code for C programs. 
+	  
+	  http://www.gnu.org/software/gengetopt/gengetopt.html
diff --git a/package/gengetopt/Config.in.host b/package/gengetopt/Config.in.host
new file mode 100644
index 0000000..f0de678
--- /dev/null
+++ b/package/gengetopt/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_GENGETOPT
+	bool "host gengetopt"
+	help
+	  Adds GNU Gengetopt
+	  Gengetopt is a tool to write command line option parsing code for C programs. 
+	
+	  http://www.gnu.org/software/gengetopt/gengetopt.html
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
