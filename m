Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5BFCD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 17:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 605DE4230C;
	Fri, 29 May 2026 17:05:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jHRgS3NtaSc2; Fri, 29 May 2026 17:05:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94E8A42305
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780074317;
	bh=sURLSyLXBxVNkMLEZBK2aeI2Pz1YPe9I470X+863etY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ampu2w2fCMGJNN6McQlO7iLuFvcg+Xkgxlg7/kZe7nQy5Y5icBT80Rm/4RGGkcuU5
	 AGilMUDXE7D4pIdvSOPv34YDFgNzaSOQNPxB4Z2GsIcathZs0suUrsFkPSFjmx4pUD
	 hqL+rXmmyuaCGyoLFYCIJ3E8+hjpWQNXRR2dxWhdxhWoiOvm1um+G05BW4BFrHd9ZM
	 JKoBSSzMONvEJHfo6NlaWw7/3BUtjd3BYbN3Yji9P6mBz1xhitnQvDS1isPlIdjR80
	 kDWB6XbZeHzcdUknN+RZtQn+7MUFIaR2j60YA8wyhh8GfCLe/Ws6G3Wm9+R5lOddxk
	 kjI5HPe/CsmwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94E8A42305;
	Fri, 29 May 2026 17:05:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 874F3D3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66E6D8416E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:05:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lG3XNtPpRH71 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 17:05:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F68984166
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F68984166
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:05:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F40C487405; Fri, 29 May 2026 17:05:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 19:02:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c0922004d8e888d378a03ecca42e77160d1bcd18
X-Git-Newrev: 825abb268233f05bb20296048fd29006d2d1a86d
X-Patchwork-Hint: ignore
Message-Id: <20260529170501.F40C487405@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/misc/gitlab-ci.yml.in: only
 specify a single tag
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/825abb268233f05bb20296048fd29006d2d1a86d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The tags specified by a job are ANDed, not ORed. So with

.runner-small:
    tags:
        - buildroot-runner
        - saas-linux-small-amd64

the job will only run on a runner that has _both_ tags - so only on the
buildroot runner. That makes it pretty pointless.

Remove all the buildroot-runner tags, except in the
.runner-buildroot-runner-only template.

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 support/misc/gitlab-ci.yml.in | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index d804e94400..81c380a4ed 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -7,27 +7,22 @@ before_script:
 
 .runner-small:
     tags:
-        - buildroot-runner
         - saas-linux-small-amd64
 
 .runner-medium:
     tags:
-        - buildroot-runner
         - saas-linux-medium-amd64
 
 .runner-large:
     tags:
-        - buildroot-runner
         - saas-linux-large-amd64
 
 .runner-xlarge:
     tags:
-        - buildroot-runner
         - saas-linux-xlarge-amd64
 
 .runner-2xlarge:
     tags:
-        - buildroot-runner
         - saas-linux-2xlarge-amd64
 
 .runner-buildroot-runner-only:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
