Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E03ECAAD5
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 15:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01DD041686;
	Tue,  6 Sep 2022 15:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01DD041686
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I3EtSgqgoRtm; Tue,  6 Sep 2022 15:05:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 853B54167A;
	Tue,  6 Sep 2022 15:05:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 853B54167A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5BC9A1BF2C5
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 15:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44578404F7
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 15:05:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44578404F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hVq-gG6ya72j for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 15:05:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29C17400FD
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29C17400FD
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 15:05:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5e76:18ec:e237:5279])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6EFA2B00539;
 Tue,  6 Sep 2022 17:05:33 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Sep 2022 17:05:33 +0200
Date: Tue, 6 Sep 2022 17:05:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Message-ID: <20220906150533.GE1585594@scaer>
References: <20220901155605.118365-1-thomas.claveirole@green-communications.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220901155605.118365-1-thomas.claveirole@green-communications.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662476735;
 bh=E6DvsKWyb+m3KGm6S/MEvix1qMY45NJJvlg6+0N+dtA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b5rVx76bDRcz1fVWZ/r7Nt271kKKMxzzKwEREvhzPxGoOWihnnYOxiQackRswDumo
 EtL5guPP4P0OhQbb/AL+VwEEx7v7V1PJr6srwnu7Nkm35V0eA3CJFTEQLvEtYQhSKt
 84EYICH2xZTCGqobxl8QRHtgtcAoLuyhSxR3y3RlGeb3C4onMRez1N7R1Wqg+mhVJS
 hpF6GKwrkH4i/Eu5LbwD9Z3kWRc4oOaphLJf0kWGNlMtR/HPPAqBHBLzI9RymChPdc
 wwhYgYRUmNXtENGK1y6bJUp3Jbl+oKv7QJdXhjhllWNMQHDF9d3QQv5PGdIfII98yh
 TxUFT3DaBuTwg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=b5rVx76b
Subject: Re: [Buildroot] [PATCH v2 1/1] package/openlayers: bump to version
 7.1.0
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

On 2022-09-01 17:56 +0200, Thomas Claveirole spake thusly:
> OpenLayers changed its release format again, only two weeks after the
> previous change.  The good news is, though, that they now ship a
> single release archive that includes the compiled JavaScript code
> together with the source code.  Furthermore, they ship both code with
> a single license, which file is part of the archive.

I'd still be more comfortable if we were to do that build, because it
ensures the generated files are actual derived from the source files,
while there is no telling what in the bundled minified ones...

But call me paranoid if you want... ;-)

> Hence, we still do not need to rely on host-nodejs for this package,
> at least not for this version.
> 
> Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/openlayers/openlayers.hash |  3 ++-
>  package/openlayers/openlayers.mk   | 10 ++++------
>  2 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/package/openlayers/openlayers.hash b/package/openlayers/openlayers.hash
> index 1c93b9a729..1b3f3cce51 100644
> --- a/package/openlayers/openlayers.hash
> +++ b/package/openlayers/openlayers.hash
> @@ -1,2 +1,3 @@
>  # Locally computed:
> -sha256  8a9fda6e392688c049ebb88fb2c73b5788b4965b625443de4cca7d4688b1fb82  v6.14.1-dist.zip
> +sha256  37a0e5fde4df3db6e6c11ed0ceb8e20608121afe5f8f7f91cf03990e89a919ca  v7.1.0-package.zip
> +sha256  6c4347b83a8c9feef18d57b18e3b6c44cf901b3c344a4a1fbd837e421555ab8e  LICENSE.md
> diff --git a/package/openlayers/openlayers.mk b/package/openlayers/openlayers.mk
> index 4626e7545a..7396e38fb9 100644
> --- a/package/openlayers/openlayers.mk
> +++ b/package/openlayers/openlayers.mk
> @@ -4,21 +4,19 @@
>  #
>  ################################################################################
>  
> -OPENLAYERS_VERSION = 6.14.1
> -OPENLAYERS_SOURCE = v$(OPENLAYERS_VERSION)-dist.zip
> +OPENLAYERS_VERSION = 7.1.0
> +OPENLAYERS_SOURCE = v$(OPENLAYERS_VERSION)-package.zip
>  OPENLAYERS_SITE = https://github.com/openlayers/openlayers/releases/download/v$(OPENLAYERS_VERSION)
>  OPENLAYERS_LICENSE = BSD-2-Clause
> -# There's no separate license file in the archive, only minified files.
> +OPENLAYERS_LICENSE_FILES = LICENSE.md
>  
>  define OPENLAYERS_EXTRACT_CMDS
>  	unzip $(OPENLAYERS_DL_DIR)/$(OPENLAYERS_SOURCE) -d $(@D)
> -	mv $(@D)/v$(OPENLAYERS_VERSION)-dist/* $(@D)
> -	rmdir $(@D)/v$(OPENLAYERS_VERSION)-dist/
>  endef
>  
>  define OPENLAYERS_INSTALL_TARGET_CMDS
>  	$(INSTALL) -D -m 0644 $(@D)/ol.css $(TARGET_DIR)/var/www/ol.css
> -	$(INSTALL) -D -m 0644 $(@D)/ol.js $(TARGET_DIR)/var/www/ol.js
> +	$(INSTALL) -D -m 0644 $(@D)/dist/ol.js $(TARGET_DIR)/var/www/ol.js
>  endef
>  
>  $(eval $(generic-package))
> -- 
> 2.35.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
