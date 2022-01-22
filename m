Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A401EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 22:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E00782AF8;
	Sat, 22 Jan 2022 22:36:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZRka_q4bvBlE; Sat, 22 Jan 2022 22:36:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C59683EDB;
	Sat, 22 Jan 2022 22:36:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 74FD11BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 22:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6299240104
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 22:35:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oBncCMxqImNn for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 22:35:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4FB0240019
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 22:35:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8038:e8ec:605a:7149])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4E4B3B00535;
 Sat, 22 Jan 2022 23:35:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642890950;
 bh=bCcaFVqJcwIBSGAwr6AmdFwfCmX9eN88ZinSw53htDE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TuuVb+LbyuR+x+6OwQKCb+J+LgEEb3LaeEtekba6IQsKzUEd2Tpsu7hnH8q+axScq
 S4jXSSXF2COkDIqN+WBq+6167jE10woOwKFrjsVCE/dglIqbaQFsuOqqUHP9C0SZmh
 zDEaQGct9L+PCJzYXTbHpwrV85xhnDGNHw8K/vWC6Xz56coIXMZ/wrehQB2hJGPNE9
 Ol7BX0j75NJl6vBJimh+z1Asd+qSnmKmcbujeDpKNM/1k7KpyX4q9YrTaljaB7vRhB
 +Rd0CRr4mPo7oQ7Tsl/qQfRdOPiAWvgBv2PB55bcsEOKax83vNgBI69b2okq0ckj+O
 AUTDpttteeWbw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 22 Jan 2022 23:35:47 +0100
Date: Sat, 22 Jan 2022 23:35:47 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220122223547.GJ3621364@scaer>
References: <20220122220334.266735-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220122220334.266735-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/luajit: add LUAJIT_CPE_ID_VENDOR
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

Fabrice, All,

On 2022-01-22 23:03 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:luajit:luajit is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aluajit%3Aluajit
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/luajit/luajit.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
> index 7c1b556ff7..cca806309d 100644
> --- a/package/luajit/luajit.mk
> +++ b/package/luajit/luajit.mk
> @@ -8,6 +8,7 @@ LUAJIT_VERSION = a91d0d9d3bba1a936669cfac3244509a0f2ac0e3
>  LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
>  LUAJIT_LICENSE = MIT
>  LUAJIT_LICENSE_FILES = COPYRIGHT
> +LUAJIT_CPE_ID_VENDOR = luajit
>  
>  LUAJIT_INSTALL_STAGING = YES
>  
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
