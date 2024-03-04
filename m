Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C73C54E41
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 11:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF7B58179D;
	Mon,  4 Mar 2024 11:51:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m-AEoR3yg8CG; Mon,  4 Mar 2024 11:51:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 133B7817A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 133B7817A1;
	Mon,  4 Mar 2024 11:51:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 13D9B1BF2F3
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 11:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00DFF817A1
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 11:51:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rmlIGsrstwNw for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 11:51:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B79B8179D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B79B8179D
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 11:51:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 165CA88052; Mon,  4 Mar 2024 11:51:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Mar 2024 12:49:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f64f82f78ffd9c4b530a7a7f17e1a66feaa23c80
X-Git-Newrev: 34d473b5cca2a0e01ba7a60ced275f94a0e40540
X-Patchwork-Hint: ignore
Message-Id: <20240304115118.165CA88052@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luvi: fix build with aarch64_be
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

commit: https://git.buildroot.net/buildroot/commit/?id=34d473b5cca2a0e01ba7a60ced275f94a0e40540
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with aarch64_be raised since the
addition of aarch64_be support to luajit in commit
28e5c2f2bdd147dbb9aefbc040fc618f46ee0663:

luajit: unknown architecture

Fixes: 28e5c2f2bdd147dbb9aefbc040fc618f46ee0663
 - http://autobuild.buildroot.org/results/9b89eff7d90173b8c74b8f676650709cc4418e65

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luvi/luvi.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/luvi/luvi.mk b/package/luvi/luvi.mk
index a8e645fab3..ebd1066c5c 100644
--- a/package/luvi/luvi.mk
+++ b/package/luvi/luvi.mk
@@ -22,6 +22,8 @@ else ifeq ($(BR2_arm)$(BR2_armeb),y)
 LUVI_TARGET_ARCH = arm
 else ifeq ($(BR2_aarch64),y)
 LUVI_TARGET_ARCH = arm64
+else ifeq ($(BR2_aarch64_be),y)
+LUVI_TARGET_ARCH = arm64be
 else ifeq ($(BR2_mips),y)
 LUVI_TARGET_ARCH = mips
 else ifeq ($(BR2_mipsel),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
