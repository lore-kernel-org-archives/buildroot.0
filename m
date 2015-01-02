From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Jan 2015 14:37:13 +0100
Subject: [Buildroot] [git commit] lsof: bump to version 4.88
Message-ID: <20150102133731.791CC7FE10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=db748e8639f79f3ca456680ec2860a792df52a88
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rename patches to new convention and add hash file as well.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...sof-0001-makefile.patch => 0001-makefile.patch} |    0
 ...f-0002-noportmap.patch => 0002-noportmap.patch} |    0
 ...ide-cflags.patch => 0003-override-cflags.patch} |    0
 ...cs.patch => 0004-remove-susvlegacy-funcs.patch} |    0
 package/lsof/lsof.hash                             |    2 ++
 package/lsof/lsof.mk                               |    5 +++--
 6 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/lsof/lsof-0001-makefile.patch b/package/lsof/0001-makefile.patch
similarity index 100%
rename from package/lsof/lsof-0001-makefile.patch
rename to package/lsof/0001-makefile.patch
diff --git a/package/lsof/lsof-0002-noportmap.patch b/package/lsof/0002-noportmap.patch
similarity index 100%
rename from package/lsof/lsof-0002-noportmap.patch
rename to package/lsof/0002-noportmap.patch
diff --git a/package/lsof/lsof-0003-override-cflags.patch b/package/lsof/0003-override-cflags.patch
similarity index 100%
rename from package/lsof/lsof-0003-override-cflags.patch
rename to package/lsof/0003-override-cflags.patch
diff --git a/package/lsof/lsof-0004-remove-susvlegacy-funcs.patch b/package/lsof/0004-remove-susvlegacy-funcs.patch
similarity index 100%
rename from package/lsof/lsof-0004-remove-susvlegacy-funcs.patch
rename to package/lsof/0004-remove-susvlegacy-funcs.patch
diff --git a/package/lsof/lsof.hash b/package/lsof/lsof.hash
new file mode 100644
index 0000000..d1e289a
--- /dev/null
+++ b/package/lsof/lsof.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	fe6f9b0e26b779ccd0ea5a0b6327c2b5c38d207a6db16f61ac01bd6c44e5c99b	lsof_4.88.tar.bz2
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 75ce3d4..0a1667a 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-LSOF_VERSION = 4.87
+LSOF_VERSION = 4.88
 LSOF_SOURCE = lsof_$(LSOF_VERSION).tar.bz2
-LSOF_SITE = ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof
+# Use http mirror since master ftp site access is very draconian
+LSOF_SITE = http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof
 LSOF_LICENSE = lsof license
 # License is repeated in each file, this is a relatively small one.
 # It is also defined in 00README, but that contains a lot of other cruft.
