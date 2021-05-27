From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 27 May 2021 17:30:03 +0200
Subject: [Buildroot] [git commit] package/wlroots: check for
 BR2_PACKAGE_SEATD
Message-ID: <20210607144658.3E293814AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1e65b0b963455bb8eb75ef23e051533c6398d6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the wlroots packaging by checking for the correct variable to
determine whether seatd is being built.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/wlroots/wlroots.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index 38ddba743d..0696d037df 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -46,7 +46,7 @@ else
 WLROOTS_CONF_OPTS += -Dx11-backend=disabled -Dxwayland=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_SEATD_LIBSEAT),y)
+ifeq ($(BR2_PACKAGE_SEATD),y)
 WLROOTS_CONF_OPTS += -Dlibseat=enabled
 WLROOTS_DEPENDENCIES += seatd
 else
