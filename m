Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C6BC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 07:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD7BA4284C;
	Sat,  8 Jun 2024 07:53:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WE_GCgah0brB; Sat,  8 Jun 2024 07:53:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CDB442854
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CDB442854;
	Sat,  8 Jun 2024 07:53:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F0C11BF422
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 07:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E794540165
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 07:52:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Su5D7uFHeAo9 for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 07:52:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A65A401FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A65A401FE
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 07:52:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6989387D82; Sat,  8 Jun 2024 07:52:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 09:44:35 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 3326cbd2e528170c1d86d3cbe4c7853467dbfa47
X-Git-Newrev: 85ba6c5c09595b335a09869ee052defa1b5e4b85
X-Patchwork-Hint: ignore
Message-Id: <20240608075253.6989387D82@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/gcc: add patch to
 fix gcc 11 build warning
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

commit: https://git.buildroot.net/buildroot/commit/?id=85ba6c5c09595b335a09869ee052defa1b5e4b85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

When building GCC 11 with GCC 14 the following error occurs

> ../../../libiberty/simple-object-mach-o.c:1231:17: error: passing argument 1 of 'set_32' from incompatible pointer type [-Wincompatible-pointer-types]

This was fixed upstream in GCC12[1]. It is applied to the GCC 11 release
branch[2], but has not been officially released yet.

[1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=38757aa88735ab2e511bc428e2407a5a5e9fa0be
[2] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=02cd761eb1198df50453b2e39653f48053609ffc

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8fa9ad7e4f2212e3ff934695eb36e9dc2cb9c2b8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0009-libiberty-Darwin-Fix-a-build-warning.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/gcc/11.4.0/0009-libiberty-Darwin-Fix-a-build-warning.patch b/package/gcc/11.4.0/0009-libiberty-Darwin-Fix-a-build-warning.patch
new file mode 100644
index 0000000000..3c694a89fa
--- /dev/null
+++ b/package/gcc/11.4.0/0009-libiberty-Darwin-Fix-a-build-warning.patch
@@ -0,0 +1,37 @@
+From d1fc3505cc09d0ee02abbb732eafc91967c3ac07 Mon Sep 17 00:00:00 2001
+From: Iain Sandoe <iain@sandoe.co.uk>
+Date: Mon, 23 Aug 2021 17:34:43 +0100
+Subject: [PATCH] libiberty, Darwin: Fix a build warning.
+
+r12-3005-g220c410162ebece4f missed a cast for the set_32 call.
+Fixed thus.
+
+Signed-off-by: Iain Sandoe <iain@sandoe.co.uk>
+
+libiberty/ChangeLog:
+
+	* simple-object-mach-o.c (simple_object_mach_o_write_segment):
+	Cast the first argument to set_32 as needed.
+
+Upstream: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=38757aa88735ab2e511bc428e2407a5a5e9fa0be
+Signed-off-by: Brandon Maier <brandon.maier@collins.com>
+---
+ libiberty/simple-object-mach-o.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libiberty/simple-object-mach-o.c b/libiberty/simple-object-mach-o.c
+index 72b69d19c21..a8869e7c639 100644
+--- a/libiberty/simple-object-mach-o.c
++++ b/libiberty/simple-object-mach-o.c
+@@ -1228,7 +1228,7 @@ simple_object_mach_o_write_segment (simple_object_write *sobj, int descriptor,
+       /* Swap the indices, if required.  */
+ 
+       for (i = 0; i < (nsects_in * 4); ++i)
+-	set_32 (&index[i], index[i]);
++	set_32 ((unsigned char *) &index[i], index[i]);
+ 
+       sechdr_offset += sechdrsize;
+ 
+-- 
+2.45.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
