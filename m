From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 14 Jul 2017 14:15:25 -0400
Subject: [Buildroot] [PATCH 03/15] libevent: support libressl
In-Reply-To: <20170714181537.17479-1-aduskett@gmail.com>
References: <20170714181537.17479-1-aduskett@gmail.com>
Message-ID: <20170714181537.17479-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/libevent/libevent.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index 36bca0b21..910f24d4b 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -26,6 +26,9 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBEVENT_DEPENDENCIES += host-pkgconf openssl
 LIBEVENT_CONF_OPTS += --enable-openssl
+else ifeq ($(BR2_PACKAGE_LIBRESSL),y)
+LIBEVENT_DEPENDENCIES += host-pkgconf libressl
+LIBEVENT_CONF_OPTS += --enable-openssl
 else
 LIBEVENT_CONF_OPTS += --disable-openssl
 endif
-- 
2.13.0
