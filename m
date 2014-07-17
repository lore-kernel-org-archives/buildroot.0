From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 17 Jul 2014 17:18:00 -0300
Subject: [Buildroot] [PATCH] libconfuse: needs host-flex
Message-ID: <1405628280-21661-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/63f/63f6f6204058932b02f79eaaa44eb4555c5bbb1f/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libconfuse/libconfuse.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index e9a1114..6450270 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -8,6 +8,7 @@ LIBCONFUSE_VERSION = V2_7
 LIBCONFUSE_SITE = $(call github,martinh,libconfuse,$(LIBCONFUSE_VERSION))
 LIBCONFUSE_INSTALL_STAGING = YES
 LIBCONFUSE_CONF_OPT = --disable-rpath
+LIBCONFUSE_DEPENDENCIES = host-flex
 LIBCONFUSE_LICENSE = ISC
 LIBCONFUSE_LICENSE_FILES = src/confuse.c
 
-- 
1.8.5.5
