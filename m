Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5636BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 08:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2D4860EC2;
	Tue, 26 Jul 2022 08:47:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2D4860EC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D44WI5WXeoyk; Tue, 26 Jul 2022 08:47:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD39D60B0B;
	Tue, 26 Jul 2022 08:47:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD39D60B0B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 46D3D1BF239
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 08:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EE63418E5
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 08:47:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EE63418E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VeaTG4sSEfml for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 08:47:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56A43415E7
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56A43415E7
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 08:47:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9946:e64:fb26:3d99])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id C22EA780346;
 Tue, 26 Jul 2022 10:47:26 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 26 Jul 2022 10:47:26 +0200
Date: Tue, 26 Jul 2022 10:47:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220726084726.GI3168@scaer>
References: <20220726063400.2321251-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220726063400.2321251-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658825251;
 bh=YNBsW2Q/IJGWmZi3ErxUsW1kRfn6NFEzJC7eMQOjmxk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GGsRoJIU0NtE8SdcdZP/0eCxzdVyeUu3/gZY//wr93N2kKgKB1VdN/WA55DHAJELz
 LwuK3ir8+KBxMW+51fEIV4McPhfrRA4XIVHceLW6sRcEe5LuNagcI+ayD2rFN5mEA7
 OSCmUeo9BjWeODdpkrIXD25UFuKnZiQDIqHVvtYys73xYhOOqqbI1LeQZ8gZQXbkNV
 Dpx41Gfphi7rDTR09yqcxe1fll4UfjvO7p+018OozDTyWcMFpAUHgWZAKv1AMCjL7U
 vK65Su9xQjsF8wxWMQ1u+EMjI5ww6i0v1czOuISgP9wHFEdsj/Z7Pej58kzcoXtmX0
 kcTvUjQBZpjPw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GGsRoJIU
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d: set cpp_rtti option
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, Al;,

On 2022-07-26 00:34 -0600, James Hilliard spake thusly:
> This needs to be set based on BR2_PACKAGE_LLVM_RTTI being set.

BR2_PACKAGE_LLVM_RTTI is a sub-option of llvm, so it somehow means
that llvm should be a dependency of mesa3d, which your patch does not
add.

But we already have a conditional dependency on llvm, so this nex rtti
option should be a sub-condition of BR2_PACKAGE_MESA3D_LLVM?

Regards,
Yann E. MORIN.

> Fixes:
>  - http://autobuild.buildroot.net/results/e2ebc9a73ed421aa6be44fe41bb5224cc12f699d
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/mesa3d/mesa3d.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 96520e2efd..652b5168d2 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -94,6 +94,12 @@ else
>  MESA3D_CONF_OPTS += -Dgallium-vc4-neon=disabled
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LLVM_RTTI),y)
> +MESA3D_CONF_OPTS += -Dcpp_rtti=true
> +else
> +MESA3D_CONF_OPTS += -Dcpp_rtti=false
> +endif
> +
>  # Drivers
>  
>  #Gallium Drivers
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
