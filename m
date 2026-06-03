Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42482CD6E57
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 19:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E992E42800;
	Wed,  3 Jun 2026 19:42:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zt_9kKkrXKIO; Wed,  3 Jun 2026 19:42:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 226E7427F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780515766;
	bh=KpbpCXLrGsQpReC4mfvgQsXwu1eCkGUIPAahxh5JWuU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=h7QLyjwgwBCBkhZzbvKa+J/f5qM0O7ZBRjc05qo9nvokUYwZc1bcLNAJ0bckYbB4r
	 TVZ7tf3KCzZCJZ1yZRVn+5YTPSbYCSuHvFHusSk7QUYZgEm4DJrMurmKT75GIY4eZH
	 EmSdC8NUsVdhLGYzcj/SELE6PxlezB7WCFHy4EB6cZEfqEyxRyFA8YShePGngLwvzQ
	 cUNOrk4JDS1b0K2BcHQPcNcrFH0KvxL/vJsW16l+snMZb/MJYJ0EAkVRtBBd0vDJtm
	 kt76bfMlgj2RCOAOyCrwbWkC/NFCuP4UkrkVUmMfwCW+QWdnygTJm9/zh3jtJZcVrA
	 oFbd3oGMYbaDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 226E7427F4;
	Wed,  3 Jun 2026 19:42:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DD5F32F5
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 19:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE7A942210
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 19:42:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mMb7nmoavgu5 for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 19:42:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B1EF40077
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B1EF40077
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 19:42:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21ADD8799B; Wed,  3 Jun 2026 19:42:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Jun 2026 21:31:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 990c39b588054390de8b0d9e9f049ee470655d2a
X-Git-Newrev: daf49629376b0f61aeb330e4f25dee495d398bc5
X-Patchwork-Hint: ignore
Message-Id: <20260603194229.21ADD8799B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/esp-hosted: don't treat warnings
 as errors
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/daf49629376b0f61aeb330e4f25dee495d398bc5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
---
 package/esp-hosted/esp-hosted.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
index 3de8f24123..5cf6571481 100644
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
