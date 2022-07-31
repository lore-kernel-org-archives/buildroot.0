Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070DCC00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 19:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 921D8418A0;
	Sun, 31 Jul 2022 19:45:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 921D8418A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S2kTjKnQxyZA; Sun, 31 Jul 2022 19:45:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D6E8416F1;
	Sun, 31 Jul 2022 19:45:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D6E8416F1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AE3FE1BF2EB
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 19:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88DEE400B9
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 19:45:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88DEE400B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id crJ_fDGrOxAK for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 19:45:11 +0000 (UTC)
X-Greylist: delayed 00:07:02 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFF52400AC
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFF52400AC
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 19:45:10 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id IElKotxmbtk1HIElKodEIX; Sun, 31 Jul 2022 21:38:06 +0200
Message-ID: <8eb444bc-cecd-264c-178f-1be13a9d5142@benettiengineering.com>
Date: Sun, 31 Jul 2022 21:38:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
To: buildroot@buildroot.org
References: <20220731104301.5987-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220731104301.5987-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfFrz+KnEqYMtVT41BRfPYE9Zy7JIxHkfyuONjaD7u55KEePv6oSyg2mbcuMQxAq/YXHfU3acHy9s7G0y8uWbwDlu0/SgjLkquWk9uSm7SuQsVUm35Q+J
 ZoKuYqYdePs66mWNqlsOCpf2COf4mp6LvrRe7oC/mHpx2r1CtamnN+6MylpNjuNUnYpvlyiN6XjKlJAaartdXq1iMBxFSel/DNk4wgES/v3lIi0YgPHComN7
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659296286; bh=sJ9FxgUenK/0Zjlxn3vZvdMkNMtXtpMPQnU1LXiaCAA=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Q5kfiQNqgSAuJsJHiFB6Os++heCUA/pz+jYBweHhDq5HwDFZ5xmzesJngb9/4H/yg
 lMR/acHOfiWMIa5Kc7nVsPKa2mLxC9Qjhzy0sJoGaNzf5BZqcWR4umiysuZcG0LgW+
 rX1oYD1qu3foXuk2+7VTkqPvL3QX/dandE7ncU0i2e00rf9GdsHw/wt13yGeGLqjKF
 IcbZQ8lx7pba9Y6GdXr9UpjsPdicN7mHevyYYcn48gdEEXBl8sart71UUlD76PMqq1
 NrLGtyiNpddw55lgU9jERchJQTuuo3BtRcdNdUUyGaMFXZS1w0AT6fs/0yJEV8si8E
 whB5AE401sswA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Q5kfiQNq
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: remoove useless whitespaces
 before tabs
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

s/remoove/remove in Subject

-- 
Giulio Benetti
Benetti Engineering sas

On 31/07/22 12:43, Giulio Benetti wrote:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   DEVELOPERS | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 88e0d02c69..8bfe9b4d5c 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2744,8 +2744,8 @@ F:	board/pine64/rockpro64
>   F:	board/radxa/rockpi-4
>   F:	board/radxa/rockpi-n8
>   F:	board/radxa/rockpi-n10
> -F: 	configs/friendlyarm_nanopc_t4_defconfig
> -F: 	configs/friendlyarm_nanopi_m4_defconfig
> +F:	configs/friendlyarm_nanopc_t4_defconfig
> +F:	configs/friendlyarm_nanopi_m4_defconfig
>   F:	configs/orangepi_rk3399_defconfig
>   F:	configs/roc_pc_rk3399_defconfig
>   F:	configs/rock_pi_4_defconfig

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
