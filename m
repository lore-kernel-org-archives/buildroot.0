From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Thu, 11 Jan 2018 23:28:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/glibc: remove the default value of
 the $(PKG)_SOURCE variable
Message-ID: <1515709724-11707-1-git-send-email-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
---
 package/glibc/glibc.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index cb3a84a..fd79d84 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,6 @@
 ifeq ($(BR2_arc),y)
 GLIBC_VERSION =  arc-2017.09-release
 GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VERSION))
-GLIBC_SOURCE = glibc-$(GLIBC_VERSION).tar.gz
 else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master
-- 
1.9.1
