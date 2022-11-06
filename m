Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0953FC433FE
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 10:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F7DA404D0;
	Sun,  6 Nov 2022 10:06:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F7DA404D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LfTcFnWt5XgA; Sun,  6 Nov 2022 10:05:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B7CB40223;
	Sun,  6 Nov 2022 10:05:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B7CB40223
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C51331BF8B4
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 10:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A144760AAE
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 10:05:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A144760AAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Jj1mAf3Rsnr for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 10:05:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E731B60B1C
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 10:05:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E731B60B1C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3E4B87F4C; Sun,  6 Nov 2022 10:05:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 6 Nov 2022 11:01:00 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 968d40d94d22e3fd9b2b9ccc644f9540fef7e85d
X-Git-Newrev: a0a992777e1a1642cb118075422881db707243a7
X-Patchwork-Hint: ignore
Message-Id: <20221106100519.D3E4B87F4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/rtl8189fs:
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

commit: https://git.buildroot.net/buildroot/commit/?id=a0a992777e1a1642cb118075422881db707243a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

s390x doesn't support CONFIG_WIRELESS in Linux so let's disable this
package for this architecture.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 33400378d05cf078314ed0fa9612fa5ab13f7fa6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtl8189fs/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rtl8189fs/Config.in b/package/rtl8189fs/Config.in
index ae69b79235..78eeed1a4f 100644
--- a/package/rtl8189fs/Config.in
+++ b/package/rtl8189fs/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RTL8189FS
 	bool "rtl8189fs"
+	depends on !BR2_s390x
 	depends on BR2_LINUX_KERNEL
 	help
 	  Wireless driver rtl8189fs.
@@ -7,4 +8,5 @@ config BR2_PACKAGE_RTL8189FS
 	  https://github.com/jwrdegoede/rtl8189ES_linux.git
 
 comment "rtl8189fs needs a Linux kernel to be built"
+	depends on !BR2_s390x
 	depends on !BR2_LINUX_KERNEL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
