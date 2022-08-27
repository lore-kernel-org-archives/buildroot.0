Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2F5ECAAD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 09:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C723A41503;
	Sat, 27 Aug 2022 09:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C723A41503
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id krjdAGr5ZPgH; Sat, 27 Aug 2022 09:36:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61659409E8;
	Sat, 27 Aug 2022 09:36:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61659409E8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F6061BF32D
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 09:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D88D1409E8
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 09:36:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D88D1409E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yAfjbo_HTuMs for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 09:36:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CDA24099A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6CDA24099A
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 09:36:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1c2f:c99e:ae80:bcc0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 5940E19F396;
 Sat, 27 Aug 2022 11:36:03 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 27 Aug 2022 11:36:03 +0200
Date: Sat, 27 Aug 2022 11:36:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Message-ID: <20220827093603.GT37358@scaer>
References: <20220825151204.390615-1-thomas.claveirole@green-communications.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220825151204.390615-1-thomas.claveirole@green-communications.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661592965;
 bh=bU4nCgCmWkcNnz9n8amonnmPb3hrapAPPr/2SfP8jVI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dD9jXyIjONvSBKN9zPlNrNLCCGyp5cFd6zvgvkHAl5uPgrnyIbfgNfjWQDuRd9KGP
 N8v1avYTagSBpGv7pZHVwrK+Og2/TF0oDe6fwRYhEumXsH0EYNiBjmOBCzzpZKvez7
 0tywm5YUHPOMyj1IUPxnbB1mSrwDDxcV7yuXy6uz7gWh+WH2o1uLeSAZdb8O7/3ZeZ
 zsK6ZuvObLDlLu1rtwWCBulNV0Ep5CN2HZ7Xfo37iT49rpda8sI7CJ49D9Q4/h6jND
 D+5+4Rwoi6jDGRmd54Z0qqM3wVIM0+J+vyuEkK86dL0cOOCb6z2uPo6fZkzojAp2To
 F6n+tid9gWbow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dD9jXyIj
Subject: Re: [Buildroot] [PATCH 1/1] package/openlayers: bump to version
 7.0.0
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

Thomas, All,

On 2022-08-25 17:12 +0200, Thomas Claveirole spake thusly:
> Do not rely on the "dist" archive anymore (or the "legacy" archive as
> OpenLayers calls it now).  Build the JavaScript directly from the
> source archive instead, using host-nodejs.

Ah, another case [0] of building sith host-nodejs, two data-points,
better than one! :-) And see below [1]...

[0] https://lore.kernel.org/buildroot/20220827084732.GR37358@scaer/T/#m4c898e32584721ce8a793bedc6a057dff98cbf3e

> Note that the v6.14.1-dist.zip archive for the previous version did
> change, hence the hash for previous version is broken.  See
> https://github.com/openlayers/openlayers/issues/14053 for details.

Ah, this is bad... :-( "First rule of release management: do not ever
change a release."

So, for master: v6.14.1 is just a fix in the package-lock?json. Since
we were not building the package, but were relying on the pre-build
archive, we should not be imapcted by this change, right? In that case,
we could just revert back to using v6.14.0, so that we can have a hash
that is correct.

Thoughts?

> Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
> ---
[--SNIP--]
> diff --git a/package/openlayers/openlayers.mk b/package/openlayers/openlayers.mk
> index 4626e7545a..08a58cd796 100644
> --- a/package/openlayers/openlayers.mk
> +++ b/package/openlayers/openlayers.mk
> @@ -4,21 +4,26 @@
>  #
>  ################################################################################
>  
> -OPENLAYERS_VERSION = 6.14.1
> -OPENLAYERS_SOURCE = v$(OPENLAYERS_VERSION)-dist.zip
> -OPENLAYERS_SITE = https://github.com/openlayers/openlayers/releases/download/v$(OPENLAYERS_VERSION)
> -OPENLAYERS_LICENSE = BSD-2-Clause
> -# There's no separate license file in the archive, only minified files.
> +OPENLAYERS_VERSION = 7.0.0
> +OPENLAYERS_SITE = $(call github,openlayers,openlayers,v$(OPENLAYERS_VERSION))
>  
> -define OPENLAYERS_EXTRACT_CMDS
> -	unzip $(OPENLAYERS_DL_DIR)/$(OPENLAYERS_SOURCE) -d $(@D)
> -	mv $(@D)/v$(OPENLAYERS_VERSION)-dist/* $(@D)
> -	rmdir $(@D)/v$(OPENLAYERS_VERSION)-dist/
> +# OpenLayers itself is BSD-2-Clause, but not all of the dependencies
> +# it brings in are.  See $(@D)/build/legacy/*.LICENSE.txt after build
> +# for details.
> +OPENLAYERS_LICENSE = BSD-2-Clause, BSD-3-Clause (ieee754), Apache-2.0
> +OPENLAYERS_LICENSE_FILES = LICENSE.md
> +
> +OPENLAYERS_DEPENDENCIES = host-nodejs
> +
> +define OPENLAYERS_BUILD_CMDS
> +	cd $(@D) && $(NPM) install && $(NPM) run build-legacy

[1] As I said in [0], it is weird to see that we need to install before
we can build?

Why build-legacy? a small note in the comit log to explain that would be
nice.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
