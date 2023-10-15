Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E49CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 09:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76BF540C53;
	Sun, 15 Oct 2023 09:03:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76BF540C53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id twQX_uEtLKAo; Sun, 15 Oct 2023 09:03:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DA9840AA2;
	Sun, 15 Oct 2023 09:03:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DA9840AA2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 847281BF2F1
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 09:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A228818C2
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 09:03:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A228818C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id usBaWl0QWf07 for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 09:03:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7741E8188A
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 09:03:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7741E8188A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 612A384600; Sun, 15 Oct 2023 09:03:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 10:49:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2dc61bfa768659ffa208b179967c332e6252d5ad
X-Git-Newrev: 84cdd92f0172ccc49fd2c037caaf3a659a26194d
X-Patchwork-Hint: ignore
Message-Id: <20231015090300.612A384600@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: remove leftover from legacy
 PowerPC patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=84cdd92f0172ccc49fd2c037caaf3a659a26194d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 0c82f3f63563 (package/gcc: remove powerpc conditional patching
logic), the macro defining the conditional patch was removed, but it was
still referenced and expanded in the apply-patches hook.

Drop that now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 4a3b780618..9a164c8374 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -44,7 +44,6 @@ define HOST_GCC_APPLY_PATCHES
 			$(APPLY_PATCHES) $(@D) $${patchdir} \*.patch || exit 1; \
 		fi; \
 	done
-	$(HOST_GCC_APPLY_POWERPC_PATCH)
 endef
 
 HOST_GCC_EXCLUDES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
