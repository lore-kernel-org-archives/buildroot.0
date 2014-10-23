From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 23 Oct 2014 10:31:18 -0300
Subject: [Buildroot] [PATCH] inadyn: bump to version 1.99.12
Message-ID: <1414071078-10158-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to alternate github download link (s3-hosted) that provides a
hash to verify the tarball.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/inadyn/inadyn.hash | 4 ++--
 package/inadyn/inadyn.mk   | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/inadyn/inadyn.hash b/package/inadyn/inadyn.hash
index e69feb2..940bd16 100644
--- a/package/inadyn/inadyn.hash
+++ b/package/inadyn/inadyn.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256	7e2bfc5df32848abd814548c87bf1d2731ffcf34ad180d8204d94239cb7ad590	inadyn-1.99.11.tar.gz
+# From https://github.com/troglobit/inadyn/releases/download/1.99.12/inadyn-1.99.12.tar.xz.md5
+md5	a620c9eab9cd31c8923e7264b08376f3	inadyn-1.99.12.tar.xz
diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index 74bb679..73d95db 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-INADYN_VERSION = 1.99.11
-INADYN_SITE = $(call github,troglobit,inadyn,$(INADYN_VERSION))
+INADYN_VERSION = 1.99.12
+INADYN_SITE = https://github.com/troglobit/inadyn/releases/download/$(INADYN_VERSION)
+INADYN_SOURCE = inadyn-$(INADYN_VERSION).tar.xz
 INADYN_LICENSE = GPLv2+
-INADYN_LICENSE_FILES = COPYING LICENSE
+INADYN_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 INADYN_CONF_OPTS += --enable-openssl
-- 
2.0.4
