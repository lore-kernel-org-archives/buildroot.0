From: Baruch Siach <baruch@tkos.co.il>
Date: Wed,  2 Oct 2019 00:18:44 +0300
Subject: [Buildroot] [PATCH] package/strace: drop STRACE_GEN_V4L2_PIX_FMT
Message-ID: <e038bcad4f827725584f96c0197fafb5733848b2.1569964724.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit 6bf7f4728c97 ("package/strace: bump version to 5.3") we no
longer patch v4l2_pix_fmts.in.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/strace/strace.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 46990423d541..5e7a119ba527 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -11,13 +11,6 @@ STRACE_LICENSE = LGPL-2.1+
 STRACE_LICENSE_FILES = COPYING LGPL-2.1-or-later
 STRACE_CONF_OPTS = --enable-mpers=check
 
-# Regenerate v4l2_pix_fmts.h since we patch v4l2_pix_fmts.in
-define STRACE_GEN_V4L2_PIX_FMT
-	$(@D)/xlat/gen.sh $(@D)/xlat/v4l2_pix_fmts.in $(@D)/xlat/v4l2_pix_fmts.h
-endef
-
-STRACE_POST_PATCH_HOOKS += STRACE_GEN_V4L2_PIX_FMT
-
 # strace bundle some kernel headers to build libmpers, this mixes userspace
 # headers and kernel headers which break the build with musl.
 # The stddef.h from gcc is used instead of the one from musl.
-- 
2.23.0
