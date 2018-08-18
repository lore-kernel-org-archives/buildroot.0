From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Aug 2018 01:30:52 +0200
Subject: [Buildroot] [PATCH/next 4/4] package/botan: add optional dependency
 to xz
In-Reply-To: <20180818233052.30190-1-bernd.kuhls@t-online.de>
References: <20180818233052.30190-1-bernd.kuhls@t-online.de>
Message-ID: <20180818233052.30190-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/botan/botan.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 984ecdc039..eb817f62d9 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -60,6 +60,11 @@ BOTAN_DEPENDENCIES += sqlite
 BOTAN_CONF_OPTS += --with-sqlite
 endif
 
+ifeq ($(BR2_PACKAGE_XZ),y)
+BOTAN_DEPENDENCIES += xz
+BOTAN_CONF_OPTS += --with-lzma
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 BOTAN_DEPENDENCIES += zlib
 BOTAN_CONF_OPTS += --with-zlib
-- 
2.18.0
