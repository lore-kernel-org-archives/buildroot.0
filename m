From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Nov 2013 11:31:12 +0100
Subject: [Buildroot] [git commit] nut: add libltdl dependency
Message-ID: <20131124113313.662919BB05@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=46250ee126476821ef934a737f487ee49b33fd5a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libltdl is needed for nut-scanner

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nut/nut.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/nut/nut.mk b/package/nut/nut.mk
index 8cb8a01..25b88c4 100644
--- a/package/nut/nut.mk
+++ b/package/nut/nut.mk
@@ -48,6 +48,14 @@ else
 NUT_CONF_OPT += --without-cgi
 endif
 
+# libltdl (libtool) is needed for nut-scanner
+ifeq ($(BR2_PACKAGE_LIBTOOL),y)
+NUT_DEPENDENCIES += libtool
+NUT_CONF_OPT += --with-libltdl
+else
+NUT_CONF_OPT += --without-libltdl
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)
 NUT_DEPENDENCIES += libusb-compat
 NUT_CONF_OPT += --with-usb
