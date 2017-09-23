From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Sep 2017 10:46:28 +0200
Subject: [Buildroot] [PATCH v2 2/4] package/tor: add optional support for
	lzma
In-Reply-To: <20170923084630.3841-1-bernd.kuhls@t-online.de>
References: <20170923084630.3841-1-bernd.kuhls@t-online.de>
Message-ID: <20170923084630.3841-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to https://blog.torproject.org/tor-0317-now-released
we also need host-pkgconf for lzma support.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: no changes

 package/tor/tor.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index a68f29cac6..6052e09cf1 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -30,6 +30,13 @@ ifeq ($(BR2_PACKAGE_LIBCAP),y)
 TOR_DEPENDENCIES += libcap
 endif
 
+ifeq ($(BR2_PACKAGE_XZ),y)
+TOR_CONF_OPTS += --enable-lzma
+TOR_DEPENDENCIES += host-pkgconf xz
+else
+TOR_CONF_OPTS += --disable-lzma
+endif
+
 ifeq ($(BR2_arm)$(BR2_armeb)$(BR2_i386)$(BR2_x86_64)$(BR2_PACKAGE_LIBSECCOMP),yy)
 TOR_CONF_OPTS += --enable-seccomp
 TOR_DEPENDENCIES += libseccomp
-- 
2.11.0
