From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 21 Apr 2014 19:28:04 +0200
Subject: [Buildroot] [PATCH 1/1] libdrm: needs threads
Message-ID: <1398101284-31520-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libdrm select libpthread-stubs that needs threads support.

Fixes:
http://autobuild.buildroot.net/results/1da/1dad13110312a44b40b9ee4050b265de1f3c8a42/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/libdrm/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index 72cf5f8..fdb541e 100644
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
@@ -59,5 +60,6 @@ endmenu
 
 endif
 
-comment "libdrm needs a toolchain w/ largefile"
+comment "libdrm needs a toolchain w/ largefile, threads"
 	depends on !BR2_LARGEFILE
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.9.0
