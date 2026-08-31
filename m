Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C66C61DF0
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 06:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91C1B4054E;
	Mon, 31 Aug 2026 06:00:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QUwZnrqkLO0O; Mon, 31 Aug 2026 06:00:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788156028;
	bh=gVOvtZHhsDbvevXE9Cf180LWOP5wHzwvvluYjhMbDMw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IzZNJRvP09SFc1Yeb7k3ILX5huvgjQ4wzloXHTUcO3g/CAYpNYN8OPphXgTyS3AsR
	 cxWoZ9fkaMzIEDtM88rCEdw7qXJ92R4G9zQgArgWWoTShVDtNOBAoBTJkczCPJyftH
	 AMLM5NsD4Kjcx3EZnpVhjhY3U6ljKxlgWULhsXdFvUk8wMaA8CYnYWocZthRxSiZGm
	 /Na0+6cUQCAXnW6iU69vRkQlhoiWx+Y7O5L892o+tqlKWM2KXF1bsGkuZqZcwfF2X0
	 T/PsobLQiFu2QnYIcs0ESdLBUATNZb4ry/KWbnBHTT4oIMiIXBjsz2QVRW18Xgh09a
	 78Z6dWhHUpDGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 460BA4054F;
	Mon, 31 Aug 2026 06:00:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 409B0356
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 06:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 328B2605D8
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 06:00:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n6fAJD_c4h3q for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 06:00:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 268BE605D5
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 06:00:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C64BB923A7; Mon, 31 Aug 2026 05:59:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 31 Aug 2026 07:58:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 911dc3a5d28ca33a1e44358a5c4760a6eba1f9ae
X-Git-Newrev: 2d7d9d8200232bce215d87cadda443ba74308f01
X-Patchwork-Hint: ignore
Message-Id: <20260831055926.C64BB923A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: patchwork is now at
 patchwork.buildroot.org
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2d7d9d8200232bce215d87cadda443ba74308f01
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

patchwork.buildroot.org used to be a redirect to patchwork.ozlabs.org,
but we are now running our own instance, so let's adjust the links in
the manual accordingly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/contribute.adoc | 10 +++++-----
 docs/manual/resources.adoc  |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
index a0002ce188..f82eb14303 100644
--- a/docs/manual/contribute.adoc
+++ b/docs/manual/contribute.adoc
@@ -460,7 +460,7 @@ editing the commit message. Below the +Signed-off-by+ section, add
 
 Although the changelog will be visible for the reviewers in the mail
 thread, as well as in
-https://patchwork.ozlabs.org/project/buildroot/list/[patchwork], +git+
+https://patchwork.buildroot.org/project/buildroot/list/[patchwork], +git+
 will automatically ignores lines below +---+ when the patch will be
 merged. This is the intended behavior: the changelog is not meant to
 be preserved forever in the +git+ history of the project.
@@ -513,19 +513,19 @@ $ git format-patch -v4 -M -s -o outgoing origin/master
 
 When you provide a new version of a patch, please mark the old one as
 superseded in
-https://patchwork.ozlabs.org/project/buildroot/list/[patchwork]. You
+https://patchwork.buildroot.org/project/buildroot/list/[patchwork]. You
 need to create an account on
-https://patchwork.ozlabs.org/project/buildroot/list/[patchwork] to be
+https://patchwork.buildroot.org/project/buildroot/list/[patchwork] to be
 able to modify the status of your patches. Note that you can only change
 the status of patches you submitted yourself, which means the email
 address you register in
-https://patchwork.ozlabs.org/project/buildroot/list/[patchwork] should
+https://patchwork.buildroot.org/project/buildroot/list/[patchwork] should
 match the one you use for sending patches to the mailing list.
 
 You can also add the +--in-reply-to=<message-id>+ option when
 submitting a patch to the mailing list. The id of the mail to reply to
 can be found under the "Message Id" tag on
-https://patchwork.ozlabs.org/project/buildroot/list/[patchwork]. The
+https://patchwork.buildroot.org/project/buildroot/list/[patchwork]. The
 advantage of *in-reply-to* is that patchwork will automatically mark
 the previous version of the patch as superseded.
 
diff --git a/docs/manual/resources.adoc b/docs/manual/resources.adoc
index a1b8b366e1..331929e0c6 100644
--- a/docs/manual/resources.adoc
+++ b/docs/manual/resources.adoc
@@ -68,4 +68,4 @@ review comments in a clean and concise web interface, it can be useful
 for all Buildroot developers.
 +
 The Buildroot patch management interface is available at
-https://patchwork.ozlabs.org/project/buildroot/list/[].
+https://patchwork.buildroot.org/project/buildroot/list/[].
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
