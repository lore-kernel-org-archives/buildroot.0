From: Axel Lin <axel.lin@ingics.com>
Date: Mon, 30 Sep 2013 11:28:09 +0800
Subject: [Buildroot] [PATCH] diffutils: set gnu99 C mode
Message-ID: <1380511689.20480.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
Fix below build error:

  CC       dir.o
dir.c: In function 'find_dir_file_pathname':
dir.c:345:8: error: 'for' loop initial declarations are only allowed in C99 mode
dir.c:345:8: note: use option -std=c99 or -std=gnu99 to compile your code
make[3]: *** [dir.o] Error 1
make[3]: *** Waiting for unfinished jobs....

 package/diffutils/diffutils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index 6934532..38b1ccd 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -10,6 +10,7 @@ DIFFUTILS_SITE = $(BR2_GNU_MIRROR)/diffutils
 DIFFUTILS_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 DIFFUTILS_LICENSE = GPLv3+
 DIFFUTILS_LICENSE_FILES = COPYING
+DIFFUTILS_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 DIFFUTILS_DEPENDENCIES += busybox
-- 
1.8.1.2
