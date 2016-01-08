From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  7 Jan 2016 22:34:21 -0300
Subject: [Buildroot] [PATCH] squid: bump to version 3.5.13
Message-ID: <1452216861-8647-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to bz2 tarball since there doesn't seem to be an xz release this
time around.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/squid/squid.hash | 6 +++---
 package/squid/squid.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index c806dc9..97fb45d 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.12.tar.xz.asc
-md5	50016bf6e2d3a3a186a6c7236d251f63	squid-3.5.12.tar.xz
-sha1	59b0dcb2c9c04f1a0586f7a1f346197ddb6d5be5	squid-3.5.12.tar.xz
+# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.13.tar.bz2.asc
+md5	3fccd1c072433bb896374a832f608b7d	squid-3.5.13.tar.bz2
+sha1	9bf3b803752c019cb2ddf15afa20f21fa9d385e3	squid-3.5.13.tar.bz2
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index b1dee3c..47060d1 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.5
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).12
-SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).13
+SQUID_SOURCE = squid-$(SQUID_VERSION).tar.bz2
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
 SQUID_LICENSE_FILES = COPYING
-- 
2.4.10
