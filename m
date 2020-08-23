From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 23 Aug 2020 11:37:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/davfs2: bump to version 1.6.0
Message-ID: <20200823093737.3243619-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This bump is needed to fix a build failure with gcc 10:
https://savannah.nongnu.org/support/?func=detailitem&item_id=110186#options

Here is an extratc of the bug report:

"It is not a bug to have variables with the same name in different source
files. The bug was the missing keyword "static".

But there was a different bug that was not tolerated by GCC 10. It was
same strange data type conversions in dav_coda.c. The resolution was to
drop coda altogether because there is still fuse which is better suited
anyway.

The new release 1.6.0 should fix all these problems. Please tell me if
there are still problems with GCC 10."

Also update indentation in hash file (two spaces)

Fixes:
 - http://autobuild.buildroot.org/results/42beafade6fd31927c8db14bc52110c0fc5b17c2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/davfs2/davfs2.hash | 4 ++--
 package/davfs2/davfs2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/davfs2/davfs2.hash b/package/davfs2/davfs2.hash
index b8ac0af1b5..88a314d1c2 100644
--- a/package/davfs2/davfs2.hash
+++ b/package/davfs2/davfs2.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 417476cdcfd53966b2dcfaf12455b54f315959b488a89255ab4b44586153d801  davfs2-1.5.6.tar.gz
+sha256  2e6b675685bd917772be60f0999ae098c80f79ff20dc131e8fec4547cbb63b50  davfs2-1.6.0.tar.gz
 # License file, locally calculated
-sha256 0ae0485a5bd37a63e63603596417e4eb0e653334fa6c7f932ca3a0e85d4af227  COPYING
+sha256  0ae0485a5bd37a63e63603596417e4eb0e653334fa6c7f932ca3a0e85d4af227  COPYING
diff --git a/package/davfs2/davfs2.mk b/package/davfs2/davfs2.mk
index a73093a52a..a82e9d2f7c 100644
--- a/package/davfs2/davfs2.mk
+++ b/package/davfs2/davfs2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAVFS2_VERSION = 1.5.6
+DAVFS2_VERSION = 1.6.0
 DAVFS2_SITE = http://download.savannah.nongnu.org/releases/davfs2
 DAVFS2_LICENSE = GPL-3.0+
 DAVFS2_LICENSE_FILES = COPYING
-- 
2.28.0
