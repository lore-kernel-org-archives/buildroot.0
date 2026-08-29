Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C92C61DCB
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 21:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A334F80E14;
	Sat, 29 Aug 2026 21:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dOsCrF7qZKuZ; Sat, 29 Aug 2026 21:20:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788038427;
	bh=224HC+iFYxf5wHLm7eM/2zHi5zv7z0Kj+8IHqq/KuLU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cqY97I/T6tz3wfeCPw2Mw0qQ7KVgtHZyJhTXl5McUIIdoyjdYt2x7GJH+EGrJsaOV
	 JFXK6VJP7oO51OtDXKJcrnniBeCjv0V3Fx0CUaZGG20X+IU+F/iuCZtUwv19inxfDX
	 8BL06zPXyPPXHH7Iel2Eon+C46dT21iG6//WP9krfWHILKTCA9P1Z8/gWYIyB51OMC
	 4YyBaeAh+LB58QPaV0Q9BMLIJP33VTdek6rHItl/6/Wh2JV9EAlettUM6KiV2wffjC
	 v3rIhIhnkCdsH3gToDgiUYl5Mo/z27XojPSF3tun2iPeyvWveM6v5chEupR3Gp5YP8
	 yrCrWcIP+lAPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8E9280E18;
	Sat, 29 Aug 2026 21:20:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B8FE79D4
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F50B605EE
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:20:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kRz4ClqYbV1H for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 21:20:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19B54605E9
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:20:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FAAC90BC2; Sat, 29 Aug 2026 21:19:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Aug 2026 23:20:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59efb9037f6ca57740d7736b4963c0bdabf57703
X-Git-Newrev: dd2fb3de1146b2317c0f2eef20b8afa6b0de25f5
X-Patchwork-Hint: ignore
Message-Id: <20260829211927.4FAAC90BC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: minor aesthetic cleanups in
 "Getting Buildroot"
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dd2fb3de1146b2317c0f2eef20b8afa6b0de25f5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Minor tweaks including proper capitalization.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/getting.adoc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/manual/getting.adoc b/docs/manual/getting.adoc
index b3a451f67d..4b5eae0150 100644
--- a/docs/manual/getting.adoc
+++ b/docs/manual/getting.adoc
@@ -15,14 +15,14 @@ available in `support/misc/Vagrantfile` in the Buildroot source tree
 to quickly set up a virtual machine with the needed dependencies to
 get started.
 
-If you want to setup an isolated buildroot environment on Linux or Mac
-Os X, paste this line onto your terminal:
+If you want to set up an isolated Buildroot environment on Linux or Mac
+OS X, paste this line into your terminal:
 
 ----
 curl -O https://buildroot.org/downloads/Vagrantfile; vagrant up
 ----
 
-If you are on Windows, paste this into your powershell:
+If you are on Windows, paste this into your PowerShell:
 
 ----
 (new-object System.Net.WebClient).DownloadFile(
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
