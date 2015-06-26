From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Jun 2015 09:44:35 +0200
Subject: [Buildroot] [git commit] dosfstools: bump to version 3.0.28
Message-ID: <20150626075003.7BF6C7FB66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7171a0e7a016ef68ee19420593f9097b4aa37cae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change to new homepage since maintainer changed as well.
Add hash file based on tarball signature file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dosfstools/Config.in       |    2 +-
 package/dosfstools/dosfstools.hash |    2 ++
 package/dosfstools/dosfstools.mk   |    4 ++--
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/dosfstools/Config.in b/package/dosfstools/Config.in
index 7f3481c..33c64b3 100644
--- a/package/dosfstools/Config.in
+++ b/package/dosfstools/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_DOSFSTOOLS
 	help
 	  Tools for creating and checking DOS FAT filesystems.
 
-	  http://www.daniel-baumann.ch/software/dosfstools/
+	  https://github.com/dosfstools/dosfstools
 
 if BR2_PACKAGE_DOSFSTOOLS
 
diff --git a/package/dosfstools/dosfstools.hash b/package/dosfstools/dosfstools.hash
new file mode 100644
index 0000000..f852195
--- /dev/null
+++ b/package/dosfstools/dosfstools.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	ee95913044ecf2719b63ea11212917649709a6e53209a72d622135aaa8517ee2	dosfstools-3.0.28.tar.xz
diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index 88c4fe8..b7f7d96 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DOSFSTOOLS_VERSION = 3.0.26
+DOSFSTOOLS_VERSION = 3.0.28
 DOSFSTOOLS_SOURCE = dosfstools-$(DOSFSTOOLS_VERSION).tar.xz
-DOSFSTOOLS_SITE = http://daniel-baumann.ch/files/software/dosfstools
+DOSFSTOOLS_SITE = https://github.com/dosfstools/dosfstools/releases/download/v$(DOSFSTOOLS_VERSION)
 DOSFSTOOLS_LICENSE = GPLv3+
 DOSFSTOOLS_LICENSE_FILES = COPYING
 
