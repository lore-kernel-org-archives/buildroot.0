From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 15:09:13 +0200
Subject: [Buildroot] [git commit] package/kodi: extend comment about non-RPi
	options
Message-ID: <20170429130930.682C08220A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f6de270e2224a06f5c9bcaa993b62bfb2b48961
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Suggested by Thomas:
http://lists.busybox.net/pipermail/buildroot/2017-April/190767.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: improve wording.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/kodi.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 12dc311..0b89bdd 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -147,7 +147,11 @@ ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 KODI_CONF_OPTS += -DCORE_SYSTEM_NAME=rbpi
 KODI_DEPENDENCIES += rpi-userland
 else
-# these options only exist on non-rpi systems
+# Kodi considers "rpbi" and "linux" as two separate platforms. The
+# below options, defined in
+# project/cmake/scripts/linux/ArchSetup.cmake are only valid for the
+# "linux" platforms. The "rpbi" platform has a different set of
+# options, defined in project/cmake/scripts/rbpi/
 KODI_CONF_OPTS += -DENABLE_LDGOLD=OFF
 ifeq ($(BR2_PACKAGE_LIBAMCODEC),y)
 KODI_CONF_OPTS += -DENABLE_AML=ON
