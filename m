Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819CEC433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 21:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B02641A31;
	Tue, 17 May 2022 21:04:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JBIdUn4AHR64; Tue, 17 May 2022 21:04:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9637E41A4F;
	Tue, 17 May 2022 21:04:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D4EF31BF83C
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 21:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D134160B26
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 21:04:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mb_Gz55tD4Rb for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 21:04:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC7A9607F2
 for <buildroot@buildroot.org>; Tue, 17 May 2022 21:04:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:38de:5f35:431:927e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3787113F7E2;
 Tue, 17 May 2022 23:04:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652821446;
 bh=qiD3TjOcf8ZzgwQZua3vHwK0GJEtJifkMvkqyeyK84Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G2iez/D6sD8FSIHavXHa/RznG7bzuOT2YQiaBIK34hXqzC/KyoVV5xn/RK8epbUrj
 6TuL/LqtF1bOUAL6r8FXvjhMLGYcaYSGXg/lW8NWp4XG65i9wW/toSCIaGYc1gW7tZ
 DhZwFBB6uVb8qlzGsaGLhedoxVePPBQjMDPc1Oxkr9Uj/Yh6lABh68LL4zrRRLZZ5R
 tP37v0eolj+sNd+Sxq58zy2k5NblbogqAPndt1btaqFALPshSCuyyUVcbEfIhldtRB
 Wqck4+yX64xinCLzRhPFJq851Bm1ZBkP+zIuh+H4T7jRq6IM40k/UGHTL/DFtzXKuc
 5aVZ2oqkHQMgA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 17 May 2022 23:04:03 +0200
Date: Tue, 17 May 2022 23:04:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Linus <linus@cosmos-ink.net>
Message-ID: <20220517210403.GV1597494@scaer>
References: <20220517141938.3395-1-linus@cosmos-ink.net>
 <20220517204027.GS1597494@scaer>
 <7700647d-b901-b966-8588-8ae73590cd78@cosmos-ink.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7700647d-b901-b966-8588-8ae73590cd78@cosmos-ink.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] fs/squashfs: needs more test cases
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Linus, All,

On 2022-05-17 22:56 +0200, Linus spake thusly:
> You've been really helpful. I really appreciate the time you set aside for
> me.

It benefits us all, so thanks!

> Huge Thanks,
> Linus Kaschulla
> 
> P.S.: I might probably add the pv utility (pipeview) sometime later as I
> consider the tool essential and noticed it missing. But might be a few
> months until I get to that. Should be a pretty easy addtion tough.

Err.. we do have it, no? See: package/pv/

Regards,
Yann E. MORIN.

> Am 17.05.22 um 22:40 schrieb Yann E. MORIN:
> >Linus, All,
> >
> >On 2022-05-17 14:19 +0000, Linus Kaschulla via buildroot spake thusly:
> >>For the new patch, adding block size options (commit 555f8dfd),
> >>Yann E. MORIN requested updated testcases that specifically ensure
> >>the extreme blocksizes (4K and 1024K) don't cause issues.
> >>
> >>This patch splits the current test case in 2, testing with both
> >>block sizes and ensuring the block size was applied in the same
> >>fashion as for the specified compression.
> >>
> >>Signed-off-by: Linus Kaschulla <linus@cosmos-ink.net>
> >>---
> >>  support/testing/tests/fs/test_squashfs.py | 17 ++++++++++++++++-
> >>  1 file changed, 16 insertions(+), 1 deletion(-)
> >>
> >>diff --git a/support/testing/tests/fs/test_squashfs.py b/support/testing/tests/fs/test_squashfs.py
> >>index a914f5aac7..07239fcce2 100644
> >>--- a/support/testing/tests/fs/test_squashfs.py
> >>+++ b/support/testing/tests/fs/test_squashfs.py
> >>@@ -3,13 +3,15 @@ import os
> >>  import infra.basetest
> >>-class TestSquashfs(infra.basetest.BRTest):
> >>+class TestSquashfsMinBlocksize(infra.basetest.BRTest):
> >In fact I think we need to keep the existing test that uses the default
> >value too.
> >
> >>      config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> >>          """
> >>          BR2_TARGET_ROOTFS_SQUASHFS=y
> >>+        BR2_TARGET_ROOTFS_SQUASHFS_BS_4K=y
> >>          BR2_TARGET_ROOTFS_SQUASHFS4_LZO=y
> >>          # BR2_TARGET_ROOTFS_TAR is not set
> >>          """
> >>+    expected_blocksize_in_bytes = 1024 * 4
> >>      def test_run(self):
> >>          unsquashfs_cmd = ["host/bin/unsquashfs", "-s", "images/rootfs.squashfs"]
> >>@@ -18,6 +20,7 @@ class TestSquashfs(infra.basetest.BRTest):
> >>          self.assertEqual(out[0],
> >>                           "Found a valid SQUASHFS 4:0 superblock on images/rootfs.squashfs.")
> >>          self.assertEqual(out[3], "Compression lzo")
> >>+        self.assertEqual(out[4], "Block size {}".format(self.expected_blocksize_in_bytes))
> >>          img = os.path.join(self.builddir, "images", "rootfs.squashfs")
> >>          infra.img_round_power2(img)
> >>@@ -31,3 +34,15 @@ class TestSquashfs(infra.basetest.BRTest):
> >>          cmd = "mount | grep '/dev/root on / type squashfs'"
> >>          self.assertRunOk(cmd)
> >>+
> >     $ make check-flake8
> >     WARNING: support/testing/tests/fs/test_squashfs.py:40:1: E302 expected 2 blank lines, found 1
> >
> >Yes, like check-package, this is 100% totally undocumented. :-]
> >
> >So, I've restored the original test that checks the default, and two new
> >tersts that check the min and max, and I fixed the flake8 issue.
> >
> >Applied to master, thanks.
> >
> >Regards,
> >Yann E. MORIN.
> >
> >>+# Reusing TestSquashfsMinBlocksize's test_run(), but change
> >>+# blocksize in config the maxium to ensure all extemes work.
> >>+class TestSquashfsMaxBlocksize(TestSquashfsMinBlocksize):
> >>+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> >>+        """
> >>+        BR2_TARGET_ROOTFS_SQUASHFS=y
> >>+        BR2_TARGET_ROOTFS_SQUASHFS_BS_1024K=y
> >>+        BR2_TARGET_ROOTFS_SQUASHFS4_LZO=y
> >>+        # BR2_TARGET_ROOTFS_TAR is not set
> >>+        """
> >>+    expected_blocksize_in_bytes = 1024 * 1024
> >>-- 
> >>2.35.1
> >>
> >>_______________________________________________
> >>buildroot mailing list
> >>buildroot@buildroot.org
> >>https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
