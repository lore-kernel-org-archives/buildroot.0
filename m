From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 19 Dec 2016 21:10:24 +0100
Subject: [Buildroot] [PATCH v1 4/6] qt5webchannel: add examples license
	information
In-Reply-To: <20161219201026.13040-1-ps.report@gmx.net>
References: <20161219201026.13040-1-ps.report@gmx.net>
Message-ID: <20161219201026.13040-4-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5webchannel/qt5webchannel.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index 3865ced34..c48757beb 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -13,6 +13,9 @@ QT5WEBCHANNEL_INSTALL_STAGING = YES
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
 QT5WEBCHANNEL_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
 QT5WEBCHANNEL_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+QT5WEBCHANNEL_LICENSE := $(QT5WEBCHANNEL_LICENSE), BSD-3c (examples)
+endif
 else
 QT5WEBCHANNEL_LICENSE = Commercial license
 QT5WEBCHANNEL_REDISTRIBUTE = NO
-- 
2.11.0
