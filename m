Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C474C47DB7
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 10:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 291B140468;
	Sun, 21 Jan 2024 10:19:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 291B140468
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KtgC_n6O1inO; Sun, 21 Jan 2024 10:19:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1710D405A9;
	Sun, 21 Jan 2024 10:19:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1710D405A9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 892871BF37C
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 10:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FA0981E0C
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 10:19:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FA0981E0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a1O2TmMTUhVo for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 10:19:16 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 36C7B81E09
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 10:19:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36C7B81E09
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4C6EC13F879;
 Sun, 21 Jan 2024 11:19:11 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 Jan 2024 11:19:11 +0100
Date: Sun, 21 Jan 2024 11:19:11 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <Zazvn5iG5SYzeC9y@landeda>
References: <20240110210638.213739-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240110210638.213739-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705832353;
 bh=CLxgT/DzkWVyJQO5ggee2JthyldInG7TUSF3iBKZEJ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sLBcmyzBX0yCcA0cYNsd5bAGGwUFMMEix09G4kDY4hWpk1ucIJi8M37R8HA3wLgXf
 MHXbn7BvZsIjW579Bw6KNnt5q4ycuASC2oM03B+UkSJlK7JR8XJEgVtnsOHZ79OJK2
 KUrzj5m63BPw/lmZET9PMH81E4rIXw1bLmhd2Hmunk526pWAkOq3lDT6xqouaaeCov
 x7qTW1ruqOJHntRKrE+dmyUBVvcZ8mjy1zVnIuYPunYArlEqlxG5RxWLJgMhnYJ3mp
 YMMMzlFTau/f6EBTGJdwgy7XfBTQG0X/tnG7gQAIcer7Bt7mdMMR2pHff5oyle1W4t
 kz9aeEKR9lxWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sLBcmyzB
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add mtr runtime test
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

Julien, All,

On 2024-01-10 22:06 +0100, Julien Olivain spake thusly:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS                                |  1 +
>  support/testing/tests/package/test_mtr.py | 22 ++++++++++++++++++++++
>  2 files changed, 23 insertions(+)
>  create mode 100644 support/testing/tests/package/test_mtr.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d7543247f2..79152b28ae 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1789,6 +1789,7 @@ F:	support/testing/tests/package/test_lsof.py
>  F:	support/testing/tests/package/test_lz4.py
>  F:	support/testing/tests/package/test_lzop.py
>  F:	support/testing/tests/package/test_mtools.py
> +F:	support/testing/tests/package/test_mtr.py
>  F:	support/testing/tests/package/test_ncdu.py
>  F:	support/testing/tests/package/test_nftables.py
>  F:	support/testing/tests/package/test_nftables/
> diff --git a/support/testing/tests/package/test_mtr.py b/support/testing/tests/package/test_mtr.py
> new file mode 100644
> index 0000000000..d78b33a31a
> --- /dev/null
> +++ b/support/testing/tests/package/test_mtr.py
> @@ -0,0 +1,22 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestMtr(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_PACKAGE_MTR=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv5",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> +
> +        self.assertRunOk("mtr --version")
> +        self.assertRunOk("mtr -r -c 5 127.0.0.1", timeout=30)
> -- 
> 2.43.0
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
