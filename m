From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 13 Aug 2017 22:22:47 +0200
Subject: [Buildroot] [PATCH] libconfuse: bugfix bump to 3.2
Message-ID: <20170813202247.17711-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
Just to be clear, this is for master.

It is NOT for 2017.05 because the bug is a regression of v3.1 and
2017.05.x has v3.0.
---
 package/libconfuse/Config.in       | 2 +-
 package/libconfuse/libconfuse.hash | 7 ++++---
 package/libconfuse/libconfuse.mk   | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/libconfuse/Config.in b/package/libconfuse/Config.in
index be18cbb073..b96b8f2811 100644
--- a/package/libconfuse/Config.in
+++ b/package/libconfuse/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_LIBCONFUSE
 	  environment variable expansion, functions and nested include
 	  statements.
 
-	  http://savannah.nongnu.org/download/confuse/
+	  https://github.com/martinh/libconfuse/
diff --git a/package/libconfuse/libconfuse.hash b/package/libconfuse/libconfuse.hash
index e57e59c56d..826a9263f5 100644
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
index 07a73c8937..431fefd4c7 100644
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
-- 
2.13.3
