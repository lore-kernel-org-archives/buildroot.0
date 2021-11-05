Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E92FFC433EF
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 21:31:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A10FB610A8
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 21:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A10FB610A8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 687098290B;
	Fri,  5 Nov 2021 21:31:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xcFDSbidVZjc; Fri,  5 Nov 2021 21:31:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C337D826D5;
	Fri,  5 Nov 2021 21:31:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EA4271BF5B5
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 21:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D970E826D5
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 21:31:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JK0kryESdP9d for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 21:31:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 138528242D
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 21:31:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9d6e:5497:a761:f603])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 820BB5FF9E;
 Fri,  5 Nov 2021 22:31:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636147882;
 bh=fgjFit5WhB2bATv8PmjjGjycdVcvpcPH+NgHwofQpNc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OLo4AdlyyvkZKcuvxK5sZD6PaziFNMTO/udkCon3rr6ECSzgkRa1mB9bkaY3gVau9
 vBy2Jswh0e3KNuM7kmD310Q4RIzGjXsMAATON7Dm2ilFDfdUX6dXU/FJ5odqcjQVuf
 DWXHHTj2Ca2HNuKOjWo5rp3fg0kDGuR2qv8fmaHisbnp8xfeXIc0cozi66LlQ2s/+j
 oE7Wzn1Ca+VM+2nRUiUNnUaZmrdEVv6K0Vi7t+z7/Q0+WGUWSyPuDZ4miAXSJMzPOO
 uCnysRst6CccFGFB8e4DCEwtupVAuIhrJ13IoY71Th4lHRRPUzTJN/gxrseAHOQdZB
 GR5/Um5e3eOMw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 05 Nov 2021 22:31:18 +0100
Date: Fri, 5 Nov 2021 22:31:18 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20211105213118.GH2400@scaer>
References: <20211029212941.85822-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211029212941.85822-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] support/testing: test_jffs2.py: update
 logical eraseblock size for qemu >= 2.9
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

Romain, All,

On 2021-10-29 23:29 +0200, Romain Naour spake thusly:
> The test_jffs2 test fail for the same reason as test_ubi test with qemu >= 2.9
> due to a qemu 2.8 bug. See commit d8447c38f53f98e1df4a209e9f70e54f8b60f36e.
> 
> Divide the erase block size by two.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590514
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/testing/tests/fs/test_jffs2.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/fs/test_jffs2.py b/support/testing/tests/fs/test_jffs2.py
> index f595e408d5..1806bd7e3c 100644
> --- a/support/testing/tests/fs/test_jffs2.py
> +++ b/support/testing/tests/fs/test_jffs2.py
> @@ -16,7 +16,7 @@ class TestJffs2(infra.basetest.BRTest):
>          """
>          BR2_TARGET_ROOTFS_JFFS2=y
>          BR2_TARGET_ROOTFS_JFFS2_CUSTOM=y
> -        BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE=0x80000
> +        BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE=0x40000
>          BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
>          BR2_TARGET_ROOTFS_JFFS2_PAD=y
>          BR2_TARGET_ROOTFS_JFFS2_PADSIZE=0x4000000
> -- 
> 2.31.1
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
