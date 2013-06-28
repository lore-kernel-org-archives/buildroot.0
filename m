From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Jun 2013 12:41:11 +0200
Subject: [Buildroot] [git commit] qt5quick1: ensure optional qt5webkit
	support is enabled if present
Message-ID: <20130628104414.853339B27F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e3f983c851a0f2b13f47850276f5e4ce0f984403
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qt5quick1 has optional qt5webkit support, so ensure it is built after
qt5webkit if enabled.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt5/qt5quick1/qt5quick1.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/qt5/qt5quick1/qt5quick1.mk b/package/qt5/qt5quick1/qt5quick1.mk
index fc37388..83e11c4 100644
--- a/package/qt5/qt5quick1/qt5quick1.mk
+++ b/package/qt5/qt5quick1/qt5quick1.mk
@@ -7,7 +7,8 @@
 QT5QUICK1_VERSION = $(QT5_VERSION)
 QT5QUICK1_SITE = $(QT5_SITE)
 QT5QUICK1_SOURCE = qtquick1-opensource-src-$(QT5QUICK1_VERSION).tar.xz
-QT5QUICK1_DEPENDENCIES = qt5base qt5xmlpatterns qt5script qt5declarative qt5jsbackend
+QT5QUICK1_DEPENDENCIES = qt5base qt5xmlpatterns qt5script qt5declarative qt5jsbackend \
+	$(if $(BR2_PACKAGE_QT5WEBKIT),qt5webkit)
 QT5QUICK1_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
