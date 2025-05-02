Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F948C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D045642C32;
	Fri,  2 May 2025 11:14:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yokVevCiNMDG; Fri,  2 May 2025 11:14:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12B4242C38
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12B4242C38;
	Fri,  2 May 2025 11:14:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F43BEE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E35F417D0
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wiSZPlDEPXCb for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D918441D96
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D918441D96
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D235F860E9; Fri,  2 May 2025 11:11:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 May 2025 13:00:59 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: bd6342e3b529a1bdecf3a8fe09db1a22c9810b95
X-Git-Newrev: 9611c1cd9e0ac314edd5923d7bdc69fb6be4b400
X-Patchwork-Hint: ignore
Message-Id: <20250502111137.D235F860E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
 test_edk2: add macchiatobin build test
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2561378885896053584=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2561378885896053584==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=9611c1cd9e0ac314edd5923d7bdc69fb6be4b400
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Add an EDK II build test for the MACCHIATObin platform.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Dick Olsson <hi@senzilla.io>
Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a5821cdaa103965bcf7795b839082a1d5b39e031)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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

--===============2561378885896053584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2561378885896053584==--
