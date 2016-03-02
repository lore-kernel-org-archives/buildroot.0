From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 02 Mar 2016 20:27:53 -0000
Subject: [Buildroot] [git commit] package/mjpg-streamer: added optional
	dependency to libv4l
Message-ID: <20160302202752.038BC80203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e4e6a3a186f58bee3566eb1aaa5b8a311fb515c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mjpg-streamer/mjpg-streamer.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/mjpg-streamer/mjpg-streamer.mk b/package/mjpg-streamer/mjpg-streamer.mk
index e54c600..a710af6 100644
--- a/package/mjpg-streamer/mjpg-streamer.mk
+++ b/package/mjpg-streamer/mjpg-streamer.mk
@@ -14,8 +14,13 @@ MJPG_STREAMER_LICENSE = GPLv2+
 MJPG_STREAMER_LICENSE_FILES = LICENSE
 MJPG_STREAMER_DEPENDENCIES = jpeg
 
+ifeq ($(BR2_PACKAGE_LIBV4L),y)
+MJPG_STREAMER_DEPENDENCIES += libv4l
+MJPG_STREAMER_USE_LIBV4L += USE_LIBV4L2=true
+endif
+
 define MJPG_STREAMER_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" -C $(@D) $(MJPG_STREAMER_USE_LIBV4L)
 endef
 
 define MJPG_STREAMER_INSTALL_TARGET_CMDS
