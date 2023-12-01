Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A388BC4167B
	for <buildroot@archiver.kernel.org>; Fri,  1 Dec 2023 10:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5569D847E2;
	Fri,  1 Dec 2023 10:06:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5569D847E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XyGb5xOXYwz4; Fri,  1 Dec 2023 10:06:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86AFC847DC;
	Fri,  1 Dec 2023 10:06:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86AFC847DC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3AF041BF344
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 10:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F8EE4028D
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 10:06:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F8EE4028D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A-_Z_Q5s4O0u for <buildroot@lists.busybox.net>;
 Fri,  1 Dec 2023 10:06:22 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C1E884021C
 for <buildroot@buildroot.org>; Fri,  1 Dec 2023 10:06:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1E884021C
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4c68:322b:52a4:6805])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id B73632003F6;
 Fri,  1 Dec 2023 11:06:17 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 01 Dec 2023 11:06:17 +0100
Date: Fri, 1 Dec 2023 11:06:17 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231201100617.GN3177259@scaer>
References: <20231129173901.505113-1-fontaine.fabrice@gmail.com>
 <20231129173901.505113-2-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231129173901.505113-2-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701425179;
 bh=mRb78NonLLKHu/mZay50qHtmIBTJI2WAjyAPs5k5tgg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DwYagnVqjCK9dnoTlFMND+7zJnLMlXQq1A/fTAke02z0TX85wM84si4i3+Odwu7cR
 u+c3r2D9p/kyOk7VZtUBFEFocp4X4DpuxzvnXayLmAcYbvOB93AGmFV4tD54WoKqms
 xiWGEsV/5vwvAwsk5d2JJ4vcPrhB0XSjV33ABuH8zpl7+eizLs5p/Ql+vCLL+Juq6q
 3uk28LnczY4wEqHcAshBjxacDexP6B3txIvIN31Y7j1geNg4/njYe0nsRLGpumOvMI
 mCgzlWgRGcCoilJxhWtel7flm2LBVSTbAhFcBDGu+PPEvRrO+ZFSa2qEjev//zQr2E
 nscVK1zklBhQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DwYagnVq
Subject: Re: [Buildroot] [PATCH 2/2] package/xtables-addons: bump to version
 3.24
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

fabrice, All,

On 2023-11-29 18:39 +0100, Fabrice Fontaine spake thusly:
> This bump will fix the following build failure with kernel >= 6.2 thanks
> to
> https://codeberg.org/jengelh/xtables-addons/commit/51761c3fe2454e0b4bc25274dd55d4ab72c54bf0:
> 
> /home/buildroot/autobuild/instance-1/output-1/build/xtables-addons-3.22/extensions/xt_TARPIT.c:
> In function 'xttarpit_honeypot':
> /home/buildroot/autobuild/instance-1/output-1/build/xtables-addons-3.22/extensions/xt_TARPIT.c:110:26:
> error: implicit declaration of function 'prandom_u32_max'; did you mean
> 'prandom_u32_state'? [-Werror=implicit-function-declaration]
>   110 |                         (prandom_u32_max(0x20) - 0xf);
>       |                          ^~~~~~~~~~~~~~~
>       |                          prandom_u32_state
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e8f2a0cb5b38ff98da97268c4b642554a0a732e1
>  - http://autobuild.buildroot.org/results/0191ee0590c08b73f17b35a5c8521796693772b5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to next, thanks, since I was not on master when applying. Now,
I've also applied to master, thanks.

Sorry for the mess...

Regards,
Yann E. MORIN.

> ---
>  package/xtables-addons/xtables-addons.hash | 2 +-
>  package/xtables-addons/xtables-addons.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/xtables-addons/xtables-addons.hash b/package/xtables-addons/xtables-addons.hash
> index 840a31f947..7bdbbb8578 100644
> --- a/package/xtables-addons/xtables-addons.hash
> +++ b/package/xtables-addons/xtables-addons.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  faa16a27166275afbfe8df605f55c3a81ac693bf19da674d45ceded4137ae217  xtables-addons-3.22.tar.xz
> +sha256  3e823f71720519ced31c4c7d2bfaf7120d9c01c59a0843dfcbe93c95c64d81c1  xtables-addons-3.24.tar.xz
>  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE
> diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
> index adfedbc874..efd8bd98ce 100644
> --- a/package/xtables-addons/xtables-addons.mk
> +++ b/package/xtables-addons/xtables-addons.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XTABLES_ADDONS_VERSION = 3.22
> +XTABLES_ADDONS_VERSION = 3.24
>  XTABLES_ADDONS_SOURCE = xtables-addons-$(XTABLES_ADDONS_VERSION).tar.xz
>  XTABLES_ADDONS_SITE = https://inai.de/files/xtables-addons
>  XTABLES_ADDONS_DEPENDENCIES = iptables linux host-pkgconf
> -- 
> 2.42.0
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
