Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F9B2C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 18:56:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73C0B60EB2
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 18:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 73C0B60EB2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 355196079A;
	Sat, 31 Jul 2021 18:56:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VGzSYxFaCKnq; Sat, 31 Jul 2021 18:56:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84367606C6;
	Sat, 31 Jul 2021 18:56:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 88F5D1BF352
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 18:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78A09831F2
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 18:56:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GzytwmYiUESh for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 18:56:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9EE2882CDD
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 18:56:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 7AAD5240003;
 Sat, 31 Jul 2021 18:56:04 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Buildroot List <buildroot@buildroot.org>
Date: Sat, 31 Jul 2021 20:55:58 +0200
Message-Id: <20210731185600.2238723-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210731185600.2238723-1-thomas.petazzoni@bootlin.com>
References: <20210731185600.2238723-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/binutils: default to version 2.36.x
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Now that we have added version 2.37, it's time to use the 2.36.x
series as the default version.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 6190ee4d97..91ce209583 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -7,7 +7,7 @@ config BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_35_X if !BR2_arc && !BR2_csky
+	default BR2_BINUTILS_VERSION_2_36_X if !BR2_arc && !BR2_csky
 	default BR2_BINUTILS_VERSION_ARC if BR2_arc
 	default BR2_BINUTILS_VERSION_CSKY if BR2_csky
 	help
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
