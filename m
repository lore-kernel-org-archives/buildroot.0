From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 15 Nov 2020 22:55:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/xorriso: fix host option
Message-ID: <20201115215530.553826-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--disable-bzip2 is not a recognized option so replace it by
--disable-libbz2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xorriso/xorriso.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xorriso/xorriso.mk b/package/xorriso/xorriso.mk
index 8bb3c5e9fa..7b38f268bb 100644
--- a/package/xorriso/xorriso.mk
+++ b/package/xorriso/xorriso.mk
@@ -14,7 +14,7 @@ XORRISO_LICENSE_FILES = COPYING COPYRIGHT
 HOST_XORRISO_CONF_OPTS = \
 	--disable-xattr-h-pref-attr \
 	--disable-zlib \
-	--disable-bzip2 \
+	--disable-libbz2 \
 	--disable-libcdio \
 	--disable-libreadline \
 	--disable-libedit \
-- 
2.29.2
