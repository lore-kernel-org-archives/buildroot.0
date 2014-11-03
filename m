From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Nov 2014 23:06:08 +0100
Subject: [Buildroot] [git commit] qt5: expose a QT5_QMAKE variable for other
	Qt5 packages
Message-ID: <20141103220809.C5619B1B3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ff8c746aba02c4987326ed39c8887e4f4500c412
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Much like package/qt/qt.mk exposes a QT_QMAKE variable that other
qmake-based Qt4 libraries/applications can use in their .mk file, this
commit adds a QT5_QMAKE variable to allow the same for Qt5 packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index e9c59db..2a3e274 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -17,3 +17,6 @@ define QT5_LA_PRL_FILES_FIXUP
 		$(SED) "s%-L/usr/lib%%" $$i; \
 	done
 endef
+
+# Variable for other Qt applications to use
+QT5_QMAKE = $(HOST_DIR)/usr/bin/qmake -spec devices/linux-buildroot-g++
