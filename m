Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD5FC6FA82
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 20:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BF8A4051D;
	Wed, 21 Sep 2022 20:15:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BF8A4051D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8QWTOvxNwpYI; Wed, 21 Sep 2022 20:15:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97DB540217;
	Wed, 21 Sep 2022 20:15:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97DB540217
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 623E21BF34B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:15:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B7884156E
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:15:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B7884156E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yToSH86GWd2B for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 20:15:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4E344156C
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A4E344156C
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 20:15:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AD6CAC000A;
 Wed, 21 Sep 2022 20:15:24 +0000 (UTC)
Date: Wed, 21 Sep 2022 22:15:23 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Maxim Kochetkov <fido_max@inbox.ru>
Message-ID: <20220921221523.21e6656d@windsurf>
In-Reply-To: <20220919062023.1091771-1-fido_max@inbox.ru>
References: <20220919062023.1091771-1-fido_max@inbox.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663791324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R4tS8x+sAPknLa04dHZ1WLZt81R4j5OFofYeLBggNec=;
 b=SnLggPFUX/RWfNMzoAGJCgh+SJEgEFeKrm3FndZ4iG4uqSTD5GFXAY65oFDXmflNMgxGhp
 DIFPQSKNtGVT+eojzkVR5XZh4X+cbsMB/dowWu/eO3vIY1yCulMOhXmdRp/RT5YR38FBHx
 jmyCCGbSJ467TbgWhV143/J9oBxB1RMA5NW8Pw0QIqxSOew0v/Bove3REYPLo84yIJ5RC9
 vtlPGpqjRDEmb8LPugM73XHPk6tKTKYS0x8Jyt0B8w4E8Yqi/aHhhBNyoapxowu555qnuo
 QDQ0hOaFIKo5njjCy0no5ZFBgIDwuVhtI7OzYBzwVGc9g+1HB0eO2Fuz7ao18A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SnLggPFU
Subject: Re: [Buildroot] [PATCH 1/1] package/postgis: bump version to 3.3.1
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

On Mon, 19 Sep 2022 09:20:23 +0300
Maxim Kochetkov <fido_max@inbox.ru> wrote:

> Release-notes: https://git.osgeo.org/gitea/postgis/postgis/src/tag/3.3.1/NEWS
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  ...kefile.in-do-not-force-static-linkin.patch | 23 ++++++++++---------
>  package/postgis/postgis.hash                  |  2 +-
>  package/postgis/postgis.mk                    |  2 +-
>  3 files changed, 14 insertions(+), 13 deletions(-)
> 
> diff --git a/package/postgis/0002-raster-loader-Makefile.in-do-not-force-static-linkin.patch b/package/postgis/0002-raster-loader-Makefile.in-do-not-force-static-linkin.patch
> index 756a7c10dd..20a359fadd 100644
> --- a/package/postgis/0002-raster-loader-Makefile.in-do-not-force-static-linkin.patch
> +++ b/package/postgis/0002-raster-loader-Makefile.in-do-not-force-static-linkin.patch
> @@ -1,6 +1,6 @@
> -From 29c33c483e22a4445d870739187d128df0f11f60 Mon Sep 17 00:00:00 2001
> -From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> -Date: Wed, 27 Jul 2022 15:12:40 +0200
> +From 50af3f4fc2353ba35fd054060e27e034d29b1c78 Mon Sep 17 00:00:00 2001
> +From: Maxim Kochetkov <mkochetkov@airspan.com>
> +Date: Mon, 19 Sep 2022 09:09:44 +0300

Since you are not doing substantial changes on this patch, it would be
nicer to preserve the authorship as it is.

>  Subject: [PATCH] raster/loader/Makefile.in: do not force static linking
>  
>  This is similar to commit
> @@ -13,23 +13,24 @@ object XYZ".
>  
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>  Upstream: https://github.com/postgis/postgis/pull/702

Do you think you could follow-up with upstream on this? I did an
initial fix, but that wasn't accepted as-is. However, my interest in
postgis is limited, so I don't think I will have the chance to look
into this in the near future.

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
