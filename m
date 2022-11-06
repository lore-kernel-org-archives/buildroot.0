Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05051C4332F
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 10:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A68B360B38;
	Sun,  6 Nov 2022 10:06:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A68B360B38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nt5uBTbROBtq; Sun,  6 Nov 2022 10:06:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC01160B2C;
	Sun,  6 Nov 2022 10:06:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC01160B2C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 044341BF8C7
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 10:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB80F60AAE
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 10:05:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB80F60AAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5y4bFubmFAJY for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 10:05:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01A4C60B55
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 10:05:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01A4C60B55
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DEEAC87F8D; Sun,  6 Nov 2022 10:05:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 6 Nov 2022 11:01:18 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a0a992777e1a1642cb118075422881db707243a7
X-Git-Newrev: 85c1af52dca5ce3129fa0b8f6038a160acd962b9
X-Patchwork-Hint: ignore
Message-Id: <20221106100519.DEEAC87F8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/rtl8723bu:
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

commit: https://git.buildroot.net/buildroot/commit/?id=85c1af52dca5ce3129fa0b8f6038a160acd962b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

s390x doesn't support CONFIG_WIRELESS in Linux so let's disable this
package for this architecture.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bff3a804024e1931affcbf13453761afd3c767c6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtl8723bu/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rtl8723bu/Config.in b/package/rtl8723bu/Config.in
index 266a794a7d..7c624fc4d4 100644
--- a/package/rtl8723bu/Config.in
+++ b/package/rtl8723bu/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RTL8723BU
 	bool "rtl8723bu"
+	depends on !BR2_s390x
 	depends on BR2_LINUX_KERNEL
 	help
 	  rtl8723bu wifi driver
@@ -7,4 +8,5 @@ config BR2_PACKAGE_RTL8723BU
 	  https://github.com/lwfinger/rtl8723bu
 
 comment "rtl8723bu needs a Linux kernel to be built"
+	depends on !BR2_s390x
 	depends on !BR2_LINUX_KERNEL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
