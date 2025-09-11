Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1DDCAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 18:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDD536F4B1;
	Thu, 11 Sep 2025 18:55:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XiVx5FoSzz47; Thu, 11 Sep 2025 18:55:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 093CE6F4DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 093CE6F4DC;
	Thu, 11 Sep 2025 18:55:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4099C2735
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C937961CB1
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:54:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GfMnFiIFyufF for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 18:54:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76D0B6EDCC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76D0B6EDCC
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:54:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74076840F1; Thu, 11 Sep 2025 18:54:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 17:43:14 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 920c47a61c3d423e18359dc91b26f977af60930d
X-Git-Newrev: bfc214fedfb553180c111c8b610ac75ee850a771
X-Patchwork-Hint: ignore
Message-Id: <20250911185454.74076840F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/mbpfan: fix musl
 / uclibc-ng patch
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bfc214fedfb553180c111c8b610ac75ee850a771
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Commit 759a08633e ("package/mbpfan: fix build on musl / uclibc-ng") added a
patch for musl / uclibc-ng, but the upstream patch did not correctly apply
to the 2.4.0 release, breaking the build.

Fix that.  In the mean time the patch has been applied upstream, so add a
reference to the upstream commit.

Fixes:

  https://autobuild.buildroot.net/results/785be6231c1edc4e5461ce083a3d65fd27fc5843/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 717138c83c857d1dd119750f1af6eda033d9206f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0001-Makefile-util.c-fix-build-on-musl-uClibc-ng.patch | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/mbpfan/0001-Makefile-util.c-fix-build-on-musl-uClibc-ng.patch b/package/mbpfan/0001-Makefile-util.c-fix-build-on-musl-uClibc-ng.patch
index ac15143e2e..7b42957bdd 100644
--- a/package/mbpfan/0001-Makefile-util.c-fix-build-on-musl-uClibc-ng.patch
+++ b/package/mbpfan/0001-Makefile-util.c-fix-build-on-musl-uClibc-ng.patch
@@ -1,4 +1,4 @@
-From 924e38f159e4f5906f88cd8ddbe27f273c601cb0 Mon Sep 17 00:00:00 2001
+From 2e6ae7ce5c28acaff9b3e77d7a693b7224a46003 Mon Sep 17 00:00:00 2001
 From: Peter Korsgaard <peter@korsgaard.com>
 Date: Mon, 1 Sep 2025 12:08:53 +0200
 Subject: [PATCH] {Makefile,util.c}: fix build on musl / uClibc-ng
@@ -27,6 +27,8 @@ _DEFAULT_SOURCE is:
 https://github.com/bminor/glibc/blob/master/include/features.h#L417-L419
 
 Upstream: https://github.com/linux-on-mac/mbpfan/pull/271
+(cherry picked from commit 25c2a09bd0d74e19c3843ce35ac54b5e288480ab)
+[Peter: backport to 2.4.0]
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  Makefile   | 2 +-
@@ -34,29 +36,29 @@ Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
  2 files changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 94d72ee..ff1b7e6 100644
+index 41873fa..bb6c913 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -19,7 +19,7 @@ BINFLAG = -o
  INCLUDES =
  LIBS = -lm
  LIBPATH =
--CFLAGS += $(COPT) -g $(INCLUDES) -Wall -Wextra -Wno-unused-function -Wno-unused-parameter -std=c99 -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=500
-+CFLAGS += $(COPT) -g $(INCLUDES) -Wall -Wextra -Wno-unused-function -Wno-unused-parameter -std=c99 -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=500 -D_DEFAULT_SOURCE
+-CFLAGS += $(COPT) -g $(INCLUDES) -Wall -Wextra -Wno-unused-function -std=c99 -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=500
++CFLAGS += $(COPT) -g $(INCLUDES) -Wall -Wextra -Wno-unused-function -std=c99 -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=500 -D_DEFAULT_SOURCE
  LDFLAGS += $(LIBPATH) -g
  
  OBJS := $(patsubst %.$(C),%.$(OBJ),$(wildcard $(SOURCE_PATH)*.$(C)))
 diff --git a/src/util.c b/src/util.c
-index df5b03f..25415b9 100644
+index c66e6d7..b7fe71e 100644
 --- a/src/util.c
 +++ b/src/util.c
 @@ -1,6 +1,5 @@
  #include <stdarg.h>
  #include <stdio.h>
 -#define __USE_MISC
- #define _GNU_SOURCE
  #include <syslog.h>
  
+ #include "global.h"
 -- 
 2.39.5
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
