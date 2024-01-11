Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EF1C47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 10:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17B0383E70;
	Thu, 11 Jan 2024 10:38:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17B0383E70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e7EjhN07aQlY; Thu, 11 Jan 2024 10:38:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62E0583E68;
	Thu, 11 Jan 2024 10:38:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62E0583E68
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 96BA01BF2F5
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 10:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F07E410E7
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 10:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F07E410E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hB0JT7mtszbk for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 10:38:11 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 28057410D4
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 10:38:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28057410D4
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E1B3DB00548;
 Thu, 11 Jan 2024 11:38:03 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 Jan 2024 11:38:03 +0100
Date: Thu, 11 Jan 2024 11:38:03 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Message-ID: <ZZ_FC9OGQsHjJvFV@landeda>
References: <20231220105623.192609-1-hayashi.kunihiko@socionext.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231220105623.192609-1-hayashi.kunihiko@socionext.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704969488;
 bh=jbD30h8bqfqFWxAT97hWnoOArHv32YThG86wqruCTV0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CRUdmEldypJid0ykMI0wIIbqqp5kUaQBFLQv+5xZF1SgwIQamKlIadBzC6oe9YXVS
 p59RjFOd4fh04jo90rNeWibYWMVW5owWLHiVtUXUg6Irw05zjubuNevcMDu8Khcd2r
 btzL7qiA0hvCy4xSpQXiWCilCA3IcjRHxjyInXBy/iw6rrz1KwY/eu8Z9cHOc5Yonh
 Z8XVD7DCwSae0GlULSN6+jT8AS/4NdV1AwItOa1/RaGiVbZ7sgJqM8wfR5F/YhxDqV
 nqSqeZScbi773tgPMwq+N+Gdq+EQLMhncDJM/ZJ/JhOXCJf8t3hmZoa+ObQ8a2X16z
 hsuPZdmqtxXPA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CRUdmEld
Subject: Re: [Buildroot] [PATCH 1/1] package/eudev: add sgx group for
 eudev-3.2.12
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Bernd Kuhls <bernd@kuhls.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Kunihiko Hayashi, All,

On 2023-12-20 19:56 +0900, Kunihiko Hayashi spake thusly:
> The eudev has "sgx" group in 50-udev-default.rules as default
> since commit 247724da450b.
> 
> The group is defined by package/systemd [1], however, when
> enabling BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y with
> qemu_aarch64_virt_defconfig, the systemd isn't used and the following
> warning occurs:
> 
>     udevd[153]: specified group 'sgx' unknown
> 
> Just add sgx group to the package/eudev.
> 
> [1] https://lists.buildroot.org/pipermail/buildroot/2022-April/641079.html
> 
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

Peter has sent a better patch, which I applied:
    https://gitlab.com/buildroot.org/buildroot/-/commit/edfa9ea45ce3c2ddad2c52ab57a8047f4257c76f

Thank you for your contribution nonetheless!

Regards,
Yann E. MORIN.

> ---
>  package/eudev/eudev.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
> index 235a71967ef5..14e22ee50a1f 100644
> --- a/package/eudev/eudev.mk
> +++ b/package/eudev/eudev.mk
> @@ -55,6 +55,10 @@ define EUDEV_INSTALL_INIT_OPENRC
>  	@:
>  endef
>  
> +define EUDEV_USERS
> +	- - sgx -1 * - - - SGX device nodes
> +endef
> +
>  HOST_EUDEV_DEPENDENCIES = host-gperf host-pkgconf
>  
>  HOST_EUDEV_CONF_OPTS = \
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
