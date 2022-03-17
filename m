Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273C8C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 12:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D051F847D0;
	Thu, 17 Mar 2022 12:20:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o90WOkAw0g9h; Thu, 17 Mar 2022 12:20:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0179E847CB;
	Thu, 17 Mar 2022 12:20:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 547C11BF36E
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 12:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E69A40136
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 12:19:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oua_tT0bMIa2 for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 12:19:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E539A40141
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 12:19:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5923E84398; Thu, 17 Mar 2022 12:11:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 17 Mar 2022 13:13:04 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 56c9ec58d08cbe88f421c69e7e658e374f92c8cf
X-Git-Newrev: e4d21fda051b78af74e446d32937ff0e9d612b20
X-Patchwork-Hint: ignore
Message-Id: <20220317121107.5923E84398@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] docs/manual: Document
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

commit: https://git.buildroot.net/buildroot/commit/?id=e4d21fda051b78af74e446d32937ff0e9d612b20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
