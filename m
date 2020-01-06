From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  6 Jan 2020 06:39:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/tor: add optional dependency to zstd
Message-ID: <20200106053949.85300-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/454/454309539101c55a572c12c699cf3542dfb21637/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tor/tor.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 1b493f6993..2ecb41f072 100644
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
2.20.1
