From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Apr 2017 22:31:11 +0200
Subject: [Buildroot] [PATCH 23/29] package/qt5webkit: always use the
	opensource license
In-Reply-To: <cover.1492979449.git.yann.morin.1998@free.fr>
References: <cover.1492979449.git.yann.morin.1998@free.fr>
Message-ID: <12e5473d0737e86b5e5ff203492149e5e220e08c.1492979449.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We never ask the user to confirm their assent about the use of a free
license; there is no reason we do so for Qt.

The output of legal-info is there to gather all the licenses used in a
build; the license for qt5webkit will be there to be consulted as well.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5webkit/qt5webkit.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 295d24d16f..d435192994 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -14,15 +14,10 @@ QT5WEBKIT_INSTALL_STAGING = YES
 
 QT5WEBKIT_LICENSE_FILES = Source/WebCore/LICENSE-LGPL-2 Source/WebCore/LICENSE-LGPL-2.1
 
-ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 QT5WEBKIT_LICENSE = LGPL-2.1+, BSD-3-Clause, BSD-2-Clause
 # Source files contain references to LGPL_EXCEPTION.txt but it is not included
 # in the archive.
 QT5WEBKIT_LICENSE_FILES += LICENSE.LGPLv21
-else
-QT5WEBKIT_LICENSE = LGPL-2.1+ (WebCore), Commercial license
-QT5WEBKIT_REDISTRIBUTE = NO
-endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
 QT5WEBKIT_DEPENDENCIES += xlib_libXext xlib_libXrender
-- 
2.11.0
