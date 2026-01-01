Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415D4EED609
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 13:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D38A404C6;
	Thu,  1 Jan 2026 13:27:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oP1Qmk-BQ7VN; Thu,  1 Jan 2026 13:27:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E98040762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767274047;
	bh=M577WtvjvZ4r5CX0A5FX0WmR/UrZGt0k+MjqH7q/ONk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rkBf0DqtMPAc3NW/XripsORrFllCIXjhm8bXkoqCN3swTtMImFztAmu6S74AM4+Xh
	 Kkuz8TvBmHouMgDOnmN30sKM8wrtT5eTjsnHCel9shDk39uKP0pDFNnlKQz6nvODrR
	 2I3T+6idd56lk831z/dN4fOo6UdHHS5a8DVIeqNmu4iqD0qiSkM15XiMrcdntjwu/I
	 XKz4Q2zh29jjH/yePb4Yx9meapfEtuAdhhBaYXWqF117XXk5+J+DbVWKpFkNZQ0/4s
	 d49Vt0AY2hYTBl/aY0AmeWNW4mATK1XpSdkK5DuTuOqAUCVDoA5YpYMQ0Sdckt2ruu
	 2y6BHrmx94zqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E98040762;
	Thu,  1 Jan 2026 13:27:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6802D19D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 13:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58C7E40762
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 13:27:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id grNo42KNHxYq for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 13:27:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76ECE404C6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76ECE404C6
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 13:27:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66BC587D82; Thu,  1 Jan 2026 13:27:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 14:27:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3e007e27d0da4ea1ba3e8d90779fc5f239ee3e06
X-Git-Newrev: a5d29e752a996c24f26b03d118e6f755e8eae5a7
X-Patchwork-Hint: ignore
Message-Id: <20260101132724.66BC587D82@busybox.osuosl.org>
Subject: [Buildroot] [git commit] gitignore: ignore utils/brmake log output
 named `br.log`
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0881582258980122668=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0881582258980122668==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a5d29e752a996c24f26b03d118e6f755e8eae5a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

--===============0881582258980122668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0881582258980122668==--
