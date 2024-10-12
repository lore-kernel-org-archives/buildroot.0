Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64635CF2566
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 14:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25F00405E3;
	Sat, 12 Oct 2024 14:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IPNAdSuOAZTe; Sat, 12 Oct 2024 14:07:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58C3241B16
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58C3241B16;
	Sat, 12 Oct 2024 14:07:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 85F0C1BF3DA
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA45D40860
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WlmOYH6jsMyB for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 14:05:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3C6B40858
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3C6B40858
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 14:05:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF6528285E; Sat, 12 Oct 2024 14:05:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 15:59:28 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 206c6f0acd9329580f11f5da5620129a4ac9d671
X-Git-Newrev: 0243bc0795f8ca5014fc8dc4b16d3e6db71d8857
X-Patchwork-Hint: ignore
Message-Id: <20241012140531.DF6528285E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x]
 boot/optee-os/optee-os.mk: fix 'PLATFORM' typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=0243bc0795f8ca5014fc8dc4b16d3e6db71d8857
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7bd00d5506e8572f316a9b742b78039e0743d86b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/optee-os/optee-os.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index 6b04a0f5e1..c6de49c151 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -65,7 +65,7 @@ OPTEE_OS_MAKE_OPTS += \
 	CFG_ARM32_core=y
 endif
 
-# Get mandatory PLAFORM and optional PLATFORM_FLAVOR and additional
+# Get mandatory PLATFORM and optional PLATFORM_FLAVOR and additional
 # variables
 OPTEE_OS_MAKE_OPTS += PLATFORM=$(call qstrip,$(BR2_TARGET_OPTEE_OS_PLATFORM))
 ifneq ($(call qstrip,$(BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR)),)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
