Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91E3C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 17:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BCD9410E4;
	Mon,  1 Aug 2022 17:43:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BCD9410E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id by9W8bxh0Vyf; Mon,  1 Aug 2022 17:43:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87B74410D5;
	Mon,  1 Aug 2022 17:43:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87B74410D5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 91FC81BF33D
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7806A410D5
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:43:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7806A410D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jxyGc1_t_a7h for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 17:42:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36425410D3
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 36425410D3
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 17:42:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AAD5540004;
 Mon,  1 Aug 2022 17:42:55 +0000 (UTC)
Date: Mon, 1 Aug 2022 19:42:54 +0200
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Message-ID: <20220801194254.118219ec@windsurf>
In-Reply-To: <20220727192948.18653-4-guillaume.bressaix@gmail.com>
References: <20220727192948.18653-1-guillaume.bressaix@gmail.com>
 <20220727192948.18653-4-guillaume.bressaix@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659375776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=at1pivmr2FpVaxuL+vwJavb+wctviMHhTDVUPvZybl4=;
 b=jTfFE5cHtcJ8OsozeuoS+T5uMslds+zD4hPZeUAaHDdzKAUy9o8xMref/NvT1oyuIujB4O
 dOZWQW0VKsL0U8Usx7zu81rBdZA6BLJ0IhbJTjjjgFZ9JmnrmEo8+C4383ZKfBmkSJJKzl
 aJWZV1rtKA05yk0WxXSnwcWZvn+sCtnAY0QUMwiGw5pw1m/EjdDWAB7cfjJfQhWJoeLWT/
 6qSz9c/EbNwS9SNS0tAf03MKWc2QcL6Pj3EvYG5vZuObMXJT2h77S0Y/DRWnXXsVhxJM57
 n5GnLMxm5XVlVC/RJQnO+kO35rtRAyhWFS4bP6GH0kpqqhx/Gk/zvdd82m01nA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jTfFE5cH
Subject: Re: [Buildroot] [PATCH v5 4/4] package/python-scipy: new package
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
Cc: jmfriedt@femto-st.fr, gwen@trabucayre.com,
 Jagan Teki <jagan@amarulasolutions.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed, 27 Jul 2022 21:29:48 +0200
"Guillaume W. Bres" <guillaume.bressaix@gmail.com> wrote:

> From: Jagan Teki <jagan@amarulasolutions.com>
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> [Arnout:
>  - Indent hash file with two spaces.
>  - Bump to 1.7.3 to fix build failure with recent GCC.
>  - Get from github instead of PyPI.
>  - Add host-meson and host-python-pythran dependencies.
>  - Properly propagate Config.in dependencies.
>  - Correct usage of BR2_INSTALL_LIBSTDCPP symbol.
>  - Remove F77, no longer used.
> ]
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> [Guillaume:
>  - -lnpymath: npymath.ini localization problem
>  - -lnpyrandom resolution problem
>  - fix legal-info for latest version LICENSE.txt
>  - zlib is a scipy::io module runtime requirement
>  - update serie for scipy 1.8.1 (latest)
> ]
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>

I have applied, with the following changes:

    [Thomas:
     - add runtime test
     - drop dependency on OpenBLAS, which is not needed in a minimal
       configuration
     - remove PYTHON_SCIPY_NPY_PKG_CONFIG_PATH logic as it is no longer
       needed
    ]

Could you please:

 (1) Review the runtime test, to see if it can be improved with some
     better testing.

 (2) Review the OpenBLAS dependency, to see if it needs to be added as
     an optional dependency in some way.

> +# Provide system configuration options to numpy distutils extenions, telling
> +# to find all include files and libraries in staging directory.
> +define PYTHON_SCIPY_CONFIGURE_CMDS
> +	-rm -f $(@D)/site.cfg
> +	echo "[DEFAULT]" >> $(@D)/site.cfg
> +	echo "library_dirs = $(STAGING_DIR)/usr/lib" >> $(@D)/site.cfg
> +	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg
> +endef

This part is a bit annoying, as it's duplicated from python-numpy.mk. I
looked a bit, but couldn't really find a good way of avoiding this
duplication.

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
