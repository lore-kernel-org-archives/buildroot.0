From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  2 May 2018 20:33:35 +0200
Subject: [Buildroot] [PATCH v2,1/2] libgdiplus: fix license
Message-ID: <20180502183336.13568-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libgdiplus is licensed under LGPL-2.1 or MPL-1.1 and not MIT, see:
http://patchwork.ozlabs.org/patch/906830

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni and Sergio Prado):
 - Fix license from MIT to LGPL-2.1 or MPL-1.1 (in a separate patch)

 package/libgdiplus/libgdiplus.mk | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/libgdiplus/libgdiplus.mk b/package/libgdiplus/libgdiplus.mk
index eb1858574d..52032d4f07 100644
--- a/package/libgdiplus/libgdiplus.mk
+++ b/package/libgdiplus/libgdiplus.mk
@@ -6,13 +6,8 @@
 
 LIBGDIPLUS_VERSION = 5.4
 LIBGDIPLUS_SITE = $(call github,mono,libgdiplus,$(LIBGDIPLUS_VERSION))
-
-# Although there is a LICENSE file thas specifies LGPL or MPL-1.1,
-# looks like it is incorrect. The actual source files specify that
-# they're licensed under MIT, and so does the COPYING file (and they
-# all predate the addition of the LICENSE file).
-LIBGDIPLUS_LICENSE = MIT
-LIBGDIPLUS_LICENSE_FILES = COPYING src/carbon-private.h
+LIBGDIPLUS_LICENSE = LGPL-2.1 or MPL-1.1
+LIBGDIPLUS_LICENSE_FILES = LICENSE
 
 LIBGDIPLUS_INSTALL_STAGING = YES
 
-- 
2.14.1
