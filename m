From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 15 Oct 2018 20:50:49 +0200
Subject: [Buildroot] [PATCH v1] qt5multimedia: add license info for examples
 fftreal library
Message-ID: <20181015185049.9141-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5multimedia/qt5multimedia.hash | 1 +
 package/qt5/qt5multimedia/qt5multimedia.mk   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index dfc4d60701..fb82851162 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -14,3 +14,4 @@ sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.
 sha256 1996a36160b2158c2be264d2ddfa6148ebe0f1ececff55aca8d754a1ddcc7bb8 LICENSE.LGPLv21
 sha256 438c1f9a2b256e47dac33249f2ad6d4a9df643f1ec5312216d528a2f7ad82084 LGPL_EXCEPTION.txt
 sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52 LICENSE.LGPLv3
+sha256 c1d75c15db4409bcbb182180d582f410a263dc9a631cd546b256e95f1da42165 examples/multimedia/spectrum/3rdparty/fftreal/license.txt
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index c97aebfd95..d044b7b96c 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -71,6 +71,8 @@ endef
 endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+QT5MULTIMEDIA_LICENSE := $(QT5MULTIMEDIA_LICENSE), LGPL-2.1+ (examples/multimedia/spectrum/3rdparty/fftreal)
+QT5MULTIMEDIA_LICENSE_FILES += examples/multimedia/spectrum/3rdparty/fftreal/license.txt
 define QT5MULTIMEDIA_INSTALL_TARGET_EXAMPLES
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/multimedia* $(TARGET_DIR)/usr/lib/qt/examples/
 endef
-- 
2.19.0
