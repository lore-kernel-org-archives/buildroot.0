From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed, 27 Jan 2010 02:09:02 +0100
Subject: [Buildroot] [PATCH 14/19] libxslt: fix dependency on libxml
In-Reply-To: <1264554547-9009-1-git-send-email-llandwerlin@gmail.com>
References: <1264554547-9009-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1264554547-9009-15-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/libxslt/Config.in  |    1 +
 package/libxslt/libxslt.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/libxslt/Config.in b/package/libxslt/Config.in
index c318966..23acd18 100644
--- a/package/libxslt/Config.in
+++ b/package/libxslt/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBXSLT
 	bool "libxslt"
+        select BR2_PACKAGE_LIBXML2
 	help
 	  Install the xslt library which is used
 	  to transform XML files to other XML files.
diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index 2478800..03c1131 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -23,7 +23,7 @@ LIBXSLT_CONF_OPT = --with-gnu-ld --enable-shared \
 		--without-threads \
 		--with-libxml-prefix=$(STAGING_DIR)/usr/
 
-LIBXSLT_DEPENDENCIES = $(LIBXSLT_DEPENDENCIES_EXTRA)
+LIBXSLT_DEPENDENCIES = libxml2 $(LIBXSLT_DEPENDENCIES_EXTRA)
 
 $(eval $(call AUTOTARGETS,package,libxslt))
 
-- 
1.6.6
