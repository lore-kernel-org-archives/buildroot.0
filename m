From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Apr 2021 14:25:22 +0200
Subject: [Buildroot] [git commit] package/tvheadend: add option to enable
 timeshift support
Message-ID: <20210404120101.E80238C422@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ae47f5c48d0b51714df3d0777e266c60e6b2f03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998 at free.fr: one option per-commit]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tvheadend/Config.in    | 6 ++++++
 package/tvheadend/tvheadend.mk | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index d96d199898..cc42f8b4cd 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -40,6 +40,12 @@ config BR2_PACKAGE_TVHEADEND_SATIP
 	help
 	  Enable SAT>IP support.
 
+config BR2_PACKAGE_TVHEADEND_TIMESHIFT
+	bool "timeshift support"
+	default y
+	help
+	  Enable timeshift support.
+
 config BR2_PACKAGE_TVHEADEND_TRANSCODING
 	bool "transcoding support"
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 9a007ce8d1..dd963f2e94 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -85,6 +85,12 @@ else
 TVHEADEND_CONF_OPTS += --disable-satip_client --disable-satip_server
 endif
 
+ifeq ($(BR2_PACKAGE_TVHEADEND_TIMESHIFT),y)
+TVHEADEND_CONF_OPTS += --enable-timeshift
+else
+TVHEADEND_CONF_OPTS += --disable-timeshift
+endif
+
 ifeq ($(BR2_PACKAGE_LIBDVBCSA),y)
 TVHEADEND_DEPENDENCIES += libdvbcsa
 TVHEADEND_CONF_OPTS += --enable-tvhcsa
