Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45F8D3ABF5
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 19:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55F078100C;
	Mon, 11 Nov 2024 19:53:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1_yyTFMR1Kji; Mon, 11 Nov 2024 19:52:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 658F981004
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 658F981004;
	Mon, 11 Nov 2024 19:52:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5091E6C
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 19:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E00E40527
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 19:52:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ic_typoBhHeb for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 19:52:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 346F14045E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 346F14045E
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 19:52:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1B81D86097; Mon, 11 Nov 2024 19:52:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 11 Nov 2024 20:52:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5a59c24e577f19111bef37af946ad498f689ccd8
X-Git-Newrev: 48490cf7b13a9f0e942adb7bb4691a9459137db6
X-Patchwork-Hint: ignore
Message-Id: <20241111195257.1B81D86097@busybox.osuosl.org>
Subject: [Buildroot] [git commit] CHANGES: add issues resolved in 2024.11-rc1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=48490cf7b13a9f0e942adb7bb4691a9459137db6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 CHANGES | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/CHANGES b/CHANGES
index f00ffdd5ab..5094e91b5b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -38,6 +38,14 @@
 	pyqt5, python-sdbus, python-sdbus-networkmanager, rrdtool,
 	unbound, which
 
+	Issues resolved:
+	- host rpath fixups misses needed directory
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/39
+	- procps-ng: build failure when linking to systemd
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/28
+	- ripgrep leaves /usr/crates2.json / .crates.toml files
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/17
+
 2024.08.1, released October 20th, 2024
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
