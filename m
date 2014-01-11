From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 11 Jan 2014 16:42:13 +0100
Subject: [Buildroot] [pkg-luarocks infra v7 11/15] coxpcall: bump to version
	1.14.0
In-Reply-To: <1389454937-13494-1-git-send-email-francois.perrad@gadz.org>
References: <1389454937-13494-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1389454937-13494-12-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

and refactor with luarocks infra

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/coxpcall/coxpcall.mk |   11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/coxpcall/coxpcall.mk b/package/coxpcall/coxpcall.mk
index de95461..11f823f 100644
--- a/package/coxpcall/coxpcall.mk
+++ b/package/coxpcall/coxpcall.mk
@@ -4,13 +4,8 @@
 #
 ################################################################################
 
-COXPCALL_VERSION = 1.13.0
-COXPCALL_SITE = http://luaforge.net/frs/download.php/3406
+COXPCALL_VERSION = 1.14.0-1
+COXPCALL_SUBDIR  = coxpcall-1_14_0
 COXPCALL_LICENSE = MIT
 
-define COXPCALL_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/src/coxpcall.lua \
-		$(TARGET_DIR)/usr/share/lua/5.1/coxpcall.lua
-endef
-
-$(eval $(generic-package))
+$(eval $(luarocks-package))
-- 
1.7.9.5
