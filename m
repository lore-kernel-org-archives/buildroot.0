From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Dec 2020 15:15:47 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/python-pyqt5: fix
 qt5 openssl conditional
Message-ID: <20201222140041.5351A8645C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d74ea609ab3c746d903ef94677ef2373a6686339
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

BR2_PACKAGE_QT5BASE_OPENSSL was dropped by commit 4be1f9b9873
(package/qt5enginio: drop qt 5.6 support), but python-pyqt5 not updated to
match.  Fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 54854dc44e6ff937834bf00a2b63186fd066477c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyqt5/python-pyqt5.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pyqt5/python-pyqt5.mk b/package/python-pyqt5/python-pyqt5.mk
index 9285b6497c..8f28c90d15 100644
--- a/package/python-pyqt5/python-pyqt5.mk
+++ b/package/python-pyqt5/python-pyqt5.mk
@@ -135,7 +135,7 @@ PYTHON_PYQT5_QTDETAIL_TYPE = shared
 # Turn off features that aren't available in current qt configuration
 PYTHON_PYQT5_QTDETAIL_DISABLE_FEATURES += $(if $(BR2_PACKAGE_QT5BASE_OPENGL),,PyQt_OpenGL)
 PYTHON_PYQT5_QTDETAIL_DISABLE_FEATURES += $(if $(BR2_PACKAGE_QT5BASE_OPENGL_DESKTOP),,PyQt_Desktop_OpenGL)
-PYTHON_PYQT5_QTDETAIL_DISABLE_FEATURES += $(if $(BR2_PACKAGE_QT5BASE_OPENSSL),,PyQt_SSL)
+PYTHON_PYQT5_QTDETAIL_DISABLE_FEATURES += $(if $(BR2_PACKAGE_OPENSSL),,PyQt_SSL)
 
 define PYTHON_PYQT5_QTDETAIL
 	echo $(1) >> $(2)/qtdetail.out
