From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Oct 2014 05:30:02 +0100
Subject: [Buildroot] [git commit] avahi: add optional gtk3 support
Message-ID: <20141026043430.88B59B57DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4ee770e1847b16e6b671513aee492e8426f5398d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/avahi/avahi.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 3b9ac63..752f2e7 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -73,7 +73,6 @@ AVAHI_CONF_OPTS = \
 		--disable-gdbm \
 		--disable-python-dbus \
 		--disable-pygtk \
-		--disable-gtk3 \
 		--disable-mono \
 		--disable-monodoc \
 		--disable-stack-protector \
@@ -123,6 +122,13 @@ else
 AVAHI_CONF_OPTS += --disable-gtk
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGTK3),y)
+AVAHI_DEPENDENCIES += libgtk3
+AVAHI_CONF_OPTS += --enable-gtk3
+else
+AVAHI_CONF_OPTS += --disable-gtk3
+endif
+
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 AVAHI_CONF_ENV += am_cv_pathless_PYTHON=python \
 		am_cv_path_PYTHON=$(PYTHON_TARGET_BINARY) \
