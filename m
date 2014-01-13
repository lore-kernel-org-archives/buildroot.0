From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jan 2014 23:19:20 +0100
Subject: [Buildroot] [git commit] coxpcall: bump to version 1.14.0
Message-ID: <20140113222142.2EED29C4A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dfbb747238cb6bd6d9ef5383de83a44f7346c4bd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

and refactor with luarocks infra

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/coxpcall/coxpcall.mk |   11 +++--------
 1 files changed, 3 insertions(+), 8 deletions(-)

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
