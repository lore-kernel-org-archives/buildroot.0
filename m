Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AC2C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 19:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 669A981772;
	Wed,  1 May 2024 19:59:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g7xNXUf5mzi0; Wed,  1 May 2024 19:59:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2499A81BFA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2499A81BFA;
	Wed,  1 May 2024 19:59:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C93191BF2C9
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A99640598
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:58:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id njQQLFssh2aP for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 19:58:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0A5B405E9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0A5B405E9
 for <buildroot@buildroot.org>; Wed,  1 May 2024 19:58:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9BF0486486; Wed,  1 May 2024 19:58:24 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 1 May 2024 21:57:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c34e40fb65952c6f1a681e88dcd2995a90e83031
X-Git-Newrev: 13602787bc17ead55f30456d8932d705e927ddc7
X-Patchwork-Hint: ignore
Message-Id: <20240501195824.9BF0486486@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain: remove binutils bug 27597
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=13602787bc17ead55f30456d8932d705e927ddc7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Binutils bug 27597 is not present anymore in Buildroot so let's remove it.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 toolchain/Config.in | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index e8b3db64fb..944e573f82 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -70,12 +70,6 @@ source "package/gdb/Config.in.host"
 
 comment "Toolchain Generic Options"
 
-# https://sourceware.org/bugzilla/show_bug.cgi?id=27597
-# Affect toolchains built with binutils 2.36.1, still not fixed.
-config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
-	bool
-	default y if BR2_nios2
-
 # https://sourceware.org/bugzilla/show_bug.cgi?id=30730
 # Affect toolchains built with binutils 2.40, still not fixed.
 config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
