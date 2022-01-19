Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E175DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 19 Jan 2022 20:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7313D829A9;
	Wed, 19 Jan 2022 20:24:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C5ZNJunXf6EG; Wed, 19 Jan 2022 20:24:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D5EE829F2;
	Wed, 19 Jan 2022 20:24:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EADEC1BF405
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 20:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8C4D415B2
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 20:24:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9OvV-PiZDYUM for <buildroot@lists.busybox.net>;
 Wed, 19 Jan 2022 20:23:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 993CD415AF
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 20:23:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7065:fa25:c80a:5e5a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 1985519F5A9;
 Wed, 19 Jan 2022 21:23:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642623835;
 bh=S5r61ZilrnP3GY0gXYlgXgvIzGfI3fnRQC8hVZHDaMM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qovp8AAV5zcYMSVCf9P2NZh9lOoHE/o41aY/NpZy5eClILe5TqhaxrO3EuTo96Mqi
 823/J5DFop/BgZRIy5BpMm6l1BaQpE4pyGn2uZR2U0x4E7VESYld4rF49p8aChj//4
 v9KAWzjq5Ohe97VpTnZV6wAmBsxycRvfXLSI+IVOPQQRj7oMhHh0m+RfaIYrBXSrhp
 iPBXxcWVi0qbXfSXqyiWGIBhs3j4HPehoGrAXO2zc5+FUwmDzGWzpvVPLMylRpj2PV
 EYg1LY89zNBptlr/DWsQmkSs3BtC0zOSBiYJtFK5jmC8s8sKZ2rct7gLq8fEaFXKmH
 HMq8AXr9WzNjg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 19 Jan 2022 21:23:51 +0100
Date: Wed, 19 Jan 2022 21:23:51 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220119202351.GA3095239@scaer>
References: <20220115160449.2292472-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220115160449.2292472-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/riscv-isa-sim: set --with-boost
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-01-15 17:04 +0100, Fabrice Fontaine spake thusly:
> Set --with-boost to avoid the following build failure when a non working
> boost version is installed on host. This failure is raised since the
> addition of the package in commit
> ea033cecf990ed3f86619647523a9ad2ccb09adb:
> 
> configure:5559: error: Could not find a version of the Boost::Asio library!
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/855b66b86d979cc922b947da932b0e2388481263
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/riscv-isa-sim/riscv-isa-sim.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/riscv-isa-sim/riscv-isa-sim.mk b/package/riscv-isa-sim/riscv-isa-sim.mk
> index ee9067d304..90eed93c36 100644
> --- a/package/riscv-isa-sim/riscv-isa-sim.mk
> +++ b/package/riscv-isa-sim/riscv-isa-sim.mk
> @@ -9,5 +9,6 @@ RISCV_ISA_SIM_SITE = $(call github,riscv-software-src,riscv-isa-sim,v$(RISCV_ISA
>  RISCV_ISA_SIM_LICENSE = BSD-3-Clause
>  RISCV_ISA_SIM_LICENSE_FILES = LICENSE
>  HOST_RISCV_ISA_SIM_DEPENDENCIES = host-boost host-dtc
> +HOST_RISCV_ISA_SIM_CONF_OPTS = --with-boost=$(HOST_DIR)

To be noted: riscv-isa-sim could also be configured with --without-boost
and the build succeeds.

Anyway: applied to master, thanks.

Julien, do you know what ill-effect building without Boost would have?

Regards,
Yann E. MORIN.

>  $(eval $(host-autotools-package))
> -- 
> 2.34.1
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
