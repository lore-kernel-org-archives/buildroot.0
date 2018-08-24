From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Aug 2018 10:35:25 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] bzip2: change upstream
 site
Message-ID: <20180824082742.681E48E5BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91cbb754c4a7794978e593c6a868cb4952d30a09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

The bzip.org website is down. Use the Buildroot backup download site.
Remove the website link as there is no clear alternative upstream at
this point.

  https://lwn.net/Articles/762264/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f45976b2c759b1630a2886e75312340b3b511f81)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bzip2/Config.in | 2 --
 package/bzip2/bzip2.mk  | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/bzip2/Config.in b/package/bzip2/Config.in
index dbc82496df..ca447bbb2d 100644
--- a/package/bzip2/Config.in
+++ b/package/bzip2/Config.in
@@ -5,5 +5,3 @@ config BR2_PACKAGE_BZIP2
 	  It typically compresses files to within 10% to 15% of the best
 	  available techniques, while being around twice as fast at
 	  compression and six times faster at decompression.
-
-	  http://www.bzip.org
diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index e43533072b..a3af322993 100644
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
