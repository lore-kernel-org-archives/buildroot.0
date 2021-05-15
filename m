From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 May 2021 18:14:28 +0200
Subject: [Buildroot] [git commit] package/libbluray: add optional support
 for libudfread
Message-ID: <20210515154607.C75588138F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7aa9b9041d29547114d29f963d567fe421cccb1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libbluray/libbluray.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index 36f59190b1..835e8edd83 100644
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -19,6 +19,10 @@ ifeq ($(BR2_PACKAGE_LIBICONV),y)
 LIBBLURAY_DEPENDENCIES += libiconv
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUDFREAD),y)
+LIBBLURAY_DEPENDENCIES += libudfread
+endif
+
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 LIBBLURAY_DEPENDENCIES += freetype
 LIBBLURAY_CONF_OPTS += --with-freetype
