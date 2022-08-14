Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1E6C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 10:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 192B260BA9;
	Sun, 14 Aug 2022 10:39:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 192B260BA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id necJwc_w66cn; Sun, 14 Aug 2022 10:39:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32F4B60A8A;
	Sun, 14 Aug 2022 10:39:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32F4B60A8A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0BFE21BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E614141696
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:39:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E614141696
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xkjvRwOsiRMP for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 10:39:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C59F4136B
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C59F4136B
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 10:39:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3FD5F240008;
 Sun, 14 Aug 2022 10:39:50 +0000 (UTC)
Date: Sun, 14 Aug 2022 12:39:49 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220814123949.6dcc4963@windsurf>
In-Reply-To: <20220813193227.2386185-1-fontaine.fabrice@gmail.com>
References: <20220813193227.2386185-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660473590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nkYnwUj0JTFA7Aj2Qx3VGyXso7ZJjNJPXN8Ql/NZI7M=;
 b=Jv5HLavVROIKcXBOcq+lf7F5mKoRPf9tHl14Q3mEonB7+2ad8p7o0xxN9qtMsvIsLqUNbx
 +qm+l/DrVytNRWHqcI/awlqcSNxC/5XkYfeJeQqYf9P7+VBuheT6C/XZsV6/oDnL90+54p
 vz1bvwyJJ2RCmbAL0nGnPF1rr7T4sqp2xKY/NkPx8RCouB7FUghbtC3qavlmGXvp1llOPD
 wfdSo3+HzRgpDrMDWuSlGMoeO4bDxOhTX0q4r3tX23tB4S66zFTVTYMW05rR2ZJe+8LN/l
 0ePL5Ri/vGzDKP480Ve8y0pr1tmKYUKfp5XtW32n8UQ6XCieNKMbmSylbh22wg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Jv5HLavV
Subject: Re: [Buildroot] [PATCH 1/1] package/jose: disable man pages
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Sat, 13 Aug 2022 21:32:27 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> +diff --git a/meson_options.txt b/meson_options.txt
> +new file mode 100644
> +index 0000000..0885515
> +--- /dev/null
> ++++ b/meson_options.txt
> +@@ -0,0 +1 @@
> ++option('skip_manpages', type: 'boolean', value: false, description: 'Do not build manpages')
> diff --git a/package/jose/jose.mk b/package/jose/jose.mk
> index 8a60e20cc6..11c0783799 100644
> --- a/package/jose/jose.mk
> +++ b/package/jose/jose.mk
> @@ -11,5 +11,6 @@ JOSE_LICENSE = Apache-2.0
>  JOSE_LICENSE_FILES = COPYING
>  JOSE_INSTALL_STAGING = YES
>  JOSE_DEPENDENCIES = host-pkgconf zlib jansson openssl
> +JOSE_CONF_OPTS = -Dskip_manpages=false

Should this be -Dskip_manpages=true, to skip building the man pages?

If you set skip_manpages = false, then "if not
get_option('skip_manpages')" is true, and we build the manpages.

Am I missing something?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
