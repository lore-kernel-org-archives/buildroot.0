From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 6 Feb 2019 16:31:24 +0100
Subject: [Buildroot] [git commit] package/libv4l: remove qt support
Message-ID: <20190206153033.4EB0881121@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dda04ad608c6e9e42a287ec614dfc2adc0198ac5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that Qt4 is removed, the support in libv4l can be removed as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libv4l/libv4l.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 6df69c19f0..71011d9102 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -73,9 +73,6 @@ LIBV4L_CONF_ENV += \
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 LIBV4L_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 endif
-else ifeq ($(BR2_PACKAGE_QT_OPENGL_GL_DESKTOP),y)
-LIBV4L_CONF_OPTS += --enable-qv4l2
-LIBV4L_DEPENDENCIES += qt
 else
 LIBV4L_CONF_OPTS += --disable-qv4l2
 endif
