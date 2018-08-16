From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Aug 2018 12:00:47 +0200
Subject: [Buildroot] [git commit branch/next] package/vlc: add optional
 dependency to libidn
Message-ID: <20180816113141.649FD886CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3db1612981f78c65b09affa5e8a4148866c70abc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vlc/vlc.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index b8c47582dc..edd0c36372 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -216,6 +216,10 @@ else
 VLC_CONF_OPTS += --disable-libgcrypt
 endif
 
+ifeq ($(BR2_PACKAGE_LIBIDN),y)
+VLC_DEPENDENCIES += libidn
+endif
+
 ifeq ($(BR2_PACKAGE_LIBMAD),y)
 VLC_CONF_OPTS += --enable-mad
 VLC_DEPENDENCIES += libmad
