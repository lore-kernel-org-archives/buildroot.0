From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 12:33:19 +0200
Subject: [Buildroot] [git commit] jo: new package
Message-ID: <20170326103701.DDAF58222F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a6315d30cd77968ba6a40bd9505f3a2f6bee591
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS           |  1 +
 package/Config.in    |  1 +
 package/jo/Config.in |  6 ++++++
 package/jo/jo.hash   |  2 ++
 package/jo/jo.mk     | 14 ++++++++++++++
 5 files changed, 24 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 186f48f..a4e2e9e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1203,6 +1203,7 @@ N:	Peter Korsgaard <peter@korsgaard.com>
 F:	board/orangepi/
 F:	configs/orangepi_pc_defconfig
 F:	package/flickcurl/
+F:	package/jo/
 F:	package/libfastjson/
 F:	package/lzop/
 F:	package/memtool/
diff --git a/package/Config.in b/package/Config.in
index ec54880..51c7264 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -141,6 +141,7 @@ menu "Development tools"
 	source "package/git-crypt/Config.in"
 	source "package/gperf/Config.in"
 	source "package/grep/Config.in"
+	source "package/jo/Config.in"
 	source "package/jq/Config.in"
 	source "package/libtool/Config.in"
 	source "package/make/Config.in"
diff --git a/package/jo/Config.in b/package/jo/Config.in
new file mode 100644
index 0000000..c5532c2
--- /dev/null
+++ b/package/jo/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_JO
+	bool "jo"
+	help
+	  Command-line processor to output JSON from a shell
+
+	  https://github.com/jpmens/jo
diff --git a/package/jo/jo.hash b/package/jo/jo.hash
new file mode 100644
index 0000000..429f1e4
--- /dev/null
+++ b/package/jo/jo.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	d66ec97258d1afad15643fb2d5b5e807153a732ba45c2417adc66669acbde52e  jo-1.0.tar.gz
diff --git a/package/jo/jo.mk b/package/jo/jo.mk
new file mode 100644
index 0000000..5529f55
--- /dev/null
+++ b/package/jo/jo.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# jo
+#
+################################################################################
+
+JO_VERSION = 1.0
+JO_SITE = https://github.com/jpmens/jo/releases/download/v$(JO_VERSION)
+JO_LICENSE = MIT (json.[ch]), GPLv2+ (rest)
+JO_LICENSE_FILES = COPYING
+# don't build man pages
+JO_CONF_ENV = ac_cv_path_PANDOC=''
+
+$(eval $(autotools-package))
