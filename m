From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 19 Dec 2016 21:10:25 +0100
Subject: [Buildroot] [PATCH v1 5/6] qt5websockets: add examples license
	information
In-Reply-To: <20161219201026.13040-1-ps.report@gmx.net>
References: <20161219201026.13040-1-ps.report@gmx.net>
Message-ID: <20161219201026.13040-5-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/qt5/qt5websockets/qt5websockets.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index 609b68e4e..977155600 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -13,6 +13,9 @@ QT5WEBSOCKETS_INSTALL_STAGING = YES
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 QT5WEBSOCKETS_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3
 QT5WEBSOCKETS_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+QT5WEBSOCKETS_LICENSE := $(QT5WEBSOCKETS_LICENSE), BSD-3c (examples)
+endif
 else
 QT5WEBSOCKETS_LICENSE = Commercial license
 QT5WEBSOCKETS_REDISTRIBUTE = NO
-- 
2.11.0
