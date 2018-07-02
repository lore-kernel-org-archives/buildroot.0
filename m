From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Jul 2018 23:02:42 +0200
Subject: [Buildroot] [git commit] qt5charts: fix license information
Message-ID: <20180702210023.DA1A984005@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9086de8e15d98abda64850c52b66756646e0c2f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qt5charts-2.1.3 (build with Qt 5.6) doesn't contain any license files so
remove LICENSE.GPL3 from QT5CHARTS_LICENSE_FILES when building Qt 5.6.

Fixes:
 http://autobuild.buildroot.net/results/c95d34129902a0511b8d64c9d50f1ffa293b33fd
 http://autobuild.buildroot.net/results/b9c14ce7c2fdaa412eb6416ae12a0376aaf05770
 http://autobuild.buildroot.net/results/1bde69c515d9140ef0f9a5571475c2850c7b8dee

Signed-off-by: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5charts/qt5charts.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qt5/qt5charts/qt5charts.mk b/package/qt5/qt5charts/qt5charts.mk
index 71d0e54027..9e2e6de881 100644
--- a/package/qt5/qt5charts/qt5charts.mk
+++ b/package/qt5/qt5charts/qt5charts.mk
@@ -16,7 +16,9 @@ QT5CHARTS_DEPENDENCIES = qt5base
 QT5CHARTS_INSTALL_STAGING = YES
 
 QT5CHARTS_LICENSE = GPL-3.0
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5CHARTS_LICENSE_FILES = LICENSE.GPL3
+endif
 
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
 QT5CHARTS_DEPENDENCIES += qt5declarative
