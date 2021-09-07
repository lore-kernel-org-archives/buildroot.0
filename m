Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1EE5C433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 13:01:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AACF61052
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 13:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9AACF61052
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 793B5406D2;
	Tue,  7 Sep 2021 13:01:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rB3pyvLrAe9F; Tue,  7 Sep 2021 13:01:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B80BF406CB;
	Tue,  7 Sep 2021 13:01:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5A4251BF334
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 13:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 486DC40282
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 13:00:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bkmUwsa_xQiL for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 13:00:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FA6F4049D
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 13:00:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D985B88806; Tue,  7 Sep 2021 12:59:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Sep 2021 14:59:17 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 5126808849792039dcb9cde0c8d183ef48b68ef6
X-Git-Newrev: 78c963244a88bf1f9c03a601eb8d791745770021
X-Patchwork-Hint: ignore
Message-Id: <20210907125926.D985B88806@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] support/testing:
 test_atf: bump the custom version to v2.5
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=78c963244a88bf1f9c03a601eb8d791745770021
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

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
(cherry picked from commit e5494f1fac12744217784c331b1ba3c28f319567)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/boot/test_atf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
index e6c11aa742..a6ef676182 100644
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
