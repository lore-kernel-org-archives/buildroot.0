From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 02 Jun 2019 20:12:44 -0000
Subject: [Buildroot] [git commit] package/qt5base: enable journald logging
Message-ID: <20190602201233.AFF6E8EDA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d63ba6546bdcdd691220ca5276b8dacf0671acb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allows Qt applications to log into systemd journal with
QT_LOGGING_TO_CONSOLE=0 environment variable.

Signed-off-by: David Rosca <nowrep@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5base/qt5base.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index e73b8931aa..e4ae120631 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -253,6 +253,13 @@ QT5BASE_CONFIGURE_OPTS += -no-gtk
 endif
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+QT5BASE_CONFIGURE_OPTS += -journald
+QT5BASE_DEPENDENCIES += systemd
+else
+QT5BASE_CONFIGURE_OPTS += -no-journald
+endif
+
 # Build the list of libraries to be installed on the target
 QT5BASE_INSTALL_LIBS_y                                 += Qt5Core
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_XCB)        += Qt5XcbQpa
