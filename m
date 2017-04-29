From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 15:53:19 +0200
Subject: [Buildroot] [git commit] package/qt5base: always use the opensource
	license
Message-ID: <20170429135923.13CD682629@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8569e78de682affea612daf628c661e6a48c0716
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We never ask the user to confirm their assent about the use of a free
license; there is no reason we do so for Qt.

The output of legal-info is there to gather all the licenses used in a
build; the license for qt5base will be there to be consulted as well.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5base/qt5base.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index a91c138..0c08835 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -47,7 +47,6 @@ ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
 QT5BASE_CONFIGURE_OPTS += -largefile
 endif
 
-ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 QT5BASE_CONFIGURE_OPTS += -opensource -confirm-license
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5BASE_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
@@ -60,10 +59,6 @@ ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 QT5BASE_LICENSE := $(QT5BASE_LICENSE), BSD-3-Clause (examples)
 QT5BASE_LICENSE_FILES += header.BSD
 endif
-else
-QT5BASE_LICENSE = Commercial license
-QT5BASE_REDISTRIBUTE = NO
-endif
 
 QT5BASE_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_QT5BASE_CONFIG_FILE))
 
