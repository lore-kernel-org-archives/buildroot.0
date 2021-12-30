Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0770C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 20:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71EDD405C2;
	Thu, 30 Dec 2021 20:12:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VAB_ryeLYH0Z; Thu, 30 Dec 2021 20:12:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87045404BE;
	Thu, 30 Dec 2021 20:12:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B8E1C1BF361
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3990404BE
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:12:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b7nFMEvepzA9 for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 20:12:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp2.osuosl.org (Postfix) with ESMTP id A08D5402D0
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 20:12:33 +0000 (UTC)
Received: from localhost.localdomain ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 31mpnSeH3Ni3c31mqnVJ85; Thu, 30 Dec 2021 21:12:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1640895152; bh=mWFe6wxeVJhDBwtaqSOD00kVIVVmsj/7NSih6Uaca4w=;
 h=From:To:Subject:Date:MIME-Version;
 b=evjDIfr0dJM7tqXm/WQ102GTAAHxQRLKe2/DfHGflib3SsPosvEN4Z0rXucMQg+vc
 oLDwM8Db8G/bIakzbw2ExJlajXaGBALKNgG/y/q7P/mmOURu1Vr7ORkJeI0dXnnGe2
 p1OP3poG0EZAKTY8wv3m2E7m9NEJDKunpmWsbUgQ/LhBPKUv+GsZb98jeLbZbsb7NY
 5Z8GjYJMXUM/px/fyi6NVvfLlwdLc+gVOjcjO5RbHFeEqD/v5L6JvXqSGF749Ap5ao
 XZ152G6oe/1+nlsDK2kPbqIhjMvswJ9xcB9ChzpX3RbKl9wXdS40jfav6Ko1jB60V3
 p60MvSTewQ8/w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 30 Dec 2021 21:12:30 +0100
Message-Id: <20211230201230.1804439-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <391ca4ef-c213-e972-ac15-4ff3e225bf87@benettiengineering.com>
References: <391ca4ef-c213-e972-ac15-4ff3e225bf87@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfDH2eqe7EyWtGeJWArT//6P7Ws1jwANcFKDb7+Oz943V/Xh1b46a3nq93HL6FOAG9xOpCASfwePP7HgrFc+HgSm61S5qEuIcEghVqUryufj2ZwDSVN01
 uUgJEnbwEL0Mp64v0kR5Vuk9NcXrHYnE+LH527v3Yn02GkKDPRSeeVADqlKgwaqppwbnkyU6hWCo5/ptq6DM7yfw2aYqvzAWFG+VTalti/lNQCr/s5HWsz2S
 d9m0EyuHvtaEM9p8aBJLQx/EFuVDKGX7zE+jVmy6axnYs2FBLYVcudYKpN5aSkiPIuVi5OC/DyjEwUu3AhBRbwVyPOsWv6KaHm6RrdW8XTZtGE0kbcAJbYw8
 iBGTvfpgBsEVPJQkee0vSuyYU77zlCM2vzgTa3KAihRFH3OQkiw=
Subject: [Buildroot] [PATCH] package/protobuf: drop dependency on binutils
 bug 21464
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
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package build failure has been fixed by using -mcmodel=large that is
now available in external toolchains as well as buildroot toolchains. So
we can drop its dependency on binutils 21464.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/protobuf/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index 30050950aa..46c820b9cf 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -24,7 +24,6 @@ config BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	default y if BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_USE_MMU # fork()
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
 
 config BR2_PACKAGE_PROTOBUF
 	bool "protobuf"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
