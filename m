From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Dec 2014 22:10:31 +0100
Subject: [Buildroot] [git commit] package/gpsd: remove duplicate dependency
Message-ID: <20141215211812.EB6367FF39@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d213b3bc0dd61fba45be7e95f7ae95dcfb4a20c6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No need to duplicate the host-pkgconf dependency on the Qt case, we
already depend on it in the general case.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gpsd/gpsd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
