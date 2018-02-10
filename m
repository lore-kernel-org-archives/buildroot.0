From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Feb 2018 16:14:56 +0100
Subject: [Buildroot] [git commit] qt5tools: fix typo in <pkg>_SOURCE
Message-ID: <20180210151602.57CC28865A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c384c3b0f292413c3364f5113b340e22efa76f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The QT5TOOLS_SOURCE variable uses mismatch QT5BASE_VERSION variable.

This commit fixes the typo by using the appropriate QT5TOOLS_VERSION
variable.

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5tools/qt5tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
index 3638b74163..cf181e576b 100644
--- a/package/qt5/qt5tools/qt5tools.mk
+++ b/package/qt5/qt5tools/qt5tools.mk
@@ -6,7 +6,7 @@
 
 QT5TOOLS_VERSION = $(QT5_VERSION)
 QT5TOOLS_SITE = $(QT5_SITE)
-QT5TOOLS_SOURCE = qttools-opensource-src-$(QT5BASE_VERSION).tar.xz
+QT5TOOLS_SOURCE = qttools-opensource-src-$(QT5TOOLS_VERSION).tar.xz
 
 QT5TOOLS_DEPENDENCIES = qt5base
 QT5TOOLS_INSTALL_STAGING = YES
