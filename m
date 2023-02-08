Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AEEC636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 11:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5923B81F89;
	Wed,  8 Feb 2023 11:15:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5923B81F89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 345ReRUWM-86; Wed,  8 Feb 2023 11:15:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BA7281F82;
	Wed,  8 Feb 2023 11:15:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BA7281F82
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C30E1BF3A4
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 11:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03BC040BF5
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 11:15:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03BC040BF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1H4m2u97PJMj for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 11:15:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B78540BFB
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B78540BFB
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 11:15:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 10FD9E0005;
 Wed,  8 Feb 2023 11:15:02 +0000 (UTC)
Date: Wed, 8 Feb 2023 12:15:01 +0100
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20230208121501.7fc4267d@windsurf>
In-Reply-To: <20230207171721.2973997-12-angelo@amarulasolutions.com>
References: <20230207171721.2973997-1-angelo@amarulasolutions.com>
 <20230207171721.2973997-12-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675854905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A4dah6FSLH3mzwBpIwZM9x+kpSIQUmNIBB5QeBE/P7w=;
 b=e3kMXaSiReMiNCSE94nPrshm6rhBJPlqnCvsCForfjRVf7ZTNPuNCqZBH/CLs63CtyiqcL
 4GpWKS9RLa2Ylo7dVVfHBQeAs5K8E74k//vnU/bT59k4RA4GUQaKvFP/lDzXdVZKNCfdqm
 NYgRJsBBq5t4pnuUriiEIcnt4r7By0KPMJ/H+hU25UvuguhREhWfyutBaqp7fyn9JO+5ti
 /XAtuyWlnT0OVbk50O3wSPhuoNmHSPrh9RSd1HW13LSnUiKrTzqM30y/Q8iLvOxsIjP3+p
 73o18q9UYM7FdADPrgfYNnZqUl0hcpfAcrYOYIIO8HRedpYt19ngmSTn1JUPLg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=e3kMXaSi
Subject: Re: [Buildroot] [PATCH v6 11/13] package/qt6/qt6base: add support
 for printsupport/cups
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
Cc: jesseevg@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  7 Feb 2023 18:17:19 +0100
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> From: Jesse Van Gavere <jesseevg@gmail.com>
> 
> Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/qt6/qt6base/Config.in  |  4 ++++
>  package/qt6/qt6base/qt6base.mk | 12 ++++++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
> index d5d6d3569d..4d13128661 100644
> --- a/package/qt6/qt6base/Config.in
> +++ b/package/qt6/qt6base/Config.in
> @@ -168,6 +168,10 @@ config BR2_PACKAGE_QT6BASE_NETWORK
>  	help
>  	  This options enables the Qt6Network library.
>  
> +config BR2_PACKAGE_QT6BASE_PRINTSUPPORT
> +	depends on BR2_PACKAGE_QT6BASE_WIDGETS
> +	def_bool y

Why is that a def_bool y? I see it's like that in qt5base, but I'm not
sure why. I changed it to be a normal option:

config BR2_PACKAGE_QT6BASE_PRINTSUPPORT
        bool "printing support"
        # yes, print support needs widgets
        depends on BR2_PACKAGE_QT6BASE_WIDGETS
        help
          This option enables printing support, optionally using CUPS
          if available.

> diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
> index 4a64886a3f..97986a3c2b 100644
> --- a/package/qt6/qt6base/qt6base.mk
> +++ b/package/qt6/qt6base/qt6base.mk
> @@ -206,6 +206,18 @@ else
>  QT6BASE_CONF_OPTS += -DFEATURE_jpeg=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_QT6BASE_PRINTSUPPORT), y)

Spurious space before y

> +QT6BASE_CONF_OPTS += -DFEATURE_printsupport=ON
> +ifeq ($(BR2_PACKAGE_CUPS), y)

Same.

Applied with those fixes. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
