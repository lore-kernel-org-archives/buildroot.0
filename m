From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Mar 2014 23:02:18 +0100
Subject: [Buildroot] [git commit] libestr: new package
Message-ID: <20140315225330.AAE059BFA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ea048fd1f9825be4023db40e152de8948ee2498
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in          |    1 +
 package/libestr/Config.in  |    6 ++++++
 package/libestr/libestr.mk |   13 +++++++++++++
 3 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 51d1e24..ad603e1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -812,6 +812,7 @@ source "package/enchant/Config.in"
 source "package/icu/Config.in"
 source "package/libedit/Config.in"
 source "package/libenca/Config.in"
+source "package/libestr/Config.in"
 source "package/libfribidi/Config.in"
 source "package/libiconv/Config.in"
 source "package/linenoise/Config.in"
diff --git a/package/libestr/Config.in b/package/libestr/Config.in
new file mode 100644
index 0000000..b1ca2a5
--- /dev/null
+++ b/package/libestr/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBESTR
+	bool "libestr"
+	help
+	  Some essentials for string handling (and a bit more)
+
+	  http://libestr.adiscon.com/
diff --git a/package/libestr/libestr.mk b/package/libestr/libestr.mk
new file mode 100644
index 0000000..ea6011c
--- /dev/null
+++ b/package/libestr/libestr.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libestr
+#
+################################################################################
+
+LIBESTR_VERSION = 0.1.9
+LIBESTR_SITE = http://libestr.adiscon.com/files/download/
+LIBESTR_LICENSE = LGPLv2.1+
+LIBESTR_LICENSE_FILES = COPYING
+LIBESTR_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
