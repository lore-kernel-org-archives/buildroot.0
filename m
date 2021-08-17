Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B76DDC4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 21:31:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A9B66102A
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 21:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A9B66102A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34EBC600C6;
	Tue, 17 Aug 2021 21:31:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MukfrfqjWP17; Tue, 17 Aug 2021 21:31:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8A7160B93;
	Tue, 17 Aug 2021 21:31:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7AD951BF396
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 21:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AC88402CE
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 21:31:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fiHOmOqJneOj for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 21:31:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0651.aruba.it (smtpcmd0651.aruba.it [62.149.156.51])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72AE240304
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 21:31:16 +0000 (UTC)
Received: from ubuntu.localdomain ([89.164.10.249])
 by Aruba Outgoing Smtp  with ESMTPSA
 id G6fxm5yQlxC2nG6fym1JHK; Tue, 17 Aug 2021 23:31:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1629235874; bh=RvAAExCO6wpU3ZGqN1w7HC3YBptEJBUBYg8NxAuoLGo=;
 h=From:To:Subject:Date:MIME-Version;
 b=drrJHKzT0ndA1NF+wIK4fR9466l67vNyl5LBN9VnfpMvjAft1abf2OXua360udqt/
 mFgEm7UJYRhlKHnPBz78P1N4/Jk24QA1J7EPcIxzicbGtUUf9zvgOkKmAE6YfZ6Oem
 Gt7WBi4ywSsBZDisubHFN7+wTZxACieEaFN1YbJ9HvCc8rwMC8FaUTrf06xi+yFTy4
 H8I5KRGmccDK2GfbP/iDaRqVjUMSJdAaMpXe8KGY3WBIatNHNtkwRWR0zQMHtMVqH9
 qR5HYERgYD54JMVaO0iQF+ysbE19u2w+M+LJCWNzhALaqQyLn9mPIdCjuboHe0sBg/
 uIAub16fy8oOQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 17 Aug 2021 23:31:11 +0200
Message-Id: <20210817213112.302830-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210817213112.302830-1-giulio.benetti@benettiengineering.com>
References: <20210817213112.302830-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfKVz6bi1KLZKM362IJrU24X7T+7vL45RE6yPTOyOcYvfDOIej/ZzasbIGMLvM5XMm3tgFlBEMPxGZUEB90jM5UFp26qRqiHDsl2Hel+/jTm5Hq5voDzZ
 4s8ydlbE3jAWU9iP5AxZY4biKSZ3fC4G9yrokEvXA/5MzI/w7Czk8Vje5bD7xB18Zz0D+xZIq/tnLVIJJJJYk+wd7GOAZDJvqXJD5pKzz3HPpN5uPieGHYV2
 XtPSLG6NdTXuz81UpSI4FQBhXeA8lR9zBxDabZSOljYOAhqAPNEZ+cz1B28TRfOtS5aLZ0UhygqvEf0f92dBYJcM1/Qwu0JawxsU2vFE82G52vmIiRwoYjzb
 hKKdEFJxHta6Cv08qUT/W1UEdIDFEQ==
Subject: [Buildroot] [PATCH 1/2] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_101952
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
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

bullet package fails to build for the SH4 architecture with optimization
enabled with gcc = 11.1.0:
http://autobuild.buildroot.net/results/32b/32bfaf0aae57ed18c18e82a72a958af9b3e1b241/

It's been reported upstream:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101952

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index c3edf8f48d..d9a49e87e6 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -191,6 +191,13 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_101916
 	bool
 	default y if BR2_sh4
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101952
+# ICE: on SH4: unaligned opcodes detected in executable segment.
+# This bug still exists in gcc = 11.1.0
+config BR2_TOOLCHAIN_HAS_GCC_BUG_101952
+	bool
+	default y if BR2_sh4
+
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
