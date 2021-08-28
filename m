Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B56C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 12:24:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8D9060EAF
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 12:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C8D9060EAF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 999F840307;
	Sat, 28 Aug 2021 12:24:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lExkGcITcG8L; Sat, 28 Aug 2021 12:24:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10AFF42755;
	Sat, 28 Aug 2021 12:24:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F7C71BF319
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 12:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BDC983032
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 12:24:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G1wEsZuld7TU for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 12:24:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27F6B8302F
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 12:24:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BEFEB8EDBD; Sat, 28 Aug 2021 12:23:33 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 14:24:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bdf792910945f287beda6d9262492f1910646a61
X-Git-Newrev: e5494f1fac12744217784c331b1ba3c28f319567
X-Patchwork-Hint: ignore
Message-Id: <20210828122333.BEFEB8EDBD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_atf: bump the custom
 version to v2.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=e5494f1fac12744217784c331b1ba3c28f319567
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version bump is needed to pass the ATF test with
hardening option enabled (-fstack-protector-strong)

With the version v2.2, ATF fail due to undefined references:

./build/juno/release/bl2u/arm_tzc400.o: In function `arm_tzc400_setup':
arm_tzc400.c:(.text.arm_tzc400_setup+0x10): undefined reference to `__stack_chk_guard'
arm_tzc400.c:(.text.arm_tzc400_setup+0x18): undefined reference to `__stack_chk_guard'
arm_tzc400.c:(.text.arm_tzc400_setup+0xb8): undefined reference to `__stack_chk_guard'
arm_tzc400.c:(.text.arm_tzc400_setup+0xcc): undefined reference to `__stack_chk_fail'

Since commit ccac9a5bbbd7374187a0f0017101ece0c202851d, Buildroot no
longer forces ENABLE_STACK_PROTECTOR. However, we rely on the ATF build
system to handle it correctly, and this wasn't the case in v2.2.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/1524842591

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/boot/test_atf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
index a9d5b67ac7..4fcb9b241c 100644
--- a/support/testing/tests/boot/test_atf.py
+++ b/support/testing/tests/boot/test_atf.py
@@ -10,7 +10,7 @@ class TestATFVexpress(infra.basetest.BRTest):
         BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.2"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.5"
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="juno"
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
