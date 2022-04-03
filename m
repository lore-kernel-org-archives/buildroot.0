Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238A6C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 19:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF4F5607A4;
	Sun,  3 Apr 2022 19:19:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qJ0UQRD5yzq3; Sun,  3 Apr 2022 19:19:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DB5060773;
	Sun,  3 Apr 2022 19:19:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C7E5E1BF36B
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 19:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B63764016D
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 19:19:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W8C5U0mwTW1Q for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 19:19:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA72C40137
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 19:19:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 5847A860CA; Sun,  3 Apr 2022 19:09:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Apr 2022 21:17:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 158b062a42c393e9084bde9691f663ee0ef59b18
X-Git-Newrev: 342631bed10f987351a83c9378c94447584a1515
X-Patchwork-Hint: ignore
Message-Id: <20220403190943.5847A860CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openocd: Allow to build BCM2835 on
 aarch64
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

commit: https://git.buildroot.net/buildroot/commit/?id=342631bed10f987351a83c9378c94447584a1515
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allow to build the BCM2835 bitbang interface on aarch64.

Signed-off-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/openocd/Config.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index b14f940b27..cef109b511 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -190,13 +190,17 @@ config BR2_PACKAGE_OPENOCD_AT91RM
 	help
 	  Enable building support for AT91RM9200 based SBCs
 
+endif # BR2_arm
+
+if BR2_arm || BR2_aarch64
+
 config BR2_PACKAGE_OPENOCD_BCM2835
 	bool "bitbanging on BCM2835"
 	help
 	  Enable building support for bitbanging on BCM2835
 	  (as found in Raspberry Pi)
 
-endif # BR2_arm
+endif # BR2_arm || BR2_aarch64
 
 config BR2_PACKAGE_OPENOCD_GW16012
 	bool "Gateworks GW16012 JTAG Programmer"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
