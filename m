Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F418C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08C1942B2E;
	Mon, 20 Feb 2023 21:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08C1942B2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2w5d0Q3pfzus; Mon, 20 Feb 2023 21:19:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1BFA42D12;
	Mon, 20 Feb 2023 21:19:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1BFA42D12
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 22FF51BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34FF340C19
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34FF340C19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RkZkw6zO7PZP for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56C1A414E7
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56C1A414E7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C71086495; Mon, 20 Feb 2023 20:51:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Nov 2022 22:21:09 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 75cb8a490200e2480d1dcc2a2e59de0a575c1531
X-Git-Newrev: 6ebfe647b6df76016fb8a50b718d60fdff15fe87
X-Patchwork-Hint: ignore
Message-Id: <20230220205152.4C71086495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mesa3d: fix uClibc
 build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3164993596306784821=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3164993596306784821==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6ebfe647b6df76016fb8a50b718d60fdff15fe87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Moved the util/compiler.h include to util/macros.h due to upstream
commit which added static_assert() to src/util/macros.h
https://cgit.freedesktop.org/mesa/mesa/commit/src/util/macros.h?h=22.2&id=f1023571e8ce7ccb6ec7bc115240cb76aef3e5e5

Please note that this patch can be removed when buildroot toolchains
are updated to uClibc 1.0.42:
https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?h=v1.0.42&id=03fbd941e943976bb92cb392882c2ff7ec218704

Fixes:
http://autobuild.buildroot.net/results/a55/a55d6980faad8b5063f8f4f8b89467061d44a2ae/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d/0004-Fix-uClibc-build.patch | 37 +++++++++++++++++-------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/package/mesa3d/0004-Fix-uClibc-build.patch b/package/mesa3d/0004-Fix-uClibc-build.patch
index 70ff5e2b4c..c8c82fe0dc 100644
--- a/package/mesa3d/0004-Fix-uClibc-build.patch
+++ b/package/mesa3d/0004-Fix-uClibc-build.patch
@@ -18,29 +18,22 @@ Fixes build errors with uClibc and gcc-9.3.0:
  function ‘static_assert’ [-Werror=implicit-function-declaration] 101 |
  static_assert(ARRAY_SIZE(egl_platforms) == _EGL_NUM_PLATFORMS,
 
+../src/util/macros.h:74:4: error: implicit declaration of function
+ ‘static_assert’ [-Werror=implicit-function-declaration]
+   74 |    static_assert(cond, #cond); \
+      |    ^~~~~~~~~~~~~
+
 Patch sent upstream:
 https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/13898
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
- src/egl/main/egldisplay.c |  1 +
- src/util/compiler.h       | 10 ++++++++++
+ src/util/compiler.h | 10 ++++++++++
+ src/util/macros.h   |  1 +
  2 files changed, 11 insertions(+)
 
-diff --git a/src/egl/main/egldisplay.c b/src/egl/main/egldisplay.c
-index 131fc22786f9..d3e2bb96e2f6 100644
---- a/src/egl/main/egldisplay.c
-+++ b/src/egl/main/egldisplay.c
-@@ -42,6 +42,7 @@
- #endif
- #include <fcntl.h>
- #include "c11/threads.h"
-+#include "util/compiler.h"
- #include "util/macros.h"
- #include "util/os_file.h"
- #include "util/u_atomic.h"
 diff --git a/src/util/compiler.h b/src/util/compiler.h
-index d184ad455af9..b5c56807acc6 100644
+index d184ad455af..b5c56807acc 100644
 --- a/src/util/compiler.h
 +++ b/src/util/compiler.h
 @@ -36,6 +36,16 @@
@@ -60,6 +53,18 @@ index d184ad455af9..b5c56807acc6 100644
  #include "util/macros.h"
  
  
+diff --git a/src/util/macros.h b/src/util/macros.h
+index 22b18303826..8f73ee72693 100644
+--- a/src/util/macros.h
++++ b/src/util/macros.h
+@@ -27,6 +27,7 @@
+ #include <stdio.h>
+ #include <assert.h>
+ #include <stdint.h>
++#include "util/compiler.h"
+ 
+ /* Compute the size of an array */
+ #ifndef ARRAY_SIZE
 -- 
-GitLab
+2.34.1
 

--===============3164993596306784821==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3164993596306784821==--
