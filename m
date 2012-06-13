From: blunderer at blunderer.org <blunderer@blunderer.org>
Date: Wed, 13 Jun 2012 11:06:05 +0200
Subject: [Buildroot] [PATCHv2] libroxml: bump version to 2.2.0
Message-ID: <1339578366-7053-1-git-send-email-blunderer@blunderer.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Tristan Lelong <tristan.lelong@blunderer.org>

Signed-off-by: Tristan Lelong <tristan.lelong@blunderer.org>
---
 package/libroxml/libroxml-2.1.2-werror.patch |   22 ----------------------
 package/libroxml/libroxml-2.2.0-werror.patch |   22 ++++++++++++++++++++++
 package/libroxml/libroxml.mk                 |    2 +-
 3 files changed, 23 insertions(+), 23 deletions(-)
 delete mode 100644 package/libroxml/libroxml-2.1.2-werror.patch
 create mode 100644 package/libroxml/libroxml-2.2.0-werror.patch

diff --git a/package/libroxml/libroxml-2.1.2-werror.patch b/package/libroxml/libroxml-2.1.2-werror.patch
deleted file mode 100644
index a72f2a7..0000000
--- a/package/libroxml/libroxml-2.1.2-werror.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-[PATCH] remove -Werror from CFLAGS
-
--Werror should only be used during development, not in released SW.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- Makefile |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: libroxml-2.1.0/Makefile
-===================================================================
---- libroxml-2.1.0.orig/Makefile
-+++ libroxml-2.1.0/Makefile
-@@ -41,7 +41,7 @@
- 
- # options
- override CPPFLAGS += -Iinc/
--override CFLAGS += $(OPTIM) -fPIC -Wall -Wextra -Wno-unused -Werror -Iinc/ $(DEFINES)
-+override CFLAGS += $(OPTIM) -fPIC -Wall -Wextra -Wno-unused -Iinc/ $(DEFINES)
- override LDFLAGS += 
- 
- ifeq ("$(OS)", "Darwin")
diff --git a/package/libroxml/libroxml-2.2.0-werror.patch b/package/libroxml/libroxml-2.2.0-werror.patch
new file mode 100644
index 0000000..a72f2a7
--- /dev/null
+++ b/package/libroxml/libroxml-2.2.0-werror.patch
@@ -0,0 +1,22 @@
+[PATCH] remove -Werror from CFLAGS
+
+-Werror should only be used during development, not in released SW.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: libroxml-2.1.0/Makefile
+===================================================================
+--- libroxml-2.1.0.orig/Makefile
++++ libroxml-2.1.0/Makefile
+@@ -41,7 +41,7 @@
+ 
+ # options
+ override CPPFLAGS += -Iinc/
+-override CFLAGS += $(OPTIM) -fPIC -Wall -Wextra -Wno-unused -Werror -Iinc/ $(DEFINES)
++override CFLAGS += $(OPTIM) -fPIC -Wall -Wextra -Wno-unused -Iinc/ $(DEFINES)
+ override LDFLAGS += 
+ 
+ ifeq ("$(OS)", "Darwin")
diff --git a/package/libroxml/libroxml.mk b/package/libroxml/libroxml.mk
index 5c0bf01..228a0df 100644
--- a/package/libroxml/libroxml.mk
+++ b/package/libroxml/libroxml.mk
@@ -2,7 +2,7 @@
 # libroxml
 #
 
-LIBROXML_VERSION = 2.1.2
+LIBROXML_VERSION = 2.2.0
 LIBROXML_SITE = http://libroxml.googlecode.com/files
 LIBROXML_INSTALL_STAGING = YES
 
-- 
1.7.10
