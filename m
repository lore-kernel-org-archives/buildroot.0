Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9E3C433EF
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 20:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F02AA81D3D;
	Mon,  3 Jan 2022 20:43:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7r6qDsdIgb17; Mon,  3 Jan 2022 20:43:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45DE281D35;
	Mon,  3 Jan 2022 20:43:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C141B1BF309
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 20:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD55D81D35
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 20:43:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5phfHctP8y3t for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 20:43:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E356C81D34
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 20:43:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6d4f:8674:7dd0:6c06])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2B20713F814;
 Mon,  3 Jan 2022 21:43:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641242631;
 bh=rMgS+ke+kS+zU9cbnMNq/e6byJr+SJ3a+ZDYdUmWsO0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q9Ig4DfLdCSyQqH/yE7Uc2xX7lU00LdZkfuzSVRSMY5XdGvQn3OjrRrXgdNg3dvlr
 YKpXsxkK+PlfZJgIlHKNSwarL/xGR4DSrXNQz6mMKbScCqJUQV8j6kiKtVxxK3nN3D
 3RAK4mmAPBvxW4xhbAtZpIIVTffCHNslTqkhUybaLoJZk7lzmZkQNF+DF8/DpoV6EZ
 OI0T/oA8ACdi3Bnm1BRBBxw7/HRi1/eec45CZ1/2ubSCniEVuB3xfPoxuZ0/M06M7j
 iuHMBJSNQOF1TmXjB3AYpGX3wlgTZMe0LNXNmrVBhlx/Of8fiC7WzdB8bXHa1B23g8
 Jvd6CtEMMpZvA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 03 Jan 2022 21:43:44 +0100
Date: Mon, 3 Jan 2022 21:43:44 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220103204344.GJ69135@scaer>
References: <20220102165431.3551867-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220102165431.3551867-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] board/qemu/aarch64-sbsa: use
 partition-type-uuid for genimage-15
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain, All,

On 2022-01-02 17:54 +0100, Romain Naour spake thusly:
> Genimage 15 restricted the partition-type option to mbr and hybrid
> partition-table-type and now prints a warning when it is used [1]:
> 
> ERROR: hdimage(disk.img): part boot: 'partition-type' is only valid for mbr and hybrid partition-table-type
> 
> [1] https://github.com/pengutronix/genimage/commit/1d72d8091f83790a0a35a1ea7dc25d46adba8876
> 
> Sync the genimage.cfg with the one used for aarch64_efi_defconfig
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/1929717179
> https://gitlab.com/buildroot.org/buildroot/-/jobs/1921792262

I've added a link to the Wikipedia page that lists the UUIDs:
    https://en.wikipedia.org/wiki/GUID_Partition_Table#Partition_type_GUIDs

> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Dick Olsson <hi@senzilla.io>
> Cc: Pierre-Jean Texier <texier.pj2@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  board/qemu/aarch64-sbsa/genimage.cfg | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/board/qemu/aarch64-sbsa/genimage.cfg b/board/qemu/aarch64-sbsa/genimage.cfg
> index 121ae9f37b..bdf8a89d75 100644
> --- a/board/qemu/aarch64-sbsa/genimage.cfg
> +++ b/board/qemu/aarch64-sbsa/genimage.cfg
> @@ -18,12 +18,14 @@ image disk.img {
>  	}
>  
>  	partition boot {
> -		partition-type = 0xEF
>  		image = "efi-part.vfat"
> +		partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
> +		offset = 32K
> +		bootable = true
>  	}
>  
>  	partition root {
> -		partition-type = 0x83
> +		partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
>  		image = "rootfs.ext2"
>  	}
>  }
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
