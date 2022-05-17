Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4418FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 20:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7D40403FB;
	Tue, 17 May 2022 20:40:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5FreN0EM0GDM; Tue, 17 May 2022 20:40:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE25A401FB;
	Tue, 17 May 2022 20:40:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F6D81BF83C
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 290F084026
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:40:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J8cm04yQ9GDr for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 20:40:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 27B9983466
 for <buildroot@buildroot.org>; Tue, 17 May 2022 20:40:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:38de:5f35:431:927e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6DCEA13F846;
 Tue, 17 May 2022 22:40:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652820029;
 bh=+wm19feZvjfXsmHx6dz2oteJW+0/XF28N1IIaQ3QXz0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n9LxIzwzwLub6jS9kx6ZDtbDXGp8dxCOQt2YbprukrbIT6rjt7fTkfKxCqSsDH2ab
 irJlYxk1zg7F2ChA5AatDOkCuChz0i2gVBjQ6MA6ZHnzkcB7bLbDoNamm6LdVE7QN6
 tPOsU+NpTEz5peQgpt1w1GK5Q8AGa9qZWIYnnppimD3cDqQHBHiPnnh2eNyXjhKT7n
 P9kLMujKAnNBxAUpSP/YpeO1ZQkZARYtjyk49DtwVhCsihbdpMpgY1qCQUugJOLu5V
 12A9gM+3sPGpyyNr8OmzB0Mstc5yNqx74sTzpMS/QMrNNqgL0CzuKYq5UASW00kaZT
 aHhCI1bVdvloA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 17 May 2022 22:40:27 +0200
Date: Tue, 17 May 2022 22:40:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Linus Kaschulla <linus@cosmos-ink.net>
Message-ID: <20220517204027.GS1597494@scaer>
References: <20220517141938.3395-1-linus@cosmos-ink.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220517141938.3395-1-linus@cosmos-ink.net>
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

On 2022-05-17 14:19 +0000, Linus Kaschulla via buildroot spake thusly:
> For the new patch, adding block size options (commit 555f8dfd),
> Yann E. MORIN requested updated testcases that specifically ensure
> the extreme blocksizes (4K and 1024K) don't cause issues.
> 
> This patch splits the current test case in 2, testing with both
> block sizes and ensuring the block size was applied in the same
> fashion as for the specified compression.
> 
> Signed-off-by: Linus Kaschulla <linus@cosmos-ink.net>
> ---
>  support/testing/tests/fs/test_squashfs.py | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/fs/test_squashfs.py b/support/testing/tests/fs/test_squashfs.py
> index a914f5aac7..07239fcce2 100644
> --- a/support/testing/tests/fs/test_squashfs.py
> +++ b/support/testing/tests/fs/test_squashfs.py
> @@ -3,13 +3,15 @@ import os
>  import infra.basetest
>  
>  
> -class TestSquashfs(infra.basetest.BRTest):
> +class TestSquashfsMinBlocksize(infra.basetest.BRTest):

In fact I think we need to keep the existing test that uses the default
value too.

>      config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
>          """
>          BR2_TARGET_ROOTFS_SQUASHFS=y
> +        BR2_TARGET_ROOTFS_SQUASHFS_BS_4K=y
>          BR2_TARGET_ROOTFS_SQUASHFS4_LZO=y
>          # BR2_TARGET_ROOTFS_TAR is not set
>          """
> +    expected_blocksize_in_bytes = 1024 * 4
>  
>      def test_run(self):
>          unsquashfs_cmd = ["host/bin/unsquashfs", "-s", "images/rootfs.squashfs"]
> @@ -18,6 +20,7 @@ class TestSquashfs(infra.basetest.BRTest):
>          self.assertEqual(out[0],
>                           "Found a valid SQUASHFS 4:0 superblock on images/rootfs.squashfs.")
>          self.assertEqual(out[3], "Compression lzo")
> +        self.assertEqual(out[4], "Block size {}".format(self.expected_blocksize_in_bytes))
>  
>          img = os.path.join(self.builddir, "images", "rootfs.squashfs")
>          infra.img_round_power2(img)
> @@ -31,3 +34,15 @@ class TestSquashfs(infra.basetest.BRTest):
>  
>          cmd = "mount | grep '/dev/root on / type squashfs'"
>          self.assertRunOk(cmd)
> +

    $ make check-flake8
    WARNING: support/testing/tests/fs/test_squashfs.py:40:1: E302 expected 2 blank lines, found 1

Yes, like check-package, this is 100% totally undocumented. :-]

So, I've restored the original test that checks the default, and two new
tersts that check the min and max, and I fixed the flake8 issue.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +# Reusing TestSquashfsMinBlocksize's test_run(), but change
> +# blocksize in config the maxium to ensure all extemes work.
> +class TestSquashfsMaxBlocksize(TestSquashfsMinBlocksize):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_TARGET_ROOTFS_SQUASHFS=y
> +        BR2_TARGET_ROOTFS_SQUASHFS_BS_1024K=y
> +        BR2_TARGET_ROOTFS_SQUASHFS4_LZO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +    expected_blocksize_in_bytes = 1024 * 1024
> -- 
> 2.35.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
