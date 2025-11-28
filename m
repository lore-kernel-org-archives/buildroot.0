Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E9BD116EA
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 20:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20C8A809CD;
	Fri, 28 Nov 2025 20:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BjTB0wjRNlLA; Fri, 28 Nov 2025 20:24:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9985C8094E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9985C8094E;
	Fri, 28 Nov 2025 20:24:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7012A1A9
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 20:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6263F80903
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 20:24:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UUFufZsgwlbn for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 20:24:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=pkerbrat@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 30D2F8083F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30D2F8083F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 30D2F8083F
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 20:24:39 +0000 (UTC)
Received: from sejong (unknown [82.64.130.240])
 (Authenticated sender: pkerbrat@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 3EE28B0053E;
 Fri, 28 Nov 2025 21:24:35 +0100 (CET)
To: buildroot@buildroot.org
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
 Pierre-Yves Kerbrat <pkerbrat@free.fr>
Date: Fri, 28 Nov 2025 21:24:29 +0100
Message-ID: <20251128202429.2785183-1-pkerbrat@free.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764361477;
 bh=ZiMeKgJo8gBUMe7eTPdkjGOP5jL8PW13b0f0e89zK1A=;
 h=From:To:Cc:Subject:Date:From;
 b=lJTc8++EOZskfKQ/x4qSWw6FxD19DLcKV4SghKkLC2R6LrQuezN0IgYxVE+0Biuf7
 JyaXUcUeiAognuYzfrh1jciFbH/nSSfnwXz9vIYVfFhsMBdyjDDuoePtuI5Xmz1ig4
 I22zx+xMOTU6evOd+zvz2ANQGRYIROVBSSgWYY2pmC8cbSjWdvJ7HVqRkaMY5JsvWj
 K/KmXAj6gNh5NafcpsdhnDg/F/9VQGwiW3LpESQi71ifS7gTEWqTrN64Z5jtv5jaIO
 /EqF6O4708jypPczHnPfxi457D7/RW7H6fhnE8lTpGEVgmKIdl3TinmHVob8QAtfnk
 2SKJ9y030UguQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lJTc8++E
Subject: [Buildroot] [PATCH 1/1] package/git: bump to 2.52.0
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
From: Pierre-Yves Kerbrat via buildroot <buildroot@buildroot.org>
Reply-To: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://git.kernel.org/pub/scm/git/git.git/plain/Documentation/RelNotes/2.52.0.adoc

Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 19b212cd0d10..3dcd1d443723 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  60a7c2251cc2e588d5cd87bae567260617c6de0c22dca9cdbfc4c7d2b8990b62  git-2.51.0.tar.xz
+sha256  3cd8fee86f69a949cb610fee8cd9264e6873d07fa58411f6060b3d62729ed7c5  git-2.52.0.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index a01e7c9d5302..bd1c1eeb6176 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.51.0
+GIT_VERSION = 2.52.0
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
