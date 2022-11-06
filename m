Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86515C4332F
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 10:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3865981EFE;
	Sun,  6 Nov 2022 10:08:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3865981EFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IrTlNo8VRw7I; Sun,  6 Nov 2022 10:08:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69F9281EED;
	Sun,  6 Nov 2022 10:08:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69F9281EED
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 601181BF5AA
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 10:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38C9E403AC
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 10:06:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38C9E403AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VlhPPjxVBWat for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 10:06:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1885A403C7
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 10:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1885A403C7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EEA8287FDC; Sun,  6 Nov 2022 10:06:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 6 Nov 2022 11:01:43 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: c62055cb2481240bfafb152d6ada1d0dc237d04b
X-Git-Newrev: 6c3485d433e5ed69eca076927d14dab619bd22e5
X-Patchwork-Hint: ignore
Message-Id: <20221106100640.EEA8287FDC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/rtl8723ds:
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

commit: https://git.buildroot.net/buildroot/commit/?id=6c3485d433e5ed69eca076927d14dab619bd22e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

s390x doesn't support CONFIG_WIRELESS in Linux so let's disable this
package for this architecture.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5835a64d3648b4f3a012d57a01775e7eeb1418b1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtl8723ds/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rtl8723ds/Config.in b/package/rtl8723ds/Config.in
index ef7dd39a68..e5123a2aae 100644
--- a/package/rtl8723ds/Config.in
+++ b/package/rtl8723ds/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RTL8723DS
 	bool "rtl8723ds"
+	depends on !BR2_s390x
 	depends on BR2_LINUX_KERNEL
 	help
 	  rtl8723bs wifi driver
@@ -7,4 +8,5 @@ config BR2_PACKAGE_RTL8723DS
 	  https://github.com/lwfinger/rtl8723ds
 
 comment "rtl8723ds needs a Linux kernel to be built"
+	depends on !BR2_s390x
 	depends on !BR2_LINUX_KERNEL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
