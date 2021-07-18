From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 23:31:31 +0200
Subject: [Buildroot] [git commit] package/mpv: fix reproducible build issues
Message-ID: <20210718205920.9D0E688333@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=083b48194fc7d46278bb6c33355322bf02eaec47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Do not include the build date when creating reproducible builds.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpv/mpv.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 25ac783b52..30f377054f 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -28,6 +28,10 @@ MPV_CONF_OPTS = \
 	--disable-uchardet \
 	--disable-vapoursynth
 
+ifeq ($(BR2_REPRODUCIBLE),y)
+MPV_CONF_OPTS += --disable-build-date
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 MPV_CONF_OPTS += --disable-libmpv-shared --enable-libmpv-static
 else
