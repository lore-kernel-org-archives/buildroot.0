Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826D0C2D0CD
	for <buildroot@archiver.kernel.org>; Wed, 21 May 2025 10:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AF094083E;
	Wed, 21 May 2025 10:47:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6c4U2uh8Ok5s; Wed, 21 May 2025 10:47:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2491240822
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2491240822;
	Wed, 21 May 2025 10:47:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DC73A11B
 for <buildroot@buildroot.org>; Wed, 21 May 2025 10:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C26FD80E0D
 for <buildroot@buildroot.org>; Wed, 21 May 2025 10:47:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Avw_01lW_zq for <buildroot@buildroot.org>;
 Wed, 21 May 2025 10:47:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AF6BF80DDA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF6BF80DDA
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF6BF80DDA
 for <buildroot@buildroot.org>; Wed, 21 May 2025 10:47:22 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 3679D2C8469B;
 Wed, 21 May 2025 12:47:20 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 21 May 2025 12:47:17 +0200
Message-ID: <20250521104719.783458-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1747824440; bh=De4kfYO+zTwTVW7uubFUlnQ050JH4RWvfq0FcvEbGwI=;
 h=From:To:Cc:Subject:Date;
 b=gBBXDoxtlj9acwpbxUywqs6vPAvLo3/81Zj8osGciOc82bjZrsCshot0Lyl2YvtIj
 awwuzXr/HJUjnKgQfX7geK+MuQJnsptLWUHJKswwMlat/AvUCKg6gCJrbjg+wr5diM
 WJoS++x/m15q2Xvf0x01RMB4n/f9DS+BvWJemHMms8HzGAd2BnWAYgTbeKahJy6XC2
 pE4dDk4EkaMDrJcuHN8CH/Zk88Rr6E5L230N+6YQBCS/NKkGiVU3lY7nVNCj0CpkkQ
 BVwFFKZnwmKoxMZNWuF7I/d87+qhcRmuLrKPvhlmP5/4u3v7ziaNGpqb8uxM7TbmoJ
 AIliow6kWroLg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=gBBXDoxt
Subject: [Buildroot] [PATCH] package/python-click: bump to version 8.2.1
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bugfix release for click 8.2.0, changelog:
https://click.palletsprojects.com/en/stable/changes/#version-8-2-1

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-click/python-click.hash | 4 ++--
 package/python-click/python-click.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-click/python-click.hash b/package/python-click/python-click.hash
index c1076cc858..79b1df40d9 100644
--- a/package/python-click/python-click.hash
+++ b/package/python-click/python-click.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/click/json
-md5  b9d7fc7a25f30674c85da6f460628a17  click-8.2.0.tar.gz
-sha256  f5452aeddd9988eefa20f90f05ab66f17fce1ee2a36907fd30b05bbb5953814d  click-8.2.0.tar.gz
+md5  438cfd4974584ae4f960ffeab32e8991  click-8.2.1.tar.gz
+sha256  27c491cc05d968d271d5a1db13e3b5a184636d9d930f148c50b038f0d0646202  click-8.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  LICENSE.txt
diff --git a/package/python-click/python-click.mk b/package/python-click/python-click.mk
index e457b03b8b..9b64a0c351 100644
--- a/package/python-click/python-click.mk
+++ b/package/python-click/python-click.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CLICK_VERSION = 8.2.0
+PYTHON_CLICK_VERSION = 8.2.1
 PYTHON_CLICK_SOURCE = click-$(PYTHON_CLICK_VERSION).tar.gz
-PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/cd/0f/62ca20172d4f87d93cf89665fbaedcd560ac48b465bd1d92bfc7ea6b0a41
+PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/60/6c/8ca2efa64cf75a977a0d7fac081354553ebe483345c734fb6b6515d96bbc
 PYTHON_CLICK_SETUP_TYPE = flit
 PYTHON_CLICK_LICENSE = BSD-3-Clause
 PYTHON_CLICK_LICENSE_FILES = LICENSE.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
