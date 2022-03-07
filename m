Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5646AC433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 20:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED93660EDA;
	Mon,  7 Mar 2022 20:38:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ta3FIvEDCBPB; Mon,  7 Mar 2022 20:38:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38EED60EAD;
	Mon,  7 Mar 2022 20:38:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 041B61BF3A0
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 20:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6A5B60ED5
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 20:38:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2FhhuOatit9q for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 20:38:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4784860E45
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 20:38:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9212782B3F; Mon,  7 Mar 2022 20:29:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 21:36:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25fd3b0a523805db14682f7c559cc1c9c366ed55
X-Git-Newrev: ca9e55ad11271cb26b0bffba336cf5a0d74ba378
X-Patchwork-Hint: ignore
Message-Id: <20220307202940.9212782B3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: Document Kconfig requirements
 for uboot
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

commit: https://git.buildroot.net/buildroot/commit/?id=ca9e55ad11271cb26b0bffba336cf5a0d74ba378
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When using uboot's legacy build system, the 'make uboot-menuconfig'
and 'make uboot-savedefconfig' targets are not available as they
are created by 'kconfig-package'.

Signed-off-by: Simon Doppler <dopsi@dopsi.ch>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/make-tips.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
index 869b6807dd..df3b888c25 100644
--- a/docs/manual/make-tips.txt
+++ b/docs/manual/make-tips.txt
@@ -35,7 +35,8 @@ some settings in the +.config+ file may hide some targets:
 * +barebox-menuconfig+ and +barebox-savedefconfig+ only work when the
   +barebox+ bootloader is enabled.
 * +uboot-menuconfig+ and +uboot-savedefconfig+ only work when the
-  +U-Boot+ bootloader is enabled.
+  +U-Boot+ bootloader is enabled and the +uboot+ build system is set
+  to +Kconfig+.
 
 .Cleaning:
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
