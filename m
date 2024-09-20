Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA75C78821
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 10:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68E48405F7;
	Fri, 20 Sep 2024 10:35:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aFtYHHE-ADLl; Fri, 20 Sep 2024 10:35:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB37E42B82
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB37E42B82;
	Fri, 20 Sep 2024 10:35:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 25A651BF599
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C8C6403C2
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:34:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QvVDUn1eeONa for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 10:34:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 280FB403EB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 280FB403EB
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 10:34:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 876E783FA7; Fri, 20 Sep 2024 10:34:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 12:33:55 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 041393b237d7c9b02d50abe840109ff56c25513f
X-Git-Newrev: 6733f2954cf3594b91821265f816e0ac692a3a54
X-Patchwork-Hint: ignore
Message-Id: <20240920103451.876E783FA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/linux-firmware:
 fix typo in Config.in prompt
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

commit: https://git.buildroot.net/buildroot/commit/?id=6733f2954cf3594b91821265f816e0ac692a3a54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit abfefc0a148fef85cc159dbaf19454f0d4d1cc3a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 6fb8953c1c..076ecde02c 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -581,7 +581,7 @@ config BR2_PACKAGE_LINUX_FIRMWARE_QLOGIC_4X
 	  (qede)
 
 config BR2_PACKAGE_LINUX_FIRMWARE_RTL_815X
-	bool "Realtek 8152/8153/8156 USB Ethernet Adapaters"
+	bool "Realtek 8152/8153/8156 USB Ethernet Adapters"
 	help
 	  Firmware files for Realtek 8152/8153/8156 based USB Ethernet
 	  adapters.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
