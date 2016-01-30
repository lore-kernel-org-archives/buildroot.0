From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jan 2016 08:36:56 +0100
Subject: [Buildroot] [git commit] package/lm-sensors: fix download URL
Message-ID: <20160201224706.1F2797F90D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b93183b8ec56e314877ad1168ad312f32d1a121
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to http://www.lm-sensors.org/
"the previous hosting for lm-sensors.org has been discontinued and the
 former website maintainers can't be reached. For now, please refer to
 the Internet Archive of the old site until a replacement is created:
 https://web.archive.org/web/20150905145034/http://www.lm-sensors.org/"

This site points to ftp://ftp.netroedge.com/pub/lm-sensors/ as a mirror
site for this package, so let's use it until upstream can fix its web
site.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lm-sensors/lm-sensors.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index c26f919..cc05ef4 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -6,7 +6,7 @@
 
 LM_SENSORS_VERSION = 3.3.5
 LM_SENSORS_SOURCE = lm_sensors-$(LM_SENSORS_VERSION).tar.bz2
-LM_SENSORS_SITE = http://dl.lm-sensors.org/lm-sensors/releases
+LM_SENSORS_SITE = ftp://ftp.netroedge.com/pub/lm-sensors
 LM_SENSORS_INSTALL_STAGING = YES
 LM_SENSORS_DEPENDENCIES = host-bison host-flex
 LM_SENSORS_LICENSE = libsensors LGPLv2.1+, programs GPLv2+
