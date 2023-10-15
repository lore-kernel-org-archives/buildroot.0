Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A9DCDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 18:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 413E3414CF;
	Sun, 15 Oct 2023 18:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 413E3414CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0JIEyJ8LOb-b; Sun, 15 Oct 2023 18:34:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D051341493;
	Sun, 15 Oct 2023 18:34:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D051341493
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D6DD1BF83A
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 18:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9090E416D0
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 18:32:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9090E416D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hbff337bUgKS for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 18:32:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC70841703
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 18:32:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC70841703
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ACE73855A5; Sun, 15 Oct 2023 18:32:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 20:20:11 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: a4cfbf072edf545c3e13fb14ad85e77cc81f0d08
X-Git-Newrev: d354a46ad32a6c4012a870ed0e756724e03a6487
X-Patchwork-Hint: ignore
Message-Id: <20231015183251.ACE73855A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/gcc: remove
 leftover from legacy PowerPC patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=d354a46ad32a6c4012a870ed0e756724e03a6487
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

In commit 0c82f3f63563 (package/gcc: remove powerpc conditional patching
logic), the macro defining the conditional patch was removed, but it was
still referenced and expanded in the apply-patches hook.

Drop that now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 84cdd92f0172ccc49fd2c037caaf3a659a26194d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 3050229176..5d023d725f 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -41,7 +41,6 @@ define HOST_GCC_APPLY_PATCHES
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
