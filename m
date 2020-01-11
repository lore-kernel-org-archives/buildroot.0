From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 11 Jan 2020 10:18:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/gpsd: add bluez5_utils optional
 dependency
Message-ID: <20200111091832.418684-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.24.1
