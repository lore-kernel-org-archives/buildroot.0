Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED2CC369D1
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 18:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D098A60E86;
	Tue, 22 Apr 2025 18:44:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UD5YDGtV8ToY; Tue, 22 Apr 2025 18:44:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2451D60F07
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2451D60F07;
	Tue, 22 Apr 2025 18:44:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AB75C19F
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 18:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 914104057B
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 18:44:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tmcRKbsnCsML for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 18:44:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCC3640177
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCC3640177
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 18:44:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B716C860C0; Tue, 22 Apr 2025 18:44:38 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 22 Apr 2025 19:33:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 531adf23c49151181326e459fcef4daa765c7f3e
X-Git-Newrev: 6240b75d0cd2d602e8449a093c6a0499b3e66733
X-Patchwork-Hint: ignore
Message-Id: <20250422184438.B716C860C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/warp7: Improve Wifi instructions
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

commit: https://git.buildroot.net/buildroot/commit/?id=6240b75d0cd2d602e8449a093c6a0499b3e66733
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
