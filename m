From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sun, 16 Mar 2014 15:47:17 -0400
Subject: [Buildroot] [PATCH] mtools: remove ignored configure options
Message-ID: <1394999237-30259-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The --enable-xdf, --enable-vold, and --enable-new-vold options were
actually not being passed to ./configure since they were specified on
the wrong variable (MTOOLS_CONF_OPT vs. HOST_MTOOLS_CONF_OPT) and mtools
is a host-only package. Fixing the variable name so that the options are
actually used ends up causing the build to fail due to linker errors.
Since vold identifiers and OS/2 XDF support are unlikely to be used any
more, remove them completely.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/mtools/mtools.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
index 6751059..11517df 100644
--- a/package/mtools/mtools.mk
+++ b/package/mtools/mtools.mk
@@ -10,8 +10,4 @@ MTOOLS_SITE          = $(BR2_GNU_MIRROR)/mtools/
 MTOOLS_LICENSE       = GPLv3+
 MTOOLS_LICENSE_FILES = COPYING
 
-MTOOLS_CONF_OPT = --enable-xdf        \
-                  --enable-vold       \
-                  --enable-new-vold
-
 $(eval $(host-autotools-package))
-- 
1.8.3.2
