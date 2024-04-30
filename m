Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF786C10F16
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 20:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBA2941580;
	Tue, 30 Apr 2024 20:52:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ksEVKWXNkuzx; Tue, 30 Apr 2024 20:52:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88A4C4158A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88A4C4158A;
	Tue, 30 Apr 2024 20:52:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5E4FA1BF977
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 20:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48ABC40554
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 20:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HLD_pNK8-UXW for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 20:51:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 344E040324
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 344E040324
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 20:51:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2AEAF8631E; Tue, 30 Apr 2024 20:51:56 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 30 Apr 2024 22:50:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b3662e49218effe0a6bc9b814bb4647869cb5f6
X-Git-Newrev: bc75b09b1c18541abaa47fc34eab44e91e2018ca
X-Patchwork-Hint: ignore
Message-Id: <20240430205156.2AEAF8631E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: TestATFAllwinner: add
 missing openssl dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=bc75b09b1c18541abaa47fc34eab44e91e2018ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The commit [1] updated the u-boot version with the one used by
orangepi_zero_plus2_defconfig but the dependency on openssl
was forgotten.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6703221868

[1] eb16148dddc6be39b0d850181c2461fdaba1ee6f

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/boot/test_atf.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
index 352725e721..b0e7696e86 100644
--- a/support/testing/tests/boot/test_atf.py
+++ b/support/testing/tests/boot/test_atf.py
@@ -19,6 +19,7 @@ class TestATFAllwinner(infra.basetest.BRTest):
         BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
         BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero_plus2"
         BR2_TARGET_UBOOT_NEEDS_DTC=y
+        BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
         BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
         BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
         BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
