Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5182C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 13:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B37E40B0E;
	Sat, 23 Jul 2022 13:38:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B37E40B0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iK86NbODDJ6v; Sat, 23 Jul 2022 13:38:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FF2F40B08;
	Sat, 23 Jul 2022 13:38:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FF2F40B08
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4FDB11BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37B9A60FE7
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:37:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37B9A60FE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x32KCOnEaXLD for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 13:37:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F9CD60B59
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F9CD60B59
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 13:37:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8acf:5600:bc2c:46eb:561c:827])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 7B329780509;
 Sat, 23 Jul 2022 15:37:20 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 23 Jul 2022 15:37:20 +0200
Date: Sat, 23 Jul 2022 15:37:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220723133720.GA2641@scaer>
References: <20220722202151.76235-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220722202151.76235-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658583445;
 bh=mhSDryRkewelgPTese0vLfN+796QXbtT0yTokz4g/j4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZIBJ4M0NVYzFA4jx5g5xzPfDQv7sRubPQeNecPF8PBXdLxAKZ14EVe6QkeL60DqYz
 0v63sRe1uCxd5a4SKBlEHeQ45RFAapxKCgGMoRk89umDFGVYDwpz4zptV4OlPPBorb
 ULZ9eaEjRkqmI/R+W3Y+Wp6HdBmxXuCeRNQT1menk8Zj3Yq1ZvhYLir8bqmnGHmSjy
 4GpVD2fmPNF87w4lyvIt7FimJS77JNWMYcvAETgYziF3DwflEEUwpx9aYq+t6kVZX6
 T/nmNZcB3H6PX6fvFOhK88m/x9qL9G/UKZ9j70qdtsi3M8cgV91C5T7gWdBbPSZsfv
 gfEQ9iGZwo+1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZIBJ4M0N
Subject: Re: [Buildroot] [PATCH 0/8] genimage.cfg file clean-up
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, Giulio, All,

On 2022-07-22 22:21 +0200, Thomas Petazzoni via buildroot spake thusly:
> This small series is a revamp of Giulio's series cleaning up
> genimage.cfg. This new version is the result of some discussion
> between Arnout and me to find a middle-ground situation.

Applied to master, Thanks!

I'll further reply to patch 3 with a very minor comment.

Regards,
Yann E. MORIN.

> So what we propose is to:
> 
>  - Use the U and F specifiers provided by genimage for the EFI System
>    Partition and FAT32 partitions respectively.
> 
>  - Use the L specifier (explicitly specified in genimage.cfg, even
>    though it is the default), for the root filesystem or other Linux
>    filesystems. This means we would not comply with the
>    systemd-specific Discoverable Partitions Specification
>    (https://systemd.io/DISCOVERABLE_PARTITIONS/), but we don't see the
>    point of this specification (which requires identifying root
>    filesystems for different architecture by different GUID) in the
>    context of Buildroot. However, while we recommend using L for all
>    new genimage.cfg, we do not change existing genimage.cfg, to not
>    break them.
> 
> In this series, none of the patches except the last make any
> functional change. The last patch does introduce some functional
> change: some partitions were identified as EFI System Partition even
> though they are not: the last commit converts them to use the "F"
> type, used for FAT filesystems.
> 
> Best regards,
> 
> Thomas Petazzoni
> 
> Thomas Petazzoni (8):
>   board/orangepi/common/genimage.cfg: use quotes around "gpt"
>   board/*/genimage.cfg: use partition-table-type = "gpt"
>   docs/manual: update documentation about partition-type-uuid convention
>     in genimage.cfg
>   board/orangepi/orangepi-r1/genimage.cfg: remove double quotes around
>     partition-type-uuid values
>   board/orangepi/orangepi-r1/genimage.cfg: use correct partition type
>   board/*/genimage.cfg: use partition-type-uuid U where relevant
>   board/sifive/hifive-unleashed/genimage*: convert partition-type-uuid
>     values to lower-case
>   board/*/genimage.cfg: use partition-type-uuid = F for some FAT
>     partitions
> 
>  board/aarch64-efi/genimage-efi.cfg                   |  2 +-
>  board/friendlyarm/nanopc-t4/genimage.cfg             |  2 +-
>  board/friendlyarm/nanopi-m4/genimage.cfg             |  2 +-
>  board/octavo/osd32mp1-brk/genimage.cfg               |  2 +-
>  board/octavo/osd32mp1-red/genimage.cfg               |  2 +-
>  board/olimex/stmp1_olinuxino/genimage.cfg            |  2 +-
>  board/orangepi/common/genimage.cfg                   |  2 +-
>  board/orangepi/orangepi-r1/genimage.cfg              |  4 ++--
>  board/pc/genimage-efi.cfg                            |  2 +-
>  board/pine64/rockpro64/genimage.cfg                  |  2 +-
>  board/qemu/aarch64-sbsa/genimage.cfg                 |  2 +-
>  board/radxa/rockpi-4/genimage.cfg                    |  2 +-
>  board/radxa/rockpi-n10/genimage.cfg                  |  2 +-
>  board/radxa/rockpi-n8/genimage.cfg                   |  2 +-
>  board/seeed/stm32mp157c-odyssey/genimage.cfg         |  2 +-
>  board/sifive/hifive-unleashed/genimage_sdcard.cfg    |  6 +++---
>  board/sifive/hifive-unleashed/genimage_spi-nor.cfg   |  4 ++--
>  .../common/stm32mp157/genimage.cfg.template          |  2 +-
>  docs/manual/writing-rules.txt                        | 12 ++++++++++++
>  19 files changed, 34 insertions(+), 22 deletions(-)
> 
> -- 
> 2.37.1
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
