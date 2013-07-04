From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  4 Jul 2013 10:22:25 -0300
Subject: [Buildroot] [PATCH] uclibc: snapshots are bz2
Message-ID: <1372944145-4354-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Snapshot tarballs are only in bz2 format, fixes:
http://autobuild.buildroot.net/results/b02/b021b296309d01405ad45344055863a5761abd70/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/uclibc/uclibc.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index f8495ba..5cbc011 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -5,15 +5,15 @@
 ################################################################################
 
 UCLIBC_VERSION = $(call qstrip,$(BR2_UCLIBC_VERSION_STRING))
-UCLIBC_SOURCE = uClibc-$(UCLIBC_VERSION).tar.xz
+UCLIBC_SOURCE = uClibc-$(UCLIBC_VERSION).tar.bz2
 
 ifeq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
 UCLIBC_SITE = http://www.uclibc.org/downloads/snapshots
 else ifeq ($(findstring arc,$(UCLIBC_VERSION)),arc)
 UCLIBC_SITE = $(BR2_ARC_SITE)
-UCLIBC_SOURCE = uClibc-$(UCLIBC_VERSION).tar.bz2
 else
 UCLIBC_SITE = http://www.uclibc.org/downloads
+UCLIBC_SOURCE = uClibc-$(UCLIBC_VERSION).tar.xz
 endif
 
 UCLIBC_INSTALL_STAGING = YES
-- 
1.8.1.5
