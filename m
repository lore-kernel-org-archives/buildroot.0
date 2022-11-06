Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF82CC4332F
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 10:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88E9640530;
	Sun,  6 Nov 2022 10:07:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88E9640530
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XOpy21ueDwjw; Sun,  6 Nov 2022 10:07:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9A78404F8;
	Sun,  6 Nov 2022 10:07:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9A78404F8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0FA991BF909
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 10:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE4594088F
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 10:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE4594088F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kdlsdg2R8zbL for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 10:06:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03A34403AC
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 10:06:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03A34403AC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DAFBE87FDA; Sun,  6 Nov 2022 10:06:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 6 Nov 2022 11:00:53 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: e732c005b52d2c89ed21ce898b8a94597665900f
X-Git-Newrev: dc5c854e19c3be87fef1fba5a8f78ec83a6ceac5
X-Patchwork-Hint: ignore
Message-Id: <20221106100640.DAFBE87FDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/rtl8189fs:
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

commit: https://git.buildroot.net/buildroot/commit/?id=dc5c854e19c3be87fef1fba5a8f78ec83a6ceac5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

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
