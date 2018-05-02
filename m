From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  2 May 2018 08:05:39 +0200
Subject: [Buildroot] [PATCH 3/4] package/transmission: fix inotify configure
 option
In-Reply-To: <20180502060540.11628-1-bernd.kuhls@t-online.de>
References: <20180502060540.11628-1-bernd.kuhls@t-online.de>
Message-ID: <20180502060540.11628-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configure option is really called --with-inotify:
https://github.com/transmission/transmission/blob/2.9x/configure.ac#L211

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/transmission/transmission.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index f15d037266..cb1b8f6cdd 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -16,7 +16,7 @@ TRANSMISSION_DEPENDENCIES = \
 	zlib
 TRANSMISSION_AUTORECONF = YES
 TRANSMISSION_CONF_OPTS = \
-	--disable-libnotify \
+	--without-inotify \
 	--enable-lightweight
 TRANSMISSION_LICENSE = GPL-2.0 or GPL-3.0 with OpenSSL exception
 TRANSMISSION_LICENSE_FILES = COPYING
-- 
2.14.2
