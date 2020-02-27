From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Feb 2020 23:56:00 +0100
Subject: [Buildroot] [git commit branch/next] package/libv4l: drop
 QT5_VERSION_LATEST logic
Message-ID: <20200227224530.AE0AA8E823@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f88e67a1dbe4b06c32e7fde62b9ed42a046d82cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Now that the version selection has been removed.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libv4l/libv4l.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index a3bf099221..e095e3d7e1 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -70,9 +70,7 @@ LIBV4L_CONF_ENV += \
 	ac_cv_prog_RCC=$(HOST_DIR)/bin/rcc \
 	ac_cv_prog_UIC=$(HOST_DIR)/bin/uic
 # qt5 needs c++11 (since qt-5.7)
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 LIBV4L_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
-endif
 else
 LIBV4L_CONF_OPTS += --disable-qv4l2
 endif
