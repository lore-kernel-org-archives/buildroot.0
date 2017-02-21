From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 21 Feb 2017 22:04:36 +0100
Subject: [Buildroot] [PATCH v1] bctoolbox: remove redundant mbedtls
	dependency
Message-ID: <20170221210436.11040-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  Makefile:532: *** mbedtls is in the dependency chain of bctoolbox that
  has added it to its _DEPENDENCIES variable without selecting it or
  depending on it from Config.in.  Stop.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/bctoolbox/bctoolbox.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/bctoolbox/bctoolbox.mk b/package/bctoolbox/bctoolbox.mk
index 76737aa3c..78269751e 100644
--- a/package/bctoolbox/bctoolbox.mk
+++ b/package/bctoolbox/bctoolbox.mk
@@ -8,7 +8,6 @@ BCTOOLBOX_VERSION = 0.4.0
 BCTOOLBOX_SITE = $(call github,BelledonneCommunications,bctoolbox,$(BCTOOLBOX_VERSION))
 BCTOOLBOX_LICENSE = GPLv2+
 BCTOOLBOX_LICENSE_FILES = COPYING
-BCTOOLBOX_DEPENDENCIES = mbedtls
 BCTOOLBOX_INSTALL_STAGING = YES
 
 # Set CMAKE_SKIP_RPATH to prevent bctoolbox from adding the rpath to
-- 
2.11.0
