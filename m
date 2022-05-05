Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEB4C433F5
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 03:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C95D8403AC;
	Thu,  5 May 2022 03:20:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u5xOXGreVMQF; Thu,  5 May 2022 03:20:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E172940223;
	Thu,  5 May 2022 03:20:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E5A41BF389
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 03:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6436083E14
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 03:20:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z7VX4Gh1-BWO for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 03:20:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EDA8483E0F
 for <buildroot@busybox.net>; Thu,  5 May 2022 03:20:38 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 273944405D7;
 Thu,  5 May 2022 06:19:41 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1651720781;
 bh=sDIKW6oMpoOlNqNt8mPa0JAFTBSHATlspPnx9IWGV7I=;
 h=From:To:Cc:Subject:Date:From;
 b=cFNWxJkZsPkRGkqa0V9S7cyiZysXJAygmrqR28NyNEm+mq6+kSBAFtRv8POD0Zh9J
 Vl3KkBBLmp0arNqKe3d57TvKTJLocEztbux4yhM/Do4n71z5SZJ0FROzKLSZB+z+bI
 U7HhfsObCRvi2EoK4/N24LKhj9zDqzAtojjnbrikY90atZzCPmr6c9GJjw+z/jYj1I
 EMYQZXjnWptX8RZSMztsquWek+wnJirbm9OcIi7xVjwJH/M70E3bwxu2pCLHm/O6QZ
 rY/yXHzAAgfAFY2ycXWDOK61+bWVtHld7K4r/SUplTpWqNGSRpP3ukrrwWDeMLUrmN
 Fi52ynJLmHNpw==
To: buildroot@busybox.net
Date: Thu,  5 May 2022 06:20:27 +0300
Message-Id: <6b4488278264afdbe3614a452671c3a89220e2f8.1651720827.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] linux: add a comment about
 CONFIG_EXTRA_FIRMWARE requirement
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
Cc: Charlie Leger <c.leger@borea-dental.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Explain why the kernel needs firmware packages as build time
dependencies.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 linux/linux.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7ff7b05042e4..e0a1ff74f998 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -70,7 +70,11 @@ LINUX_MAKE_ENV = \
 	BR_BINARIES_DIR=$(BINARIES_DIR)
 
 LINUX_INSTALL_IMAGES = YES
-LINUX_DEPENDENCIES = host-kmod \
+LINUX_DEPENDENCIES = host-kmod
+
+# The kernel CONFIG_EXTRA_FIRMWARE feature requires firmware files at build
+# time. Make sure they are available before the kernel builds.
+LINUX_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_INTEL_MICROCODE),intel-microcode) \
 	$(if $(BR2_PACKAGE_LINUX_FIRMWARE),linux-firmware) \
 	$(if $(BR2_PACKAGE_WIRELESS_REGDB),wireless-regdb)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
