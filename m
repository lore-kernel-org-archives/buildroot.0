Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821E8CCF2D7
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 09:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5494460DA3;
	Mon, 19 Jan 2026 09:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t7ODz7E-sdhA; Mon, 19 Jan 2026 09:58:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD22F60D88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816736;
	bh=A8GN4JxnJSTm5Ke29x8sbNrq8ihKOvXeR235r04yhhk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=T1yBxQkWf6xnemJROeZBVWHsqNnJ7AQ5nGukrc4uh2IHus0eVk19WlVwgxypz8gk+
	 Mhck07exvP0GVTzSiXTBvE87eCmwPXTJDJBzp3KMq0j0JOZbxZFNRT19wMfOVyZw1b
	 BR68/uiHsgGeG9hXVeblK5cIBN4H0JsIX68YCDwROawh9UnXEbXAdv9LeXpuvqRmgo
	 zUWF1JO1u614gV+/DQFjpuvTupitgj4asqMD5+6+0HfcMGvhNugr9+B8JlZljuyqEK
	 k5FZ4FAaZef9P7FYdmNFFJrok5pgnO9VaNIPS7p25IswuOdKOeczCw9LQelfIL0pCv
	 Av2O8h7Vwh9Jw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD22F60D88;
	Mon, 19 Jan 2026 09:58:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 170B62CE
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD5AC40CF6
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jVFSzQuJMG1e for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAF4D40CE5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAF4D40CE5
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E879D8408E; Mon, 19 Jan 2026 09:58:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 09:16:29 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1a8b410c63af30927dbc6d94083c682119169e9c
X-Git-Newrev: eaeea525189b68a6f7888edab61effa156c342d0
X-Patchwork-Hint: ignore
Message-Id: <20260119095849.E879D8408E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/rpcbind: fix
 build failure due to missing BR2_PACKAGE_LIBTIRPC_RPCDB
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=eaeea525189b68a6f7888edab61effa156c342d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Package rpcbind requires libtirpc rpcdb option enabled. Package
libtirpc with commit [1] disabled rpcdb functions by default so let's
select it by default to enable rpcdb functions required.

[1]:
https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=7cea8ad66aecc21e6caae330b5d31075af399193

Fixes:
https://autobuild.buildroot.org/results/f461212605d9d5f1c38a1ffe00a83912522bf482/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a2159c80b51a4f8606e382c180bdeca8f92e9705)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/rpcbind/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rpcbind/Config.in b/package/rpcbind/Config.in
index 9cde7bba39..ec8f8ee1b5 100644
--- a/package/rpcbind/Config.in
+++ b/package/rpcbind/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_RPCBIND
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libtirpc
 	depends on BR2_USE_MMU 	# fork()
 	select BR2_PACKAGE_LIBTIRPC
+	select BR2_PACKAGE_LIBTIRPC_RPCDB
 	help
 	  The rpcbind utility is a server that converts RPC program
 	  numbers into universal addresses.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
