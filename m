Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24F1CD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 573254073A;
	Fri, 12 Jun 2026 11:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MUPkCF3ODbN6; Fri, 12 Jun 2026 11:36:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7171D4066E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264177;
	bh=Lo/pVrfsSNcVNIGfNhfko/rAu5+Vphz0P1N+HVviMNE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OiyYBEguylX0bVQ6D68bTNpOtEIj5w04ctxcdEcS9/1nli7P5d5x6fItwpZvrCiPZ
	 v47JYh4T39+VKB2taApmiqmSI/i33tAzKBruCkWzp7JupKoUBUnCcA6rNYVxtUpEaT
	 2NXeJz6Wdxz8+4aE/rJW93iOBdoHd/uOYlHKnVjjj3ZV9F1VUqf9pV1+MD0+vyDMTs
	 Q4RJjPD6B3aQPfPWo21N8D7bLiepDOLztw1mWMpyx7NebJCILj/QOjRdFHWrjREMp8
	 CPUVvbs78tWVf4OnIPa77mfpoAnrvRjiI26Gxn0RiK5AKSqUgPxzqtIwo7o9Yblpfa
	 f7UWgbrZfUXaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7171D4066E;
	Fri, 12 Jun 2026 11:36:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CA3A12F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0293C40645
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:36:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J8cqk5d6_XsQ for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:36:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BF544065E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BF544065E
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:36:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F00B4880E7; Fri, 12 Jun 2026 11:35:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:34:51 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 470e20cadd41f1f56ce67274df53ab532ebffbba
X-Git-Newrev: 702b01dc967a7d243283fc06f3a8e370e5865fb4
X-Patchwork-Hint: ignore
Message-Id: <20260612113555.F00B4880E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/esp-hosted: don't
 treat warnings as errors
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/702b01dc967a7d243283fc06f3a8e370e5865fb4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

This driver fails to build because warnings are treated as errors but
this is too strict, breaking the build.

This used to be hidden by commit 6b56e0b4f0 ("linux: disable -Werror"),
which was reverted in commit a966f5cde5 ("Revert "linux: disable -Werror""),
so fix it by explicitly passing -Wno-error.

Fixes:
https://autobuild.buildroot.org/results/df3763e74de4071331a41140fb5528523af9e374/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Peter: add note about when issue was (re-)introduced]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit daf49629376b0f61aeb330e4f25dee495d398bc5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/esp-hosted/esp-hosted.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
index 15603b9679..7cf3cbc99c 100644
--- a/package/esp-hosted/esp-hosted.mk
+++ b/package/esp-hosted/esp-hosted.mk
@@ -29,5 +29,7 @@ else
 ESP_HOSTED_MODULE_MAKE_OPTS = target=sdio
 endif
 
+ESP_HOSTED_MODULE_MAKE_OPTS += KCFLAGS="-Wno-error"
+
 $(eval $(kernel-module))
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
