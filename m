From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Aug 2017 21:47:24 +0200
Subject: [Buildroot] [git commit] libconfuse: bugfix bump to 3.2
Message-ID: <20170814194458.AC28981E4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=049c0f1b4db07ffbb5d115da3ac8271ae6426dc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This release contains only two real changes to fix two bugs. One is
only relevant for Windows; the other one fixes handling of empty
comment lines.

libconfuse is used by genimage, and we have one defconfig,
linksprite_pcduino, that has empty comment lines in its genimage.cfg.
Thus, it fixes https://gitlab.com/buildroot.org/buildroot/-/jobs/27873642

While we're at it, also change the upstream URL in Config.in to github.
The old URL on nongnu was just a download directory and didn't have
anything newer than 2010, while github has a nice README.md.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libconfuse/Config.in       | 2 +-
 package/libconfuse/libconfuse.hash | 7 ++++---
 package/libconfuse/libconfuse.mk   | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/libconfuse/Config.in b/package/libconfuse/Config.in
index be18cbb..b96b8f2 100644
--- a/package/libconfuse/Config.in
+++ b/package/libconfuse/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_LIBCONFUSE
 	  environment variable expansion, functions and nested include
 	  statements.
 
-	  http://savannah.nongnu.org/download/confuse/
+	  https://github.com/martinh/libconfuse/
diff --git a/package/libconfuse/libconfuse.hash b/package/libconfuse/libconfuse.hash
index e57e59c..826a926 100644
--- a/package/libconfuse/libconfuse.hash
+++ b/package/libconfuse/libconfuse.hash
@@ -1,3 +1,4 @@
-# From https://github.com/martinh/libconfuse/releases/download/v3.1/confuse-3.1.tar.xz.md5, sha256 locally computed.
-md5  08f1ace0055f92d80a8ad11671346a37  confuse-3.1.tar.xz
-sha256  8171f31e0071d5e4460269fdcc8b4e748cf23b4bf6bbe672f718a136dd63ca66  confuse-3.1.tar.xz
+# From https://github.com/martinh/libconfuse/releases/download/v3.2/confuse-3.2.tar.xz.md5
+md5  84259ac3bd495645ab2fe61654917232  confuse-3.2.tar.xz
+# Locally computed
+sha256  a46abb8696026d314197b6a70ae1a1c296342a9a68aa69b1935709c1477a4e48  confuse-3.1.tar.xz
diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index 07a73c8..431fefd 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCONFUSE_VERSION = 3.1
+LIBCONFUSE_VERSION = 3.2
 LIBCONFUSE_SOURCE = confuse-$(LIBCONFUSE_VERSION).tar.xz
 LIBCONFUSE_SITE = https://github.com/martinh/libconfuse/releases/download/v$(LIBCONFUSE_VERSION)
 LIBCONFUSE_INSTALL_STAGING = YES
