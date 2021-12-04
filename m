Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64D4C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 21:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C8D440253;
	Sat,  4 Dec 2021 21:38:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6hqfxdZWYgoV; Sat,  4 Dec 2021 21:38:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5B9B401FE;
	Sat,  4 Dec 2021 21:38:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E60C1BF36B
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DF0C83E4E
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:38:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z0Z3SJczKIN9 for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 21:38:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49DE283E0C
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 21:38:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:44c6:1f1c:4326:e15f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id B05525FE03;
 Sat,  4 Dec 2021 22:38:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1638653886;
 bh=Fg84H+hR2Iqiv5pbdoIdoqXJTwYovBnyu+O3N0HFqtQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yo66ne4eaJD6baAHGg4rjIpSIHbnS0r5lxuKBzB41L6tv5oB4rPalAMupuIrA2NvW
 PdW6V04dxfx0QufzIDqDqEqQAOYd/f0vcv3WsGpMIGkJMWmszuHu/ao9FbgCLlJQZU
 maHzEpN2HrK1Vbo/lKovWaGgdY2kT3AAbA3lEjPqQFoiLQSSmt3eZLT9Cagi4TLMcg
 Tdh9Z6iXvYG8o49RoxUg8Ikei96Dh8VOxEE4DVo+NfFKPsdnkIL6iAVjsyvdv8CAfn
 1Zy5mZ1THXgwZxaOa1q18SQoAKBMSAh46SEZ5YJcunIGtWa2v0TAfuuLAp/MfGvmXX
 DDFBy7lEdooiw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Dec 2021 22:38:02 +0100
Date: Sat, 4 Dec 2021 22:38:02 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211204213802.GF472627@scaer>
References: <20211204212547.2019391-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211204212547.2019391-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/util-linux/util-linux-libs: add
 CPE variables
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

On 2021-12-04 22:25 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:kernel:util-linux is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Akernel%3Autil-linux
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/util-linux/util-linux-libs/util-linux-libs.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/util-linux/util-linux-libs/util-linux-libs.mk b/package/util-linux/util-linux-libs/util-linux-libs.mk
> index 3a3a655e62..f1a4334c5c 100644
> --- a/package/util-linux/util-linux-libs/util-linux-libs.mk
> +++ b/package/util-linux/util-linux-libs/util-linux-libs.mk
> @@ -19,6 +19,8 @@ UTIL_LINUX_LIBS_LICENSE_FILES = README.licensing \
>  	Documentation/licenses/COPYING.BSD-3-Clause \
>  	Documentation/licenses/COPYING.LGPL-2.1-or-later
>  
> +UTIL_LINUX_LIBS_CPE_ID_VENDOR = kernel
> +UTIL_LINUX_LIBS_CPE_ID_PRODUCT = util-linux

In fact, we can use the variables from util-linux, like is done for the
version, site et al.

Applied to master with the above fixed, thanks.

Regards,
Yann E. MORIN.

>  UTIL_LINUX_LIBS_INSTALL_STAGING = YES
>  UTIL_LINUX_LIBS_DEPENDENCIES = \
>  	host-pkgconf \
> -- 
> 2.33.0
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
