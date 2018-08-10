From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 10 Aug 2018 07:24:16 +0300
Subject: [Buildroot] [PATCH] bzip2: change upstream site
Message-ID: <7f5f3c1bfdc21cad97c41dfba00c53f935ef6a73.1533875056.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The bzip.org website is down. Use the Buildroot backup download site.
Change the website link to a gitlab repo that mirrors the content of the
tarball.

  https://lwn.net/Articles/762264/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/bzip2/Config.in | 2 +-
 package/bzip2/bzip2.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bzip2/Config.in b/package/bzip2/Config.in
index dbc82496df7e..89e4d5de9a03 100644
--- a/package/bzip2/Config.in
+++ b/package/bzip2/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_BZIP2
 	  available techniques, while being around twice as fast at
 	  compression and six times faster at decompression.
 
-	  http://www.bzip.org
+	  https://gitlab.com/bzip/bzip2
diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index e43533072b2d..a3af32299370 100644
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 BZIP2_VERSION = 1.0.6
-BZIP2_SITE = http://www.bzip.org/$(BZIP2_VERSION)
+BZIP2_SITE = http://sources.buildroot.net
 BZIP2_INSTALL_STAGING = YES
 BZIP2_LICENSE = bzip2 license
 BZIP2_LICENSE_FILES = LICENSE
-- 
2.18.0
