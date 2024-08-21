Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C473AC5472C
	for <buildroot@archiver.kernel.org>; Wed, 21 Aug 2024 13:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 569DC4052D;
	Wed, 21 Aug 2024 13:05:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jeKCBPWuie5s; Wed, 21 Aug 2024 13:05:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 264284053B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 264284053B;
	Wed, 21 Aug 2024 13:05:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ED56A1BF3C0
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 13:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E40084053B
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 13:05:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uRJN_qo72Rid for <buildroot@lists.busybox.net>;
 Wed, 21 Aug 2024 13:05:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BD25A4052D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD25A4052D
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD25A4052D
 for <buildroot@buildroot.org>; Wed, 21 Aug 2024 13:05:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id BED004000E;
 Wed, 21 Aug 2024 13:05:48 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>,
 Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Aug 2024 15:05:45 +0200
Message-ID: <20240821130547.2036270-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724245549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=f4dYm/InlbDfccP2tYeqQ4cxXBa+4v/CRlJEDsbLSzY=;
 b=oQfIcYuw9RL4i+3GO5xWNOamjQVnkSjwX97YXMIV1Ffdtajn8A6Pob0goihhhtog8/TpCl
 E/Np7WsX18hnn+PLmg1iZiVW5aGd+WXC9o03Dqx5Xx6NZ0E43pFDV84a+C4MhqGKQ66u+z
 eRBxbaEzkuo9gkpPIpepKc+ZFhjCn2XMZgizE5DuYnr9O0b6lzn5RYpdmINCelTgjpx0tq
 16fKJ/w2nxdq+MGWiuAe8hCSBSde+ZbHUCSh7gYq/fRCiwN1SbOId9R7NJl/GiLVpviLrz
 zS5z4zBFjrktzKb4iPBDZgayfnBLyI4AKezMpmswi5uvomBmhiiX46BGiEhENg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oQfIcYuw
Subject: [Buildroot] [PATCH 2024.02.x 1/2] package/gcc: renumber 11.4.0
 patches
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Patch 0009 should be numbered 0008.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ning.patch => 0008-libiberty-Darwin-Fix-a-build-warning.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/gcc/11.4.0/{0009-libiberty-Darwin-Fix-a-build-warning.patch => 0008-libiberty-Darwin-Fix-a-build-warning.patch} (100%)

diff --git a/package/gcc/11.4.0/0009-libiberty-Darwin-Fix-a-build-warning.patch b/package/gcc/11.4.0/0008-libiberty-Darwin-Fix-a-build-warning.patch
similarity index 100%
rename from package/gcc/11.4.0/0009-libiberty-Darwin-Fix-a-build-warning.patch
rename to package/gcc/11.4.0/0008-libiberty-Darwin-Fix-a-build-warning.patch
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
