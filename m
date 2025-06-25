Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841E1C7EE2A
	for <buildroot@archiver.kernel.org>; Wed, 25 Jun 2025 17:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35EE041E1C;
	Wed, 25 Jun 2025 17:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fWRdsJpPcuUD; Wed, 25 Jun 2025 17:47:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EDC041E1A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EDC041E1A;
	Wed, 25 Jun 2025 17:47:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 41126E27
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33D7940130
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:47:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DYNMakm5TQUV for <buildroot@buildroot.org>;
 Wed, 25 Jun 2025 17:47:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 83E6740109
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83E6740109
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83E6740109
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:47:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 93EF82003BE;
 Wed, 25 Jun 2025 19:47:12 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 25 Jun 2025 19:47:12 +0200
MIME-Version: 1.0
Date: Wed, 25 Jun 2025 19:47:12 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250624204604.2199246-1-giulio.benetti@benettiengineering.com>
References: <20250624204604.2199246-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <e588cb906285e712ff53b179c01b3621@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750873633;
 bh=FP0uRzjleW7vq7d+A+3uzXcGdo4IpKqVnM8ehfPlNv0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LtfbC+96Vqd/vASH6HJRQSXDYm0WQe3VpxdwBgXRBas4TviLEKoqoHEVBgEUJmq0i
 nnEG8LvGe6mCq8H3HVgRQwgKWoyvvOJeDV5wljflhFaR5ae0DORbJgDY26QB8cB5U2
 dkwjnEy6Bm3aY2N7BIXVKSWz+pFDMVpRNuOH3o2pmAUFUpqqdEh6vki5P/qUM9TRrm
 FUz5OwR9KDEA6ep4qFjk7+/zogH85LV6NH3ncFb1gHzOzcX6rUPcVIbSSpf7lZvuvh
 4U/K0S++OOgF7a+qhjIdXkBv4D2pe11T7vKWFs7gX2lpi8ynYIxho0GvwtFxwdGdnW
 4OmKibQurBSrA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LtfbC+96
Subject: Re: [Buildroot] [PATCH] board/freescale/mxs: fix Linux booting
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

Thanks for the patch! (and good catch!)

Unfortunately, it is not fixing the issue in its current state. See 
below.

On 24/06/2025 22:46, Giulio Benetti wrote:
> Actually DTB_LIST accepts only file and not files with relative path
> preprended. This leads to have vfat without .dtb files and so Linux
> doesn't start. Let's fix this by including slash in sed command as done
> for mxc.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  board/freescale/common/mxs/post-image.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/board/freescale/common/mxs/post-image.sh 
> b/board/freescale/common/mxs/post-image.sh
> index 0bfb835c6e..65154fa8e0 100755
> --- a/board/freescale/common/mxs/post-image.sh
> +++ b/board/freescale/common/mxs/post-image.sh
> @@ -7,7 +7,7 @@
>  #
>  dtb_list()
>  {
> -	local DTB_LIST="$(sed -n 
> 's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([a-z0-9 \-]*\)"$/\1/p' 
> ${BR2_CONFIG})"
> +	local DTB_LIST="$(sed -n 
> 's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([\/a-z0-9 \-]*\)"$/\1/p' 
> ${BR2_CONFIG})"

With this patch applied, when testing with imx23evk_defconfig, this
script generates an error:

     sed: -e expression #1, char 17: unknown option to `s'

which is hidden by the subsequent commands succeeding. Maybe it would
be better if the script was adding a "set -e" at the beginning?

Then, since the DTS file name can contain a slash "/" character, the
sed expression should be rewritten using another character (e.g.
"s#...#...#p").

Finally, the DTS file name may contain directories in the Kernel tree,
but the file is copied as is in "output/images/". So only the basename
should be kept.

> 
>  	for dt in $DTB_LIST; do
>  		echo -n "\"$dt.dtb\", "
> --
> 2.39.5

Could you send an updated patch addressing those issues, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
