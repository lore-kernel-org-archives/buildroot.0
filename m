From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 10 Oct 2019 00:13:04 +0200
Subject: [Buildroot] [git commit] package/restorecond: re-enable on ARC
Message-ID: <20191009221024.7F3C781798@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc39dfac0d02dac09789dab4de017a83c34df815
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libselinux is now available on ARC, so we can allow the selection of
restorecond on ARC as well.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/restorecond/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/restorecond/Config.in b/package/restorecond/Config.in
index 10ca74e351..31f85f2882 100644
--- a/package/restorecond/Config.in
+++ b/package/restorecond/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_RESTORECOND
 	bool "restorecond"
-	depends on !BR2_arc
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
@@ -18,6 +17,5 @@ config BR2_PACKAGE_RESTORECOND
 
 comment "restorecond needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_arc
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
 		BR2_STATIC_LIBS
