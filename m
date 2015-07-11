From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 11 Jul 2015 16:15:09 +0200
Subject: [Buildroot] [PATCH 6/7] zic: use <PKG>_STRIP_COMPONENTS
In-Reply-To: <1436624110-20428-1-git-send-email-luca@lucaceresoli.net>
References: <1436624110-20428-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1436624110-20428-6-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/zic/zic.mk | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index a768ac6cfd59..03e023ae4ff4 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -7,14 +7,9 @@
 ZIC_VERSION = 2015e
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = ftp://ftp.iana.org/tz/releases
+ZIC_STRIP_COMPONENTS = 0
 ZIC_LICENSE = Public domain
 
-# Don't strip any path components during extraction.
-define HOST_ZIC_EXTRACT_CMDS
-	gzip -d -c $(DL_DIR)/$(ZIC_SOURCE) \
-		| $(TAR) --strip-components=0 -C $(@D) -xf -
-endef
-
 define HOST_ZIC_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) zic
 endef
-- 
1.9.1
