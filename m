Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DDAC54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 09:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9E4384294;
	Sun, 18 Sep 2022 09:57:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9E4384294
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id olbhPGetZcJq; Sun, 18 Sep 2022 09:57:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D49488414A;
	Sun, 18 Sep 2022 09:57:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D49488414A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF2D11BF328
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 959B5405B6
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:57:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 959B5405B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YtsHp6dYL_1A for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 09:57:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43DD24011C
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 43DD24011C
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 09:57:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 309961C0003;
 Sun, 18 Sep 2022 09:57:19 +0000 (UTC)
Date: Sun, 18 Sep 2022 11:57:17 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20220918115717.45180a48@windsurf>
In-Reply-To: <20220826135503.20612-12-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
 <20220826135503.20612-12-jesseevg@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663495039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Do58x9ldQA7ccbR5m2wbJWO19NNxQBbPyLOym/YSBU=;
 b=Huj5nLYx52mU04ABtUnazyfGS/kV/eeJN4WWAmxTnKPh5zfII0uq2jCYImKXIj+7GH5vZo
 OzZIFg1EcW6vWWztcD+Z2Bnpw7KOvWonJvitHIhIeBN8kM96vCk2J3hRWzANWI7oudoxNu
 WDbNqmBz7yrLdtg4WKvl4CGCgcS8eXLK48NMnLHej1hRbg4lq9wx7/sR+n6btGKMspRXKh
 N2uURyNTIS9ZfMhdwJicegLzTHZyTxWZwtNcwI5QWkTEiXYxXlSKD8bMqz3E9IvyqT4vh1
 4G0dk1cO0Mf+CJkTT7KciUdbumhYXHvzVobafRYBAZXjWPmwTVZXzDtUfZF8zw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Huj5nLYx
Subject: Re: [Buildroot] [PATCH v4 11/29] package/qt6/qt6base: add qt
 support for SSE/AVX SIMD extensions
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

On Fri, 26 Aug 2022 15:54:45 +0200
Jesse Van Gavere <jesseevg@gmail.com> wrote:

> Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
> ---
>  package/qt6/qt6base/qt6base.mk | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
> index 21c15607d6..8bca29900e 100644
> --- a/package/qt6/qt6base/qt6base.mk
> +++ b/package/qt6/qt6base/qt6base.mk
> @@ -35,6 +35,25 @@ QT6BASE_CONF_OPTS = \
>  	-DFEATURE_system_zlib=ON \
>  	-DFEATURE_system_libb2=ON
>  
> +QT6BASE_CONF_OPTS += -DFEATURE_sse2=$(if $(BR2_X86_CPU_HAS_SSE2),ON,OFF)
> +QT6BASE_CONF_OPTS += -DFEATURE_sse3=$(if $(BR2_X86_CPU_HAS_SSE3),ON,OFF)
> +QT6BASE_CONF_OPTS += -DFEATURE_sse4_1=$(if $(BR2_X86_CPU_HAS_SSE4),ON,OFF)
> +QT6BASE_CONF_OPTS += -DFEATURE_sse4_2=$(if $(BR2_X86_CPU_HAS_SSE42),ON,OFF)
> +QT6BASE_CONF_OPTS += -DFEATURE_ssse3=$(if $(BR2_X86_CPU_HAS_SSSE3),ON,OFF)
> +QT6BASE_CONF_OPTS += -DFEATURE_avx=$(if $(BR2_X86_CPU_HAS_AVX),ON,OFF)
> +QT6BASE_CONF_OPTS += -DFEATURE_avx2=$(if $(BR2_X86_CPU_HAS_AVX2),ON,OFF)
> +# no buildroot BR2_X86_CPU_HAS_AVX512 option yet

This is not true: we do have a BR2_X86_CPU_HAS_AVX512 option, but my
understanding of AVX512 is too limited to know how that maps to those
individual avx512xyz options, so I kept them disabled as you did, but
with a different explanation.

Also, I grouped the whole thing into a single assignment to
QT6BASE_CONF_OPTS.

And of course applied the result:

  https://gitlab.com/buildroot.org/buildroot/-/commit/3b395c1574299147b41602aa471a76c98db9a1cc

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
