From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Dec 2017 15:39:19 +0100
Subject: [Buildroot] [git commit] luksmeta: enabled build with musl
Message-ID: <20171222144124.3DA1F80FA7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a604ddcd8d8bf093cdedaefc074a8c61933a4b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cryptsetup is available under musl since commit f71507d41bcb00 (lvm2:
make basic package available under musl). Enable luksmeta as well.

Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luksmeta/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/luksmeta/Config.in b/package/luksmeta/Config.in
index f2f6feb..ddc9b6f 100644
--- a/package/luksmeta/Config.in
+++ b/package/luksmeta/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_LUKSMETA
 	depends on BR2_TOOLCHAIN_HAS_THREADS # cryptsetup -> lvm2
 	depends on BR2_USE_MMU # cryptsetup -> lvm2
 	depends on !BR2_STATIC_LIBS # cryptsetup -> lvm2
-	depends on !BR2_TOOLCHAIN_USES_MUSL # cryptsetup -> lvm2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # cryptsetup -> json-c
 	select BR2_PACKAGE_CRYPTSETUP
 	help
@@ -12,8 +11,7 @@ config BR2_PACKAGE_LUKSMETA
 
 	  https://github.com/latchset/luksmeta
 
-comment "luksmeta needs a glibc or uClibc toolchain w/ threads, dynamic library"
+comment "luksmeta needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_TOOLCHAIN_USES_MUSL
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
