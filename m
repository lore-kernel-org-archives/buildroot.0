Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A12C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 20:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6F48408FE;
	Mon,  8 Aug 2022 20:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6F48408FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MOrKvnTnsgnZ; Mon,  8 Aug 2022 20:32:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8974B4010F;
	Mon,  8 Aug 2022 20:32:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8974B4010F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5EB441BF365
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC14A4015F
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:31:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC14A4015F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tn-irmJBUrtU for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 20:31:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47BD7400A8
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 47BD7400A8
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 20:31:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B01331BF206;
 Mon,  8 Aug 2022 20:31:52 +0000 (UTC)
Date: Mon, 8 Aug 2022 22:31:50 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220808223150.704a8822@windsurf>
In-Reply-To: <20220808151402.1694762-1-fontaine.fabrice@gmail.com>
References: <20220808151402.1694762-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659990713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U/nte8lw3TToCmVv21oDgatAzEdIJPh/JfZnuQuNaD0=;
 b=LwSOjtBjfebK1QUs3W7faJU5g7XsyR2SpxEyHTS3QVJAshsP0QO0DK+CCz9xHG6gUtFFMg
 3HpT+ugqWs0aW/ZvYktf8ZzfFmLkF8iMtvRayKuLIo9kcr9Dv9hLQGKGjRq6eWYDnO8SsU
 VDGJlBgJjQ3GnloXgDf080dEII5uI1vJlFbRy4OsaidHjTU/uCC9Aofp8Ori5BV0xDIbbV
 uxCvOh+xSt+grbxpABi++whmKS37EicH4bqxJ7wBWofNo0TlTY9ZvvQLbTZbpCxi0nlB2O
 nIGrssmfSWS1yPDu5/fCc32J3itQdk4OSVWM57DCaf8jXbf2mwy3q5ObbS3FBA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LwSOjtBj
Subject: Re: [Buildroot] [PATCH 1/2] package/serd: bump to version 0.30.14
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Mon,  8 Aug 2022 17:14:01 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

>  ifeq ($(BR2_STATIC_LIBS),y)
> -SERD_CONF_OPTS += --static --no-shared --static-progs
> +SERD_CONF_OPTS += -Dstatic=true
> +else
> +SERD_CONF_OPTS += -Dstatic=false
>  endif

The meson-package infra is already doing:

	--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \

What is the behavior when both --default-library and -Dstatic are
combined? 

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
