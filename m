Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24590C47074
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 17:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D306341680;
	Sun,  7 Jan 2024 17:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D306341680
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DceIfJ4p5if1; Sun,  7 Jan 2024 17:36:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28A44415FB;
	Sun,  7 Jan 2024 17:36:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28A44415FB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 643951BF3C0
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 17:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B2F1415E6
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 17:36:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B2F1415E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MP6A4CsL7O6R for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 17:36:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74541415E7
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 17:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74541415E7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5492F84849; Sun,  7 Jan 2024 17:36:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Jan 2024 18:34:13 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: c3e41c34a1c3e930c53892b2e69dce9247afeda2
X-Git-Newrev: c01b8fd38aacb983599ad63cffd26bb5131e7fb5
X-Patchwork-Hint: ignore
Message-Id: <20240107173611.5492F84849@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/sway/Config.in:
 select BR2_PACKAGE_XKEYBOARD_CONFIG
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

commit: https://git.buildroot.net/buildroot/commit/?id=c01b8fd38aacb983599ad63cffd26bb5131e7fb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Much like weston, this is a runtime dependency.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7e767c81a837883f8035bb7d7ee3925218adcd80)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sway/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sway/Config.in b/package/sway/Config.in
index 26b5b2ecea..08b6911069 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -18,6 +18,7 @@ config BR2_PACKAGE_SWAY
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_PANGO
+	select BR2_PACKAGE_XKEYBOARD_CONFIG # runtime
 	help
 	  i3-compatible Wayland compositor
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
