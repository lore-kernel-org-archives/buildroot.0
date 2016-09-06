From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Sep 2016 21:30:55 +0200
Subject: [Buildroot] [git commit] libenca: bump to version 1.19
Message-ID: <20160906193115.91AA18222A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83b3dc25be96ceec520945adc6fdf6ab9db109f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to homepage download URL to get the smaller xz-compressed variant.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libenca/libenca.hash | 2 +-
 package/libenca/libenca.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libenca/libenca.hash b/package/libenca/libenca.hash
index e6d6b35..1a03c8f 100644
--- a/package/libenca/libenca.hash
+++ b/package/libenca/libenca.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 14457b185c77b947ca2f8e09a2c3ec66940d97a2ccea28b8e61a6e0f3a0033f6  libenca-1.16.tar.gz
+sha256 3a487eca40b41021e2e4b7a6440b97d822e6532db5464471f572ecf77295e8b8  enca-1.19.tar.xz
diff --git a/package/libenca/libenca.mk b/package/libenca/libenca.mk
index 184cac9..b87427a 100644
--- a/package/libenca/libenca.mk
+++ b/package/libenca/libenca.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBENCA_VERSION = 1.16
-LIBENCA_SITE = $(call github,nijel,enca,$(LIBENCA_VERSION))
+LIBENCA_VERSION = 1.19
+LIBENCA_SITE = http://dl.cihar.com/enca
+LIBENCA_SOURCE = enca-$(LIBENCA_VERSION).tar.xz
 LIBENCA_INSTALL_STAGING = YES
 LIBENCA_LICENSE = GPLv2
 LIBENCA_LICENSE_FILES = COPYING
