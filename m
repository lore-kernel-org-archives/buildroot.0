From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Aug 2018 23:05:19 +0200
Subject: [Buildroot] [PATCH/next 09/12] package/vlc: add optional dependency
 to libidn
In-Reply-To: <20180811210522.15600-1-bernd.kuhls@t-online.de>
References: <20180811210522.15600-1-bernd.kuhls@t-online.de>
Message-ID: <20180811210522.15600-10-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.18.0
