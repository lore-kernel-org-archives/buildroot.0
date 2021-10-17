Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9BC3C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 19:51:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 634D8610C7
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 19:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 634D8610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE6AA40160;
	Sun, 17 Oct 2021 19:51:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2N6v89XR0wMW; Sun, 17 Oct 2021 19:51:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D55834017C;
	Sun, 17 Oct 2021 19:51:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 455841BF59C
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 19:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30B484017C
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 19:51:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PvUqGQcCtt2a for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 19:51:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 739BB40160
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 19:51:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4430:5ced:ec21:1036])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id BDC24780357;
 Sun, 17 Oct 2021 21:51:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634500303;
 bh=NGEGfHVn8zEvvk4xCLpf+QSgnkBNftk8hlV3iVPBi3w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sfH6+1pSW+2yK1kPBlmMACyEoxLFlgtLx/e1PUL1tSE7Hl7hC3xZGete/lyDpgVzS
 JvocHK9APaYvEXO7is6NztFbFTRdV46jVBVVz3eUNc/jBxH1IIzRZghl+KqOYgK1L+
 BaECt5AFKbqkWjzmapQEAh0jsOaf2514F3fdC8bWyyxDR1KjjTLqj9xX2jB6+WgobE
 3lP5MYyJwTGDDFBdiFUWVXBD4g9HEV7PtBWSCUg+23p75xilZlVOAIfwVIfsyEBX/g
 HPrMU0RaAisBB5MBqfGk8BjiM25ODNoLHTeRMOdO6q0U/xMCuXPenUcaKUzfVQ0I2t
 uTHIrdJCAr4hw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Oct 2021 21:51:36 +0200
Date: Sun, 17 Oct 2021 21:51:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20211017195136.GL2400@scaer>
References: <20210912140658.253602-1-romain.naour@gmail.com>
 <20210912141140.253778-13-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210912141140.253778-13-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 15/16] support/testing: update logical
 eraseblock and physical eraseblock size for qemu >= 2.9
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain, All,

On 2021-09-12 16:11 +0200, Romain Naour spake thusly:
> The current ubi/ubifs test (test_ubi.py) rely on a Qemu bug present in
> 2.8.0 that was fixed in Qemu 2.9.0 [1]. The ubi/ubifs settings is
> updated to run with Qemu >= 2.9.0 using the new multiple chip handling.
> 
> If needed, the old behavior can be enabled using the pflash01 property
> "old-multiple-chip-handling" [2].
> 
> The issue was not detected until now since we are sill using an old
> qemu (2.8 from Debian stretch) for testing in gitlab (using the
> Buildroot Docker image used by gitlab-ci.yml).
> 
> First the logical eraseblock size (LEB) must be updated to the value
> 0x3ff80 reported by the kernel when using qemu >= 2.9.0.
> 
>   UBIFS (ubi0:0): Mounting in unauthenticated mode
>   UBIFS error (ubi0:0 pid 1): ubifs_read_superblock: LEB size mismatch: 524160 in superblock, 262016 real
>   UBIFS error (ubi0:0 pid 1): ubifs_read_superblock: bad superblock, error 1
> 
> But the system is still failing to boot:
> 
>  UBIFS error (ubi0:0 pid 1): ubifs_scan: garbage
>  UBIFS error (ubi0:0 pid 1): ubifs_recover_master_node: failed to recover master node
> 
> ubifs is reading garbage since Qemu >= 2.9.0 report a sector
> length per device divided by the number of devices (see commit [1]).
> 
> The kernel detect two flash devices (dmesg):
> 
>   Concatenating MTD devices:
>   (0): "40000000.flash"
>   (1): "40000000.flash"
>   into device "40000000.flash"
> 
> Divide the physical eraseblock (PEB) size by two.
> 
> Tested with qemu 2.9.0, 5.1.0.
> 
> Fixes:
> https://gitlab.com/kubu93/buildroot/-/jobs/1543100932
> 
> [1] https://git.qemu.org/?p=qemu.git;a=commitdiff;h=feb0b1aa11f14ee71660aba46b46387d1f923c9e
> [2] http://lists.busybox.net/pipermail/buildroot/2021-September/622069.html

I am not sure I understood that reference: the patch in [2] was never
applied, it is no longer present in patchwork, but I could not find a
discsuuion about it either... Did you withdraw that patch?

> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/testing/tests/fs/test_ubi.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/support/testing/tests/fs/test_ubi.py b/support/testing/tests/fs/test_ubi.py
> index eeb55b1d59..7c687c1982 100644
> --- a/support/testing/tests/fs/test_ubi.py
> +++ b/support/testing/tests/fs/test_ubi.py
> @@ -8,10 +8,10 @@ class TestUbi(infra.basetest.BRTest):
>      config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
>          """
>          BR2_TARGET_ROOTFS_UBIFS=y
> -        BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x7ff80
> +        BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x3ff80
>          BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE=0x1
>          BR2_TARGET_ROOTFS_UBI=y
> -        BR2_TARGET_ROOTFS_UBI_PEBSIZE=0x80000
> +        BR2_TARGET_ROOTFS_UBI_PEBSIZE=0x40000
>          BR2_TARGET_ROOTFS_UBI_SUBSIZE=1
>          """
>  
> -- 
> 2.31.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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
