Return-Path: <SRS0=Fkjy=NM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E11C4338F
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 21:33:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7D68611AF
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 21:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D7D68611AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 851816062E;
	Sat, 21 Aug 2021 21:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YzxqyM2Blfae; Sat, 21 Aug 2021 21:33:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04C1B6065F;
	Sat, 21 Aug 2021 21:33:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D0671BF2B6
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 21:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8970E80EAD
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 21:33:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iCO0LXpxJMeU for <buildroot@lists.busybox.net>;
 Sat, 21 Aug 2021 21:33:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-ws.aruba.it (smtpcmd01-ws.aruba.it [62.149.158.241])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BB8B80EAA
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 21:33:08 +0000 (UTC)
Received: from ubuntu.localdomain ([141.136.161.207])
 by Aruba Outgoing Smtp  with ESMTPSA
 id HYbwmtI6rZx06HYbwmL75L; Sat, 21 Aug 2021 23:33:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1629581586; bh=E1GolRIOtBU7Ok7T0H97YIr4DjepzWsDrfqOL2CE3hg=;
 h=From:To:Subject:Date:MIME-Version;
 b=RIR3fWW7xZCk8e1ha0LYSldtTczf8XkiWlX5CTNV3hdiVG1eEK8mZ0naj7w+LzjEX
 vVlzNWLfBHqOleJR8Jj5xcUUv1B0OZnHul8XAs2X4pZRCI2S3C7yKELjJd+Gd+kipP
 +oTtMQ1Xw02V2FgqvZ1La1hKzua6ZNynbiKoQH1+NV6vw6U6cWAH6SbeHbNCan4C7I
 35s9RE3MOza2AGizATfdEIvPAU3875E0zIhzDSkgMvc7VGHsRewW6mztw44KNT9SI7
 F9IJK3jZNnCcVFkKcwkbmC3MSC+3Zw2PSb9fr3A0vkx1Z7lfjD3jK1zTP19e61xzMM
 9k/4xE99jZopA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Aug 2021 23:33:03 +0200
Message-Id: <20210821213303.283387-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CA04665D-1E5D-400A-9CA1-860F8579C01A@benettiengineering.com>
References: <CA04665D-1E5D-400A-9CA1-860F8579C01A@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfMjUh5mgUoAMW/r+1ki8EEvkPQ2Gdb4klmKJcE/i1QnVu2at6TbGT5D7ViTgHwng+gYV+UHjfxm0dPijc3XPNgGCluh1hM/XrQX66xuUV68t7QcdrBHm
 bFEr7sO8d2bFfz5DFIsFbYJSVE5Rxij6Q2EeroQOhLHs8vmxjqK7GKFe5EBjFojJNRMJIWBJ1ZgfcfVF7ulCNpll7sky3UdkU9I/5uKp2HjbijtotkSh6vzu
 Ymc9JGufqz5sDphwzWF/WMMlXJIiGXIGvEL/rrktMWfkuNE2meXHy15IERO7pAY3g39jHBly9l5XEqz8rhjSzqpglEfAP48CPRf7CVWidDrt9lhl1Ptetcdr
 dAjc+LVVJbpqtKo1S1B7IxXSAGi+h44TPkCWRAg22DUyOc89sjw=
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
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
* gcc 8.x works, gcc 9.x doesn't, gcc 10.x+ work
---
 toolchain/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index c35c52d142..d033ce3962 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -165,10 +165,12 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_93847
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99410
 # Error: branch offset out of range on Nios II. This bug
-# no longer exists in gcc >= 8.x.
+# no longer exists in gcc 8.x but reappeared on gcc 9.x and has been
+# fixed on gcc 10.x.
 config BR2_TOOLCHAIN_HAS_GCC_BUG_99140
 	bool
-	default y if BR2_nios2 && !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+	default y if BR2_nios2
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || BR2_TOOLCHAIN_GCC_AT_LEAST_9
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101737
 # ICE: SH4 -Os causes internal compiler error. This bug
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
