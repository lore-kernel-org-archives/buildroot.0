From: Michael Vetter <jubalh@iodoru.org>
Date: Mon, 15 Feb 2021 11:45:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/jasper: security bump version to
 2.0.25
Message-ID: <20210215104528.22045-1-jubalh@iodoru.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes:

* Fix memory-related bugs in the JPEG-2000 codec resulting from
  attempting to decode invalid code streams. (#264, #265)
  This fix is associated with CVE-2021-26926 and CVE-2021-26927.
* Fix wrong return value under some compilers (#260)
* Fix CVE-2021-3272 heap buffer overflow in jp2_decode (#259)

Signed-off-by: Michael Vetter <jubalh@iodoru.org>
---
 package/jasper/jasper.hash | 2 +-
 package/jasper/jasper.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jasper/jasper.hash b/package/jasper/jasper.hash
index 7386c2179f..d4ed191f91 100644
--- a/package/jasper/jasper.hash
+++ b/package/jasper/jasper.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d2d28e115968d38499163cf8086179503668ce0d71b90dd33855b3de96a1ca1d  jasper-2.0.24.tar.gz
+sha256  f5bc48e2884bcabd2aca1737baff4ca962ec665b6eb673966ced1f7adea07edb  jasper-2.0.25.tar.gz
 sha256  4ad1bb42aff888c4403d792e6e2c5f1716d6c279fea70b296333c9d577d30b81  LICENSE
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index d8110082c9..d487e8e2d6 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JASPER_VERSION = 2.0.24
+JASPER_VERSION = 2.0.25
 JASPER_SITE = $(call github,jasper-software,jasper,version-$(JASPER_VERSION))
 JASPER_INSTALL_STAGING = YES
 JASPER_LICENSE = JasPer-2.0
-- 
2.26.2
