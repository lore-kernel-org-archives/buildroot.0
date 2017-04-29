From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 15:53:24 +0200
Subject: [Buildroot] [git commit] package/qt5connectivity: always use the
	opensource license
Message-ID: <20170429135923.3475F82629@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8ba4e436c74c6dc081b3b4f2e6579dd6d6c762c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We never ask the user to confirm their assent about the use of a free
license; there is no reason we do so for Qt.

The output of legal-info is there to gather all the licenses used in a
build; the license for qt5connectivity will be there to be consulted as
well.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5connectivity/qt5connectivity.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index a9518cb..d53aa91 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -10,7 +10,6 @@ QT5CONNECTIVITY_SOURCE = qtconnectivity-opensource-src-$(QT5CONNECTIVITY_VERSION
 QT5CONNECTIVITY_DEPENDENCIES = qt5base
 QT5CONNECTIVITY_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5CONNECTIVITY_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5CONNECTIVITY_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
@@ -21,10 +20,6 @@ endif
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 QT5CONNECTIVITY_LICENSE := $(QT5CONNECTIVITY_LICENSE), BSD-3-Clause (examples)
 endif
-else
-QT5CONNECTIVITY_LICENSE = Commercial license
-QT5CONNECTIVITY_REDISTRIBUTE = NO
-endif
 
 QT5CONNECTIVITY_DEPENDENCIES += $(if $(BR2_PACKAGE_QT5DECLARATIVE),qt5declarative)
 QT5CONNECTIVITY_DEPENDENCIES += $(if $(BR2_PACKAGE_BLUEZ_UTILS),bluez_utils)
