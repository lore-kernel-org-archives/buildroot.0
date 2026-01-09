Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42249D29DE7
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F12538387D;
	Tue, 13 Jan 2026 19:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZxblQDDP9Tou; Tue, 13 Jan 2026 19:36:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A46B83705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333018;
	bh=qeqqj1a16iU+W54PJswft28cb3KDHPjoba8fWfXmavs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VM/CVmK+uZN7iTh0qu5eMvLGbkSFWqQ8Fc0GQwnE7yXrQEDCSNvdbO5L4gQCDvxAI
	 pMP4JPynbl9zwG0JZ+gFjG30RZp3yYSTuV/HWVdbjjG1fqI5wqtweLd8JbvjaKVu/n
	 6g8w7wEHyoqG+YEZT9UqYtXcUmjJGWr8kCI7/CxxFqiUsj+I7RyJekN5y2igO21ffu
	 7Z5TKFHD2b29kN+8e2rwXj7I4Ftsmr4bcgCm6d2M9sX7bp64hSBWjKOMn4/lStPcDF
	 xSJZ1qWFttFxeEPkMD/Y7jHLOJPpoyhsoIfKhaJOk2Kqbyx7R80VO72xVfFCZHsWo5
	 JiVgmIScMN4fg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A46B83705;
	Tue, 13 Jan 2026 19:36:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 050A8231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2F2B82CF9
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NR8-XHLZAmE8 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E15E782C99
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E15E782C99
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E049E873D9; Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:30:11 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5826d197fb6bc131a58175ebdb18c31ac0967260
X-Git-Newrev: 356d9a9206e542c3746631264a8a04db723d38da
X-Patchwork-Hint: ignore
Message-Id: <20260113193618.E049E873D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] gitignore: ignore
 utils/brmake log output named `br.log`
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
Content-Type: multipart/mixed; boundary="===============5976539818260429568=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5976539818260429568==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=356d9a9206e542c3746631264a8a04db723d38da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The `utils/brmake` tool runs `make all` with logs put into `br.log`.
That file is therefore the result of a build and committing it never
makes sense, neither upstream nor on any other remote/branch.

    ⟩ git status --short
    ⟩ make beaglebone_defconfig
    ⟩ ./utils/brmake
    ⟩ git status --short
    ?? br.log

Add a new `/br.log` entry in the root `.gitignore` file.
Append to the end because no ordering logic was found.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a5d29e752a996c24f26b03d118e6f755e8eae5a7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index ec5768d053..fb20b03daf 100644
--- a/.gitignore
+++ b/.gitignore
@@ -13,3 +13,4 @@
 *.rej
 *~
 *.pyc
+/br.log

--===============5976539818260429568==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5976539818260429568==--
