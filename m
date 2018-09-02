From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun,  2 Sep 2018 10:33:21 +0200
Subject: [Buildroot] [PATCH] imagemagick: security bump to version 7.0.7-39
Message-ID: <20180902083321.29329-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From the release notes:

2018-06-06  7.0.7-39  <quetzlzacatenango@image...>
  * Fixed numerous use of uninitialized values, integer overflow, memory
    exceeded, and timeouts (credit to OSS Fuzz).

The most critical of these are:
https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=8772
https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=8782

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index cf529b597c..9d5a39567e 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 ac957ef303fb870cb92331947ebcdcef5b553e80c7897c0aec866889f35e1a23  7.0.7-38.tar.gz
+sha256 e7c1b19923bb97ed456c78b63b3259b809ebc8e3967c6d086450370c67eedf06  7.0.7-39.tar.gz
 sha256 2318cc05bbd2c25c1b2d13af1aadccc45b9cf6f94757421ae59a3c8ea9064f1c  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 4aa9d56db2..b75d65375b 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.7-38
+IMAGEMAGICK_VERSION = 7.0.7-39
 IMAGEMAGICK_SOURCE = $(IMAGEMAGICK_VERSION).tar.gz
 IMAGEMAGICK_SITE = https://github.com/ImageMagick/ImageMagick/archive
 IMAGEMAGICK_LICENSE = Apache-2.0
-- 
2.11.0
