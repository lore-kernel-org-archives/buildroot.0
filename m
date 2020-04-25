From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 16:23:15 +0200
Subject: [Buildroot] [git commit] package/libiio: fix install of C# bindings
Message-ID: <20200425140842.0E4F69002B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0db2b337818fb3ee9d40bf2e4595eeab4215a158
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libiio-sharp.dll.mdb is not installed since version 0.19.0 and
https://github.com/analogdevicesinc/libiio/commit/8b571969fa245fb25c6431340f23ff157e34841b

Indeed, EXISTS "${LIBIIO_CS_DLL}.mdb" will always return false because
the file will not exist when cmake will create the makefiles.

Fixes:
 - http://autobuild.buildroot.org/results/42ffbd07d0e998c75d1afde6a5db7d6418c10f45

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libiio/libiio.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index efd582a5ea..af5b27ba5f 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -72,7 +72,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBIIO_BINDINGS_CSHARP),y)
 define LIBIIO_INSTALL_CSHARP_BINDINGS_TO_TARGET
-	rm $(TARGET_DIR)/usr/lib/cli/libiio-sharp-$(LIBIIO_VERSION)/libiio-sharp.dll.mdb
 	$(HOST_DIR)/bin/gacutil -root $(TARGET_DIR)/usr/lib -i \
 		$(TARGET_DIR)/usr/lib/cli/libiio-sharp-$(LIBIIO_VERSION)/libiio-sharp.dll
 endef
