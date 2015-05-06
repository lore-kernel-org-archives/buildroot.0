From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed,  6 May 2015 16:59:36 +0200
Subject: [Buildroot] [PATCH 1/1] python-pyqt: fix opengl build failure
Message-ID: <1430924376-26750-1-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Fix:
http://autobuild.buildroot.net/results/206/2062208c171207428c9121215971e00c52bf306a/

According to configure-ng.py, PyQt_NoOpenGLES must be added to qtdetail when
QT_OPENGL_ES is set.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/python-pyqt/python-pyqt.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python-pyqt/python-pyqt.mk b/package/python-pyqt/python-pyqt.mk
index 2445567..f10d508 100644
--- a/package/python-pyqt/python-pyqt.mk
+++ b/package/python-pyqt/python-pyqt.mk
@@ -40,6 +40,10 @@ ifeq ($(BR2_PACKAGE_QT_OPENSSL),)
 PYTHON_PYQT_QTDETAIL_DISABLE_FEATURES += PyQt_OpenSSL
 endif
 
+ifeq ($(BR2_PACKAGE_QT_OPENGL_ES),y)
+PYTHON_PYQT_QTDETAIL_DISABLE_FEATURES += PyQt_NoOpenGLES
+endif
+
 # PyQt_qreal_double must be disabled on a number of architectures that
 # use float for qreal.
 ifeq ($(BR2_PACKAGE_PYTHON_PYQT_ARCH_USES_QREAL_FLOAT),y)
-- 
2.3.6
