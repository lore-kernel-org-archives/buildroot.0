From: Allan W. Nielsen <a@awn.dk>
Date: Tue, 10 May 2011 08:17:05 +0200
Subject: [Buildroot] [PATCH 2/3] Makefile.package.in: Added LZMA as
	compression type
In-Reply-To: <1305008226-8906-1-git-send-email-a@awn.dk>
References: <1305008226-8906-1-git-send-email-a@awn.dk>
Message-ID: <1305008226-8906-3-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Allan W. Nielsen <a@awn.dk>
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
index 5f61b93..0ac9f12 100644
--- a/Makefile
+++ b/Makefile
@@ -271,6 +271,7 @@ KERNEL_ARCH:=$(shell echo "$(ARCH)" | sed -e "s/-.*//" \
 
 ZCAT:=$(call qstrip,$(BR2_ZCAT))
 BZCAT:=$(call qstrip,$(BR2_BZCAT))
+XZCAT:=$(call qstrip,$(BR2_XZCAT))
 TAR_OPTIONS=$(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 
 GNU_TARGET_SUFFIX:=-$(call qstrip,$(BR2_GNU_TARGET_SUFFIX))
diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index e5dafd1..1e87256 100644
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
