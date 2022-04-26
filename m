Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986F3C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 18:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29698832D0;
	Tue, 26 Apr 2022 18:42:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J2WqWMRT5evu; Tue, 26 Apr 2022 18:42:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32E2183295;
	Tue, 26 Apr 2022 18:42:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D6D4E1BF592
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 18:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D39DF4046B
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 18:42:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UfQ60r4gTu7o for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 18:42:39 +0000 (UTC)
X-Greylist: delayed 23:34:41 by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 95F184015D
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 18:42:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 76D69240009;
 Tue, 26 Apr 2022 18:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650998556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1P/TNxjUuy+mvLl2HdkE7bBUnB76ojandITUYU7EjaY=;
 b=Fkfu9loDAyA6WIMFMqfOEZ02ZZ7PguWUSUt93zUw+qCJNSw6HhVw+27iMepgyUGiwSrLlJ
 R4mhHu8+quV4pTV6q0PvftPrLEUL4e9lL6p8vMamW+FVWoBgBPGj6WF7VxkpsIbyqe3oYP
 NUIi81UrFOVuhuzjFTtnY+p/rWozu7FFjblvOXxj3qboMUap8Z72x7yulLRrhme628Uwsv
 EA3ZyHsXxPly0PPMyVhuvFHpWLR9urA4NZ1QEO8y0hMRwZolI3kfYTS/V4xbOBtjHyIVbV
 OTlua+zVRoAZ4Oh+E6bhwo4ELMiCzkanSCv+DY6W/JMF1QA6Bm9oDf3ikqJWMQ==
Date: Tue, 26 Apr 2022 20:42:33 +0200
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <20220426204233.77ed8bc5@windsurf>
In-Reply-To: <20220426173211.64840-2-f.fainelli@gmail.com>
References: <20220426173211.64840-1-f.fainelli@gmail.com>
 <20220426173211.64840-2-f.fainelli@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/2] toolchain/Config.in: add
 BR2_TOOLCHAIN_GCC_AT_LEAST_12 blind option
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: opendmb@gmail.com, mmayer@broadcom.com, buildroot@buildroot.org, "Yann
 E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Florian,

Thanks for the patch! I hope you're doing well :-)

On Tue, 26 Apr 2022 10:32:10 -0700
Florian Fainelli <f.fainelli@gmail.com> wrote:

> In order to add gcc 12 support for internal and external toolchain
> in follow-up commits, introduce BR2_TOOLCHAIN_GCC_AT_LEAST_12 symbol.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  toolchain/Config.in | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index d2c81217c84a..b572a89f2f85 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -117,7 +117,8 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_43744
>  	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
>  		BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
>  		BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
> -		BR2_TOOLCHAIN_GCC_AT_LEAST_11
> +		BR2_TOOLCHAIN_GCC_AT_LEAST_11 || \
> +		BR2_TOOLCHAIN_GCC_AT_LEAST_12
>  
>  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63261. This bug no
>  # longer exists in gcc 8.x.
> @@ -150,7 +151,8 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_68485
>  config BR2_TOOLCHAIN_HAS_GCC_BUG_83143
>  	bool
>  	default y if BR2_sh
> -	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || BR2_TOOLCHAIN_GCC_AT_LEAST_11
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || BR2_TOOLCHAIN_GCC_AT_LEAST_11 || \
> +		   BR2_TOOLCHAIN_GCC_AT_LEAST_12

Did you verify that these two bugs still affected gcc 12.x ?

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
