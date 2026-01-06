Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C1FCEFD19
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 22:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EB5340693;
	Tue,  6 Jan 2026 22:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mpbhJrK0KR6N; Tue,  6 Jan 2026 22:16:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE571408E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767737776;
	bh=Yt/BKK2zP7TqYL7LP5CUU2KjYy0Q0ZdA4INMoCTQCco=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iV7zqL4gBtzQEIjwEfR6oUgzeTHxGOSxx/wRQJwXtwCNsovbRZS/Ly8+rzbBuUS/3
	 DmRSSzYlKV+UrdW5jxEJkbigP9o/HlHcF6CujcGC/vNoC0F7/JK7t6YWHWZDb63nH1
	 s7cp4hae7jHU+dERqsp1KO5MUlYg/3uusK8XhDnEyZDzz7HtPEAWz8zA2R82KsaVzt
	 dRJvJqeX1S0OxYuPPqwfwJ4T+fMJfO3GxzH7D8YpMKY2+60cbVhiTejeyAQmC32eKH
	 jJVuyW1Soi9X/971p4mTCTp4vc840338jqwORuvxFJGmKjfJXnDCjFsFsqdoPt2Xk4
	 wS9rzzOWTtP3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE571408E0;
	Tue,  6 Jan 2026 22:16:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A6D9249
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78AF440693
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JakIwKp0EICY for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 22:16:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0F99402CD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0F99402CD
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:16:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA94D8834A; Tue,  6 Jan 2026 22:16:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 23:14:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 83d0ba5faf990b556fc638edd34e1be971ba7338
X-Git-Newrev: a2159c80b51a4f8606e382c180bdeca8f92e9705
X-Patchwork-Hint: ignore
Message-Id: <20260106221613.BA94D8834A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpcbind: fix build failure due to
 missing BR2_PACKAGE_LIBTIRPC_RPCDB
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

commit: https://git.buildroot.net/buildroot/commit/?id=a2159c80b51a4f8606e382c180bdeca8f92e9705
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
