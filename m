Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9ED6C3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 13:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1533F418CA;
	Mon,  8 Jan 2024 13:00:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1533F418CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 49sQrr4PdVYD; Mon,  8 Jan 2024 13:00:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FF4641743;
	Mon,  8 Jan 2024 13:00:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FF4641743
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14E641BF292
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 12:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E29488140E
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 12:59:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E29488140E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ru7BIxYl1QCG for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 12:59:46 +0000 (UTC)
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C70F8131B
 for <buildroot@busybox.net>; Mon,  8 Jan 2024 12:59:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C70F8131B
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 8ABFD440865;
 Mon,  8 Jan 2024 14:57:32 +0200 (IST)
To: buildroot@busybox.net
Date: Mon,  8 Jan 2024 14:59:30 +0200
Message-ID: <955dd511a8904b18bce9c2ac8e27ad07c160e2b2.1704718771.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1704718652;
 bh=hhAD0qFWvE4Wp23oInf4obXsA4yvw31akTxtwXNElgE=;
 h=From:To:Cc:Subject:Date:From;
 b=XxwIgk+RPcIftFx1PaZ/8cqUxModPBTWW4MY2LqccKOVsrH8TRqaOMzL0W1YO916m
 8zydYcEd5Z8WaiN0Ct3TxBS8CWkgmw8Y078G5nnx7HSTMfyrMePgKpEzg5LIF6m/ZH
 qXJEjCeME8dbReB6NxWrHMWUZTf1/rkEpqS0dsMQ/LF4IdHcncNcOqvYZtCBNx63mC
 UhsWtGEJ1zNpqi7PyIBXh866zyG3Y9Iqs2dCKnZJtT+LxN/oDQqRX+Dk78FBJtm3bJ
 dh+/vH8LCm8k7VNycF0jTxwGlL2YZ0mYP2Fzezq7eoO2SUESgScLInpqrI4F90D8kF
 ZTzPQteaUTYzA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=XxwIgk+R
Subject: [Buildroot] [PATCH 1/2] package/rng-tools: update help text website
 reference
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We switched to new upstream since commit f9e9c6349afe0
("package/rng-tools: bump to 6.7"). Update the website URL as well.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/rng-tools/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rng-tools/Config.in b/package/rng-tools/Config.in
index be3f078a0bce..7f08fa25fbf7 100644
--- a/package/rng-tools/Config.in
+++ b/package/rng-tools/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_RNG_TOOLS
 	help
 	  Daemon to use hardware random number generators.
 
-	  http://sourceforge.net/projects/gkernel/
+	  https://github.com/nhorman/rng-tools
 
 if BR2_PACKAGE_RNG_TOOLS
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
