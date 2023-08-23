Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE560EE49AB
	for <buildroot@archiver.kernel.org>; Wed, 23 Aug 2023 06:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 100888206F;
	Wed, 23 Aug 2023 06:28:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 100888206F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ufQkrNCbHQw; Wed, 23 Aug 2023 06:28:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 351208206D;
	Wed, 23 Aug 2023 06:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 351208206D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AA4C01BF591
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 06:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E5DB61245
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 06:28:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E5DB61245
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lRcGXI03PX3r for <buildroot@lists.busybox.net>;
 Wed, 23 Aug 2023 06:28:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8794961227
 for <buildroot@buildroot.org>; Wed, 23 Aug 2023 06:28:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8794961227
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A37D861A4; Wed, 23 Aug 2023 06:28:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 23 Aug 2023 08:25:38 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d06ca392909d1c03e1e471dc7ae401b3ee73a5fc
X-Git-Newrev: 7b29c67e97072229fe5f836f51fa7a3a1f1db0aa
X-Patchwork-Hint: ignore
Message-Id: <20230823062804.6A37D861A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/util-linux: drop
 superfluous patch after merge
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b29c67e97072229fe5f836f51fa7a3a1f1db0aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

In commit 2423d9f16b26 (Merge tag '2023.08-rc2' into next), we missed
the fact that util-linux on next is a newer version than on master,
version which includes the patch we backported on master.

Unsurprisingly, that patch no longer applies; drop it.

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-libmount-ifdef-statx-call.patch           | 57 ----------------------
 1 file changed, 57 deletions(-)

diff --git a/package/util-linux/0001-libmount-ifdef-statx-call.patch b/package/util-linux/0001-libmount-ifdef-statx-call.patch
deleted file mode 100644
index ba44650bd3..0000000000
--- a/package/util-linux/0001-libmount-ifdef-statx-call.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From c0136ac0c98b18208508fbcfac31a843e0bb8a37 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Thu, 3 Aug 2023 12:39:19 +0200
-Subject: [PATCH] libmount: ifdef statx() call
-
-In this case the statx() is use to get mount ID. It's optional and not
-required. Let's #ifdef the statx() call and also check for stx_mnt_id
-struct member.
-
-Fixes: https://github.com/util-linux/util-linux/issues/2415
-Signed-off-by: Karel Zak <kzak@redhat.com>
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://github.com/util-linux/util-linux/commit/c0136ac0c98b18208508fbcfac31a843e0bb8a37
----
- configure.ac              | 5 ++++-
- libmount/src/hook_mount.c | 2 ++
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index a3cf330b5..ae721c7ac 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -525,7 +525,10 @@ AC_CHECK_MEMBERS([struct termios.c_line],,,
-     [[#include <termios.h>]])
- 
- AC_CHECK_MEMBERS([struct stat.st_mtim.tv_nsec],,,
--	[#include <sys/stat.h>])
-+    [[#include <sys/stat.h>]])
-+
-+AC_CHECK_MEMBERS([struct statx.stx_mnt_id],,,
-+    [[#include <linux/stat.h>]])
- 
- AC_CHECK_DECLS([_NL_TIME_WEEK_1STDAY],[],[],[[#include <langinfo.h>]])
- 
-diff --git a/libmount/src/hook_mount.c b/libmount/src/hook_mount.c
-index d69a018ec..056338c49 100644
---- a/libmount/src/hook_mount.c
-+++ b/libmount/src/hook_mount.c
-@@ -294,6 +294,7 @@ static int hook_create_mount(struct libmnt_context *cxt,
- 		/* cleanup after fail (libmount may only try the FS type) */
- 		close_sysapi_fds(api);
- 
-+#if defined(HAVE_STRUCT_STATX) && defined(HAVE_STRUCT_STATX_STX_MNT_ID)
- 	if (!rc && cxt->fs) {
- 		struct statx st;
- 
-@@ -306,6 +307,7 @@ static int hook_create_mount(struct libmnt_context *cxt,
- 				fs->id = cxt->fs->id;
- 		}
- 	}
-+#endif
- 
- done:
- 	DBG(HOOK, ul_debugobj(hs, "create FS done [rc=%d, id=%d]", rc, cxt->fs ? cxt->fs->id : -1));
--- 
-2.39.2
-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
