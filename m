From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Apr 2016 22:06:30 +0200
Subject: [Buildroot] [git commit] libinput: add explicit event-gui handling
Message-ID: <20160422200736.D41A281EB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c02dee9552c06c90d887746e70181347a2e2fde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise since it's automatic it was left to random depending on the
libgtk3/libinput build order.

Also collapse all that whitespace.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libinput/libinput.mk | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 6d8b7b6..2954760 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -7,13 +7,18 @@
 LIBINPUT_VERSION = 1.1.5
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
-LIBINPUT_LICENSE = MIT
-LIBINPUT_LICENSE_FILES = COPYING
-
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
 LIBINPUT_INSTALL_STAGING = YES
-
+LIBINPUT_LICENSE = MIT
+LIBINPUT_LICENSE_FILES = COPYING
 # Tests need fork, so just disable them everywhere.
 LIBINPUT_CONF_OPTS = --disable-tests
 
+ifeq ($(BR2_PACKAGE_LIBGTK3),y)
+LIBINPUT_CONF_OPTS += --enable-event-gui
+LIBINPUT_DEPENDENCIES += libgtk3
+else
+LIBINOUT_CONF_OPTS += --disable-event-gui
+endif
+
 $(eval $(autotools-package))
