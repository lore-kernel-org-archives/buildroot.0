From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 Mar 2019 10:13:14 +0100
Subject: [Buildroot] [git commit] package/qt5/qt5base: exclude OpenSSL
 functionality for Qt 5.6.x
Message-ID: <20190301091158.57CC381007@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c110e48cecde6f543da18388322907b05b25e7d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No patch back-porting OpenSSL 1.1.x support to Qt 5.6.x is available.

https://development.qt-project.narkive.com/RW4wxYXY/openssl-1-1-x-support-on-qt-5-6-5-9

Signed-off-by: James Grant <james.grant@jci.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/qt5base.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index e71878a487..a5ce583327 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -188,8 +188,13 @@ else
 QT5BASE_CONFIGURE_OPTS += -no-eglfs
 endif
 
+ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
+# No OpenSSL 1.1.x support in Qt 5.6.x
+QT5BASE_CONFIGURE_OPTS += -no-openssl
+else
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_OPENSSL),-openssl,-no-openssl)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_OPENSSL),openssl)
+endif
 
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_FONTCONFIG),-fontconfig,-no-fontconfig)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_FONTCONFIG),fontconfig)
