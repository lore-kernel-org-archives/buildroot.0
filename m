Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5016DC433FE
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 10:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F225C40414;
	Sun,  6 Nov 2022 10:06:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F225C40414
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HGmcnSoOYp40; Sun,  6 Nov 2022 10:06:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EE8E40529;
	Sun,  6 Nov 2022 10:06:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EE8E40529
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0862D1BF5AA
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 10:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8E048175B
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 10:05:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8E048175B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OA-vsowe4NfR for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 10:05:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0823B815AB
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 10:05:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0823B815AB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9D8687FB6; Sun,  6 Nov 2022 10:05:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 6 Nov 2022 11:02:00 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 85c1af52dca5ce3129fa0b8f6038a160acd962b9
X-Git-Newrev: a06eea4ebe835a135f87e4fede3eab358c130018
X-Patchwork-Hint: ignore
Message-Id: <20221106100519.E9D8687FB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 package/rtl8812au-aircrack-ng: disable package for s390x architecture
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a06eea4ebe835a135f87e4fede3eab358c130018
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

s390x doesn't support CONFIG_WIRELESS in Linux so let's disable this
package for this architecture.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 895692594f9aac04dfede06067eca794533869d8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
