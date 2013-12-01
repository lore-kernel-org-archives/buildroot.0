From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sun,  1 Dec 2013 23:08:05 +0100
Subject: [Buildroot] [PATCH 1/1] inadyn: remove the source variable and fix
	download URL
Message-ID: <1385935685-6966-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Github seems to provide only ziped and gziped files.

$ file inadyn-1.98.1.tar.bz2
inadyn-1.98.1.tar.bz2: gzip compressed data, from Unix

Since inadyn-1.98.1.tar.gz is the default value of the source variable,
so this patch removes it.

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/inadyn/inadyn.mk |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index 12f8acc..b2e537b 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 INADYN_VERSION = 1.98.1
-INADYN_SOURCE = inadyn-$(INADYN_VERSION).tar.bz2
-INADYN_SITE = https://github.com/downloads/troglobit/inadyn
+INADYN_SITE = https://github.com/troglobit/inadyn/archive/$(INADYN_VERSION)
 INADYN_LICENSE = GPLv2+
 INADYN_LICENSE_FILES = COPYING LICENSE
 
-- 
1.7.9.5
