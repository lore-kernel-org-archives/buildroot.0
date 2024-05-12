Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A0BC10F1A
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 07:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21E374010C;
	Sun, 12 May 2024 07:59:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C-RW0kXs-W8l; Sun, 12 May 2024 07:59:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2845A40497
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2845A40497;
	Sun, 12 May 2024 07:59:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F2691BF228
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 178C441506
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:59:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tHhizYTXNGCR for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 07:59:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9ECC5414E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9ECC5414E2
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9ECC5414E2
 for <buildroot@buildroot.org>; Sun, 12 May 2024 07:59:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D9040240002;
 Sun, 12 May 2024 07:59:17 +0000 (UTC)
Date: Sun, 12 May 2024 09:59:11 +0200
To: friedtj@free.fr
Message-ID: <20240512095911.17df30df@windsurf>
In-Reply-To: <1322751925.1056008247.1711141112983.JavaMail.zimbra@free.fr>
References: <1392555888.1047670733.1711087389627.JavaMail.zimbra@free.fr>
 <1322751925.1056008247.1711141112983.JavaMail.zimbra@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715500758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=poxKx9RZjM87qTHeQ9Pg5AKjMj90TTgDFqbvs5SQc50=;
 b=RDk8NNB7eFGVIjS98kNtKbw0puqqQUSKiZMvGwKKNn3nGl+GjLQYOe+inA0Vu0PLYuJwgM
 z/eAEle1ZXx6zRHoGrIs+FnNdcJBmu1eDBcTtJr7a3i+7eieMirsxs2wt7LZcPdDPPg+f0
 Vlwgf5HMIQo/SqOehzlAKHiqWZ8Ohp6HdhqHKKV4xAKZ27I7vDRKY5zCWJCxYyXOoWPcFz
 +7mNIpvLauAwZTJzvHBglKunMvg3t239B4FWORnF8csgAApQ+XfqQRiG2HT4GzBcCUwZwc
 J2PZ/QFBTZSjcRSzYJOm9YKg91MwtqOLfHAq1Xc4yf3CV0SC0VdXj7oa1COchQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RDk8NNB7
Subject: Re: [Buildroot] package/gnuradio: activate gr-iio
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jean-Michel,

On Fri, 22 Mar 2024 21:58:32 +0100 (CET)
friedtj@free.fr wrote:

> From e26989cc30d4476d7384e62064cfa6486706bf8b Mon Sep 17 00:00:00 2001
> From: JM Friedt <jmfriedt@femto-st.fr>
> Date: Fri, 22 Mar 2024 20:55:44 +0000
> Subject: [PATCH 1/1] package/gnuradio: add IIO as optional feature of GNU Radio

I'm not sure what happened, but your patch is badly formatted. Also
your Signed-off-by line is missing.

> +config BR2_PACKAGE_GNURADIO_IIO
> +       bool "gr-iio support"
> +       select BR2_PACKAGE_LIBIIO

Since you select libiio...

> +       select BR2_PACKAGE_GNURADIO_BLOCKS
> +       help
> +         IIO support
> +
>  config BR2_PACKAGE_GNURADIO_NETWORK
>         bool "gr-network support"
>         select BR2_PACKAGE_GNURADIO_BLOCKS
> diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
> index 4e82c9e129..2267e7561a 100644
> --- a/package/gnuradio/gnuradio.mk
> +++ b/package/gnuradio/gnuradio.mk
> @@ -112,6 +112,12 @@ else
>  GNURADIO_CONF_OPTS += -DENABLE_GR_NETWORK=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_GNURADIO_IIO),y)
> +GNURADIO_CONF_OPTS += -DENABLE_GR_IIO=ON

don't you need libiio as a build dependency?

> +else
> +GNURADIO_CONF_OPTS += -DENABLE_GR_IIO=OFF
> +endif

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
