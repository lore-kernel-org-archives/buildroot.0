Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C6CC433F5
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 09:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB68E40A8F;
	Fri, 14 Jan 2022 09:37:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QTcWmlyD6_aO; Fri, 14 Jan 2022 09:37:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06653403A7;
	Fri, 14 Jan 2022 09:37:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6AA561BF3DF
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 09:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67CBD83F89
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 09:37:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9VY6c0gIGoqt for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 09:37:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 062A483F5F
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 09:37:02 +0000 (UTC)
Received: from relay12.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::232])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 11184C00B5
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 09:31:00 +0000 (UTC)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 3CEBD200008;
 Fri, 14 Jan 2022 09:30:54 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 10:30:49 +0100
Message-Id: <20220114093049.2380117-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] linux: clarify BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
 description
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
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This clarifies that custom DTSI files can be passed too,
and that the files are compiled after being copied to the
Linux kernel source tree.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 linux/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 582f37ba7c..048a7fbfd0 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -411,9 +411,10 @@ config BR2_LINUX_KERNEL_INTREE_DTS_NAME
 config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
 	string "Out-of-tree Device Tree Source file paths"
 	help
-	  Path to the out-of-tree device tree source files.
-	  You can provide a list of dts paths to copy and
-	  build, separated by spaces.
+	  Paths to out-of-tree Device Tree Source (.dts)
+	  and Device Tree Source Include (.dtsi) files,
+	  separated by spaces. These files will be copied
+	  to the kernel sources and compiled from there.
 
 config BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME
 	bool "Keep the directory name of the Device Tree"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
