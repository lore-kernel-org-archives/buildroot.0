From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 10 Oct 2019 00:11:47 +0200
Subject: [Buildroot] [git commit] package/checkpolicy: re-enable on ARC
Message-ID: <20191009221024.610187FD5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=010f4ac5d495ecdd336d7cad664229f8e503e5a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libselinux is now available on ARC, so we can re-enable checkpolicy as
well.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/checkpolicy/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/checkpolicy/Config.in b/package/checkpolicy/Config.in
index f7b03df11d..ad769d22b7 100644
--- a/package/checkpolicy/Config.in
+++ b/package/checkpolicy/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_CHECKPOLICY
 	bool "checkpolicy"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libselinux
 	depends on !BR2_STATIC_LIBS # libselinux
-	depends on !BR2_arc # libselinux
 	select BR2_PACKAGE_LIBSELINUX
 	select BR2_PACKAGE_FLEX
 	help
@@ -15,5 +14,4 @@ config BR2_PACKAGE_CHECKPOLICY
 	  http://selinuxproject.org/page/Main_Page
 
 comment "checkpolicy needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_arc
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
