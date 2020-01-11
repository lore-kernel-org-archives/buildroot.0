From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jan 2020 15:29:04 +0100
Subject: [Buildroot] [git commit] package/gpsd: add bluez5_utils optional
 dependency
Message-ID: <20200111142227.DAD5A8A3C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81321c62c751b825c56734e069c54581c9605456
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gpsd/gpsd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index fa9b057821..93f1aeeb73 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -58,6 +58,8 @@ endif
 # If bluetooth is available build it before so the package can use it
 ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
 GPSD_DEPENDENCIES += bluez_utils
+else ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
+GPSD_DEPENDENCIES += bluez5_utils
 else
 GPSD_SCONS_OPTS += bluez=no
 endif
