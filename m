From: Arthur Courtel <arthur.courtel@smile.fr>
Date: Thu, 19 Dec 2019 12:10:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/glibc: hide "glibc utils" if glibc
 is not selected
Message-ID: <20191219111024.308479-1-arthur.courtel@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_PACKAGE_GLIBC_UTILS config must not exist if we use other libc than glibc

Signed-off-by: Arthur Courtel <arthur.courtel@smile.fr>
---
 package/glibc/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 7b2f246947..cc178468b5 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -7,10 +7,11 @@ config BR2_PACKAGE_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP if BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
 	help
 	  https://www.gnu.org/software/libc/
-endif
 
 config BR2_PACKAGE_GLIBC_UTILS
 	bool "Install glibc utilities"
 	help
 	  Enabling this option will compile and install the getconf,
 	  ldconfig, ldd and locale glibc utilities for the target.
+
+endif # BR2_TOOLCHAIN_BUILDROOT_GLIBC
-- 
2.23.0
