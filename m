Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8C6C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 12:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82DED41745;
	Thu, 17 Mar 2022 12:19:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZJedaXDi-0Ta; Thu, 17 Mar 2022 12:19:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 963E1418C1;
	Thu, 17 Mar 2022 12:19:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E93971C1135
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 12:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D849F60F7B
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 12:19:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kOY8AvXzrtoX for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 12:19:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CEF160A75
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 12:19:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 93F458438C; Thu, 17 Mar 2022 12:10:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 17 Mar 2022 13:13:31 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 812e7952b4e117bd7b160d1969bda19d30059d99
X-Git-Newrev: 1da4b588b8cf6db6b2ecc64213131e855e3bb6ff
X-Patchwork-Hint: ignore
Message-Id: <20220317121041.93F458438C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] docs/manual: Document
 Kconfig requirements for uboot
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

commit: https://git.buildroot.net/buildroot/commit/?id=1da4b588b8cf6db6b2ecc64213131e855e3bb6ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

When using uboot's legacy build system, the 'make uboot-menuconfig'
and 'make uboot-savedefconfig' targets are not available as they
are created by 'kconfig-package'.

Signed-off-by: Simon Doppler <dopsi@dopsi.ch>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ca9e55ad11271cb26b0bffba336cf5a0d74ba378)
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
