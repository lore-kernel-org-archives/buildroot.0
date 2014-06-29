From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 17:36:29 +0200
Subject: [Buildroot] [git commit] lsof: bump to version 4.87
Message-ID: <20140629153716.009839D109@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b51d78c4d77f565b56f80664fb21fa9c8ee2a676
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And install to /usr/bin/lsof rather than /bin/lsof otherwise we still
keep busybox lsof.

[Thomas: fix patch numbering, two patches had the 0001 sequence
number.]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ....85-makefile.patch => lsof-0001-makefile.patch} |    0
 ...5-noportmap.patch => lsof-0002-noportmap.patch} |    0
 ...flags.patch => lsof-0003-override-cflags.patch} |    0
 ...tch => lsof-0004-remove-susvlegacy-funcs.patch} |    0
 package/lsof/lsof.mk                               |    4 ++--
 5 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lsof/lsof-4.85-makefile.patch b/package/lsof/lsof-0001-makefile.patch
similarity index 100%
rename from package/lsof/lsof-4.85-makefile.patch
rename to package/lsof/lsof-0001-makefile.patch
diff --git a/package/lsof/lsof-4.85-noportmap.patch b/package/lsof/lsof-0002-noportmap.patch
similarity index 100%
rename from package/lsof/lsof-4.85-noportmap.patch
rename to package/lsof/lsof-0002-noportmap.patch
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
