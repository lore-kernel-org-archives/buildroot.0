Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C8BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 14:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BB874155E;
	Sun, 10 Apr 2022 14:53:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DtsjOVaC1WKO; Sun, 10 Apr 2022 14:53:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E53F410E7;
	Sun, 10 Apr 2022 14:53:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9A0A91BF3B5
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8892C8403B
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:53:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lk9LeTCCzfva for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 14:53:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDFFE830B8
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 14:53:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 351C283828; Sun, 10 Apr 2022 14:43:21 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 16:48:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ecac95be4e815dabbd5abf163f2917ec2770c28
X-Git-Newrev: 9f47a9480b9b168e00f0d564db362b95306af95b
X-Patchwork-Hint: ignore
Message-Id: <20220410144321.351C283828@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpa_supplicant: enable SAE-PK
 option for WPA3
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f47a9480b9b168e00f0d564db362b95306af95b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This enables a new security feature "SAE Public Key".

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/wpa_supplicant/wpa_supplicant.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index f0eb36e083..a2ca8a0b30 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -112,11 +112,13 @@ ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPA3),y)
 WPA_SUPPLICANT_CONFIG_ENABLE += \
 	CONFIG_DPP \
 	CONFIG_SAE \
+	CONFIG_SAE_PK \
 	CONFIG_OWE
 else
 WPA_SUPPLICANT_CONFIG_DISABLE += \
 	CONFIG_DPP \
 	CONFIG_SAE \
+	CONFIG_SAE_PK \
 	CONFIG_OWE
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
