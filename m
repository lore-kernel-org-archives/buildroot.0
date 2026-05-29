Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE082CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 18:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A7B961631;
	Fri, 29 May 2026 18:25:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RR3YCILSO736; Fri, 29 May 2026 18:25:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A200761636
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780079126;
	bh=1IAJZJHIXfdGqxjMw/RSo+vYbEua+2Typz9D3GUkPGo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gTjPijxPcjVPP6dPF2cHTLNI26Q0bwHPpQ4UELTyNzrY1TnOzfXJy2E8I7ACoVp03
	 ss4m0S1lRbyLIY5snPcXTryo62GUA/jlJ0Qet0HWh1tBf51DBUn1LkjZGHeeoowmwZ
	 w8eU1ZZ3AeKvxTYg4xr3dGiTqiq7NmFq1rAGWPM5CJgsG4P3jMxKElL19g32UPuCQP
	 M5o0s9y9TJdZmsbRywtWzP9lg32yxJ7n46QtSXgYgZjRrv21yJYXKULoZ23rCw4P4X
	 KHw+74BpH+PVvF1FXxtCgLbWxLyyC4Lrgsn9m/izbF0NzPvnaYPUbAbFsIJpYLJcLN
	 J3KmiEZFbb2Vw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A200761636;
	Fri, 29 May 2026 18:25:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C26B1288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1614421FB
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:25:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S5GQsguqF5QD for <buildroot@buildroot.org>;
 Fri, 29 May 2026 18:25:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D243540449
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D243540449
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:25:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2ED7987420; Fri, 29 May 2026 18:25:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 20:24:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8500fe7ef0999945b44e4f179493f8739be5b8fe
X-Git-Newrev: dbdc45e9b0d610bccda7a55a03addc03e3ca3c00
X-Patchwork-Hint: ignore
Message-Id: <20260529182512.2ED7987420@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs: add OpenSSF best practices badge
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dbdc45e9b0d610bccda7a55a03addc03e3ca3c00
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

As of today, the Buildroot project is now 100% compliant with
OpenSSF Best Practices self-assesment. Let's therefore advertise this
in our SECURITY.md and in the footer of the website.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 SECURITY.md              | 2 ++
 docs/website/footer.html | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/SECURITY.md b/SECURITY.md
index 6b21ffd2b9..85740a15a5 100644
--- a/SECURITY.md
+++ b/SECURITY.md
@@ -1,5 +1,7 @@
 # Security Policy
 
+ [![OpenSSF Best Practices](https://www.bestpractices.dev/projects/12245/badge)](https://www.bestpractices.dev/projects/12245)
+
 ## Security advisories
 
 Advisories for Buildroot security vulnerabilities are reported on the
diff --git a/docs/website/footer.html b/docs/website/footer.html
index 82901b7ee6..b93fa46ebb 100644
--- a/docs/website/footer.html
+++ b/docs/website/footer.html
@@ -3,5 +3,11 @@
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.7.1/clipboard.min.js" integrity="sha256-Daf8GuI2eLKHJlOWLRR/zRy9Clqcj4TUSumbxYH9kGI=" crossorigin="anonymous"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/x2js/1.2.0/xml2json.min.js" integrity="sha256-RbFvov4fXA9DW/RzOAcIC0ZHIDmghGdsoug5slJHMMI=" crossorigin="anonymous"></script>
 	<script type="text/javascript" src="js/buildroot.js"></script>
+
+	<div style="text-align: center">
+		<a href="https://www.bestpractices.dev/projects/12245">
+			<img src="https://www.bestpractices.dev/projects/12245/badge">
+		</a>
+	</div>
 </body>
 </html>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
