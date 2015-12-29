From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 17:00:15 +0100
Subject: [Buildroot] [git commit] libfuse: switch to github
Message-ID: <20151229160137.1D7AD826E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f6573601de55e919757884d533c79c57c7699a18
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The project moved to github, so point the homepage and download URL
there.

[Thomas:
 - Remove comment "Switch to github helper on bump" since we clearly
   don't want to switch to the github helper if they continue to
   upload release tarballs.
 - Adjust comment in the .hash file for clarity.]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libfuse/Config.in    | 2 +-
 package/libfuse/libfuse.hash | 1 +
 package/libfuse/libfuse.mk   | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libfuse/Config.in b/package/libfuse/Config.in
index deedb5a..2b0e31a 100644
--- a/package/libfuse/Config.in
+++ b/package/libfuse/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_LIBFUSE
 	help
 	  FUSE (Filesystem in UserSpacE)
 
-	  http://fuse.sourceforge.net/
+	  https://github.com/libfuse/libfuse
 
 comment "libfuse needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
diff --git a/package/libfuse/libfuse.hash b/package/libfuse/libfuse.hash
index b1bbee3..618ab3b 100644
--- a/package/libfuse/libfuse.hash
+++ b/package/libfuse/libfuse.hash
@@ -1,3 +1,4 @@
 # From http://sourceforge.net/projects/fuse/files/fuse-2.X/2.9.4/
+# Currently still valid for github release tarballs
 md5	ecb712b5ffc6dffd54f4a405c9b372d8	fuse-2.9.4.tar.gz
 sha1	c8b25419f33624dc5240af6a5d26f2c04367ca71	fuse-2.9.4.tar.gz
diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index 8360c82..32d70d3 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -6,7 +6,7 @@
 
 LIBFUSE_VERSION = 2.9.4
 LIBFUSE_SOURCE = fuse-$(LIBFUSE_VERSION).tar.gz
-LIBFUSE_SITE = http://downloads.sourceforge.net/project/fuse/fuse-2.X/$(LIBFUSE_VERSION)
+LIBFUSE_SITE = https://github.com/libfuse/libfuse/releases/download/fuse_2_9_4
 LIBFUSE_LICENSE = GPLv2, LGPLv2.1
 LIBFUSE_LICENSE_FILES = COPYING COPYING.LIB
 LIBFUSE_INSTALL_STAGING = YES
