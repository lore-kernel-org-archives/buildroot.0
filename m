Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CE2E77180
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 22:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ADF460648;
	Fri, 13 Dec 2024 22:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LrV10NO7288v; Fri, 13 Dec 2024 22:45:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C8A860E09
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C8A860E09;
	Fri, 13 Dec 2024 22:45:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BB23EECD
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 22:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0C904055A
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 22:45:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mZKpFPlp7wvG for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 22:45:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0D5F40558
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0D5F40558
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 22:45:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A27A86F49; Fri, 13 Dec 2024 22:45:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Dec 2024 23:44:05 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: d47b41bbf6319c25ce15a81ea3376e964fac29bd
X-Git-Newrev: de3a8734f13e80467638a82f3f8673c35889fc6c
X-Patchwork-Hint: ignore
Message-Id: <20241213224555.8A27A86F49@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x]
 support/testing/tests/boot/test_edk2.py: switch to neoverse-n1 cpu
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=de3a8734f13e80467638a82f3f8673c35889fc6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

The SBSA Reference Platform was updated to use the neoverse-n1 cpu
(armv8.2a) in Qemu v8.1 [1].

Commit c58a2a968 "configs/qemu_aarch64_sbsa_defconfig: switch to
neoverse-n1 (armv8.2a)" [2] reflected this change in
qemu_aarch64_sbsa_defconfig.

This commit updates the test_edk2 runtime test the same way.

This update is possible with the help of commits [3] and [4].

[1] https://gitlab.com/qemu-project/qemu/-/commit/1877272bad7b08b67312503ee66184279876c7bd
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/c58a2a9687c045379c0f768c8c6c1c1a41842a85
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/0d4177598ce7e73f2b97ac58c21fb177343643e3
[4] https://gitlab.com/buildroot.org/buildroot/-/commit/fba62f2ab13c095de860a07851d148181f4e38bc

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 36c7a5366a975519aba6cbc2f0306c8547a31d5f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/boot/test_edk2.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/boot/test_edk2.py b/support/testing/tests/boot/test_edk2.py
index 39d7a4dbcc..54a59089da 100644
--- a/support/testing/tests/boot/test_edk2.py
+++ b/support/testing/tests/boot/test_edk2.py
@@ -7,6 +7,7 @@ class TestEdk2(infra.basetest.BRTest):
     config = \
         """
         BR2_aarch64=y
+        BR2_neoverse_n1=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_TARGET_ROOTFS_EXT2=y
@@ -63,7 +64,7 @@ class TestEdk2(infra.basetest.BRTest):
         flash1 = os.path.join(self.builddir, "images", "SBSA_FLASH1.fd")
         self.emulator.boot(arch="aarch64",
                            options=["-M", "sbsa-ref",
-                                    "-cpu", "cortex-a57",
+                                    "-cpu", "neoverse-n1",
                                     "-m", "512M",
                                     "-pflash", flash0,
                                     "-pflash", flash1,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
