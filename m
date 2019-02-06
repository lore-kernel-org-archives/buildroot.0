From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 6 Feb 2019 16:31:06 +0100
Subject: [Buildroot] [git commit] package/gpsd: remove qt support
Message-ID: <20190206153033.47BA681121@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f32ed723e93073e77eb42fb7c886f37c4d17326
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that Qt4 is removed, the support in gpsd can be removed as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
