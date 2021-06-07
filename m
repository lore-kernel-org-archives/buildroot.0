From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 07 Jun 2021 15:17:32 -0000
Subject: [Buildroot] [git commit] package/libbluray: add optional support
 for libudfread
Message-ID: <20210607144651.726ED8B398@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=698ddd07b4a1cadc57b0f6b72a0bedcf957ef104
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libbluray/libbluray.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index 5c5f603dd8..233797f38d 100644
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
