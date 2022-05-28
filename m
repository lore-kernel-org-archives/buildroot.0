Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0BFC433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 23:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A069B40B9E;
	Sat, 28 May 2022 23:41:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lBcJfTFzG2Zh; Sat, 28 May 2022 23:41:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C015940B9C;
	Sat, 28 May 2022 23:41:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A0F41BF402
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 23:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50F2483FF2
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 23:41:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b5Jkp0G8LugX for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 23:41:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpdh20-2.aruba.it (smtpdh20-2.aruba.it [62.149.155.165])
 by smtp1.osuosl.org (Postfix) with ESMTP id E209683365
 for <buildroot@buildroot.org>; Sat, 28 May 2022 23:41:29 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.179])
 by Aruba Outgoing Smtp  with ESMTPSA
 id v63inO6TwGIp6v63inB3fH; Sun, 29 May 2022 01:41:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1653781286; bh=JlgYfDIv3Q8AfgGYnYlYGke4Aqd4p31rqZHEpmtQI/k=;
 h=From:To:Subject:Date:MIME-Version;
 b=FVje8ZkTqRoarFd5yjZhiEpCzMpyY64fqaRpfoOTmcraBqe4Rw7eX8I9kzEUG5Sja
 GVj0LhTHjfAztDqZBZiYFMuHFfU2yQ2UKavIrGz/pj60BGm8Z3beMsCQNLt8OkwDHd
 qAdker6pQKVO7vB6XHpOCF58TBsq6DB5XtDomoB6co2CE1/sAVSTanAs13t+QFZekH
 nBTI9CJ5MxnPGf7Mn1P7osiMfEAyg5t7PXU9SHACpIt4NJ+XP/elCau0kzOUGrBfIP
 A6tCXKZUdSIc5TPtn8CnIN82KrCjMvfJRzMaZGHj2t/tXvOWoJYHN56tMQuZlpdgnl
 gBmTrt5EhUpaA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 01:41:25 +0200
Message-Id: <20220528234125.31331-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBceisCWUnfuOcnCaMY/sYzvqrViG/3xVbCkBjuXPzgQSgg95Ut3j6n4aMJyPASZqbXy+bFYC3CfXk8MSZvyq4nKV8QkX7xOxVhNer7FiQlV3M/Q0mJa
 zKBcmmmOz+XJo0y7oeegmhgzNgFkPtgFBjTADpnCZMdJxZjohzRP961Q3b3YTz7aDbS0acTm/+qHViecM3Snu+lQe9AHRxIxpuagRuRHxKlHaF+/L59k85JT
 i3G8EDac7w7GQN1P8CY3YrS2YZ83h8lcQCgtH+inJjvaj0gzkmGMYv7yLDXphzilCBoCkgfWykvls0g0+7T7nTQ2qy1qh0J3D7mECzE5KMQ=
Subject: [Buildroot] [PATCH] package/rockchip-mali: fix type on Config.in
 help section
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rockchip-mali/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rockchip-mali/Config.in b/package/rockchip-mali/Config.in
index 2a8cd786be..d616284911 100644
--- a/package/rockchip-mali/Config.in
+++ b/package/rockchip-mali/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_ROCKCHIP_MALI
 	select BR2_PACKAGE_MALI_DRIVER if BR2_LINUX_KERNEL
 	help
 	  Install the binary user-space libraries for the ARM Mali GPU
-	  suitable for Rockchip platforrms. This package requires a
+	  suitable for Rockchip platforms. This package requires a
 	  kernel with the ARM Mali GPU kernel driver enabled, as found
 	  in the 'mali-driver' package.
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
