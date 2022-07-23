Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39B7C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8557F84BAC;
	Sat, 23 Jul 2022 19:39:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8557F84BAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wLLkK4CcOu9N; Sat, 23 Jul 2022 19:39:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B0B584BEF;
	Sat, 23 Jul 2022 19:39:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B0B584BEF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 98B5F1BF5A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8181D60746
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:39:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8181D60746
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oujr2IFd0ffk for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:39:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D639660701
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:39:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D639660701
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5763E84D86; Sat, 23 Jul 2022 19:25:30 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 21:29:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ea42ff9cff1a5731dbf028ec0f1eaf9e23435ce
X-Git-Newrev: 0829c09527dd622e90ea410c1becb66c0cc71020
X-Patchwork-Hint: ignore
Message-Id: <20220723192530.5763E84D86@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: remove extra
 ending parentheses
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

commit: https://git.buildroot.net/buildroot/commit/?id=0829c09527dd622e90ea410c1becb66c0cc71020
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There are two extra ending parentheses to be removed.
They are present from the beggining of TF-A package. I suppose extra
ending parenthese does not bring any issue, but it seems relevant to
remove them.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 30ecb187ae..356d2a8b6d 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -202,8 +202,8 @@ endef
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE)$(BR_BUILDING),yy)
 
 ifeq ($(ARM_TRUSTED_FIRMWARE_VERSION),custom)
-ifeq ($(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION))),)
-$(error No tarball location specified. Please check BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION))
+ifeq ($(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION)),)
+$(error No tarball location specified. Please check BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION)
 endif
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
