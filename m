Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E9CC3ABAD
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7864583F4A;
	Fri,  2 May 2025 11:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id laUIeDLQaC4L; Fri,  2 May 2025 11:14:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 911AC84216
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 911AC84216;
	Fri,  2 May 2025 11:14:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 107B422A
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A18941C12
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MeG96FdhUyML for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF40C41DB0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF40C41DB0
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA1A3863AE; Fri,  2 May 2025 11:11:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 May 2025 13:01:00 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9611c1cd9e0ac314edd5923d7bdc69fb6be4b400
X-Git-Newrev: a7ad7c48f1e41e56a05739f41ebd6a95aa6d1eb9
X-Patchwork-Hint: ignore
Message-Id: <20250502111137.DA1A3863AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] configs/warp7: Improve
 Wifi instructions
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a7ad7c48f1e41e56a05739f41ebd6a95aa6d1eb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The "modprobe brcmfmac" command is not necessary because this driver
is automatically loaded.

Remove the "iwconfig" line as it is considered deprecated:

warning: `iwconfig' uses wireless extensions which will stop working for Wi-Fi 7 hardware; use nl80211

Remove the "-Dwext" parameter as it is not supported by the default kernel
configuration:

wlan0: Unsupported driver 'wext'

Tested Wifi by following the updated commands.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6240b75d0cd2d602e8449a093c6a0499b3e66733)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 board/warp7/readme.txt | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/board/warp7/readme.txt b/board/warp7/readme.txt
index aff7a601e5..39d845bd32 100644
--- a/board/warp7/readme.txt
+++ b/board/warp7/readme.txt
@@ -107,11 +107,9 @@ To boot your newly created system:
 Using Wifi
 ==========
 
-# modprobe brcmfmac
-# iwconfig wlan0 essid ACCESSPOINTNAME
 # wpa_passphrase ACCESSPOINTNAME > /etc/wpa.conf
 (enter the wifi password and press enter)
-# wpa_supplicant -Dwext -iwlan0 -c /etc/wpa.conf &
+# wpa_supplicant -iwlan0 -c /etc/wpa.conf &
 # udhcpc -i wlan0
 # ping buildroot.org
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
