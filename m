Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C080C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 302824F1C0;
	Fri, 28 Feb 2025 16:35:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1P5rmvmpaM0A; Fri, 28 Feb 2025 16:35:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E75CF4F1C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E75CF4F1C1;
	Fri, 28 Feb 2025 16:35:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BF9A68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D8F542485
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dZMREXIDCkjj for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C08FC419EF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C08FC419EF
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8D91844AB; Fri, 28 Feb 2025 16:29:34 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 9 Dec 2024 23:34:03 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b253ae3054b8b21238e2f57803f780e7bc04daf1
X-Git-Newrev: d6586d37ba4a155c7325b758217b7ad3a4fd4d5f
X-Patchwork-Hint: ignore
Message-Id: <20250228162934.B8D91844AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pcm-tools: fix
 'generating' typo
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d6586d37ba4a155c7325b758217b7ad3a4fd4d5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pcm-tools/pcm-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pcm-tools/pcm-tools.mk b/package/pcm-tools/pcm-tools.mk
index 30a8fbf0b6..38725ed8c8 100644
--- a/package/pcm-tools/pcm-tools.mk
+++ b/package/pcm-tools/pcm-tools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Don't use the github helper, as pcm-tools uses git attributes that are
-# replaced when gnerating the archive.
+# replaced when generating the archive.
 # 93fc9193a70e2f1f054be554c48f4a4791be5032 is the hash of the 202110 tag.
 PCM_TOOLS_VERSION = 93fc9193a70e2f1f054be554c48f4a4791be5032
 PCM_TOOLS_SITE = https://github.com/opcm/pcm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
