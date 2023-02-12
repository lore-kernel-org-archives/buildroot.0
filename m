Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FBFC05027
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 20:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D860481413;
	Sun, 12 Feb 2023 20:47:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D860481413
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ecm9MuPzOr08; Sun, 12 Feb 2023 20:47:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DF2A813FC;
	Sun, 12 Feb 2023 20:47:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DF2A813FC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3EDE61BF30E
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26E5340131
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:47:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26E5340131
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j0Vf48etTg5f for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 20:47:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F80A400D3
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F80A400D3
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 20:47:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 372475FFAA;
 Sun, 12 Feb 2023 21:47:14 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Feb 2023 21:47:13 +0100
Date: Sun, 12 Feb 2023 21:47:13 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <20230212204713.GU2796@scaer>
References: <20230212095424.1326531-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230212095424.1326531-1-yann.morin.1998@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676234836;
 bh=DzFnE7Eq/oBjOAOEImL3acTUK/rjI+gDZjoWeicdOGs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m9E2ahSv8+Kxy2XcpYvmOZd2tIUMQPXI0YS3knS3qeJ1u8Z1HeadYjH9MyDe4AyBv
 YKz0JCe/AT0iy2PoXBfVZusw07xXujAJtzq2efiWSi3yuzzL5RXHENKT9Bqh25p4dz
 Tw70SFWhzKfSEM5qTfP+2EkmKgb8Kf43aMLbCwTNGPOLjLiyLUqyKmTdqwkzRIvTjq
 M2eMIJ57Qf0jL0evA/FR7DfUd/OUNmfbBq7rOLg5EaUC0G92cMDeiNc/19xhjcPzfI
 F633n5Aq5em3VilJRiOE1cyHoj5s+xyWfiGgkzF1Z1W9U0fKLFa1zwjrZvEmcxn50T
 h74bDaipQ7rVQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=m9E2ahSv
Subject: Re: [Buildroot] [PATCH]
 package/python-magic-wormhole-mailbox-server: add missing reverse
 dependency on host-rustc
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2023-02-12 10:54 +0100, Yann E. MORIN spake thusly:
> From: Julien Olivain <ju.o@free.fr>
> 
> As reported by Yann in [1], Kconfig warns about an unmet dependency.
> 
> The issue can be reproduced on master branch at commit 451672e,
> with the command:
> 
>     KCONFIG_SEED=0x1D15B9D4 make randconfig
> 
> The patch adds the missing dependency.
> 
> Fixes:
> 
>     WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_AUTOBAHN
>       Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] && BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=n]
>       Selected by [y]:
>       - BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER [=y] && BR2_PACKAGE_PYTHON3 [=y]
> 
> [1] https://lists.buildroot.org/pipermail/buildroot/2023-February/661898.html
> 
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-magic-wormhole-mailbox-server/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-magic-wormhole-mailbox-server/Config.in b/package/python-magic-wormhole-mailbox-server/Config.in
> index db20d3e7b6..a0721e866f 100644
> --- a/package/python-magic-wormhole-mailbox-server/Config.in
> +++ b/package/python-magic-wormhole-mailbox-server/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER
>  	bool "python-magic-wormhole-mailbox-server"
> +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-autobahn -> python-cryptography
>  	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
>  	select BR2_PACKAGE_PYTHON_ATTRS # runtime
>  	select BR2_PACKAGE_PYTHON_AUTOBAHN # runtime
> -- 
> 2.25.1
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
