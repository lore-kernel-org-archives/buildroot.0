Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BECECE582
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 07:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B85AB41348;
	Tue, 10 Sep 2024 07:10:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HlSbyB-z0w6o; Tue, 10 Sep 2024 07:10:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0B43417B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0B43417B5;
	Tue, 10 Sep 2024 07:10:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 40A8D1BF2C1
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 07:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C7DC40990
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 07:08:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rWqbSl1UOAVz for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 07:08:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 299DA40399
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 299DA40399
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 299DA40399
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 07:08:57 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::224])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 6C48DC35D3
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 07:08:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 44A5CE000B;
 Tue, 10 Sep 2024 07:08:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1snuza-00HS4D-2O;
 Tue, 10 Sep 2024 09:08:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 09:08:11 +0200
Message-Id: <20240910070823.4158894-32-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910070823.4158894-1-peter@korsgaard.com>
References: <20240910070823.4158894-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 31/42] package/flutter-pi: fix Raspberry typo
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flutter-pi/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flutter-pi/Config.in b/package/flutter-pi/Config.in
index 223e29749c..ec2ef70737 100644
--- a/package/flutter-pi/Config.in
+++ b/package/flutter-pi/Config.in
@@ -24,7 +24,7 @@ menuconfig BR2_PACKAGE_FLUTTER_PI
 	  Desktop & have X11 or Wayland load up; just boot into the
 	  command-line.
 
-	  Although flutter-pi is only tested on a Rasberry Pi 4
+	  Although flutter-pi is only tested on a Raspberry Pi 4
 	  2GB, it should work fine on other linux platforms supported
 	  by Flutter so long as there is support for KMS and DRI.
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
