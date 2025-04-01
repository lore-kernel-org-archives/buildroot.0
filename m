Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC33C36010
	for <buildroot@archiver.kernel.org>; Tue,  1 Apr 2025 17:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A97340979;
	Tue,  1 Apr 2025 17:35:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gkxVXBPwxP2M; Tue,  1 Apr 2025 17:35:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 969C4406A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 969C4406A3;
	Tue,  1 Apr 2025 17:35:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A119117F
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 17:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F3E260F4D
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 17:35:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d9mi92V0-r7t for <buildroot@buildroot.org>;
 Tue,  1 Apr 2025 17:35:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 43DF260EDB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43DF260EDB
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 43DF260EDB
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 17:35:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 6388119F5BE;
 Tue,  1 Apr 2025 19:35:33 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 01 Apr 2025 19:35:33 +0200
Date: Tue, 1 Apr 2025 19:35:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Matheus Tavares Bernardino <matheus.bernardino@oss.qualcomm.com>
Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com,
 brian.cain@oss.qualcomm.com
Message-ID: <Z-wj5aErGuBvf-QN@landeda>
References: <ae120d6e18c6982f3f2b9a50b3b0aee0b206ad37.1743525327.git.matheus.bernardino@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ae120d6e18c6982f3f2b9a50b3b0aee0b206ad37.1743525327.git.matheus.bernardino@oss.qualcomm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743528937;
 bh=G8lw9yAY7+Wt8Wi+g2JM+WoDY9BcaBu2z3FJ75BBSXI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hYJt9WNhbRg3VMqPuIjAREBgHWhV/fWpaufymJQtKi+ER+B+urJs0Js8JxeyXV+6i
 dEp1PaNnu6pdspUkeiKJA3/8fmIT9G7OIsqdKnAMTZjlEkXt0Xj2GmM6yVvP/qRp3P
 GUAXY/zitWwfsXE8TbrnSDaQQ1UDENDb3GEDlgae2dh6wQD4DoYN2wmLNI986IhwX4
 /E3mHpqUQKSXJw7PNDx8qg4WYkgocvq8uNXeBFiuBISK7bglz0MS67YOwDgDgPdsCr
 VCyuk8L9LaSOtNzEl/Ix52OmRkWDmS3je8jNojKjZP3PdmTJX6cNWXOy5KuJMILwr9
 7hlcIyuRSGY8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hYJt9WNh
Subject: Re: [Buildroot] [PATCH RESEND] linux: fix broken mailing list link
 (404)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Matheus, All,

On 2025-04-01 09:36 -0700, Matheus Tavares Bernardino spake thusly:
> Signed-off-by: Matheus Tavares Bernardino <matheus.bernardino@oss.qualcomm.com>

Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Now sending after subscribing to the list.
> 
>  linux/linux.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index f915823dcf..16762ac2e6 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -537,7 +537,7 @@ endif
>  # the same $(BR2_MAKE) invocation has shown to cause parallel build
>  # issues.
>  # The call to disable gcc-plugins is a stop-gap measure:
> -#   http://lists.busybox.net/pipermail/buildroot/2020-May/282727.html
> +#   https://lore.kernel.org/buildroot/20200512095550.GW12536@scaer
>  define LINUX_BUILD_CMDS
>  	$(call KCONFIG_DISABLE_OPT,CONFIG_GCC_PLUGINS)
>  	$(foreach dts,$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)), \
> -- 
> 2.37.2
> 

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
