From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Oct 2015 23:38:33 +0200
Subject: [Buildroot] [git commit] ranger: minor fixups
Message-ID: <20151022214501.0550081F5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=adc89c35764229248e4fd810a0d19cb3cf203eab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Wrap help text and use official tarballs from ranger.nongnu.org.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ranger/Config.in   |    9 +++++----
 package/ranger/ranger.hash |    3 ++-
 package/ranger/ranger.mk   |    2 +-
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/ranger/Config.in b/package/ranger/Config.in
index 9a2c60c..3d77107 100644
--- a/package/ranger/Config.in
+++ b/package/ranger/Config.in
@@ -7,9 +7,10 @@ config BR2_PACKAGE_RANGER
 	select BR2_PACKAGE_PYTHON_CURSES if BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON3_CURSES if BR2_PACKAGE_PYTHON3
 	help
-	  ranger is a console file manager with VI key bindings. It provides a
-	  minimalistic and nice curses interface with a view on the directory hierarchy.
-	  It ships with "rifle", a file launcher that is good at automatically finding
-	  out which program to use for what file type.
+	  ranger is a console file manager with VI key bindings. It
+	  provides a minimalistic and nice curses interface with a
+	  view on the directory hierarchy.  It ships with "rifle", a
+	  file launcher that is good at automatically finding out
+	  which program to use for what file type.
 
 	  http://ranger.nongnu.org
diff --git a/package/ranger/ranger.hash b/package/ranger/ranger.hash
index 989d76e..30bdbed 100644
--- a/package/ranger/ranger.hash
+++ b/package/ranger/ranger.hash
@@ -1 +1,2 @@
-sha256 80917c93396e46272b6de63816d925eb708291a9f7a559d49b24c571ea0eeeb3 ranger-1.7.2.tar.gz
+# Locally calculated after checking pgp signature
+sha256 94f6e342daee4445f15db5a7440a11138487c49cc25da0c473bbf1b8978f5b79 ranger-1.7.2.tar.gz
diff --git a/package/ranger/ranger.mk b/package/ranger/ranger.mk
index 46f318b..fd6809a 100644
--- a/package/ranger/ranger.mk
+++ b/package/ranger/ranger.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RANGER_VERSION = 1.7.2
-RANGER_SITE = $(call github,hut,ranger,v$(RANGER_VERSION))
+RANGER_SITE = http://ranger.nongnu.org
 RANGER_SETUP_TYPE = distutils
 RANGER_LICENSE = GPLv3
 RANGER_LICENSE_FILES = AUTHORS
