From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2016 11:03:47 +0100
Subject: [Buildroot] [git commit branch/next] pv: bump to version 1.6.0
Message-ID: <20160217100440.12ACE81836@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=16690601030eb1d4e911ab82d3e0309919524b92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

And drop patch now upstream.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pv/0001-add-lstat64-to-64-emulation.patch | 22 ----------------------
 package/pv/pv.hash                                |  2 +-
 package/pv/pv.mk                                  |  2 +-
 3 files changed, 2 insertions(+), 24 deletions(-)

diff --git a/package/pv/0001-add-lstat64-to-64-emulation.patch b/package/pv/0001-add-lstat64-to-64-emulation.patch
deleted file mode 100644
index a2aa4f5..0000000
--- a/package/pv/0001-add-lstat64-to-64-emulation.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-[PATCH] add lstat64 to *64 emulation
-
-pv nowadays also uses lstat64, so add it to the emulation defines for !LFS
-builds.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- autoconf/header.in |    1 +
- 1 file changed, 1 insertion(+)
-
-Index: pv-1.5.7/autoconf/header.in
-===================================================================
---- pv-1.5.7.orig/autoconf/header.in
-+++ pv-1.5.7/autoconf/header.in
-@@ -76,6 +76,7 @@
- # endif
- # define open64 open
- # define lseek64 lseek
-+# define lstat64 lstat
- #endif
- 
- #undef HAVE_IPC
diff --git a/package/pv/pv.hash b/package/pv/pv.hash
index 4120a81..291d6dd 100644
--- a/package/pv/pv.hash
+++ b/package/pv/pv.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	c8535061bb703086b67fa540da162ad48d6ecd219ae74157111465adfdef5997  pv-1.5.7.tar.bz2
+sha256	0ece824e0da27b384d11d1de371f20cafac465e038041adab57fcf4b5036ef8d  pv-1.6.0.tar.bz2
diff --git a/package/pv/pv.mk b/package/pv/pv.mk
index 47f570f..2279805 100644
--- a/package/pv/pv.mk
+++ b/package/pv/pv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PV_VERSION = 1.5.7
+PV_VERSION = 1.6.0
 PV_SOURCE = pv-$(PV_VERSION).tar.bz2
 PV_SITE = http://www.ivarch.com/programs/sources
 PV_LICENSE = Artistic-2.0
