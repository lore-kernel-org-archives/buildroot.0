Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838F4C4332F
	for <buildroot@archiver.kernel.org>; Wed,  9 Nov 2022 22:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17C984179B;
	Wed,  9 Nov 2022 22:11:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17C984179B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v016cAUxRkQV; Wed,  9 Nov 2022 22:11:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6481641798;
	Wed,  9 Nov 2022 22:11:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6481641798
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CF4251BF308
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 22:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AACF080BAE
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 22:11:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AACF080BAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L1RiB6QrGl4Z for <buildroot@lists.busybox.net>;
 Wed,  9 Nov 2022 22:11:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3B8180B69
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A3B8180B69
 for <buildroot@buildroot.org>; Wed,  9 Nov 2022 22:11:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9DEE8FF806;
 Wed,  9 Nov 2022 22:10:59 +0000 (UTC)
Date: Wed, 9 Nov 2022 23:10:58 +0100
To: Wolfgang Grandegger <wg@grandegger.com>
Message-ID: <20221109231058.6265929b@windsurf>
In-Reply-To: <b1bafa9c-393e-b9aa-0a3e-0a3e67c5fd42@grandegger.com>
References: <b1bafa9c-393e-b9aa-0a3e-0a3e67c5fd42@grandegger.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668031859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PN4Vz447eLxvAqunydNfd1kCru/ezfZ2Gjnfj+eWMxs=;
 b=os1hRraR2+iCqM14JGVKsR6MsVgwUliO66/v3/yLHw19dDjkXj96IMXblP1rZSTf7GbgFG
 JUENT2TGFnBuTIrzESvoPPY0Ft39JAJ/tTLhGxdGdGxFvTXsisWssuaUNlk9ZnwlIul2xZ
 UugozQI4vYpYTOdx2Ii7tIXiJpHfOx78hCEUHN+eIV66A5K90ielk0Yp3jDWfQG2qq37+T
 wSNL2RZK7k6A4/aW70r4s8seA+vN2moyqRxoQaplERKGBlBMsYx8XanXCuZcWQsKO/ZkvX
 zXnbSBv4vmtjNhkOZvlgP698u6lLinmqX/m4jD5lTuajHemQJV9ntOZKWm13sw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=os1hRraR
Subject: Re: [Buildroot] [PATCH] package/udisks: add config option to
 support mounting in, /media
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Marek Belisko <marek.belisko@open-nandra.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Wolfgang,

On Tue, 8 Nov 2022 18:22:03 +0100
Wolfgang Grandegger <wg@grandegger.com> wrote:

> Support mounting in /media instead of /run/media for compatibility
> with the Filesystem Hierarchy Standard (FHS). This is also required
> for backward compatibility with udisks1.

Could you resend with your Signed-off-by: line? Also see below another
comment.

>   comment "udisks can't be built with Optimize for fast"
>   	depends on BR2_OPTIMIZE_FAST
> +
> +if BR2_PACKAGE_UDISKS
> +
> +config BR2_PACKAGE_UDISKS_FHS_MEDIA
> +	bool "Mount devices in /media instead of /run/media"
> +	help
> +	  Support mounting in /media for compatibility with the
> +	  Filesystem Hierarchy Standard (FHS)
> +
> +endif
> diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
> index 2bf519a2cc..91328effba 100644
> --- a/package/udisks/udisks.mk
> +++ b/package/udisks/udisks.mk
> @@ -39,4 +39,8 @@ UDISKS_CONF_OPTS = \
>   	--disable-vdo \
>   	--disable-zram
>   
> +ifeq ($(BR2_PACKAGE_UDISKS_FHS_MEDIA),y)
> +UDISKS_CONF_OPTS += --enable-fhs-media

Could you add:

else
UDISKS_CONF_OPTS += --disable-fhs-media

So that we are explicit about what happens when the option is disabled?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
