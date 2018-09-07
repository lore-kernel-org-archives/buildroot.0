From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:06 -0000
Subject: [Buildroot] [git commit] package/vlc: add optional dependency to
 libarchive
Message-ID: <20180907111514.136FF7FB4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f46d614d23006abc97be8fb836584412f495315
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vlc/vlc.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 7ce1f57cd8..d34ab2a9e0 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -41,7 +41,6 @@ VLC_CONF_OPTS += \
 	--disable-a52 \
 	--disable-addonmanagermodules \
 	--disable-aom \
-	--disable-archive \
 	--disable-aribb25 \
 	--disable-aribsub \
 	--disable-asdcp \
@@ -222,6 +221,13 @@ else
 VLC_CONF_OPTS += --disable-opus
 endif
 
+ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
+VLC_CONF_OPTS += --enable-archive
+VLC_DEPENDENCIES += libarchive
+else
+VLC_CONF_OPTS += --disable-archive
+endif
+
 ifeq ($(BR2_PACKAGE_LIBASS),y)
 VLC_CONF_OPTS += --enable-libass
 VLC_DEPENDENCIES += libass
