From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 17 Sep 2013 14:00:38 +0200
Subject: [Buildroot] [git commit] libroxml: bump version to 2.2.3
Message-ID: <20130917120200.771E78A557@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c1f03f652f02c4f3374d4c671698748dcaba98ab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Tristan Lelong <tristan.lelong@blunderer.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libroxml/libroxml-werror.patch |    4 ++--
 package/libroxml/libroxml.mk           |    6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libroxml/libroxml-werror.patch b/package/libroxml/libroxml-werror.patch
index a99962f..6435b01 100644
--- a/package/libroxml/libroxml-werror.patch
+++ b/package/libroxml/libroxml-werror.patch
@@ -15,8 +15,8 @@ Index: a/Makefile
  
  # options
  override CPPFLAGS += -Iinc/
--override CFLAGS += $(OPTIM) -fPIC -Wall -Wextra -Wno-unused -Werror -Iinc/ $(DEFINES)
-+override CFLAGS += $(OPTIM) -fPIC -Wall -Wextra -Wno-unused -Iinc/ $(DEFINES)
+-override CFLAGS += $(OPTIM) -fPIC -Wall -Wextra -Wno-unused-parameter -Wno-unused-result -Werror -Iinc/ $(DEFINES)
++override CFLAGS += $(OPTIM) -fPIC -Wall -Wextra -Wno-unused-parameter -Wno-unused-result -Iinc/ $(DEFINES)
  override LDFLAGS += 
  
  ifeq ("$(OS)", "Darwin")
diff --git a/package/libroxml/libroxml.mk b/package/libroxml/libroxml.mk
index 76ffa14..d602513 100644
--- a/package/libroxml/libroxml.mk
+++ b/package/libroxml/libroxml.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBROXML_VERSION = 2.2.2
-LIBROXML_SITE = http://libroxml.googlecode.com/files
+LIBROXML_VERSION = 2.2.3
+LIBROXML_SITE = http://download.libroxml.net/pool/v2.x/
 LIBROXML_INSTALL_STAGING = YES
 
 define LIBROXML_BUILD_CMDS
@@ -17,7 +17,7 @@ define LIBROXML_INSTALL_STAGING_CMDS
 endef
 
 define LIBROXML_INSTALL_TARGET_CMDS
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
+	$(MAKE) DESTDIR=$(TARGET_DIR)/usr/ -C $(@D) install
 endef
 
 define LIBROXML_UNINSTALL_STAGING_CMDS
