Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8AEC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 14:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E35A41582;
	Sun, 10 Apr 2022 14:53:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tuNQ-t4Ulglh; Sun, 10 Apr 2022 14:53:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3862D4155E;
	Sun, 10 Apr 2022 14:53:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 656501BF3B5
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0174400F3
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:53:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c-OiaTx7tYqd for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 14:53:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01FD341554
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 14:53:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3D67E83829; Sun, 10 Apr 2022 14:43:21 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 16:48:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f47a9480b9b168e00f0d564db362b95306af95b
X-Git-Newrev: c2a2f81e01e0a877c038a642eba6a9c8e7c88c15
X-Patchwork-Hint: ignore
Message-Id: <20220410144321.3D67E83829@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hostapd: enable SAE-PK option for
 WPA3
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

commit: https://git.buildroot.net/buildroot/commit/?id=c2a2f81e01e0a877c038a642eba6a9c8e7c88c15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This enables a new security feature "SAE Public Key".

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/hostapd/hostapd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 99f0cdf1b8..4420142fbd 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -85,11 +85,13 @@ ifeq ($(BR2_PACKAGE_HOSTAPD_WPA3),y)
 HOSTAPD_CONFIG_ENABLE += \
 	CONFIG_DPP \
 	CONFIG_SAE \
+	CONFIG_SAE_PK \
 	CONFIG_OWE
 else
 HOSTAPD_CONFIG_DISABLE += \
 	CONFIG_DPP \
 	CONFIG_SAE \
+	CONFIG_SAE_PK \
 	CONFIG_OWE
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
