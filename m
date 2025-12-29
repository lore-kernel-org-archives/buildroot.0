Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F06E9272A
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 14:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2804F40831;
	Mon, 29 Dec 2025 14:08:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KX82kDJd1qGY; Mon, 29 Dec 2025 14:08:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C14040807
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767017281;
	bh=XDS/mSR+8GWxnP1GupfV8711utMmKnJF6yHF5iVyw2M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FDU2xVCmwkPaREDgp/2de0bW6+qAbZkz9wtAXNowU3OG9OvupS/OoMJWkEojsGnbz
	 dIXiu6NE6cwkXOKRwLGLlIk+I/7LW10QPQM4xahua7A/1GdSJRApkLR5rzBrKh9CwK
	 /bWU6dxiu/Dhksjiz0q/KjhyCuEhvxiEZ38kEUjsmBaRO+ZI7fn2uNOQfI6QnJS+kB
	 FG//jOqpbue48ASrfGucVLT5Qp0F7ZhKB/9lu/vfd2jWqBosg7HlUxCQj+qaalE6Hb
	 rTM7PtmkYJG0R+H+mOuvmyNtulahLSOsoSzvyX6GD4KWZuGnMW13LEq1C4IVB8e+rN
	 Qg6LAzxcAFfYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C14040807;
	Mon, 29 Dec 2025 14:08:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BED22B9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 886FA40067
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:07:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id baaBRGDSHESk for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 14:07:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD8A3402C6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD8A3402C6
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:07:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A037187B49; Mon, 29 Dec 2025 14:07:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 15:06:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 848d7dc51f1ce2576cb071b0f91063e4687cc088
X-Git-Newrev: eb0dde58b3f0fa6cd3120343094634fc8a13412d
X-Patchwork-Hint: ignore
Message-Id: <20251229140743.A037187B49@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dovecot: add CVE trailer in patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb0dde58b3f0fa6cd3120343094634fc8a13412d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch b/package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
index 04b8f5392a..99a2b83563 100644
--- a/package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
+++ b/package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
@@ -12,6 +12,7 @@ Fixed by moving mechanisms and username_filter from struct passdb_module
 to struct auth_passdb, which is where they should have been in the first
 place.
 
+CVE: CVE-2022-30550
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  src/auth/auth-request.c |  6 +++---
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
