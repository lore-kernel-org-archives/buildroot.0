From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Jan 2017 16:28:19 +1100
Subject: [Buildroot] [git commit] qt5base: use libinput if selected
Message-ID: <20170119052947.288C4817FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d153dba65b92a77f3b5e6178d02528c1c330df6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
[Thomas:
 - move condition to a different place in the .mk file, with other
   similar conditions.
 - add an 'else' clause to pass -no-libinput in order to explicitly
   disable libinput support when the libinput package is not available.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5base/qt5base.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 23dba2a..45ba4e6 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -161,6 +161,13 @@ else
 QT5BASE_CONFIGURE_OPTS += -no-gstreamer
 endif
 
+ifeq ($(BR2_PACKAGE_LIBINPUT),y)
+QT5BASE_CONFIGURE_OPTS += -libinput
+QT5BASE_DEPENDENCIES += libinput
+else
+QT5BASE_CONFIGURE_OPTS += -no-libinput
+endif
+
 # Build the list of libraries to be installed on the target
 QT5BASE_INSTALL_LIBS_y                                 += Qt5Core
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_XCB)        += Qt5XcbQpa
