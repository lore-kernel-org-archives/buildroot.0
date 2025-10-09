Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE19CCD188
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 10:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6C0D6132D;
	Thu,  9 Oct 2025 10:16:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TDsNBftBvUJC; Thu,  9 Oct 2025 10:16:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE31E6131A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE31E6131A;
	Thu,  9 Oct 2025 10:16:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E68921B
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A39116120F
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:16:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sLTP68VRzk8Y for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 10:16:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0072060F22
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0072060F22
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:15:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D364986E16; Thu,  9 Oct 2025 10:15:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 Oct 2025 08:27:40 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e7ae62f74791e8020bf625638c9adfc26ddf1ad8
X-Git-Newrev: 54b64f242f40ca283e4dd19f14df6a4a39a06afa
X-Patchwork-Hint: ignore
Message-Id: <20251009101559.D364986E16@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/linux-firmware:
 add support for Intel 6E Ty architecture
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=54b64f242f40ca283e4dd19f14df6a4a39a06afa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Note:
The first file matching the pattern "iwlwifi-ty-a0-gf-a0*" was
introduced in commit [1], first included in version 20201022.

[1] https://gitlab.com/kernel-firmware/linux-firmware/-/commit/4f41e9d6437d03e7ce9279076107dd08f46656f3

Signed-off-by: Alex McLain <alex@alexmclain.com>
[Julien: add the note in commit log when the first
  firmware was introduced
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 4a51495d69da56eff157e4b51b2326ac320aabf4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/linux-firmware/linux-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index fac5733ad4..6b3a4bee24 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -610,7 +610,7 @@ LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6E),y)
-LINUX_FIRMWARE_FILES += iwlwifi-so-a0-gf-a0*.{ucode,pnvm}
+LINUX_FIRMWARE_FILES += iwlwifi-{so,ty}-a0-gf-a0*.{ucode,pnvm}
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
