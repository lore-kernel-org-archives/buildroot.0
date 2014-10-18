From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 18 Oct 2014 09:30:53 -0300
Subject: [Buildroot] [PATCH] libxml2: explicitly state zlib dir
Message-ID: <1413635453-13573-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pass the zlib directory prefix to --with-zlib otherwise it expands into
absolute (distribution) directories leading to bad test results in
configure. Fixes:
http://autobuild.buildroot.net/results/303/303d6d165c5423944122bf430575c018479733f8/build-end.log

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libxml2/libxml2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 4e296fa..354c178 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -25,7 +25,7 @@ HOST_LIBXML2_CONF_OPTS = --without-zlib --without-lzma --without-python
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 LIBXML2_DEPENDENCIES += zlib
-LIBXML2_CONF_OPTS += --with-zlib
+LIBXML2_CONF_OPTS += --with-zlib=$(STAGING_DIR)/usr
 else
 LIBXML2_CONF_OPTS += --without-zlib
 endif
-- 
2.0.4
