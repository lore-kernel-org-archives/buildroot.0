From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Aug 2018 12:01:05 +0200
Subject: [Buildroot] [git commit branch/next] package/vlc: add optional
 dependency to libdvdread
Message-ID: <20180816113141.7A5A88D3DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06a68723f3566af6866bb955d1139d9f42dfe94d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vlc/vlc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 9e1dc6b92e..928b3fabb8 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -206,6 +206,13 @@ else
 VLC_CONF_OPTS += --disable-dvbpsi
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDVDREAD),y)
+VLC_CONF_OPTS += --enable-dvdread
+VLC_DEPENDENCIES += libdvdread
+else
+VLC_CONF_OPTS += --disable-dvdread
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 VLC_CONF_OPTS += --enable-libgcrypt
 VLC_DEPENDENCIES += libgcrypt
