Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48CBC369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 11:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EA4440498;
	Tue, 22 Apr 2025 11:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XEaRn5o_qA9q; Tue, 22 Apr 2025 11:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94CD240620
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94CD240620;
	Tue, 22 Apr 2025 11:05:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C8D141A0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 11:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE38680ED6
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 11:05:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kCS4bYuY_EQj for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 11:05:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1131280EC4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1131280EC4
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 11:05:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9478860A6; Tue, 22 Apr 2025 11:05:06 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 22 Apr 2025 13:00:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ffdcc5b9db2a703259f900fdc8251c4e0d14dfb
X-Git-Newrev: a5821cdaa103965bcf7795b839082a1d5b39e031
X-Patchwork-Hint: ignore
Message-Id: <20250422110506.E9478860A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_edk2: add
 macchiatobin build test
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6918465373587858382=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6918465373587858382==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a5821cdaa103965bcf7795b839082a1d5b39e031
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an EDK II build test for the MACCHIATObin platform.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Dick Olsson <hi@senzilla.io>
Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/boot/test_edk2.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/support/testing/tests/boot/test_edk2.py b/support/testing/tests/boot/test_edk2.py
index 4e0942b3a4..19c6d9c482 100644
--- a/support/testing/tests/boot/test_edk2.py
+++ b/support/testing/tests/boot/test_edk2.py
@@ -149,3 +149,21 @@ class TestEdk2BuildQemuSbsa(TestEdk2BuildBase):
 
     def test_run(self) -> None:
         self.assertBinariesExist("SBSA_FLASH0.fd", "SBSA_FLASH1.fd", "fip.bin")
+
+
+class TestEdk2BuildSolidrunArmada80x0mcbin(TestEdk2BuildBase):
+    config = TestEdk2BuildBase.base_config + \
+        """
+        BR2_aarch64=y
+        BR2_cortex_a72=y
+        BR2_TARGET_EDK2_PLATFORM_SOLIDRUN_ARMADA80X0MCBIN=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="a80x0_mcbin"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33=y
+        BR2_TARGET_BINARIES_MARVELL=y
+        BR2_TARGET_MV_DDR_MARVELL=y
+        """
+
+    def test_run(self) -> None:
+        self.assertBinariesExist("ARMADA_EFI.fd", "fip.bin", "ble.bin",
+                                 "scp-fw.bin")

--===============6918465373587858382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6918465373587858382==--
