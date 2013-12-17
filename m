From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Dec 2013 20:33:42 +0100
Subject: [Buildroot] [git commit] libdrm: Disable vmwgfx if specified by
	config
Message-ID: <20131217194430.0DF219C0C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ebda9ae661e5be3b5b1f6d1b022beff7db9fefaf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-Off-By: Paul Cercueil <paul@crapouillou.net>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdrm/libdrm.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 697cd2f..f5efaf1 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -44,7 +44,7 @@ ifeq ($(BR2_PACKAGE_LIBDRM_VMWGFX),y)
 LIBDRM_CONF_OPT += --enable-vmwgfx
 LIBDRM_DEPENDENCIES += xlib_libpciaccess
 else
-LIBDRM_CONF_OPT += --enable-vmwgfx
+LIBDRM_CONF_OPT += --disable-vmwgfx
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_OMAP),y)
