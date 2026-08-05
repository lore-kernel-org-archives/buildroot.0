Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD245C5AC7C
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 09:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDA01811FE;
	Fri,  7 Aug 2026 09:33:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4q0m0Y0OH2YM; Fri,  7 Aug 2026 09:33:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A9EB81200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786095230;
	bh=Mw8gEaoJsx74wJ3POKp2DGoLfEs8i1BlA4+WSTBPlUw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Oi8mfc89siCha0gmJJ2uCHR83d4HFREl8D/XY5RjuA1XUrGR65kc9BJtP9jVA8K8L
	 vRgLcB7EIp4UMsgUXYbZxm52l0SBRaiSn5+4StoIvGxuI+u6RhKOnU4mQ0HRY/8/Rd
	 uyEqdanOFK3EoJKBuP+CRPOZEVga7B62Y/WE8qNt5DO/jjbDJJg+5/qiDi98BQ9t4I
	 e2ewHErRCLZOBozISUJ3801Gl/re7kGN/7xz+Dnm5iAtlHiMZ9IG6+2AadEmVExdqa
	 8gZSh+45CQU55TnXtEQPg0VowenOCi+7K6Sr9TtRciKZ7mC+U39ZUFTGDtyYVDZVtY
	 icZ2uZLn/Cz4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A9EB81200;
	Fri,  7 Aug 2026 09:33:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 01CD9397
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E676240A07
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:33:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rOWXS_Dvle-8 for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 09:33:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4A7D409F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4A7D409F9
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:33:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A5798CA3F; Fri,  7 Aug 2026 09:32:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Aug 2026 12:14:58 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9a5a2be04b4712c206b6ddd69142273c7041a821
X-Git-Newrev: cea4240a2113a26815407d4595776a6879a1d600
X-Patchwork-Hint: ignore
Message-Id: <20260807093259.2A5798CA3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] linux: remove duplicated
 comment lines
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cea4240a2113a26815407d4595776a6879a1d600
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Because of wrongly behaving script ./utils/bump-stable-kernel-versions,
the same comment line "From <URL>" has been inserted multiple times in
the Linux hash file.

Remove them, as this is unneeded.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/linux.hash | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index e14d164f5d..313350dd07 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,4 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  0ff2ab9e169f9f1948557471fbb450d3018f8c5b77caf288e1a3982582597969  linux-6.12.91.tar.xz
 sha256  3bc2652eb62ab90a90a8b0aa156b91d276f92eb84702971df62fe1a3f1eb7fe1  linux-6.6.141.tar.xz
 sha256  ed88346df623ae9150d11b5feb16ddb52c25aef563bb7803ab160bb4493fe06e  linux-6.1.174.tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
