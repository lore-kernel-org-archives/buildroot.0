From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 17:06:51 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/gpsd: fix
 BR2_PACKAGE_GPSD_MAX_{CLIENT, DEV} options
Message-ID: <20190606154047.8DFAA81D5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52b3f8187f4b9f492e39cd9a2cae2148b79c4181
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

limited_max_clients and limited_max_devices have been renamed in 3.12
as max_clients and max_devices, respectively.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Beno??t Th??baudeau <benoit.thebaudeau.dev@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 87cc11688d9f8bd88ef45643961255d0bfa2d67b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gpsd/gpsd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 48d21348b9..bc9fcf27c7 100644
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
