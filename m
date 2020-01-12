From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 12 Jan 2020 20:04:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/tor: add systemd optional dependency
Message-ID: <20200112190421.3716826-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/fa5f8506866451f40eb5f548c1099ae931b26fcc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tor/tor.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 2ecb41f072..0b41897b85 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -30,6 +30,13 @@ ifeq ($(BR2_PACKAGE_LIBCAP),y)
 TOR_DEPENDENCIES += libcap
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+TOR_CONF_OPTS += --enable-systemd
+TOR_DEPENDENCIES += host-pkgconf systemd
+else
+TOR_CONF_OPTS += --disable-systemd
+endif
+
 ifeq ($(BR2_PACKAGE_XZ),y)
 TOR_CONF_OPTS += --enable-lzma
 TOR_DEPENDENCIES += host-pkgconf xz
-- 
2.24.1
