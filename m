Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CBCC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 12:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A879606E0;
	Fri, 12 Jul 2024 12:49:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AJOdrgheIykW; Fri, 12 Jul 2024 12:49:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A998D606F0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A998D606F0;
	Fri, 12 Jul 2024 12:49:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4BB8F1BF40F
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 12:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3968F606F0
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 12:49:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jdRbXMkJJ6Kg for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 12:49:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57CC4606E0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57CC4606E0
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 12:49:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B9BA85D7E; Fri, 12 Jul 2024 12:49:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 14:47:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a316aeb7dabec9febd664422fd97a431717b59b8
X-Git-Newrev: e0f2414330b049276678a19a45a53bfb521c52f2
X-Patchwork-Hint: ignore
Message-Id: <20240712124925.4B9BA85D7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/gnuconfig: update
 config.sub/config.guess
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e0f2414330b049276678a19a45a53bfb521c52f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This adds support for Loongarch64 support.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/gnuconfig/README.buildroot |    2 +-
 support/gnuconfig/config.guess     | 1233 ++++++++++++++++++++----------------
 support/gnuconfig/config.sub       |  302 ++++++---
 3 files changed, 894 insertions(+), 643 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
