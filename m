From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 19 Sep 2017 20:45:40 +0200
Subject: [Buildroot] [PATCH 4/4] package/tor: add optional support for zstd
In-Reply-To: <20170919184540.23337-1-bernd.kuhls@t-online.de>
References: <20170919184540.23337-1-bernd.kuhls@t-online.de>
Message-ID: <20170919184540.23337-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to https://blog.torproject.org/tor-0317-now-released
we also need host-pkgconf for zstd support.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tor/tor.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 6052e09cf1..7bce9d1b40 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -37,6 +37,13 @@ else
 TOR_CONF_OPTS += --disable-lzma
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+TOR_CONF_OPTS += --enable-zstd
+TOR_DEPENDENCIES += host-pkgconf zstd
+else
+TOR_CONF_OPTS += --disable-zstd
+endif
+
 ifeq ($(BR2_arm)$(BR2_armeb)$(BR2_i386)$(BR2_x86_64)$(BR2_PACKAGE_LIBSECCOMP),yy)
 TOR_CONF_OPTS += --enable-seccomp
 TOR_DEPENDENCIES += libseccomp
-- 
2.11.0
