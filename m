From: sonic.adi at gmail.com <sonic.adi@gmail.com>
Date: Mon, 11 Nov 2013 18:36:13 +0800
Subject: [Buildroot] [PATCH] e2fsprogs: Disable elf shared library when
	BR2_PREFER_STATIC_LIB is selected.
Message-ID: <1384166173-23883-1-git-send-email-Sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 package/e2fsprogs/e2fsprogs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 0670c74..cdca906 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -11,7 +11,7 @@ E2FSPROGS_LICENSE_FILES = COPYING lib/uuid/COPYING lib/ss/mit-sipb-copyright.h l
 
 E2FSPROGS_CONF_OPT = \
 	--disable-tls \
-	--enable-elf-shlibs \
+	$(if $(BR2_PREFER_STATIC_LIB),,--enable-elf-shlibs) \
 	$(if $(BR2_PACKAGE_E2FSPROGS_DEBUGFS),,--disable-debugfs) \
 	$(if $(BR2_PACKAGE_E2FSPROGS_E2IMAGE),,--disable-imager) \
 	$(if $(BR2_PACKAGE_E2FSPROGS_E4DEFRAG),,--disable-defrag) \
-- 
1.8.2.3
