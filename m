From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  7 Aug 2015 23:56:46 +0200
Subject: [Buildroot] [PATCH] [autobuild] package/qt5quickcontrols: fix
	licensing information
Message-ID: <1438984606-27797-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the bump to 5.5.0, the LGPv2.1-with-exception has been dropped,
with only the LGPLv3 or GPLv2 as alternatives.

Drop LGPLv2.1-with-exception.

Add GFDL (GNU Free Documentation License) as it is explicitly referenced
in the source tree.

Fixes:
    http://autobuild.buildroot.org/results/0dc/0dc96010cc81a34d2363eb4fe1a155db0e3769fd/
    http://autobuild.buildroot.org/results/2b0/2b0b4c170dfa0d95c10bf030e6f249b3305dd318/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Julien CORJON <corjon.j@ecagroup.com>
---
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
index 4aeca5b..7ad4d16 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
@@ -11,8 +11,8 @@ QT5QUICKCONTROLS_DEPENDENCIES = qt5base qt5declarative
 QT5QUICKCONTROLS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
-QT5QUICKCONTROLS_LICENSE = LGPLv2.1 with exception or LGPLv3 or GPLv2
-QT5QUICKCONTROLS_LICENSE_FILES = LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.GPLv2
+QT5QUICKCONTROLS_LICENSE = LGPLv3, GPLv2, GFDL
+QT5QUICKCONTROLS_LICENSE_FILES = LICENSE.LGPLv3 LICENSE.GPLv2 LICENSE.FDL
 else
 QT5QUICKCONTROLS_LICENSE = Commercial license
 QT5QUICKCONTROLS_REDISTRIBUTE = NO
-- 
1.9.1
