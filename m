From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Apr 2014 22:19:12 +0200
Subject: [Buildroot] [git commit] libdrm: needs threads
Message-ID: <20140421202323.1D0AD9C5F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6ef45ec14220ddbf76bc2e7722fd9114bab69528
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libdrm select libpthread-stubs that needs threads support.

Fixes:
http://autobuild.buildroot.net/results/1da/1dad13110312a44b40b9ee4050b265de1f3c8a42/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libdrm/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index 72cf5f8..df95eec 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBDRM
 	bool "libdrm"
 	select BR2_PACKAGE_LIBPTHREAD_STUBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libpthread-stubs
 	depends on BR2_LARGEFILE
 	help
 	  Direct Rendering Manager
@@ -59,5 +60,5 @@ endmenu
 
 endif
 
-comment "libdrm needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
+comment "libdrm needs a toolchain w/ largefile, threads"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
