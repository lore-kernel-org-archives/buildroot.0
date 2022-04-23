Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C805FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 16:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8031A40A18;
	Sat, 23 Apr 2022 16:36:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PMhYG10RvViL; Sat, 23 Apr 2022 16:36:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D2DC40915;
	Sat, 23 Apr 2022 16:36:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9231D1BF5DF
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 527F983E08
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:33:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IWfo4md4JeaM for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 16:32:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D05E83E09
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 16:32:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D9201801E4; Sat, 23 Apr 2022 16:22:49 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 18:25:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd8c04c6bcdb5d287d570437d798dcb149e61a5e
X-Git-Newrev: d238a94ba714b992b14f47e7e1e7b813a1c3ca91
X-Patchwork-Hint: ignore
Message-Id: <20220423162249.D9201801E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/coreutils: drop patch
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d238a94ba714b992b14f47e7e1e7b813a1c3ca91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch as it is not needed since bump to version 9.1 in commit
908caefa91dbf70e7f40c61113f0f1ae2b83230d because gnulib has been updated
with
https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=135414a7f543e4d40ad0a7cbd51885e159a6e0f4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...-getrandom.c-fix-build-with-uclibc-1.0.35.patch | 46 ----------------------
 1 file changed, 46 deletions(-)

diff --git a/package/coreutils/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch b/package/coreutils/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
deleted file mode 100644
index 88390a1124..0000000000
--- a/package/coreutils/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From a0594387565e1e6b4a8a8ba04ad13b135cc1f0b5 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 1 Apr 2021 07:49:46 +0200
-Subject: [PATCH] lib/getrandom.c: fix build with uclibc < 1.0.35
-
-Fix the following build failure with uclibc < 1.0.35 which is raised
-since the addition of getrandom module in
-https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=682cc4e678aceff32dea2a84b6e5147bdf5a20a7:
-
-In file included from ./sys/random.h:40,
-                 from getrandom.c:22:
-/home/fabrice/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:27:35: error: unknown type name 'size_t'
-   27 | extern int getrandom(void *__buf, size_t count, unsigned int flags)
-      |                                   ^~~~~~
-/home/fabrice/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:8:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
-    7 | #include <features.h>
-  +++ |+#include <stddef.h>
-    8 |
-
-This patch is not upstreamable as it is only a workaround for
-uclibc < 1.0.35, upstream uclibc has been patched with
-https://github.com/wbx-github/uclibc-ng/commit/00972c02c2b6e0a95d5def4a71bdfb188e091782
-
-Fixes:
- - http://autobuild.buildroot.org/results/c69f5c8b8e53ed3de753f0c6d2cdd99497504b49
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- lib/getrandom.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/getrandom.c b/lib/getrandom.c
-index 41212fb32..0ad3f9648 100644
---- a/lib/getrandom.c
-+++ b/lib/getrandom.c
-@@ -19,6 +19,7 @@
- 
- #include <config.h>
- 
-+#include <stddef.h>
- #include <sys/random.h>
- 
- #include <errno.h>
--- 
-2.30.2
-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
