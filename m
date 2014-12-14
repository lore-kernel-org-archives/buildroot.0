From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Dec 2014 17:04:36 +0100
Subject: [Buildroot] [PATCH 1/5] package/gpsd: remove duplicate dependency
In-Reply-To: <cover.1418572993.git.yann.morin.1998@free.fr>
References: <cover.1418572993.git.yann.morin.1998@free.fr>
Message-ID: <07a14a0db8c7fb6e87dea83670fd7b9d53bb1267.1418572993.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No need to duplicate the host-pkgconf dependency on the Qt case, we
already depend on it in the general case.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/gpsd/gpsd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 5092b38..3e6411b 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -45,7 +45,7 @@ endif
 # Enable or disable Qt binding
 ifeq ($(BR2_PACKAGE_QT_NETWORK),y)
 	GPSD_SCONS_ENV += QMAKE="$(QT_QMAKE)"
-	GPSD_DEPENDENCIES += qt host-pkgconf
+	GPSD_DEPENDENCIES += qt
 else
 	GPSD_SCONS_OPTS += qt=no
 endif
-- 
1.9.1
