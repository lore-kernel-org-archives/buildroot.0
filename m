Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F389BC4332F
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 07:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 705EE41BA5;
	Wed, 19 Oct 2022 07:15:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 705EE41BA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r1zEno1f_UdF; Wed, 19 Oct 2022 07:15:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47B8141B99;
	Wed, 19 Oct 2022 07:15:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47B8141B99
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B28CE1BF95D
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 07:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7665541B99
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 07:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7665541B99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZUgnE6atcaYG for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 07:15:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF1EC41B97
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF1EC41B97
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 07:15:17 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 86D9324000C;
 Wed, 19 Oct 2022 07:15:14 +0000 (UTC)
Date: Wed, 19 Oct 2022 09:15:12 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20221019091512.77a48aa8@booty>
In-Reply-To: <20221018131506.123350-1-giulio.benetti@benettiengineering.com>
References: <20221018131506.123350-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666163714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SmmWZbMBCpmwRJOzcHQwC+tG1Km0iLqf+5QnlQj4vw8=;
 b=KdGk5AnyNVy1TtLhUHC+C6L4w3nmTgIemk762qHOsLiAyNvVIBhGTPEdEuAqHrkNxtCGtH
 J8+kVSzCjmf8Of4ighWigLDpedVAxPNQ+uC2I40ndAqK6+W2Zg95HW9AvcbUEOJywV9Uzj
 gOH91dUN8GN4heqMnpFUZpAw1QfIzrVoctlx3m5AkRHzpt2/CAuTb98fIVr9VOBNGwCokC
 uNwI3jt/souL5JkCfNAF2Y2SsvW2Ij5sHHdKwmrJERrT4lPvh4+Oytub4wMUAP5V9jDW6x
 5FJZmqxMqVRJfOC+TtkKAmZAHgQfpiY5ubmL3dPVMWFAdUeG3kBsAeGPE9gWkw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KdGk5Any
Subject: Re: [Buildroot] [PATCH] package/rtl8188eu: remove wrong description
 in Config.in
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

On Tue, 18 Oct 2022 15:15:06 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> This rtl8188eu driver is not the same as the one in mainline Linux that
> still has pending work to be done that in this driver is done, check:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/r8188eu/TODO
> specifically:
> * Switch to use LIB80211.
> * Switch to use MAC80211.
> * Switch to use CFG80211.
> So let's remove the description that is not valid anymore.

A lot of this text would be useful in the help text below. The help
text is visible in any moment in later releases, the commit log needs
to be searched.

> Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/rtl8188eu/Config.in | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/package/rtl8188eu/Config.in b/package/rtl8188eu/Config.in
> index 76d9085297..8d68d104c8 100644
> --- a/package/rtl8188eu/Config.in
> +++ b/package/rtl8188eu/Config.in
> @@ -4,9 +4,6 @@ config BR2_PACKAGE_RTL8188EU
>  	depends on BR2_LINUX_KERNEL
>  	help
>  	  A standalone driver for the RTL8188EU USB Wi-Fi adapter.
> -	  This is needed only for Linux kernels before 3.12.
> -	  Since 3.12, there is a (staging) driver in mainline, with a
> -	  similar codebase.

For the above reasons, I'd add here:

This rtl8188eu driver is not the same as the one in mainline Linux that
still has pending work to be done that in this driver is done, check:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/r8188eu/TODO

I'd not add the todo list, as it will (hopefully) change in the future
in the kernel and we don't want to keep updating our own copy.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
