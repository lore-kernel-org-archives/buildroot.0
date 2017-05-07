From: Baruch Siach <baruch@tkos.co.il>
Date: Sun,  7 May 2017 20:54:00 +0300
Subject: [Buildroot] [PATCH] connman: update musl incompatibility reason
Message-ID: <37435abb853673f385d36cb7a54f71dc0b69d526.1494179640.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

connman no longer triggers a conflict of userspace and kernel headers since
commit 69ced96355 (musl: workaround kernel if_ether.h header conflict). The
real blocker for musl build (besides a few missing includes here and there)
is the missing res_ninit() implementation. Update the comment accordingly.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/connman/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 39a81ee9f0f8..28cf16861c8d 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_CONNMAN
 	depends on BR2_USE_MMU # dbus, libglib2
 	depends on !BR2_STATIC_LIBS # needs dlopen()
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_USES_MUSL # mixes userspace and kernel headers
+	depends on !BR2_TOOLCHAIN_USES_MUSL # missing res_ninit()
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_IPTABLES
-- 
2.11.0
