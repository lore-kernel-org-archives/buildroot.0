From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 15:53:18 +0200
Subject: [Buildroot] [git commit] package/qt: always use the opensource
	license
Message-ID: <20170429135923.0789182629@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=25ca4b24b32b3b8e327c1c6aeefc1eb85cc145fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We never ask the user to confirm their assent about the use of a free
license; there is no reason we do so for Qt.

The output of legal-info is there to gather all the licenses used in a
build; the license for Qt will be there to be consulted as well.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/qt.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 690a4b4..8b52208 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -15,14 +15,10 @@ QT_DEPENDENCIES = host-pkgconf
 QT_INSTALL_STAGING = YES
 
 QT_LICENSE := LGPL-2.1 with exceptions or GPL-3.0
-ifneq ($(BR2_PACKAGE_QT_LICENSE_APPROVED),y)
-QT_LICENSE := $(QT_LICENSE) or Digia Qt Commercial license
-endif
 QT_LICENSE_FILES = LICENSE.LGPL LGPL_EXCEPTION.txt LICENSE.GPL3
 
-ifeq ($(BR2_PACKAGE_QT_LICENSE_APPROVED),y)
+# Opensource licenses are the only one we catter about
 QT_CONFIGURE_OPTS += -opensource -confirm-license
-endif
 
 QT_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_QT_CONFIG_FILE))
 
