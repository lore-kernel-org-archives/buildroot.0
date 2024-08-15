Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EE1C3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 12:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8937340292;
	Thu, 15 Aug 2024 12:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id egTAzkU7P-BT; Thu, 15 Aug 2024 12:49:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F2C740335
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F2C740335;
	Thu, 15 Aug 2024 12:49:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F6771BF574
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 12:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1C5C4044B
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 12:49:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lPwTdzE8cA4S for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 12:49:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA6F24026E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA6F24026E
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 12:49:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8861817AD; Thu, 15 Aug 2024 12:49:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 14:49:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 48e7affffa06bbe23a1cd190d0a765956cf179b0
X-Git-Newrev: c810fb6e1157656e03e982db68230a7a2e500b19
X-Patchwork-Hint: ignore
Message-Id: <20240815124946.D8861817AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iproute2: fixup Upstream url
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c810fb6e1157656e03e982db68230a7a2e500b19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-Fix-implicit-declaration-of-function-basename-in-gcc.patch  | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/iproute2/0002-Fix-implicit-declaration-of-function-basename-in-gcc.patch b/package/iproute2/0002-Fix-implicit-declaration-of-function-basename-in-gcc.patch
index 7ebbb49816..3bce4b15bb 100644
--- a/package/iproute2/0002-Fix-implicit-declaration-of-function-basename-in-gcc.patch
+++ b/package/iproute2/0002-Fix-implicit-declaration-of-function-basename-in-gcc.patch
@@ -4,9 +4,12 @@ Date: Wed, 14 Aug 2024 19:43:44 +0200
 Subject: [PATCH] Fix implicit declaration of function basename in gcc-14.x
 
 From Alpine Linux.
+https://gitlab.alpinelinux.org/alpine/aports/-/blob/master/main/iproute2/basename.patch?ref_type=heads
+
+But also reported Upstream via netdev mailinglist by Gentoo people.
 
 Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://gitlab.alpinelinux.org/alpine/aports/-/blob/master/main/iproute2/basename.patch?ref_type=heads
+Upstream: https://marc.info/?l=linux-netdev&m=172278781323421&w=2
 ---
  rdma/rdma.c | 3 +++
  1 file changed, 3 insertions(+)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
