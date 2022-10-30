Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D27C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 20:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 454A340156;
	Sun, 30 Oct 2022 20:06:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 454A340156
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iBXS6n6as60N; Sun, 30 Oct 2022 20:06:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47CD2400EC;
	Sun, 30 Oct 2022 20:06:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47CD2400EC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4CE041BF387
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25B36400EC
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:06:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25B36400EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6jmjsfAo2Ddk for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 20:06:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3A58400DC
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3A58400DC
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 20:06:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E203FC0004;
 Sun, 30 Oct 2022 20:06:16 +0000 (UTC)
Date: Sun, 30 Oct 2022 21:06:15 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20221030210615.49866828@windsurf>
In-Reply-To: <20221019134823.12594-1-giulio.benetti@benettiengineering.com>
References: <20221019134823.12594-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667160377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TK7agS1xe2bfMBZIEZTLbu85Swdy+6VB1AiPDWNKoss=;
 b=J/TKpqdvhtV6tITssULtKXdRjD7z0qbeVZ/L0QvSFT7CAGGsILED19jCzYC/hkPTckz1rl
 /vphNM9oFb60bUQ/bVizhfT5MF12PFu91IhJQsbxN3SDSbSYvPiBfI0OYgrdZ+9w0M+djq
 eJQ88vCxqZ/gB82lnGz5uFB02YQ5COYATOGQ6o6cWN1jg398fXfzaBpUfpHQazDPQ4BT+x
 SnscmUKTawh0+Z/F4WvepS5898HtWCox1J7ZwIkkammJE2RIGNmT5vDXdsVmYqEWv9Lf1b
 66pBFAysMBUadTt1K+8WlHbkCk0u8tDtXeeqbTvH2YfSAGrdwn/FfgLT9mpZKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=J/TKpqdv
Subject: Re: [Buildroot] [PATCH v2] package/rtl8188eu: remove wrong
 description in Config.in
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 19 Oct 2022 15:48:23 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> This rtl8188eu driver is not the same as the one in mainline Linux that
> still has pending work to be done that in this driver is done, check:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/r8188eu/TODO
> specifically:
> * Switch to use LIB80211.
> * Switch to use MAC80211.
> * Switch to use CFG80211.
> So let's remove the description that is not valid anymore.
> 
> Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * improve Config.in description as pointed by Luca Ceresoli
> ---
>  package/rtl8188eu/Config.in | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/rtl8188eu/Config.in b/package/rtl8188eu/Config.in
> index 76d9085297..2fab1fd5c0 100644
> --- a/package/rtl8188eu/Config.in
> +++ b/package/rtl8188eu/Config.in
> @@ -4,9 +4,10 @@ config BR2_PACKAGE_RTL8188EU
>  	depends on BR2_LINUX_KERNEL
>  	help
>  	  A standalone driver for the RTL8188EU USB Wi-Fi adapter.
> -	  This is needed only for Linux kernels before 3.12.
> -	  Since 3.12, there is a (staging) driver in mainline, with a
> -	  similar codebase.
> +	  This rtl8188eu driver is not the same as the one in mainline
> +	  Linux that still has pending work to be done that in this
> +	  driver is done, check:
> +	  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/r8188eu/TODO

I don't see any thing in this TODO that explains why the out-of-tree
driver is better than the mainline driver.

The out-of-tree driver has been integrated into drivers/staging/, and
this TODO file lists what should be improved in the driver so that it
can be graduated to move outside of drivers/staging/ into the proper
drivers/net/wireless/ location.

I don't see anything in this TODO that indicates that the out-of-tree
driver has "more features" than the mainline driver, so to me the
Config.in help text still makes sense.

Could you give some more details?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
