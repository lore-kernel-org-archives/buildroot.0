From: Matt Flax <flatmax@flatmax.org>
Date: Fri, 31 Aug 2018 10:37:57 +1000
Subject: [Buildroot] [PATCH 1/1] swig: Add Config.in.host
Message-ID: <20180831003757.19520-1-flatmax@flatmax.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch make select BR2_PACKAGE_HOST_SWIG work.

The patch adds the package/swig/Config.in.host file and adds this path
to the package/Config.in.host file.

Signed-off-by: Matt Flax <flatmax@flatmax.org>
---
 package/Config.in.host      | 1 +
 package/swig/Config.in.host | 7 +++++++
 2 files changed, 8 insertions(+)
 create mode 100644 package/swig/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 38543e7390..0bd30ab58b 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -55,6 +55,7 @@ menu "Host utilities"
 	source "package/sam-ba/Config.in.host"
 	source "package/squashfs/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
+	source "package/swig/Config.in.host"
 	source "package/tegrarcm/Config.in.host"
 	source "package/ti-cgt-pru/Config.in.host"
 	source "package/uboot-tools/Config.in.host"
diff --git a/package/swig/Config.in.host b/package/swig/Config.in.host
new file mode 100644
index 0000000000..f4cdfcd7b3
--- /dev/null
+++ b/package/swig/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_SWIG
+	bool "host swig"
+	help
+	  swig is a software development tool that connects programs written in C and
+		C++ with a variety of high-level programming languages.
+
+	  http://www.swig.org/
-- 
2.17.1
