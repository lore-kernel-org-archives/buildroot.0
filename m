Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39819C982C3
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 21:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07FE5615BA;
	Fri, 16 Jan 2026 21:02:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y1QCMg34TNtc; Fri, 16 Jan 2026 21:02:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35906615BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768597365;
	bh=Y9br4u+/r3TfevLHC3NygCozBPlNjI8e9sW2yGhhRRM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SVq/evFaaDqFLPdJFXzoPTu8QJ8cJRU8Qd9m9IcVJBNIMiAHL4JDoGXJCW1ess9zD
	 jfvkuYRbTqfDoqaMJlE0YBuDq6GB80Tx05sP6cfy88Gm1HGBztjOme7ZlQj+0hZalq
	 eVLgyuzhR0I4YGuVt/p8OpIuH8lOECl87QvBLDUgn6HKqSq8TsyfIxX17g2Kkyge+L
	 AwV8IOUlop0LXq22xBA1h3zpyXPtawUgHzoSqdeIkr8sYZSTq/jwRTkrv5SP5dZ8rQ
	 aejTm9jFnR5WxM/JGD+SaPB+sl0LpS9gswS64zThwpc9N6Bb/5jHGes+SSU/3thc6i
	 bMoSje1VBE4Eg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35906615BC;
	Fri, 16 Jan 2026 21:02:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2263C160
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12EA741A74
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:02:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 304bpRMyzZrM for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 21:02:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3318741A57
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3318741A57
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:02:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D9D7885E1; Fri, 16 Jan 2026 21:02:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Jan 2026 22:02:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f6e0678ba8c95a17b5ca7bedb05a0950ab727c9a
X-Git-Newrev: e4d075975f2ce0409a56902b0ef92fb34cdac167
X-Patchwork-Hint: ignore
Message-Id: <20260116210243.2D9D7885E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lsof: fix build failure due to
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

commit: https://git.buildroot.net/buildroot/commit/?id=e4d075975f2ce0409a56902b0ef92fb34cdac167
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Package lsof requires libtirpc rpcdb option enabled with non-glibc
toolchains since the bump of libtirpc to version 1.3.7 with buildroot
commit 3f3d6e43de9b4aac7df8545fd811171256f878d3 which includes upstream
commit:
https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=7cea8ad66aecc21e6caae330b5d31075af399193

Fixes:
https://autobuild.buildroot.net/results/59e/59e0cc2692a8a7d587f5a4da90ec268237141dab/

/home/autobuild/autobuild/instance-10/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/14.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld:
 print.c:(.text+0x166): undefined reference to `getrpcbynumber'

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lsof/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lsof/Config.in b/package/lsof/Config.in
index 48ceb39a99..424778d3d7 100644
--- a/package/lsof/Config.in
+++ b/package/lsof/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LSOF
 	bool "lsof"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_LIBTIRPC_RPCDB if BR2_PACKAGE_LIBTIRPC
 	help
 	  lsof (LiSt Open Files)
 	  The lsof tool lists information about files opened by
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
