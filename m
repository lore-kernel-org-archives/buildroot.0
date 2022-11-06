Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A321C433FE
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 10:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0693181EDE;
	Sun,  6 Nov 2022 10:07:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0693181EDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zMtzKnITInHs; Sun,  6 Nov 2022 10:07:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33F2681971;
	Sun,  6 Nov 2022 10:07:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33F2681971
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0FA431BF8C7
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 10:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF95160B2C
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 10:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF95160B2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZJjs4AIDRl48 for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 10:06:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B8F960B36
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 10:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B8F960B36
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C02B87FD8; Sun,  6 Nov 2022 10:06:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 6 Nov 2022 11:02:13 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: acd7b7f0bdea297952139b58acaab45dcaa2c8cf
X-Git-Newrev: 31d7979f591d8376a82299139c9563b0ba050d16
X-Patchwork-Hint: ignore
Message-Id: <20221106100641.0C02B87FD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/rtl8821au:
 disable package for s390x architecture
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

commit: https://git.buildroot.net/buildroot/commit/?id=31d7979f591d8376a82299139c9563b0ba050d16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

s390x doesn't support CONFIG_WIRELESS in Linux so let's disable this
package for this architecture.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1e18cc291bbb1c16401abb1b2b661e4e150092f3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtl8821au/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rtl8821au/Config.in b/package/rtl8821au/Config.in
index 87c191b22a..3d7bbf643d 100644
--- a/package/rtl8821au/Config.in
+++ b/package/rtl8821au/Config.in
@@ -1,8 +1,10 @@
 comment "rtl8821au needs a Linux kernel to be built"
+	depends on !BR2_s390x
 	depends on !BR2_LINUX_KERNEL
 
 config BR2_PACKAGE_RTL8821AU
 	bool "rtl8821au"
+	depends on !BR2_s390x
 	depends on BR2_LINUX_KERNEL
 	help
 	  rtl8821au wifi driver
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
