From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Apr 2019 22:33:02 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/libfuse: bump
 version to 2.9.9
Message-ID: <20190405204614.0F5FA815A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78c2b9252b75d5f228a4b75796410b07407533f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Contains a number of fixes for issues discovered post-2.9.8.  From the
release notes:

- Fixed readdir bug when non-zero offsets are given to filler and the
  filesystem client, after reading a whole directory, re-reads it from a
  non-zero offset e.g.  by calling seekdir followed by readdir.

https://github.com/libfuse/libfuse/releases/tag/fuse-2.9.9

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3b6d842fea292662ab944777d82d766e56cb8320)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfuse/libfuse.hash | 2 +-
 package/libfuse/libfuse.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfuse/libfuse.hash b/package/libfuse/libfuse.hash
index 3d1b973071..f522325945 100644
--- a/package/libfuse/libfuse.hash
+++ b/package/libfuse/libfuse.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	5e84f81d8dd527ea74f39b6bc001c874c02bad6871d7a9b0c14efb57430eafe3	fuse-2.9.8.tar.gz
+sha256	d0e69d5d608cc22ff4843791ad097f554dd32540ddc9bed7638cc6fea7c1b4b5	fuse-2.9.9.tar.gz
 
 # Hash for license files:
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index ab0131b057..074dc59886 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE_VERSION = 2.9.8
+LIBFUSE_VERSION = 2.9.9
 LIBFUSE_SOURCE = fuse-$(LIBFUSE_VERSION).tar.gz
 LIBFUSE_SITE = https://github.com/libfuse/libfuse/releases/download/fuse-$(LIBFUSE_VERSION)
 LIBFUSE_LICENSE = GPL-2.0, LGPL-2.1
