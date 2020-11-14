From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Nov 2020 09:09:26 +0100
Subject: [Buildroot] [git commit branch/next] package/cryptsetup: really
 break circular dependency
Message-ID: <20201117203829.351057FD00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3277694825cdc3fb8993bbe42609dd93c8959971
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The commit [1] should fix a circular dependency by
using util-linux-libs instead of util-linux if
BR2_PACKAGE_UTIL_LINUX_LIBS is set.

But util-linux is still in CRYPTSETUP_DEPENDENCIES.
Remove it to really break the circular dependency.

[1] e3c86f5c9e466ed5135e824d6dcebcfd7f5ac1ab

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Reviewed-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/cryptsetup/cryptsetup.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 60097595b4..a59a0c7570 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -9,7 +9,7 @@ CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).4
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = \
-	lvm2 popt util-linux host-pkgconf json-c libargon2 \
+	lvm2 popt host-pkgconf json-c libargon2 \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs,util-linux) \
 	$(TARGET_NLS_DEPENDENCIES)
