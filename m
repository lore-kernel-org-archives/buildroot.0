From: Norbert Lange <nolange79@gmail.com>
Date: Tue,  4 May 2021 14:33:18 +0200
Subject: [Buildroot] [PATCH 1/2] package/kmod: support zstd compression if
 available
Message-ID: <20210504123319.20056-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/kmod/kmod.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 7fed252c22..9d2b2c47d7 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -41,6 +41,13 @@ else
 KMOD_CONF_OPTS += --without-zlib
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+KMOD_DEPENDENCIES += zstd
+KMOD_CONF_OPTS += --with-zstd
+else
+KMOD_CONF_OPTS += --without-zstd
+endif
+
 ifeq ($(BR2_PACKAGE_XZ),y)
 KMOD_DEPENDENCIES += xz
 KMOD_CONF_OPTS += --with-xz
-- 
2.30.2
