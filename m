Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57AAC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 22:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 959F9813CF;
	Fri, 12 Jul 2024 22:04:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LvRmhCNqPQlf; Fri, 12 Jul 2024 22:04:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6EB1812B9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6EB1812B9;
	Fri, 12 Jul 2024 22:04:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8CA2B1BF427
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78D13410C1
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:04:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ob_p59MsIXPc for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 22:04:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 09A6040C27
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09A6040C27
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09A6040C27
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 22:04:37 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 13FD8B0053E;
 Sat, 13 Jul 2024 00:04:35 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 00:04:31 +0200
Message-ID: <20240712220431.453080-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1720821876;
 bh=V1L21/4r8c2GbilbLeXx4lewjxMoSyhFN/kns4DhjoU=;
 h=From:To:Cc:Subject:Date:From;
 b=ZVu5TVVmyuTjkB5G0+v9SDAZC4ud3R6Cq2BKm19mJ4J7ZP3H4+2yqpiyf1xBbmpA4
 rT+SGVjmy7/xLA17dTQ5CtrkBh8hq+6roD/U2kkMyDw6ioY/rd7Pvsy3d4dbo2qBs0
 lll7nNhuO96CATH5pzx77AnPFGLIyNSmoIHX/BmnltSUsYZqe9XECJzRK7kUhDi1TF
 cvKViEpgRmOg1TC9Ru2+Jlw/xvOWGjDsV84PZDcGWJNeZWauRz6fWOw7qhZ+/VvBdJ
 O+fU7UMejSfaHeUD9uZT8uLpZ3hZXHqQWsHbnAACpHWGpoooZnZ/ngg/HdYbSIk5mb
 RGVUpoj5IUL/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZVu5TVVm
Subject: [Buildroot] [PATCH 1/1] package/btrfs-progs: update Kconfig package
 homepage URL
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The btrfs-progs homepage [1] show a banner:

    OBSOLETE CONTENT
    This wiki has been archived and the content is no longer updated.

    NOTE: this wiki is archived and not updated anymore (02/2023).
    Contents will be migrated to https://btrfs.readthedocs.io

This commit updates the URL to the new one at [2].

[1] https://btrfs.wiki.kernel.org/index.php/Main_Page
[2] https://btrfs.readthedocs.io

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/btrfs-progs/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/btrfs-progs/Config.in b/package/btrfs-progs/Config.in
index 35dfc39193..bae096061d 100644
--- a/package/btrfs-progs/Config.in
+++ b/package/btrfs-progs/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_BTRFS_PROGS
 	help
 	  Btrfs filesystem utilities
 
-	  https://btrfs.wiki.kernel.org/index.php/Main_Page
+	  https://btrfs.readthedocs.io
 
 comment "btrfs-progs needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
