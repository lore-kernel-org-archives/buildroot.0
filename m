From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 29 Jun 2014 12:05:03 -0300
Subject: [Buildroot] [PATCH] lsof: bump to version 4.87
Message-ID: <1404054303-11800-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And install to /usr/bin/lsof rather than /bin/lsof otherwise we still
keep busybox lsof.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lsof/{lsof-4.85-makefile.patch => lsof-0001-makefile.patch}   | 0
 package/lsof/{lsof-4.85-noportmap.patch => lsof-0001-noportmap.patch} | 0
 ...sof-4.85-override-cflags.patch => lsof-0003-override-cflags.patch} | 0
 ...susvlegacy-funcs.patch => lsof-0004-remove-susvlegacy-funcs.patch} | 0
 package/lsof/lsof.mk                                                  | 4 ++--
 5 files changed, 2 insertions(+), 2 deletions(-)
 rename package/lsof/{lsof-4.85-makefile.patch => lsof-0001-makefile.patch} (100%)
 rename package/lsof/{lsof-4.85-noportmap.patch => lsof-0001-noportmap.patch} (100%)
 rename package/lsof/{lsof-4.85-override-cflags.patch => lsof-0003-override-cflags.patch} (100%)
 rename package/lsof/{lsof-4.85-remove-susvlegacy-funcs.patch => lsof-0004-remove-susvlegacy-funcs.patch} (100%)

diff --git a/package/lsof/lsof-4.85-makefile.patch b/package/lsof/lsof-0001-makefile.patch
similarity index 100%
rename from package/lsof/lsof-4.85-makefile.patch
rename to package/lsof/lsof-0001-makefile.patch
diff --git a/package/lsof/lsof-4.85-noportmap.patch b/package/lsof/lsof-0001-noportmap.patch
similarity index 100%
rename from package/lsof/lsof-4.85-noportmap.patch
rename to package/lsof/lsof-0001-noportmap.patch
diff --git a/package/lsof/lsof-4.85-override-cflags.patch b/package/lsof/lsof-0003-override-cflags.patch
similarity index 100%
rename from package/lsof/lsof-4.85-override-cflags.patch
rename to package/lsof/lsof-0003-override-cflags.patch
diff --git a/package/lsof/lsof-4.85-remove-susvlegacy-funcs.patch b/package/lsof/lsof-0004-remove-susvlegacy-funcs.patch
similarity index 100%
rename from package/lsof/lsof-4.85-remove-susvlegacy-funcs.patch
rename to package/lsof/lsof-0004-remove-susvlegacy-funcs.patch
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index dcdb7cf..285bd47 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LSOF_VERSION = 4.85
+LSOF_VERSION = 4.87
 LSOF_SOURCE = lsof_$(LSOF_VERSION).tar.bz2
 LSOF_SITE = ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
 LSOF_LICENSE = lsof license
@@ -58,7 +58,7 @@ define LSOF_BUILD_CMDS
 endef
 
 define LSOF_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 755 $(@D)/lsof $(TARGET_DIR)/bin/lsof
+	$(INSTALL) -D -m 755 $(@D)/lsof $(TARGET_DIR)/usr/bin/lsof
 endef
 
 $(eval $(generic-package))
-- 
1.8.5.5
