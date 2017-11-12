From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Nov 2017 09:13:23 +0100
Subject: [Buildroot] [PATCH 1/4 v3] package/freerdp: drop dependency on
 host-pkgconf
In-Reply-To: <cover.1510474387.git.yann.morin.1998@free.fr>
References: <cover.1510474387.git.yann.morin.1998@free.fr>
Message-ID: <67b488af759e72096a4cf414c5fa06344561c677.1510474387.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we only depend on host-pkgconf for gstreamer-0.x

However, we also need it at least for gstreamer-1.x and waylabnd, too.

But since FreeRDP is a cmake package, host-pkgconf is always pulled in
as a dependency by the cmake-package infrastructure.

So, drop the gstreamer-conditional host-pkgconf dependency.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Changes v1 -> v2:
  - drop host-pkgconf, as it is inherited via the infra  (Samuel)
---
 package/freerdp/freerdp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 382cd39647..6d1664b86e 100644
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
-- 
2.11.0
