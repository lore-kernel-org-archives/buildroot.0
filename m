Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C70C78820
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 10:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1142A42B75;
	Fri, 20 Sep 2024 10:36:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3KJ-eBF_3-rb; Fri, 20 Sep 2024 10:36:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B94A942CED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B94A942CED;
	Fri, 20 Sep 2024 10:36:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 411021BF990
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B4FE84C03
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:36:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4PmEwnMABNcX for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 10:36:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A088484C32
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A088484C32
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 10:36:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5CBB68412D; Fri, 20 Sep 2024 10:36:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 12:33:33 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: a6be28c767dcf95b1645d0dd6c9e9b49c6163614
X-Git-Newrev: d69b380c3c97f28e9fd97bf275daf6b5166ad62b
X-Patchwork-Hint: ignore
Message-Id: <20240920103606.5CBB68412D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/linux-firmware:
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

commit: https://git.buildroot.net/buildroot/commit/?id=d69b380c3c97f28e9fd97bf275daf6b5166ad62b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit abfefc0a148fef85cc159dbaf19454f0d4d1cc3a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 651ca45087..a10317c494 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -596,7 +596,7 @@ config BR2_PACKAGE_LINUX_FIRMWARE_QLOGIC_4X
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
