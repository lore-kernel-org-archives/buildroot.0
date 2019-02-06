From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed,  6 Feb 2019 16:11:15 +0100
Subject: [Buildroot] [PATCH 2/3] package/gpsd: remove qt support
In-Reply-To: <20190206151116.8012-1-peter@korsgaard.com>
References: <20190206151116.8012-1-peter@korsgaard.com>
Message-ID: <20190206151116.8012-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that Qt4 is removed, the support in gpsd can be removed as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gpsd/gpsd.mk | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index ade2d2a163..48d21348b9 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -23,7 +23,8 @@ GPSD_SCONS_OPTS = \
 	prefix=/usr\
 	sysroot=$(STAGING_DIR)\
 	strip=no\
-	python=no
+	python=no \
+	qt=no
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 GPSD_DEPENDENCIES += ncurses
@@ -48,14 +49,6 @@ ifeq ($(BR2_microblaze),y)
 GPSD_CFLAGS += -O0
 endif
 
-# Enable or disable Qt binding
-ifeq ($(BR2_PACKAGE_QT_NETWORK),y)
-GPSD_SCONS_ENV += QMAKE="$(QT_QMAKE)"
-GPSD_DEPENDENCIES += qt
-else
-GPSD_SCONS_OPTS += qt=no
-endif
-
 # If libusb is available build it before so the package can use it
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 GPSD_DEPENDENCIES += libusb
-- 
2.11.0
