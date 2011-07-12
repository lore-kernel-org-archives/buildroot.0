From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 12 Jul 2011 23:14:44 +0200
Subject: [Buildroot] [git commit] Makefile.package.in: Add BR2_XZCAT for
	LZMA compression type
Message-ID: <20110712211553.C0CBA8A43F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=177b4b4ac036a34fd2a037f22f121722ce163dd2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Allan W. Nielsen <a@awn.dk>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in                   |    7 +++++++
 Makefile                    |    1 +
 package/Makefile.package.in |    1 +
 3 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/Config.in b/Config.in
index a67c08d..2fce9d7 100644
--- a/Config.in
+++ b/Config.in
@@ -52,6 +52,13 @@ config BR2_BZCAT
 	  Default is "bzcat"
 	  Other possible values include "bunzip2 -c" or "bzip2 -d -c".
 
+config BR2_XZCAT
+	string "xzcat command"
+	default "xzcat"
+	help
+	  Command to be used to extract a xz'ed file to stdout.
+	  Default is "xzcat"
+
 config BR2_TAR_OPTIONS
 	string "Tar options"
 	default ""
diff --git a/Makefile b/Makefile
index 20dd707..2f3802c 100644
--- a/Makefile
+++ b/Makefile
@@ -261,6 +261,7 @@ KERNEL_ARCH:=$(shell echo "$(ARCH)" | sed -e "s/-.*//" \
 
 ZCAT:=$(call qstrip,$(BR2_ZCAT))
 BZCAT:=$(call qstrip,$(BR2_BZCAT))
+XZCAT:=$(call qstrip,$(BR2_XZCAT))
 TAR_OPTIONS=$(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 
 GNU_TARGET_SUFFIX:=-$(call qstrip,$(BR2_GNU_TARGET_SUFFIX))
diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index faa7ff1..74087cd 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -61,6 +61,7 @@ INFLATE.gz   = $(ZCAT)
 INFLATE.tbz  = $(BZCAT)
 INFLATE.tbz2 = $(BZCAT)
 INFLATE.tgz  = $(ZCAT)
+INFLATE.xz   = $(XZCAT)
 INFLATE.tar  = cat
 
 # MESSAGE Macro -- display a message in bold type
-- 
1.7.3.4
