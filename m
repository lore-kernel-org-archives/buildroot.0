From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Apr 2017 22:30:52 +0200
Subject: [Buildroot] [PATCH 04/29] package/qt5base: always use the
	opensource license
In-Reply-To: <cover.1492979449.git.yann.morin.1998@free.fr>
References: <cover.1492979449.git.yann.morin.1998@free.fr>
Message-ID: <317be76f0aa20cb52b22d12fc559efcdd8f8da24.1492979449.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We never ask the user to confirm their assent about the use of a free
license; there is no reason we do so for Qt.

The output of legal-info is there to gather all the licenses used in a
build; the license for qt5base will be there to be consulted as well.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5base/qt5base.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index a91c138f68..0c088350e5 100644
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
 
-- 
2.11.0
