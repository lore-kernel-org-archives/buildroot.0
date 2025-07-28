Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D96BC83F26
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 22:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D14024103C;
	Mon, 28 Jul 2025 22:22:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I0KaQ4XXcmSw; Mon, 28 Jul 2025 22:22:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0566941032
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0566941032;
	Mon, 28 Jul 2025 22:22:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D5CA4DA
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 22:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C747B40AEC
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 22:22:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Um3q1YN7KIfY for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 22:22:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0794B40AE0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0794B40AE0
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 22:22:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2FD786B2E; Mon, 28 Jul 2025 22:22:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 29 Jul 2025 00:21:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ffc3aa43e923c968ee1bf6dcd910100adece343
X-Git-Newrev: d15ffdfda7304db8a617add87478ea03ca5e095d
X-Patchwork-Hint: ignore
Message-Id: <20250728222234.A2FD786B2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_xen: rename TestXen
 to TestXenAarch64
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
Content-Type: multipart/mixed; boundary="===============7200154600347078903=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7200154600347078903==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d15ffdfda7304db8a617add87478ea03ca5e095d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit [1] introduced an Armv7 test case for Xen named TestXenArmv7,
next to the original Aarch64 test case which was simply named TestXen.

The test list shows, for example with the command
"support/testing/run-tests -l":

    tests.package.test_xen.TestXen
    tests.package.test_xen.TestXenArmv7

In order to make this test list a bit more explicit, this commit
renames the TestXen to TestXenAarch64. With that change, the list
becomes:

    tests.package.test_xen.TestXenAarch64
    tests.package.test_xen.TestXenArmv7

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/5346824a83488f840008eb24f84866435ac32a12

Cc: Vincent Stehlé <vincent.stehle@arm.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_xen.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_xen.py b/support/testing/tests/package/test_xen.py
index 4278b9563e..881327b9b9 100644
--- a/support/testing/tests/package/test_xen.py
+++ b/support/testing/tests/package/test_xen.py
@@ -89,7 +89,7 @@ class TestXenBase(infra.basetest.BRTest):
         self.assertNumVM(2)
 
 
-class TestXen(TestXenBase):
+class TestXenAarch64(TestXenBase):
     # Test Xen on 64b Arm.
     # Boot flow: Qemu Devicetree -> U-Boot -> Xen UEFI -> Linux
     # We need to boot Xen in UEFI to read xen.cfg.

--===============7200154600347078903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7200154600347078903==--
