From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 10 Oct 2019 00:10:52 +0200
Subject: [Buildroot] [git commit] package/libselinux: re-enable on ARC
Message-ID: <20191009221024.431878125F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8dcb39288efaf85a8ec408067bef5315d2bec71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build on ARC was disabled in commit
881845f5fcc7e30654a95ea8a21e574df60980d1 ("libselinux: mark as not
available on ARC") and since then the ARC toolchain support has made a
lot of progress. libselinux now builds fine on ARC, so we can
re-enable it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libselinux/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/libselinux/Config.in b/package/libselinux/Config.in
index 8cebd34fb2..62070c8d59 100644
--- a/package/libselinux/Config.in
+++ b/package/libselinux/Config.in
@@ -2,8 +2,6 @@ config BR2_PACKAGE_LIBSELINUX
 	bool "libselinux"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	# Toolchain issue: "fixup not contained within frag"
-	depends on !BR2_arc
 	select BR2_PACKAGE_LIBSEPOL
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
@@ -19,5 +17,4 @@ config BR2_PACKAGE_LIBSELINUX
 	  http://selinuxproject.org/page/Main_Page
 
 comment "libselinux needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_arc
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
