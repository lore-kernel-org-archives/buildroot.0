From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 Aug 2018 23:29:25 +0200
Subject: [Buildroot] [git commit branch/next] swig: add visible Config.in
 option for host variant
Message-ID: <20180831212921.11CD881F5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f018b26fc2572de53fb9d62a5954f64af722535
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The patch adds the package/swig/Config.in.host file and adds this path
to the package/Config.in.host file.

Signed-off-by: Matt Flax <flatmax@flatmax.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in.host      | 1 +
 package/swig/Config.in.host | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index a3f852b3fc..3a3578ceeb 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -57,6 +57,7 @@ menu "Host utilities"
 	source "package/sam-ba/Config.in.host"
 	source "package/squashfs/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
+	source "package/swig/Config.in.host"
 	source "package/tegrarcm/Config.in.host"
 	source "package/ti-cgt-pru/Config.in.host"
 	source "package/uboot-tools/Config.in.host"
diff --git a/package/swig/Config.in.host b/package/swig/Config.in.host
new file mode 100644
index 0000000000..fd2049d30a
--- /dev/null
+++ b/package/swig/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_SWIG
+	bool "host swig"
+	help
+	  swig is a software development tool that connects programs
+	  written in C and C++ with a variety of high-level
+	  programming languages.
+
+	  http://www.swig.org/
