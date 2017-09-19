From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 19 Sep 2017 22:20:09 +0200
Subject: [Buildroot] [git commit] package/tvheadend: add optional support
	for rpi-userland
Message-ID: <20170919201318.C61EB81076@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4226d094440d237e71f6c9f8d7ea7e1d9245552c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/tvheadend/tvheadend.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index ee3607a..cf8bee9 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -41,6 +41,12 @@ TVHEADEND_DEPENDENCIES += opus
 else
 TVHEADEND_CONF_OPTS += --disable-libopus
 endif
+ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
+TVHEADEND_CONF_OPTS += --enable-omx
+TVHEADEND_DEPENDENCIES += rpi-userland
+else
+TVHEADEND_CONF_OPTS += --disable-omx
+endif
 ifeq ($(BR2_PACKAGE_X265),y)
 TVHEADEND_CONF_OPTS += --enable-libx265
 TVHEADEND_DEPENDENCIES += x265
@@ -51,6 +57,7 @@ else
 TVHEADEND_CONF_OPTS += \
 	--disable-libav \
 	--disable-libopus \
+	--disable-omx \
 	--disable-vaapi \
 	--disable-libx264 \
 	--disable-libx265
