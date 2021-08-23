Return-Path: <SRS0=awcP=NO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A14C4338F
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 23:06:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50B67610D0
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 23:06:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50B67610D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 178A180C9E;
	Mon, 23 Aug 2021 23:06:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 37_llgpgoGt6; Mon, 23 Aug 2021 23:06:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E4CA80CD6;
	Mon, 23 Aug 2021 23:06:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9469C1BF3AF
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 23:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8368180CD6
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 23:05:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 27BAfe-EkUux for <buildroot@lists.busybox.net>;
 Mon, 23 Aug 2021 23:05:54 +0000 (UTC)
X-Greylist: delayed 00:07:03 by SQLgrey-1.8.0
Received: from smtpcmd11126.aruba.it (smtpcmd11126.aruba.it [62.149.156.126])
 by smtp1.osuosl.org (Postfix) with ESMTP id E697580C9E
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 23:05:53 +0000 (UTC)
Received: from ubuntu.localdomain ([89.164.10.203])
 by Aruba Outgoing Smtp  with ESMTPSA
 id IItymDqSYp6qUIItzm6Upr; Tue, 24 Aug 2021 00:58:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1629759528; bh=jRLpAK6rDCv0+h3JbqEsDffF1/1yrt2LXv1rohbCeBE=;
 h=From:To:Subject:Date:MIME-Version;
 b=KH3q/h6tVijSug4vJyHTYo7TyxxySI+d4wZ1A1C8sBOoo35GXwjzLCSTepqAZbQ8Q
 48L7fqlW4FZqDLqJj5i+XZ/JTAVu4B6GLxJ8n6uf8OW6KeV6upO5fQaJEzJ2LmzpU2
 cwlTaFFDssuzRyIpQghUTAucLxh71m8oWNVg88hxZpNfTa8sHfUITkEvzV1sj5HmeN
 AvOsbFtlzYilptOElN3Q6er1uN9Fdc5DieBs/ssaZD/huFrjPtqm+5mk+oTI4DPxSc
 sWpNx+aHVPotU85KRm22Zpy44CdqRpOC4WvE+QK9HbNpCyJtkfLUTMsQMx2b0mLPaE
 ECSYC6sr0UcYQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 24 Aug 2021 00:58:46 +0200
Message-Id: <20210823225846.583906-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <5cba1f8b-1434-c38d-1b86-fc380b9de458@mind.be>
References: <5cba1f8b-1434-c38d-1b86-fc380b9de458@mind.be>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfC1LIkrFzZqjVkyMsyhN5/IpjbE0OO6xlR/bfqgKS5tY9QWzykJqeEcBsINFXDtShRSmG9PRnL4yMDJlcy2LhfT2F6EeNgQLt2WhS1pEx4XMhJb+6jDI
 W0ipTuLP3dugard8WlrJt9J+r7M66t5QFaF4jkbEKrjSZCgvg08UL0fMSJVM+z9Q5OctYyi1IDwYPaZciGyZ9fdSngVeSvXkbmEcJq65Bn1zJtmHISw701FR
 VRHxQgqiha6WpRfRJrrRn7r2aP8OxfN1BzL0vNBsoItiYY+tHqZtL6UI8/RTRFoJFJnBPFD7ca9dPC+65eYkl9NmA9rtWWMzSTms9ETNl0ShlujWOdL3aitI
 xVRp1T+6ff9e7FIEPFmwzevEmNcguQ==
Subject: [Buildroot] [PATCH v2] toolchain: update gcc bug 99140
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Gcc bug 99140 has been fixed on gcc 8.x but reappeared on gcc 9.x while
it's been fixed on gcc 10.x+. So let's update
BR2_TOOLCHAIN_HAS_GCC_BUG_99140 accordingly.

Fixes:
http://autobuild.buildroot.net/results/c55/c55f50a8d657695f0d5492c32efa666254cd7f99/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* fix/improve Kconfig mechanism as suggested by Arnout
---
 toolchain/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index c35c52d142..bf2bb3efe4 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -165,10 +165,13 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_93847
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99410
 # Error: branch offset out of range on Nios II. This bug
-# no longer exists in gcc >= 8.x.
+# no longer exists in gcc 8.x but reappeared on gcc 9.x and has been
+# fixed on gcc 10.x.
 config BR2_TOOLCHAIN_HAS_GCC_BUG_99140
 	bool
-	default y if BR2_nios2 && !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9 && !BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	depends on BR2_nios2
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101737
 # ICE: SH4 -Os causes internal compiler error. This bug
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
