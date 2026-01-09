Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630CDD2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A421401E0;
	Tue, 13 Jan 2026 19:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZBOfrvviIkTc; Tue, 13 Jan 2026 19:41:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 679AE4078B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333281;
	bh=pssqzXdyb7u3YXNmdQUU2NvsGCyhDAhXRtLErZB9b8w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=czh1TmhLtAEO4rkEBLK/ijsZqkC3na8pyvF8340MC+DFzzK7mj2TirSr3zBamEWpy
	 osNSZIJEmHpUwvGXVh0x0M5ONUJ51AQ7bi3OqtTMeQGn+sTRlS8ytgWh2bNb2A/x4t
	 fcuKrlNRZhZUGEMc52v2QsDtncd5s0ea8MVVWwsWjMw55EVWlFkXKc/pi93uOiBAFE
	 A576xcvXOimWkj1pLxumsiilO5QzI74wWwyl0K/OhDbNdET9AXAgmmANXBNmmgiEUa
	 s3I0W5qk8+mqfWaSuu+uPVPSIS4oq7tB46DIrJDCfVtfpbKNoo6xjorNSLWrIYAqBE
	 jCEfEHc4opB7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 679AE4078B;
	Tue, 13 Jan 2026 19:41:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E7280231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1835E406E3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MOXbO4iAmNTJ for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC75F406E1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC75F406E1
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB0FE81385; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:30:13 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 198829dc2f71ebb315ee019155d68fbc40de696d
X-Git-Newrev: 1627619ad02fa934aaf3174629a7f6e08a2a0c97
X-Patchwork-Hint: ignore
Message-Id: <20260113194033.AB0FE81385@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] gitignore: ignore
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
Content-Type: multipart/mixed; boundary="===============3171561543280041640=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3171561543280041640==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1627619ad02fa934aaf3174629a7f6e08a2a0c97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

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

--===============3171561543280041640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3171561543280041640==--
