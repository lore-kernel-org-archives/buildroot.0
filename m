From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 22 Dec 2017 14:03:22 +0200
Subject: [Buildroot] [PATCH 2/2] luksmeta: enabled build with musl
In-Reply-To: <81e71fbdb42aa4e00f16de0225eb5a0b6b17a79d.1513944202.git.baruch@tkos.co.il>
References: <81e71fbdb42aa4e00f16de0225eb5a0b6b17a79d.1513944202.git.baruch@tkos.co.il>
Message-ID: <5fe1c4218c426dc0854b9208744b1c4b5a02c6d4.1513944202.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cryptsetup is available under musl since commit f71507d41bcb00 (lvm2:
make basic package available under musl). Enable luksmeta as well.

Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/luksmeta/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/luksmeta/Config.in b/package/luksmeta/Config.in
index dec132ddd3e0..9fa94f80716a 100644
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
@@ -12,7 +11,6 @@ config BR2_PACKAGE_LUKSMETA
 
 	  https://github.com/latchset/luksmeta
 
-comment "luksmeta needs a glibc or uClibc toolchain w/ threads, dynamic library"
+comment "luksmeta needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_TOOLCHAIN_USES_MUSL
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.15.1
