Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B91D3B7E5
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 10:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BE5B8174D;
	Mon, 29 Dec 2025 10:25:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gY-jLlCPfLqc; Mon, 29 Dec 2025 10:25:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7203381780
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767003935;
	bh=0BpTc+pXD3jFwzHrtaT1xoYppSLeYI54Lr10jHMzn3s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Wb3CJAwz8gnEmbj0SxEmOxMzJ/lgkmQkI6729swC1FZbbf6mcioixZ/DeSQuA9bLc
	 x0T1DQ0vbyuyQXzK9v2ErY4TyX8kys12b/K1W8DZ0RKxV9DSJRQxX/uBaorNtTUlj7
	 cnNfjvBiQq3Y5eNxPpSCH9S6gfwfogZ9NHkt/XnALVmSOat5hwL9q4J21bcYX6OhZu
	 equ4zzqRVC0zC8kohNkmqEnUNV4G74bAixvJG7sb/ZIUEmJ4UeUud+Ns4z4Z6h8mrD
	 5zJoLUiXF2ewaq3Dz73D+KXaU1OIH0+Nqkodmpvz56gReOGNqTGdGJOeD5vaMy/VSl
	 JErouKSM4Wgew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7203381780;
	Mon, 29 Dec 2025 10:25:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F68C1E1
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 10:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6142560AD7
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 10:25:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UJHnjXiDRvyH for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 10:25:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BEE460773
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BEE460773
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 10:25:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 432B987A69; Mon, 29 Dec 2025 10:25:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 11:24:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8892bb2b384aba54c9b7b99287067b9150f91ade
X-Git-Newrev: f8b9a50a0e6579abacdacdb920cfbde26347f5f9
X-Patchwork-Hint: ignore
Message-Id: <20251229102532.432B987A69@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/collectl: switch to GitHub
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f8b9a50a0e6579abacdacdb920cfbde26347f5f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

development no longer on https://sourceforge.net/projects/collectl/
but documentation still on https://collectl.sourceforge.net/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/collectl/Config.in     | 2 +-
 package/collectl/collectl.hash | 2 +-
 package/collectl/collectl.mk   | 3 +--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/collectl/Config.in b/package/collectl/Config.in
index 28379abe25..7a62c935ec 100644
--- a/package/collectl/Config.in
+++ b/package/collectl/Config.in
@@ -9,4 +9,4 @@ config BR2_PACKAGE_COLLECTL
 	  disk, inodes, infiniband, lustre, memory, network, nfs,
 	  processes, quadrics, slabs, sockets and tcp.
 
-	  http://collectl.sourceforge.net/
+	  https://collectl.sourceforge.net/
diff --git a/package/collectl/collectl.hash b/package/collectl/collectl.hash
index 1785d25d87..6714e2afcc 100644
--- a/package/collectl/collectl.hash
+++ b/package/collectl/collectl.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  9fab4769441c07201748e52c7f8c7b21526ab45a05142dd2b2b1fa5c16c38750  collectl-4.3.2.src.tar.gz
+sha256  552bdbe9e97071767bf0871789e19ede7d2827b68824e75da9cd7664218ea440  collectl-4.3.2.tar.gz
 sha256  b92800d37afa2aa03c02817ff3b68efc7236436fe76af06ad9b1fc4682f59bcb  ARTISTIC
 sha256  264fe27852db5624e6a9a9845b4e14e91ee5007305b33e5556dfade394d578a8  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  GPL
diff --git a/package/collectl/collectl.mk b/package/collectl/collectl.mk
index c6cb2e1494..358f8e3cb6 100644
--- a/package/collectl/collectl.mk
+++ b/package/collectl/collectl.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 COLLECTL_VERSION = 4.3.2
-COLLECTL_SOURCE = collectl-$(COLLECTL_VERSION).src.tar.gz
-COLLECTL_SITE = http://downloads.sourceforge.net/collectl/collectl
+COLLECTL_SITE = $(call github,sharkcz,collectl,$(COLLECTL_VERSION))
 COLLECTL_LICENSE = Artistic or GPL-2.0
 COLLECTL_LICENSE_FILES = COPYING ARTISTIC GPL
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
