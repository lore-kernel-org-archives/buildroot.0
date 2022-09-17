Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E966C6FA82
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 20:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5490360AF6;
	Sat, 17 Sep 2022 20:18:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5490360AF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ob97UEE1Juyz; Sat, 17 Sep 2022 20:18:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7880E607AA;
	Sat, 17 Sep 2022 20:18:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7880E607AA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2BAC31BF39A
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 20:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06B6A419E7
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 20:18:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06B6A419E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2xv7MucnQav2 for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 20:18:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98E4A416CA
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 20:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98E4A416CA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 834C08468D; Sat, 17 Sep 2022 20:18:18 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 22:13:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dbff193c74bfda9cee96e3f6975f7430dd5acbd4
X-Git-Newrev: c8a618cff715c4cc96f01a516f39107b059e25f1
X-Patchwork-Hint: ignore
Message-Id: <20220917201818.834C08468D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/test/cpio: test for pv already
 done by listing the cpio archive
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

commit: https://git.buildroot.net/buildroot/commit/?id=c8a618cff715c4cc96f01a516f39107b059e25f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we do not pivot_root/switch_root from the cpio, whatever we get
in the rootfs was exactly what we got by listing the cpio archive.

Drop the test for the presence of pv, it's redundant.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thierry Bultel <thierry.bultel@linatsea.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 support/testing/tests/fs/test_cpio.py | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/support/testing/tests/fs/test_cpio.py b/support/testing/tests/fs/test_cpio.py
index 3f661e370c..9a529f1edd 100644
--- a/support/testing/tests/fs/test_cpio.py
+++ b/support/testing/tests/fs/test_cpio.py
@@ -57,10 +57,6 @@ class TestCpioDracutBase(infra.basetest.BRTest):
                              self.builddir)
         self.assertEqual(exit_code, 0)
 
-        # No pivot_root is done, so pv shouldn't be there
-        _, exit_code = self.emulator.run("ls -l /usr/bin/pv")
-        self.assertNotEqual(exit_code, 0)
-
 
 class TestCpioDracutUclibc(TestCpioDracutBase):
     config = TestCpioDracutBase.config + \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
