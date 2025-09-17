Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489C4CAC598
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 21:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43E3284740;
	Wed, 17 Sep 2025 21:06:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sgq7HzrEnbHy; Wed, 17 Sep 2025 21:06:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A81BE84741
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A81BE84741;
	Wed, 17 Sep 2025 21:06:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D548DE87
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 21:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC4EF40985
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 21:06:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rQnLf1k_WfOq for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 21:06:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 036414094A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 036414094A
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 21:06:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F2D4185C36; Wed, 17 Sep 2025 21:06:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Sep 2025 23:04:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e028c2cdc9ee67602af98293ce0589add1fe4df8
X-Git-Newrev: 9b8b2d4478a1088bd91cff8028ff53483645f941
X-Patchwork-Hint: ignore
Message-Id: <20250917210613.F2D4185C36@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/tests/boot/test_edk2.py:
 switch to neoverse-n2 cpu
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9b8b2d4478a1088bd91cff8028ff53483645f941
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The SBSA Reference Platform was updated to neoverse-n2 (armv9.0a)
in Qemu v9.1 [1].

The Armv9-A and Neoverse N2 core support was added in Buildroot
commit [2].

Since the test_edk2 uses the Qemu sbsa-ref machine, this commit
aligns it to use the neoverse-n2 cpu.

[1] https://gitlab.com/qemu-project/qemu/-/commit/b1d592e7b0a7301eae8e3baa99744ac35db3cd2a
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/9845bd4541cb03e97e577281f3c64f00c6ead881

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/boot/test_edk2.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/boot/test_edk2.py b/support/testing/tests/boot/test_edk2.py
index a12c7a6f2b..316eb616ee 100644
--- a/support/testing/tests/boot/test_edk2.py
+++ b/support/testing/tests/boot/test_edk2.py
@@ -7,7 +7,7 @@ class TestEdk2(infra.basetest.BRTest):
     config = \
         """
         BR2_aarch64=y
-        BR2_neoverse_n1=y
+        BR2_neoverse_n2=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_TARGET_ROOTFS_EXT2=y
@@ -42,7 +42,7 @@ class TestEdk2(infra.basetest.BRTest):
         flash1 = os.path.join(self.builddir, "images", "SBSA_FLASH1.fd")
         self.emulator.boot(arch="aarch64",
                            options=["-M", "sbsa-ref",
-                                    "-cpu", "neoverse-n1",
+                                    "-cpu", "neoverse-n2",
                                     "-m", "512M",
                                     "-pflash", flash0,
                                     "-pflash", flash1,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
