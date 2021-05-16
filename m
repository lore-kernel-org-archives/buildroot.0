From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 May 2021 11:14:29 +0200
Subject: [Buildroot] [git commit] Revert "package/libbluray: add optional
 support for libudfread"
Message-ID: <20210516084957.171E5875EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d60b443e7a95a2217fae669e2e8661ced4a925f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 7aa9b9041d29547114d29f963d567fe421cccb1b.

libbluray before 1.3.0 does not properly detect libudfread, because it
checks for the incorrect name (it asks pkg-config for udfread instead of
libudfread). So, even with the dependency, it would miss it.

Reported-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libbluray/libbluray.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index 835e8edd83..36f59190b1 100644
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -19,10 +19,6 @@ ifeq ($(BR2_PACKAGE_LIBICONV),y)
 LIBBLURAY_DEPENDENCIES += libiconv
 endif
 
-ifeq ($(BR2_PACKAGE_LIBUDFREAD),y)
-LIBBLURAY_DEPENDENCIES += libudfread
-endif
-
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 LIBBLURAY_DEPENDENCIES += freetype
 LIBBLURAY_CONF_OPTS += --with-freetype
