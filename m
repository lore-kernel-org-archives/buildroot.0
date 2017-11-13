From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Nov 2017 21:24:55 +0100
Subject: [Buildroot] [git commit branch/next] package/freerdp: drop
 dependency on host-pkgconf
Message-ID: <20171113221623.19844807B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c219d396e31551785731b0ff7adb38782431b03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Currently, we only depend on host-pkgconf for gstreamer-0.x

However, we also need it at least for gstreamer-1.x and waylabnd, too.

But since FreeRDP is a cmake package, host-pkgconf is always pulled in
as a dependency by the cmake-package infrastructure.

So, drop the gstreamer-conditional host-pkgconf dependency.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freerdp/freerdp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 382cd39..6d1664b 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -16,7 +16,7 @@ FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF -Wno-dev
 
 ifeq ($(BR2_PACKAGE_FREERDP_GSTREAMER),y)
 FREERDP_CONF_OPTS += -DWITH_GSTREAMER_0_10=ON
-FREERDP_DEPENDENCIES += gstreamer gst-plugins-base libxml2 host-pkgconf
+FREERDP_DEPENDENCIES += gstreamer gst-plugins-base libxml2
 else
 FREERDP_CONF_OPTS += -DWITH_GSTREAMER_0_10=OFF
 endif
