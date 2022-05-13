Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CEBDC433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 17:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13BF5812C9;
	Fri, 13 May 2022 17:01:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WSXrtUjcsOBC; Fri, 13 May 2022 17:01:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F46E812A8;
	Fri, 13 May 2022 17:01:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 105731C1189
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 17:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D1DA408F9
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 17:01:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tZZekfWfofEQ for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 17:01:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1FC3E408FF
 for <buildroot@buildroot.org>; Fri, 13 May 2022 17:01:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:71f3:9479:94db:16e0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4A5B113F7E7;
 Fri, 13 May 2022 19:01:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652461300;
 bh=lA2SYlDwLGhKVfvGSp3fdSQoXo9+nqXl8TN1k8baItY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JlZrCkGu3sZniICuhLktpxgw6dOFSg0HXmNA0eawhmPvt60QafLUvULOoo5hGynb3
 r7ersW2mmOQnYxI9W70fx0RNuRG8PhCk5JPlqtgkOyGKd6J2TGjJNDGIoyZxoXvqcg
 qCIxU7ShLgE2drIhnZQd4b2rjI41LMYjfLXCdMfNVMsY/Zg5RX02GgDkRKrB9KunTp
 CMDZ7jKVoFMvRfoLyrZfkTjJR3Ho075RPW+OoH0aRwR8P20o/zZfczsvE6Bg65XDUK
 8IqyQi7VcvPqyul+yBJsbiCCvGmW2PAm4hICt/VB3nEwIdNTzyUbyG/IUvObq5SsfJ
 5tRCXhJIkm3Dg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 13 May 2022 19:01:38 +0200
Date: Fri, 13 May 2022 19:01:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20220513170138.GT1597494@scaer>
References: <20220513071522.19853-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220513071522.19853-1-heiko.thiery@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] configs/kontron_pitx_imx8m_defconfig: use
 linux kernel 5.17.7
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

Heiko, All,

On 2022-05-13 09:15 +0200, Heiko Thiery spake thusly:
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  configs/kontron_pitx_imx8m_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/kontron_pitx_imx8m_defconfig b/configs/kontron_pitx_imx8m_defconfig
> index 161b9cfe3b..b69516b8cc 100644
> --- a/configs/kontron_pitx_imx8m_defconfig
> +++ b/configs/kontron_pitx_imx8m_defconfig
> @@ -10,7 +10,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16.1"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.17.7"

Since we now have support for 5.17 headers, I've also changed that:

    -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
    +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=y

Could you please check that I did not bork it?

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mq-kontron-pitx-imx8m"
> -- 
> 2.20.1
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
