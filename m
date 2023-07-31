Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A625C001DF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 22:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AF9140C2F;
	Mon, 31 Jul 2023 22:08:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AF9140C2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id krMlArBMjM9v; Mon, 31 Jul 2023 22:08:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19D12408B0;
	Mon, 31 Jul 2023 22:08:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19D12408B0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F4F21BF369
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 22:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADD1140514
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 22:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADD1140514
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kLJaqXWqb8dz for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 22:07:38 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 798AA40A07
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 22:07:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 798AA40A07
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4865BC0003;
 Mon, 31 Jul 2023 22:07:36 +0000 (UTC)
Date: Tue, 1 Aug 2023 00:07:35 +0200
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230801000735.4f6608d2@windsurf>
In-Reply-To: <20230418213241.28635-1-ps.report@gmx.net>
References: <20230418213241.28635-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690841256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uxAru7SLSUozqTAPiiuT7Vob+fA8NWOVLnC+VOvqoMA=;
 b=lciOYGKTgo4VJyq3Q+DlEp+s3K4xfEhI7BOqZAMhHFo3REXVYPJAYIQ3bkbcWge0vi4DnW
 PrjpgecFfKT7U7j91w0g4hgVdgTRsTkod72ff9VdyBDMG7s6FCq7ZIy9Z+je1XpEU0/wEF
 p32Liz+q7gwLhGd9I0sduXMGtkMgCbTtL5ZnL0UgfMDfuv843G7cVWqTY/5VNTfxh+9X9Q
 Yzu1C603akyQM5yB7V9XCLMR2Q+K5TWcF1cRnNvRvxuJx+3Oq8pVUauFNRGFoxBqRTq4On
 Y5EKnL9h6XqXnV66gGtV3J2FNCghWjDJhbrYiqr6hFoAyWpaWBWU4HT5xRwo8g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lciOYGKT
Subject: Re: [Buildroot] [RFC v1] package/python-babel: add purge locale
 data support
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
Cc: Lionel Flandrin <lionel@svkt.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 18 Apr 2023 23:32:41 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Add purge loacle data support (inspired by BR2_ENABLE_LOCALE_PURGE
> handling in Makefile) to reduce target space allocation by the
> python-babel package, e.g. from 32MB to 24K for
> target/usr/lib/python3.11/site-packages/babel/locale-data with
> BR2_ENABLE_LOCALE_WHITELIST="C en_US de_DE".

I updated the commit log to add the explanation about en_US_POSIX, as
requested by Yann.

> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/python-babel/python-babel.mk | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/package/python-babel/python-babel.mk b/package/python-babel/python-babel.mk
> index 890a8b02b9..ea383e9c05 100644
> --- a/package/python-babel/python-babel.mk
> +++ b/package/python-babel/python-babel.mk
> @@ -12,5 +12,17 @@ PYTHON_BABEL_LICENSE = BSD-3-Clause
>  PYTHON_BABEL_LICENSE_FILES = LICENSE
>  HOST_PYTHON_BABEL_DEPENDENCIES = host-python-pytz
>  
> +# purge locale data (if enabled), keep special en_US_POSIX data by default
> +ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
> +define PYTHON_BABEL_CLEANUP_LOCALE
> +	for i in `ls $(TARGET_DIR)/usr/lib/python3.11/site-packages/babel/locale-data/*.dat`; \

The hardcoded 3.11 was not good, it would break at the next major bump
of Python, replace with $(PYTHON3_VERSION_MAJOR).

> +	do \
> +		i_base=`basename "$$i" .dat`; \
> +		echo "$(BR2_ENABLE_LOCALE_WHITELIST) en_US_POSIX" | grep -qw "$$i_base" || rm "$$i"; \
> +	done
> +endef
> +endif
> +PYTHON_BABEL_POST_INSTALL_TARGET_HOOKS += PYTHON_BABEL_CLEANUP_LOCALE

Changed to PYTHON_LABEL_TARGET_FINALIZE_HOOKS, as suggested by Yann,
and moved inside the ifeq ... endif block.

Applied with those changes.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
