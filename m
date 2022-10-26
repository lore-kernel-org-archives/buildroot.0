Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1ECC433FE
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 19:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD02180CCE;
	Wed, 26 Oct 2022 19:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD02180CCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TjOCArCiGdiK; Wed, 26 Oct 2022 19:53:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 229C680C08;
	Wed, 26 Oct 2022 19:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 229C680C08
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A8E341BF57C
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 19:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8281F40547
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 19:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8281F40547
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7pNc2_2XnEuz for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 19:51:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1E6F405E8
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 19:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1E6F405E8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0B3F87165; Wed, 26 Oct 2022 19:51:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 21:51:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5835a64d3648b4f3a012d57a01775e7eeb1418b1
X-Git-Newrev: 895692594f9aac04dfede06067eca794533869d8
X-Patchwork-Hint: ignore
Message-Id: <20221026195154.B0B3F87165@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8812au-aircrack-ng: disable
 package for s390x architecture
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=895692594f9aac04dfede06067eca794533869d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

s390x doesn't support CONFIG_WIRELESS in Linux so let's disable this
package for this architecture.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtl8812au-aircrack-ng/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rtl8812au-aircrack-ng/Config.in b/package/rtl8812au-aircrack-ng/Config.in
index 70cbd15221..d903ab2b3f 100644
--- a/package/rtl8812au-aircrack-ng/Config.in
+++ b/package/rtl8812au-aircrack-ng/Config.in
@@ -1,8 +1,10 @@
 comment "rtl8812au-aircrack-ng needs a Linux kernel to be built"
+	depends on !BR2_s390x
 	depends on !BR2_LINUX_KERNEL
 
 config BR2_PACKAGE_RTL8812AU_AIRCRACK_NG
 	bool "rtl8812au-aircrack-ng"
+	depends on !BR2_s390x
 	depends on BR2_LINUX_KERNEL
 	help
 	  rtl8812au wifi driver (aircrack-ng repository)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
