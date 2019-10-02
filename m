From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Oct 2019 08:10:42 +0200
Subject: [Buildroot] [git commit] package/strace: drop
 STRACE_GEN_V4L2_PIX_FMT
Message-ID: <20191002060608.A77BE873DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a9348d370694499613468605842ed8a36f1c6e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 6bf7f4728c97 ("package/strace: bump version to 5.3") we no
longer patch v4l2_pix_fmts.in.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/strace/strace.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 46990423d5..5e7a119ba5 100644
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
