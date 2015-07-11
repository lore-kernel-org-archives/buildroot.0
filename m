From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 11 Jul 2015 16:15:08 +0200
Subject: [Buildroot] [PATCH 5/7] tzdata: use <PKG>_STRIP_COMPONENTS
In-Reply-To: <1436624110-20428-1-git-send-email-luca@lucaceresoli.net>
References: <1436624110-20428-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1436624110-20428-5-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/tzdata/tzdata.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index eb6da6ce3375..c38d4fe8cd2b 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -7,6 +7,7 @@
 TZDATA_VERSION = 2015e
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = ftp://ftp.iana.org/tz/releases
+TZDATA_STRIP_COMPONENTS = 0
 TZDATA_DEPENDENCIES = host-tzdata
 HOST_TZDATA_DEPENDENCIES = host-zic
 TZDATA_LICENSE = Public domain
@@ -45,11 +46,6 @@ define TZDATA_INSTALL_TARGET_CMDS
 	fi
 endef
 
-define HOST_TZDATA_EXTRACT_CMDS
-	gzip -d -c $(DL_DIR)/$(TZDATA_SOURCE) \
-		| $(TAR) --strip-components=0 -C $(@D) -xf -
-endef
-
 define HOST_TZDATA_BUILD_CMDS
 	(cd $(@D); \
 		for zone in $(TZDATA_ZONELIST); do \
-- 
1.9.1
