Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D423C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 22:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B83B61598;
	Wed, 20 Dec 2023 22:12:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B83B61598
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8YbDY8YKIlM7; Wed, 20 Dec 2023 22:11:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 578EE61573;
	Wed, 20 Dec 2023 22:11:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 578EE61573
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4EA1C1BF471
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 22:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27C0A8308D
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 22:11:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27C0A8308D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SHZaHNvDNdAo for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 22:11:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A23680B0A
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 22:11:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A23680B0A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2395487CD1; Wed, 20 Dec 2023 22:11:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 22:14:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d107888e38f8c34e7ce429552bb77ade5247ce88
X-Git-Newrev: 7e767c81a837883f8035bb7d7ee3925218adcd80
X-Patchwork-Hint: ignore
Message-Id: <20231220221146.2395487CD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sway/Config.in: select
 BR2_PACKAGE_XKEYBOARD_CONFIG
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7e767c81a837883f8035bb7d7ee3925218adcd80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Much like weston, this is a runtime dependency.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
