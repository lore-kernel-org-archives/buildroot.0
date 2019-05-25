From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 May 2019 23:13:36 +0200
Subject: [Buildroot] [git commit] package/gpsd: fix
 BR2_PACKAGE_GPSD_MAX_{CLIENT, DEV} options
Message-ID: <20190525211012.45ACE80E2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87cc11688d9f8bd88ef45643961255d0bfa2d67b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

limited_max_clients and limited_max_devices have been renamed in 3.12
as max_clients and max_devices, respectively.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Beno??t Th??baudeau <benoit.thebaudeau.dev@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gpsd/gpsd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 0a17ddc93e..d2c7612526 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -195,10 +195,10 @@ ifeq ($(BR2_PACKAGE_GPSD_FIXED_PORT_SPEED),y)
 GPSD_SCONS_OPTS += fixed_port_speed=$(BR2_PACKAGE_GPSD_FIXED_PORT_SPEED_VALUE)
 endif
 ifeq ($(BR2_PACKAGE_GPSD_MAX_CLIENT),y)
-GPSD_SCONS_OPTS += limited_max_clients=$(BR2_PACKAGE_GPSD_MAX_CLIENT_VALUE)
+GPSD_SCONS_OPTS += max_clients=$(BR2_PACKAGE_GPSD_MAX_CLIENT_VALUE)
 endif
 ifeq ($(BR2_PACKAGE_GPSD_MAX_DEV),y)
-GPSD_SCONS_OPTS += limited_max_devices=$(BR2_PACKAGE_GPSD_MAX_DEV_VALUE)
+GPSD_SCONS_OPTS += max_devices=$(BR2_PACKAGE_GPSD_MAX_DEV_VALUE)
 endif
 
 GPSD_SCONS_ENV += LDFLAGS="$(GPSD_LDFLAGS)" CFLAGS="$(GPSD_CFLAGS)"
