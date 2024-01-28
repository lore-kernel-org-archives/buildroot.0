Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8955C46CD2
	for <buildroot@archiver.kernel.org>; Sun, 28 Jan 2024 00:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C87D4012E;
	Sun, 28 Jan 2024 00:11:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C87D4012E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VxPHgIty01cc; Sun, 28 Jan 2024 00:11:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3501D40133;
	Sun, 28 Jan 2024 00:11:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3501D40133
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD8B11BF5DC
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 00:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F45B82525
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 00:11:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F45B82525
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ilr1au6-ChZS for <buildroot@lists.busybox.net>;
 Sun, 28 Jan 2024 00:11:24 +0000 (UTC)
X-Greylist: delayed 471 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 28 Jan 2024 00:11:23 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFF9382513
Received: from aven.230ruedubac.fr (unknown [IPv6:2001:bc8:2e57:145::87])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DFF9382513
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 00:11:23 +0000 (UTC)
Received: from aven.230ruedubac.fr (localhost [127.0.0.1])
 by aven.230ruedubac.fr (230ruedubac.fr domain) with ESMTP id 2005D56497A;
 Sun, 28 Jan 2024 00:03:29 +0000 (UTC)
Received: from alden.230ruedubac.fr (knet.230ruedubac.fr [45.83.230.42])
 by aven.230ruedubac.fr (230ruedubac.fr domain) with ESMTPS id F0996564979;
 Sun, 28 Jan 2024 00:03:28 +0000 (UTC)
Received: from nb043690.eth.internal (_gateway [192.168.2.254])
 by alden.230ruedubac.fr (230ruedubac.fr domain) with ESMTPA id B1F3832B98D;
 Sun, 28 Jan 2024 00:02:58 +0000 (UTC)
From: David Barbion <davidb@230ruedubac.fr>
To: buildroot@buildroot.org
Date: Sun, 28 Jan 2024 01:02:56 +0100
Message-ID: <20240128000256.328107-1-davidb@230ruedubac.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=230ruedubac.fr; s=mail; t=1706400209;
 bh=IT9AhWGy9snRbRX73HkgzzOhCgflbAUM/YnEWQdto3U=;
 h=From:To:Cc:Subject:Date:From;
 b=M2QKGk5tnsJMCqnfx3aELlO7RRcT+0PUSmwVRr6cE9j6/FiPSNUFSb1quj/3Zdfn8
 9+N+Z8dy9gQ4kmolTIT6VqV4NR9QUQF6hqNhBZb0k2lOz/jXnzUrYHYVGxPteB+20z
 vKCXKbRUeHqR/9yxldzdXDTiNU1Mrosc52M8bJyE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=230ruedubac.fr header.i=@230ruedubac.fr
 header.a=rsa-sha256 header.s=mail header.b=M2QKGk5t
X-Mailman-Original-Authentication-Results: aven.230ruedubac.fr;
 dmarc=fail (p=none dis=none)
 header.from=230ruedubac.fr
Subject: [Buildroot] [PATCH 1/1] package: dhcpcd: bump to 10.0.5
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
Cc: John Stile <johns@msli.com>, David Barbion <davidb@230ruedubac.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version contains a fix for aarch64 based systems.

Signed-off-by: David Barbion <davidb@230ruedubac.fr>
---
 package/dhcpcd/dhcpcd.hash | 2 +-
 package/dhcpcd/dhcpcd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
index b015dce4ac..fb4f6064bc 100644
--- a/package/dhcpcd/dhcpcd.hash
+++ b/package/dhcpcd/dhcpcd.hash
@@ -1,4 +1,4 @@
 # sha256 from https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.0.4
-sha256  ced5bbde8da3726eac77b9e77e4f31a89c9849d811ef8a2c749664fc5f55a718  dhcpcd-10.0.4.tar.xz
+sha256  eb1f3cfef3069781ff8c896d7cea922639964afe22db28c069dc3f37f57eb428  dhcpcd-10.0.5.tar.xz
 # Locally calculated
 sha256  a7d6da3a202cdd38eaab0bcea4d25f60d002980f3785b3e896d9bf387f093ac8  LICENSE
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index ba1481e83d..ab3f98dd5a 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 10.0.4
+DHCPCD_VERSION = 10.0.5
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.xz
 DHCPCD_SITE = https://github.com/NetworkConfiguration/dhcpcd/releases/download/v$(DHCPCD_VERSION)
 DHCPCD_DEPENDENCIES = host-pkgconf
-- 
2.43.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
