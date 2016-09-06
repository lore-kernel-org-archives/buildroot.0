From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  5 Sep 2016 23:56:02 -0300
Subject: [Buildroot] [PATCH] libenca: bump to version 1.19
Message-ID: <1473130562-2229-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to homepage download URL to get the smaller xz-compressed variant.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
2.7.3
