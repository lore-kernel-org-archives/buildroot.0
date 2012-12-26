From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 Dec 2012 23:38:43 +0100
Subject: [Buildroot] [git commit] libfuse: needs mmu
Message-ID: <20121226224225.1C4739A43C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6a219e26b6a15b5a073660c96778024915877663
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/5c64ea05e0ffedcc78f5255f6f76afa1f159cda0

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libfuse/Config.in |    1 +
 package/sshfs/Config.in   |    1 +
 package/unionfs/Config.in |    1 +
 3 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/libfuse/Config.in b/package/libfuse/Config.in
index 2e9b7dc..5d30892 100644
--- a/package/libfuse/Config.in
+++ b/package/libfuse/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBFUSE
 	bool "libfuse"
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	help
 	  FUSE (Filesystem in UserSpacE)
 
diff --git a/package/sshfs/Config.in b/package/sshfs/Config.in
index d0cf932..11b6bb9 100644
--- a/package/sshfs/Config.in
+++ b/package/sshfs/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_SSHFS
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
+	depends on BR2_USE_MMU # libfuse
 	help
 	  FUSE filesystem client based on the SSH File Transfer Protocol.
 
diff --git a/package/unionfs/Config.in b/package/unionfs/Config.in
index 92f1787..2ac7be9 100644
--- a/package/unionfs/Config.in
+++ b/package/unionfs/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_UNIONFS
 	select BR2_PACKAGE_LIBFUSE
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
+	depends on BR2_USE_MMU # libfuse
 	help
 	  A userspace unionfs implementation.
 
