From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 May 2017 21:27:24 +0200
Subject: [Buildroot] [git commit] connman: update musl incompatibility reason
Message-ID: <20170507192821.82D007F9D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e97afdf0a684aa97ce1ce7a1c47ef3c1649b36f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

connman no longer triggers a conflict of userspace and kernel headers since
commit 69ced96355 (musl: workaround kernel if_ether.h header conflict). The
real blocker for musl build (besides a few missing includes here and there)
is the missing res_ninit() implementation. Update the comment accordingly.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/connman/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 39a81ee..28cf168 100644
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
