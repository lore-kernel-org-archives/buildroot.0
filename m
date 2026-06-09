Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B5D7CD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92E13858FD;
	Tue,  9 Jun 2026 13:02:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6vJPZwh-W7Uk; Tue,  9 Jun 2026 13:02:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A851E858BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010168;
	bh=hRjp2ver9/hRhLzhfE63mkNo8ocE3r3tTZlFwzHopIU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PDJYsJBiSF8JgJCR8ch0vVaIDGY+ftsyUlNWall+oab1od/znDaXPRWN5EXclei0f
	 nTH2fKN1JqeZ09FfVUQ2jYUKtNpZpTzxbE2kV97qfVv7FBybmwbXsvfiiywohYUMU/
	 0VdBHvL5s80XYQ27QcMc4wY5UW4nZPIB9cmi3Ois9bevw2NhEoAHgCZAtQpE2RtE4t
	 yDqABFGvxwxi0abu/oF1rRbA37PhXA6LqcKraMumizE8L/fg5ESM5ODOMjSKt677C+
	 KH2abKuKpVU5G11jZdKqw3mwJYKAjkj3h9903WRdvXY0ThsFNm9gIsm352kJNatL4v
	 uOUOtnc/En8GQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A851E858BC;
	Tue,  9 Jun 2026 13:02:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8434B196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 761786F691
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k7TZyaEbCUJ8 for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3CD16F67E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3CD16F67E
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F39EB87E86; Tue,  9 Jun 2026 13:01:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Jun 2026 14:55:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 32351f979822a0b3a45b82c2d82bdb2328b02f5a
X-Git-Newrev: c7f2991ac3a09640702d5e120c2f7d46086302d9
X-Patchwork-Hint: ignore
Message-Id: <20260609130126.F39EB87E86@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Merge branch 'next'
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c7f2991ac3a09640702d5e120c2f7d46086302d9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Patch is too large, so refusing to show it
Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
