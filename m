From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Oct 2019 23:19:14 +0200
Subject: [Buildroot] [git commit] package/ytree: fix static build with
 readline
Message-ID: <20191007211331.5DE458B474@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b1c90467d8a4be273a3010fad4728115b470ccbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/b1a1392636467f8c07504fa6cfb17962764820ae

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ytree/ytree.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ytree/ytree.mk b/package/ytree/ytree.mk
index 863eba741c..d9716f93ba 100644
--- a/package/ytree/ytree.mk
+++ b/package/ytree/ytree.mk
@@ -14,9 +14,9 @@ YTREE_CFLAGS = -DCOLOR_SUPPORT $(TARGET_CFLAGS)
 YTREE_LDFLAGS = -lncurses $(TARGET_LDFLAGS)
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
-YTREE_DEPENDENCIES += readline
+YTREE_DEPENDENCIES += host-pkgconf readline
 YTREE_CFLAGS += -DREADLINE_SUPPORT
-YTREE_LDFLAGS += -lreadline
+YTREE_LDFLAGS += `$(PKG_CONFIG_HOST_BINARY) --libs readline`
 endif
 
 define YTREE_BUILD_CMDS
