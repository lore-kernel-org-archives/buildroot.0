From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Dec 2019 18:16:30 +0100
Subject: [Buildroot] [git commit] package/glibc: hide "glibc utils" if glibc
 is not selected
Message-ID: <20191219170852.A61708CA61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d49b9522a943196604b89ca28ac782fd411b9de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_PACKAGE_GLIBC_UTILS config must not exist if we use other libc than glibc

Signed-off-by: Arthur Courtel <arthur.courtel@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
