From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Jan 2015 21:23:33 +0100
Subject: [Buildroot] [git commit] pv: bump version
Message-ID: <20150128202643.E02097FB87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3f263bb44466a6ea7cd878f443a064d209887160
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

!LFS compilation needs a trivial patch which has been sent upstream.
Also add .hash file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pv/0001-add-lstat64-to-64-emulation.patch |   22 +++++++++++++++++++++
 package/pv/pv.hash                                |    2 +
 package/pv/pv.mk                                  |    2 +-
 3 files changed, 25 insertions(+), 1 deletions(-)

diff --git a/package/pv/0001-add-lstat64-to-64-emulation.patch b/package/pv/0001-add-lstat64-to-64-emulation.patch
new file mode 100644
index 0000000..a2aa4f5
--- /dev/null
+++ b/package/pv/0001-add-lstat64-to-64-emulation.patch
@@ -0,0 +1,22 @@
+[PATCH] add lstat64 to *64 emulation
+
+pv nowadays also uses lstat64, so add it to the emulation defines for !LFS
+builds.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ autoconf/header.in |    1 +
+ 1 file changed, 1 insertion(+)
+
+Index: pv-1.5.7/autoconf/header.in
+===================================================================
+--- pv-1.5.7.orig/autoconf/header.in
++++ pv-1.5.7/autoconf/header.in
+@@ -76,6 +76,7 @@
+ # endif
+ # define open64 open
+ # define lseek64 lseek
++# define lstat64 lstat
+ #endif
+ 
+ #undef HAVE_IPC
diff --git a/package/pv/pv.hash b/package/pv/pv.hash
new file mode 100644
index 0000000..4120a81
--- /dev/null
+++ b/package/pv/pv.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	c8535061bb703086b67fa540da162ad48d6ecd219ae74157111465adfdef5997  pv-1.5.7.tar.bz2
diff --git a/package/pv/pv.mk b/package/pv/pv.mk
index 095b0d6..5346b10 100644
--- a/package/pv/pv.mk
+++ b/package/pv/pv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PV_VERSION = 1.4.12
+PV_VERSION = 1.5.7
 PV_SOURCE = pv-$(PV_VERSION).tar.bz2
 PV_SITE = http://www.ivarch.com/programs/sources
 PV_LICENSE = Artistic-2.0
