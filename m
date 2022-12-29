Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C974AC4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 16:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E93A60B20;
	Thu, 29 Dec 2022 16:07:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E93A60B20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eyCK8aTr6mbB; Thu, 29 Dec 2022 16:07:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68BA460AAF;
	Thu, 29 Dec 2022 16:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68BA460AAF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 369921BF39A
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 16:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F023400CB
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 16:07:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F023400CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cpAeX-A42ZS5 for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 16:07:08 +0000 (UTC)
X-Greylist: delayed 00:08:02 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00684400C8
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.40])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00684400C8
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 16:07:07 +0000 (UTC)
Received: from opfedar00.francetelecom.fr (unknown [xx.xx.xx.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar24.francetelecom.fr (ESMTP service) with ESMTPS id 4NjY3W41hGz5w49; 
 Thu, 29 Dec 2022 16:59:03 +0100 (CET)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Thu, 29 Dec 2022 16:59:01 +0100
Date: Thu, 29 Dec 2022 16:59:01 +0100
From: <yann.morin@orange.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <2122_1672329543_63ADB947_2122_64_1_20221229155901.GB3218@tl-lnx-nyma7486>
References: <20221229153735.12524-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221229153735.12524-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX206.corporate.adroot.infra.ftgroup (10.115.27.7)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1672329543;
 bh=l6RWEqTLR/nw3+CKSxnPeEiTTlpPBUWZjIH66wSYBE0=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=xRVghUDFHI95AmmISU3X/rFRNNlFV2DojfyVKGFGXX9FZ0z+8mQXKDcWN9H1nmUp8
 gFPwlNMB1vi78xCdgE9FOpE3ZLP7HEb4ta/m4Uh+V9IP9jez7bs8lZTHbpSMz7qNbl
 +SFuEIW/ck0Z2pYE7i+l3uDSCYgsOCQRhTHBjYugOzVKH+dEociKlch9VBeUY+rr91
 EIfmIZvYNbVjuQ1CvW9SSDKUUcCePhod++sjrpYilWOciBlEKa7vWHL9R5jmYKu+oK
 Gxnmv2XTkmSXbeGziaFcihUMoGtHKpFx+nhVyoACLQGPVHP6eEODR7u5zRuxLMvVW4
 mRQ9+TVEVsl5g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=xRVghUDF
Subject: Re: [Buildroot] [PATCH 1/1] Revert "package/tiff: add webp optional
 dependency"
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

Fabrice, All,

On 2022-12-29 16:37 +0100, Fabrice Fontaine spake thusly:
> This reverts commit 3fd6ada8dbca3370b9bb67feb2971e637cb4b11f to fix the
> following build failure raised because tiff is already an optional
> dependency of webp:
> 
> package/tiff/tiff.mk:122: *** Recursive variable 'TIFF_FINAL_RECURSIVE_DEPENDENCIES' references itself (eventually).  Stop.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d8486cd1d5e56fb3719dc88b8aebc76c3e23cdc9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/tiff/Config.in | 4 ----
>  package/tiff/tiff.mk   | 7 -------
>  2 files changed, 11 deletions(-)
> 
> diff --git a/package/tiff/Config.in b/package/tiff/Config.in
> index b9e3656e6f..d1004d6668 100644
> --- a/package/tiff/Config.in
> +++ b/package/tiff/Config.in
> @@ -72,10 +72,6 @@ config BR2_PACKAGE_TIFF_UTILITIES
>  	help
>  	  Install all tiff utilities.
>  
> -config BR2_PACKAGE_TIFF_WEBP
> -	bool "WEBP compression"
> -	select BR2_PACKAGE_WEBP
> -
>  config BR2_PACKAGE_TIFF_ZSTD
>  	bool "ZSTD compression"
>  	select BR2_PACKAGE_ZSTD
> diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
> index c2a4108f35..f0b56150b1 100644
> --- a/package/tiff/tiff.mk
> +++ b/package/tiff/tiff.mk
> @@ -105,13 +105,6 @@ else
>  TIFF_CONF_OPTS += --disable-tools
>  endif
>  
> -ifeq ($(BR2_PACKAGE_TIFF_WEBP),y)
> -TIFF_CONF_OPTS += --enable-webp
> -TIFF_DEPENDENCIES += webp
> -else
> -TIFF_CONF_OPTS += --disable-webp

I think we want to keep explicitly disabling webp, with a comment
explaining why:

    # webp has a (optional) dependency on tiff, so we can't have webp
    # support in tiff, or that would create a circular dependency.
    TIFF_CONF_OPTS += --disable-webp

Regards,
Yann E. MORIN.

> -endif
> -
>  ifeq ($(BR2_PACKAGE_TIFF_ZSTD),y)
>  TIFF_CONF_OPTS += --enable-zstd
>  TIFF_DEPENDENCIES += zstd
> -- 
> 2.35.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
