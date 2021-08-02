Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC89EC4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 15:15:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A41EB60FF2
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 15:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A41EB60FF2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F9CA403E8;
	Mon,  2 Aug 2021 15:15:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aJDGB76141_f; Mon,  2 Aug 2021 15:15:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 791F340015;
	Mon,  2 Aug 2021 15:15:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E445C1BF4D5
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 15:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4906825C7
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 15:14:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4sshgEB6st5O for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 15:14:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91F6B82D17
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 15:14:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C0D858A577; Mon,  2 Aug 2021 15:14:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 2 Aug 2021 17:08:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2245000fed43a53f35b8348441a7814d309adbdc
X-Git-Newrev: 78428b24a8c482639f9b1e5383bd301ef1a0eab6
X-Patchwork-Hint: ignore
Message-Id: <20210802151418.C0D858A577@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bluez5_utils: drop default y
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=78428b24a8c482639f9b1e5383bd301ef1a0eab6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

as discussed on the mailinglist this drops the default y
entry for the now optional plugins and tools.
This might break backward compatibility but gives new users
a smaller initial footprint.

Further add a select for the options that required the HID
plugin at runtime.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/bluez5_utils/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index 30e70fa03f..a8232279bd 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -39,7 +39,6 @@ config BR2_PACKAGE_BLUEZ5_UTILS_CLIENT
 
 config BR2_PACKAGE_BLUEZ5_UTILS_MONITOR
 	bool "build monitor utility"
-	default y
 	help
 	  Build monitor utility btmon.
 
@@ -70,7 +69,6 @@ config BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL
 
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO
 	bool "build audio plugins (a2dp and avrcp)"
-	default y
 	help
 	  Build plugins for audio profiles (for A2DP and AVRCP).
 
@@ -81,14 +79,12 @@ config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HEALTH
 
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID
 	bool "build hid plugin"
-	default y
 	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HOG
 	help
 	  Build plugin for HID (input) profiles.
 
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HOG
 	bool "build hog plugin"
-	default y
 	help
 	  Build plugin for HoG (input) profiles.
 
@@ -130,6 +126,7 @@ config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_SAP
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_SIXAXIS
 	bool "build sixaxis plugin"
 	depends on BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID # runtime
 	help
 	  Build sixaxis plugin (support Sony Dualshock
 	  controller)
@@ -145,6 +142,7 @@ config BR2_PACKAGE_BLUEZ5_UTILS_TEST
 config BR2_PACKAGE_BLUEZ5_UTILS_TOOLS_HID2HCI
 	bool "build hid2hci tool"
 	depends on BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID # runtime
 	help
 	  Build hid2hci tool
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
