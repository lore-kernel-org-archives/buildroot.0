From: Martin Bark <martin@barkynet.com>
Date: Sat,  3 Dec 2016 14:36:26 +0000
Subject: [Buildroot] [PATCH 2/3] package/zic: bump version to 2016j
In-Reply-To: <1480775787-28111-1-git-send-email-martin@barkynet.com>
References: <1480775787-28111-1-git-send-email-martin@barkynet.com>
Message-ID: <1480775787-28111-2-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 ...1-remove-dependency-check-on-version-file.patch | 32 ++++++++++++++++++++++
 package/zic/zic.hash                               |  4 +--
 package/zic/zic.mk                                 |  2 +-
 3 files changed, 35 insertions(+), 3 deletions(-)
 create mode 100644 package/zic/0001-remove-dependency-check-on-version-file.patch

diff --git a/package/zic/0001-remove-dependency-check-on-version-file.patch b/package/zic/0001-remove-dependency-check-on-version-file.patch
new file mode 100644
index 0000000..02989b3
--- /dev/null
+++ b/package/zic/0001-remove-dependency-check-on-version-file.patch
@@ -0,0 +1,32 @@
+From 4ad8932f93c490d15586b1def3863e9580e6eceb Mon Sep 17 00:00:00 2001
+From: Martin Bark <martin@barkynet.com>
+Date: Sat, 3 Dec 2016 13:51:50 +0000
+Subject: [PATCH] remove dependency check on version file
+
+$(VERISON_DEPS) includes dependencies from tzdata meaning applications
+such as zic can't build from tzcode on their own.  Remove the dependency
+to $(VERISON_DEPS) since it is not necessary to check for version updates
+in released code.  This solves building zic from tzcode without needing
+tzdata.
+
+Signed-off-by: Martin Bark <martin@barkynet.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 1b714a8..00d2c09 100644
+--- a/Makefile
++++ b/Makefile
+@@ -437,7 +437,7 @@ INSTALL:	ALL install date.1
+ 		cp date $(DESTDIR)$(BINDIR)/.
+ 		cp -f date.1 $(DESTDIR)$(MANDIR)/man1/.
+ 
+-version:	$(VERSION_DEPS)
++version:
+ 		{ (type git) >/dev/null 2>&1 && \
+ 		  V=`git describe --match '[0-9][0-9][0-9][0-9][a-z]*' \
+ 				--abbrev=7 --dirty` || \
+-- 
+2.7.4
+
diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index 360575a..6fe27bd 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,2 +1,2 @@
-# From http://mm.icann.org/pipermail/tz-announce/2016-July/000040.html
-sha512 97d084f4b0a688fef097dca256083ca9948393848d77c8ee637bdd26f859150cce7d2b26fc1165a3b44b28cc1c9075e10192332261ed68990b4b21a85438b023	tzcode2016f.tar.gz
+# From http://mm.icann.org/pipermail/tz-announce/2016-November/000044.html
+sha512 cac19dded22ff80cd784641ac239358c28cce535ac1eb60b52b7e51c6e9e5fe5f795ea0252daf32c949dddb9c5b24d7e4456d7869aa2725d49c5af58b564822a	tzcode2016j.tar.gz
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 8a0c8dc..ed7b04e 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2016f
+ZIC_VERSION = 2016j
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = http://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
-- 
2.7.4
