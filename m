From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 19 Dec 2016 21:10:26 +0100
Subject: [Buildroot] [PATCH v1 6/6] qt5xmlpatterns: add examples license
	information
In-Reply-To: <20161219201026.13040-1-ps.report@gmx.net>
References: <20161219201026.13040-1-ps.report@gmx.net>
Message-ID: <20161219201026.13040-6-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index 0b518b052..9fc44df5b 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -13,6 +13,9 @@ QT5XMLPATTERNS_INSTALL_STAGING = YES
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 QT5XMLPATTERNS_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5XMLPATTERNS_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+QT5XMLPATTERNS_LICENSE := $(QT5XMLPATTERNS_LICENSE), BSD-3c (examples)
+endif
 else
 QT5XMLPATTERNS_LICENSE = Commercial license
 QT5XMLPATTERNS_REDISTRIBUTE = NO
-- 
2.11.0
