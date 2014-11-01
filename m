From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  1 Nov 2014 23:15:09 +0100
Subject: [Buildroot] [PATCH 2/4] qt5: expose a QT5_QMAKE variable for other
	Qt5 packages
In-Reply-To: <1414880111-19166-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1414880111-19166-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1414880111-19166-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Much like package/qt/qt.mk exposes a QT_QMAKE variable that other
qmake-based Qt4 libraries/applications can use in their .mk file, this
commit adds a QT5_QMAKE variable to allow the same for Qt5 packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5.mk | 3 +++
 1 file changed, 3 insertions(+)

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
-- 
2.0.0
