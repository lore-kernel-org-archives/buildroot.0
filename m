Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284DBC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 13:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBA9F81AF5;
	Sat, 23 Jul 2022 13:38:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBA9F81AF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iTsEX2Xb5LEm; Sat, 23 Jul 2022 13:38:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5F0D81A95;
	Sat, 23 Jul 2022 13:38:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5F0D81A95
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ADC2D1BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A20D760B59
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:38:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A20D760B59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dORwkmugEOfn for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 13:38:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 890D360FE9
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 890D360FE9
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 13:38:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8acf:5600:bc2c:46eb:561c:827])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 6116878050E;
 Sat, 23 Jul 2022 15:38:04 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 23 Jul 2022 15:38:04 +0200
Date: Sat, 23 Jul 2022 15:38:04 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220723133804.GB2641@scaer>
References: <20220722202151.76235-1-thomas.petazzoni@bootlin.com>
 <20220722202151.76235-4-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220722202151.76235-4-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658583490;
 bh=dCm7OVXajUqpnvWDY68kAz7ASkEMVFIL5XeQtH0gOTk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fcqjgtddSKowyRAm+1hLmGFJPy0ACn2hUD/dELXs2vyKTzf5UspasAc4/l/N/PvE0
 atqtdhd9cGw8bixJ2t6P1uCz7OHwMGH+A/N0XOPlMdxVpqmGVDHtbOvQcYvyvHD0iV
 xx9OjUCllnHVOmsWIuRPddIkfhtpM1AfwFNzpmJXVJMhfciRuJVTlqJgA6Sjed5+aJ
 ZTVGPIp6osDESIWsQOlpGCZ+2icZZsuPXJHKT8bBO1cP4dhN89dOgGgrNNoxDOVwnL
 aTNejSNWmhZ+ueohexCDLTPZPS50ESDs6kPvGFl+ANoKWF2sXzJ9uJOwXDtnoU3T4W
 ZH3hJX2l7AUgQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fcqjgtdd
Subject: Re: [Buildroot] [PATCH 3/8] docs/manual: update documentation about
 partition-type-uuid convention in genimage.cfg
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
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas,, Giulio, All,

On 2022-07-22 22:21 +0200, Thomas Petazzoni via buildroot spake thusly:
> Whenever possible, we want to use the "shortcuts" provided by genimage
> for the partition-type-uuid values:
> 
>  - U for the EFI System Partition
>  - F for FAT32 partitions
>  - L for root filesystem partitions and other Linux filesystems
> 
> In follow-up commits, we will convert existing genimage.cfg to this
> convention, except for the root filesystem, if the existing
> genimage.cfg specifies a partition-type-uuid that doesn't match the
> one that "L" would imply. In this case, we will things as-is to not

*we will _keep_ things...

Fixed when applying.

Regards,
Yann E. MORIN.

> break existing setups. However, for all future genimage.cfg files, we
> recommend to use "L" for the root filesystem.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  docs/manual/writing-rules.txt | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
> index 84d8f76431..758965d80a 100644
> --- a/docs/manual/writing-rules.txt
> +++ b/docs/manual/writing-rules.txt
> @@ -198,6 +198,18 @@ image sdimage.img {
>    chance, the byte count.  In comments instead use +GB+, +MB+, +KB+
>    (not +kb+) in place of +G+, +M+, +K+.
>  
> +* For GPT partitions, the +partition-type-uuid+ value must be +U+ for
> +  the EFI System Partition (expanded to
> +  +c12a7328-f81f-11d2-ba4b-00a0c93ec93b+ by _genimage_), +F+ for a FAT
> +  partition (expanded to +ebd0a0a2-b9e5-4433-87c0-68b6b72699c7+ by
> +  _genimage_) or +L+ for the root filesystem or other filesystems
> +  (expanded to +0fc63daf-8483-4772-8e79-3d69d8477de4+ by
> +  _genimage_). Even though +L+ is the default value of _genimage_, we
> +  prefer to have it explicitly specified in our +genimage.cfg+
> +  files. Finally, these shortcuts should be used without double
> +  quotes, e.g +partition-type-uuid = U+. If an explicit GUID is
> +  specified, lower-case letters should be used.
> +
>  The +genimage.cfg+ files are the input for the genimage tool used in
>  Buildroot to generate the final image file(i.e. sdcard.img). For further
>  details about the _genimage_ language, refer to
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
