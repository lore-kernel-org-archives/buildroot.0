Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4918E7717F
	for <buildroot@archiver.kernel.org>; Thu, 12 Dec 2024 21:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A36376FC4B;
	Thu, 12 Dec 2024 21:34:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F6uevZawiMWB; Thu, 12 Dec 2024 21:34:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BA21703C5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BA21703C5;
	Thu, 12 Dec 2024 21:34:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 05EDD115A
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60D84848A7
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:33:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 39F4kck8uOB0 for <buildroot@buildroot.org>;
 Thu, 12 Dec 2024 21:33:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2581784667
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2581784667
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:33:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2239C86ED2; Thu, 12 Dec 2024 21:33:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Dec 2024 21:19:12 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 23872a77b2aa28df8a095aaa2ec3a32db8112048
X-Git-Newrev: a2d58f514531ee73118b5d005e01ee5bf4485be6
X-Patchwork-Hint: ignore
Message-Id: <20241212213338.2239C86ED2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/wilc-firmware:
 fix 'acceptable' typo
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=a2d58f514531ee73118b5d005e01ee5bf4485be6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0c6b8c989fcca8d057f7598f28eff377a018ed2f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wilc-firmware/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wilc-firmware/Config.in b/package/wilc-firmware/Config.in
index 72a9c73206..813a75ecf2 100644
--- a/package/wilc-firmware/Config.in
+++ b/package/wilc-firmware/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_WILC1000_FIRMWARE
 
 	  These binary blobs are provided directly from Microchip.
 	  Ideally, the firmware version should match driver version.
-	  Generally, the latest firmware would be acceptible regardless
+	  Generally, the latest firmware would be acceptable regardless
 	  of driver version.
 
 	  These will be installed to /lib/firmware/mchp/
@@ -26,7 +26,7 @@ config BR2_PACKAGE_WILC3000_FIRMWARE
 
 	  These binary blobs are provided directly from Microchip.
 	  Ideally, the firmware version should match driver version.
-	  Generally, the latest firmware would be acceptible regardless
+	  Generally, the latest firmware would be acceptable regardless
 	  of driver version.
 
 	  These will be installed to /lib/firmware/mchp/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
