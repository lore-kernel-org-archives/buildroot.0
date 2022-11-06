Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B1BC4332F
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 10:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 122B2404FC;
	Sun,  6 Nov 2022 10:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 122B2404FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jUq8p_aCeXY2; Sun,  6 Nov 2022 10:06:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10525404D0;
	Sun,  6 Nov 2022 10:06:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10525404D0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D17F81BF5AA
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 10:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACA9360B49
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 10:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACA9360B49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gEkOdazWX_8Q for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 10:06:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7EE560B2C
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 10:06:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7EE560B2C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D198887FD8; Sun,  6 Nov 2022 10:06:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 6 Nov 2022 10:58:21 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 9a80348a5d9f1c6d3a3a84e493884e3318c9c607
X-Git-Newrev: e732c005b52d2c89ed21ce898b8a94597665900f
X-Patchwork-Hint: ignore
Message-Id: <20221106100640.D198887FD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/rtl8189es:
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

commit: https://git.buildroot.net/buildroot/commit/?id=e732c005b52d2c89ed21ce898b8a94597665900f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

s390x doesn't support CONFIG_WIRELESS in Linux so let's disable this
package for this architecture.

Fixes:
http://autobuild.buildroot.net/results/693053491ba61edcff0f75a4f30c13958e7e12ce/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 682224d6f6e80e78ff61f3545a7ae5d7a15ba887)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtl8189es/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rtl8189es/Config.in b/package/rtl8189es/Config.in
index 2e3474e5e1..11dd225436 100644
--- a/package/rtl8189es/Config.in
+++ b/package/rtl8189es/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RTL8189ES
 	bool "rtl8189es"
+	depends on !BR2_s390x
 	depends on BR2_LINUX_KERNEL
 	help
 	  Wireless driver rtl8189es.
@@ -7,4 +8,5 @@ config BR2_PACKAGE_RTL8189ES
 	  https://github.com/jwrdegoede/rtl8189ES_linux.git
 
 comment "rtl8189es needs a Linux kernel to be built"
+	depends on !BR2_s390x
 	depends on !BR2_LINUX_KERNEL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
