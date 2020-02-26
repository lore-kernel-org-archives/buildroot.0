From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Feb 2020 15:46:07 +0100
Subject: [Buildroot] [PATCH v2 36/37] package/libv4l: drop
 QT5_VERSION_LATEST logic
In-Reply-To: <20200226144608.12529-1-peter@korsgaard.com>
References: <20200226144608.12529-1-peter@korsgaard.com>
Message-ID: <20200226144608.12529-36-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
-- 
2.20.1
