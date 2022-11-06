Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A86C4332F
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 10:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3D7A81E93;
	Sun,  6 Nov 2022 10:05:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3D7A81E93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gn6Tp95QgpMe; Sun,  6 Nov 2022 10:05:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB15E818C4;
	Sun,  6 Nov 2022 10:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB15E818C4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BBF471BF5AA
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 10:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 977FA40414
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 10:05:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 977FA40414
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XO53CA3zYzMp for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 10:05:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD41540223
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 10:05:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD41540223
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C937787F3D; Sun,  6 Nov 2022 10:05:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 6 Nov 2022 10:58:51 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: aab7c5e398de470d0dbafd80d8a870f73a01026e
X-Git-Newrev: 968d40d94d22e3fd9b2b9ccc644f9540fef7e85d
X-Patchwork-Hint: ignore
Message-Id: <20221106100519.C937787F3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/rtl8189es:
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

commit: https://git.buildroot.net/buildroot/commit/?id=968d40d94d22e3fd9b2b9ccc644f9540fef7e85d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
