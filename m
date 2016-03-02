From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Mar 2016 18:44:42 -0300
Subject: [Buildroot] [PATCH] lz4: fix legal info
Message-ID: <1456955082-19910-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It moved, and programs are GPLv2+. Fixes:
http://autobuild.buildroot.net/results/70a/70a526b265bb16a6be9f25c5044c65070706171c/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lz4/lz4.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index d2b09bb..a5a41d3 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -7,8 +7,8 @@
 LZ4_VERSION = r131
 LZ4_SITE = $(call github,Cyan4973,lz4,$(LZ4_VERSION))
 LZ4_INSTALL_STAGING = YES
-LZ4_LICENSE = BSD-2c
-LZ4_LICENSE_FILES = LICENSE
+LZ4_LICENSE = BSD-2c (library), GPLv2+ (programs)
+LZ4_LICENSE_FILES = lib/LICENSE programs/COPYING
 
 ifeq ($(BR2_STATIC_LIBS),y)
 define LZ4_DISABLE_SHARED
-- 
2.4.10
