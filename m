Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB58C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 17:42:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD16F60F22
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 17:42:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BD16F60F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A33140430;
	Sun, 10 Oct 2021 17:42:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aWlnhNPOlyH9; Sun, 10 Oct 2021 17:42:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0AD240436;
	Sun, 10 Oct 2021 17:42:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F0C561BF3C2
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 17:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E095440436
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 17:42:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jRKYmnEaHfVi for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 17:42:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0215F4042D
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 17:42:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:74c0:e1ec:fabc:9152])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id DC4C619F57C;
 Sun, 10 Oct 2021 19:42:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633887764;
 bh=ltDjV4c00WEaWf/VhhWju83F6SpLQCrFx7ssfAv4FBc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fpSviHIKYfDEj29iwqPfyg/RzdWhLmypWbTWj346e7h11PwsZBP0xEjJmrBZP1GXB
 0+nev9PZgPyrYeAKSsYeoXjyZDHlwtuOiq65bK6LVUdbhtRZg17gbxTp9ohFSdGI+S
 YmW9PwYrvuk9G5RlYExsJCgYZ4sQOEVpem4pga6StLNXH3YSb1rSxYLMY9gxCUmqDa
 Nt41Kcf+6vy/15gZy8mSA9B66Oa5sMtvrhtxMECf66NE48qjoFY5/4phdKJzgJxZoj
 RV85zO/d2Sbo8eqWtPL3qGXiI4nUO3n0QaAbNX+NES6t25DAZZZDmb8K32zPxpttsv
 CPfJI+mtXj4hQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 10 Oct 2021 19:42:35 +0200
Date: Sun, 10 Oct 2021 19:42:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20211010174235.GM2081069@scaer>
References: <20211009191646.1076266-1-thomas.petazzoni@bootlin.com>
 <20211009191646.1076266-4-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211009191646.1076266-4-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 3/5] package/gdb: switch to gdb 10.x as the
 default
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
Cc: Michael Fischer <mf@go-sys.de>, Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2021-10-09 21:16 +0200, Thomas Petazzoni spake thusly:
> When doing this, we can simplify the RISC-V related logic. Indeed, as
> there was no support for RISC-V in gdb 9.x, which was the current
> default, we had some trickery in the Config.in file to ensure gdb 10.x
> was used by default on RISC-V. However now that 10.x is the default
> for everybody, this trickery is no longer needed.
> 
> Also, we now needs to enable BR2_PACKAGE_GDB_TOPLEVEL when host-gdb is
> not built, as the default target gdb version is 10.x, and threfore
> requires BR2_PACKAGE_GDB_TOPLEVEL=y.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gdb/Config.in.host | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
> index 2f9790f6e1..fd739f3969 100644
> --- a/package/gdb/Config.in.host
> +++ b/package/gdb/Config.in.host
> @@ -61,7 +61,7 @@ config BR2_PACKAGE_HOST_GDB_SIM
>  
>  choice
>  	prompt "GDB debugger Version"
> -	default BR2_GDB_VERSION_9_2
> +	default BR2_GDB_VERSION_10
>  	depends on !BR2_arc
>  	depends on !BR2_csky
>  	help
> @@ -93,8 +93,8 @@ config BR2_GDB_VERSION
>  	default "arc-2020.09-release-gdb" if BR2_arc
>  	default "4ecb98fbc2f94dbe01b69384afbc515107de73df" if BR2_csky
>  	default "8.3.1"    if BR2_GDB_VERSION_8_3
> -	default "9.2"      if BR2_GDB_VERSION_9_2 || (!BR2_PACKAGE_HOST_GDB && !BR2_riscv)
> -	default "10.2"	   if BR2_GDB_VERSION_10 || (!BR2_PACKAGE_HOST_GDB && BR2_riscv)
> +	default "9.2"      if BR2_GDB_VERSION_9_2
> +	default "10.2"	   if BR2_GDB_VERSION_10 || !BR2_PACKAGE_HOST_GDB
>  	default "11.1"     if BR2_GDB_VERSION_11
>  	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
>  
> @@ -105,5 +105,5 @@ config BR2_PACKAGE_GDB_TOPLEVEL
>  	default y if BR2_arc
>  	default y if BR2_GDB_VERSION_10
>  	default y if BR2_GDB_VERSION_11
> -	default y if !BR2_PACKAGE_HOST_GDB && BR2_riscv
> +	default y if !BR2_PACKAGE_HOST_GDB
>  	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
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
