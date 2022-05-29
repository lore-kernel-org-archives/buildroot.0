Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2319C433FE
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 20:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5470983276;
	Sun, 29 May 2022 20:37:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gN2wSvyZdp3b; Sun, 29 May 2022 20:37:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BC6483131;
	Sun, 29 May 2022 20:37:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2633A1BF3D7
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 20:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2343D83131
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 20:36:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GMudt9z-8oyt for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 20:36:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3AC8D82BC8
 for <buildroot@buildroot.org>; Sun, 29 May 2022 20:36:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1c90:582e:b0d5:b1ff])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 50AA37802C2;
 Sun, 29 May 2022 22:36:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1653856616;
 bh=2oRsy1GMoNkK2KoUSxeLSD8cXvfRhi0s0bJBvSCdNEs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A0YAGKocEqFY4dQr5nhQEl0fnSHJIJZTAobMppPcaeSFWsfAMIGIOmzbxAA/b954s
 MihxZCfteTZpo5sPegFqxtDwT0QhoxbcdkOi7bfsaFwZVZ8YP33a6HqASWjxQe7+BJ
 voVW1dxlXLIt2TaPh3802kM3uzvcdOzZo6axd2P6mNv2KVin2bj32KFRL3LUF+MniO
 cXfkOKAFTlBwAdiPMxb7VwHnsotosPO+bH4L7YhjEfRt+qnkwW4WFI1kgptLwh612S
 NRmkygYcXRdvkE2BTduflX8G9D/elxJECPFUAPkNT50HfPtMnfve/hV1DkD9DJR/Pb
 VtQnT4mH7rfSQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 May 2022 22:36:51 +0200
Date: Sun, 29 May 2022 22:36:51 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220529203651.GD993669@scaer>
References: <20220529202017.822191-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220529202017.822191-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] support/testing: test_oci: update to
 _OCI_CMD option
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
Cc: "Yann E . MORIN" <yann.morin@orange.com>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Matthew Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain, All,

On 2022-05-29 22:20 +0200, Romain Naour spake thusly:
> BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS option has been
> replaced by BR2_TARGET_ROOTFS_OCI_CMD in commit [1].
> 
> Since BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS contains
> only one item, we can safely replace by
> BR2_TARGET_ROOTFS_OCI_CMD in the defconfig fragment
> used by the test_oci test case.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2491321058
> 
> [1] 08d65d81d88418b0cd7edd3bd2227faa58d022f0
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Yann E. MORIN <yann.morin@orange.com>

I'll be sure to pass the message to that guy, that he should be a bit
more careful when he moves options to legacy. ;-)

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Cc: Sergio Prado <sergio.prado@e-labworks.com>
> Cc: Matthew Weber <matthew.weber@collins.com>
> ---
>  support/testing/tests/fs/test_oci.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/fs/test_oci.py b/support/testing/tests/fs/test_oci.py
> index 347332f30d..0ecf58f626 100644
> --- a/support/testing/tests/fs/test_oci.py
> +++ b/support/testing/tests/fs/test_oci.py
> @@ -20,7 +20,7 @@ class TestOci(infra.basetest.BRTest):
>          BR2_TARGET_ROOTFS_EXT2_SIZE="600M"
>          BR2_TARGET_ROOTFS_OCI=y
>          BR2_TARGET_ROOTFS_OCI_ENTRYPOINT="df"
> -        BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS="-h"
> +        BR2_TARGET_ROOTFS_OCI_CMD="-h"
>          BR2_TARGET_ROOTFS_OCI_ARCHIVE=y
>          # BR2_TARGET_ROOTFS_TAR is not set
>          """
> -- 
> 2.35.3
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
