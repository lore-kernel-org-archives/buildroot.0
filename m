Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4339C433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 14:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27C2F60DBA;
	Thu,  6 Jan 2022 14:45:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VoqK73lkRwnp; Thu,  6 Jan 2022 14:45:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6829860E45;
	Thu,  6 Jan 2022 14:45:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9CC851BF406
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 14:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A3AA831C1
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 14:45:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RZ9zGzwU7lHQ for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 14:45:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7DFF782EE1
 for <buildroot@busybox.net>; Thu,  6 Jan 2022 14:45:41 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id o3so5190343wrh.10
 for <buildroot@busybox.net>; Thu, 06 Jan 2022 06:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QM08JRurAkBq3uJXDEbGWJciqYRLTYiqMhwvt6a6B70=;
 b=f4VgXD2Itb/jAjs79iyHakFX0QGrHzUghEqWxiCFKywLXTMBSeFt4iOBPCQVS7TjM1
 V6sTDRtcjvQD0trjdeAF4vENxWjAJJ7VyFPux72SIf0bNuGyIRB9MHsstNi6ZIU6ze0S
 rSVNq0nw1DrMsmDFK8mGUyFSz1uYnKz/RUOdv7t54ykRoOHWot5NyfmXi1ZPIbYchUZQ
 Ps8peJgmjeLrDO3IUsWOxVXy04nhYAQFWPaGm+MtY6o8QFOlO7/yzQvzaXYR5Jphn8x4
 ZtCBBszzmqOg4ZD1NSOWfeB1UghgMlHTnLHyjFm2C8ZgES+PNtmt/WGKGYjsYjzRVvF7
 m0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QM08JRurAkBq3uJXDEbGWJciqYRLTYiqMhwvt6a6B70=;
 b=cq2qOAHMpC0ue/jh0YfqqR1SS67FjfXAUelie/OwL/oWbtHuk/l4ruNGpqn0cX81y4
 gH/OwsWlUXz6GROddMDA+gVZSf3abaQGzw2mmplYRNDjCDJYhiTI2wlIueVgGmzMjm07
 Nzc2uoBGC+AmXm4qRtF1GDr/W9KhyD1hWzfxJWWuS4MFuKJ7L0KsyeG0Vsb3Uy88k8uQ
 mRyaml1PwmRzt2Gz5HCrez0AUXzoEnTR55B+/f9Uvn2mrqYOtqKnjOwiAabyldt9ZVNR
 i9nVwiUYzQHRbncH1aS7JmMAx+0woxTxUcqPGorCmrC0+ykmS8LHO3jX/4geaB5nifsa
 KD+w==
X-Gm-Message-State: AOAM530vlPWB2oVkB76ukQjt3xbsSpFa0WqH7IdHBR2GTVG/WEUtpIlZ
 EA5B2Xk7dflWfbY979sjRT8V4g==
X-Google-Smtp-Source: ABdhPJx9dGASM5M+UNoG7DILnnJoLBV4J2++zNVAH+67zgNG93A1QdDRD+dAjleMwQMYA/MuFhs50Q==
X-Received: by 2002:a5d:4b07:: with SMTP id v7mr3221621wrq.668.1641480339783; 
 Thu, 06 Jan 2022 06:45:39 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id i9sm2379567wrb.84.2022.01.06.06.45.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 06:45:39 -0800 (PST)
Message-ID: <737df820-79da-b710-22fc-dc8c53e9223c@mind.be>
Date: Thu, 6 Jan 2022 15:45:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Changming Huang <jerry.huang@nxp.com>, buildroot@busybox.net
References: <20200207083857.28058-1-jerry.huang@nxp.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20200207083857.28058-1-jerry.huang@nxp.com>
Subject: Re: [Buildroot] [PATCH v5 1/9] package/nxp: new package directory
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
Cc: geomatsi@gmail.com, Chris Dimich <chris.dimich@boundarydevices.com>,
 michael@walle.cc, thomas.petazzoni@bootlin.com, heiko.thiery@gmail.com,
 Michael Trimarchi <michael@amarulasolutions.com>, matthew.weber@collins.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Changming,

  I finally started picking up this series after two years. Unfortunately, I 
have a lot of requests for changes still.

On 07/02/2020 09:38, Changming Huang wrote:
> The "nxp" directory is intended to contain all NXP
> QorIQ (including PowerPC and LayerScape serial) related packages,
> together with their download site and version info.

  We try to avoid subdirectories in package/; we only add them in case there is 
some common functionality that needs to be factored out, like for e.g. qt5.

  In this series, the only commonality that I found is the binary extraction, 
but it ends up to be used only by qoriq-cadence-dp-firmware. That's not worth it 
IMHO.

  Therefore, I marked this patch and rejected.

  Note that it would make sense to do this if we would also move the 
freescale-imx stuff into the same directory (freescale is anyway nxp now so it 
should be OK to do that).


> Signed-off-by: Changming Huang <jerry.huang@nxp.com>
> ---
> changes since v4:
> no changes.
> 
> changes since v3:
> no changes.
> 
> changes since v2:
> 1. change the sub-direcotry to "nxp".
> 2. add helper.mk macro to extract compressed file.
> 
> changes since v1:
> no changes.
> ---
>   package/Config.in     |  1 +
>   package/nxp/Config.in |  4 ++++
>   package/nxp/helper.mk | 32 ++++++++++++++++++++++++++++++++
>   3 files changed, 37 insertions(+)
>   create mode 100644 package/nxp/Config.in
>   create mode 100644 package/nxp/helper.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index bad4f9cba6..f9827769a2 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -497,6 +497,7 @@ endmenu
>   	source "package/nvidia-driver/Config.in"
>   	source "package/nvidia-tegra23/Config.in"
>   	source "package/nvme/Config.in"
> +	source "package/nxp/Config.in"
>   	source "package/ofono/Config.in"
>   	source "package/on2-8170-modules/Config.in"
>   	source "package/open2300/Config.in"
> diff --git a/package/nxp/Config.in b/package/nxp/Config.in
> new file mode 100644
> index 0000000000..575542c7ab
> --- /dev/null
> +++ b/package/nxp/Config.in
> @@ -0,0 +1,4 @@
> +menu "NXP QorIQ libraries"
> +	depends on BR2_aarch64 || BR2_arm || BR2_powerpc64 || BR2_powerpc
> +
> +endmenu
> diff --git a/package/nxp/helper.mk b/package/nxp/helper.mk
> new file mode 100644
> index 0000000000..79e4236249
> --- /dev/null
> +++ b/package/nxp/helper.mk

  The .mk file should have the same name as the directory, so nxp.mk.

  Regards,
  Arnout

> @@ -0,0 +1,32 @@
> +################################################################################
> +#
> +# helper
> +#
> +################################################################################
> +
> +# Helper for self-extracting binaries distributed by NXP.
> +#
> +# The --force option makes sure it doesn't fail if the source
> +# directory already exists. The --auto-accept skips the license check,
> +# as it is not needed in Buildroot because we have legal-info. Since
> +# there's a EULA in the binary file, we extract it in this macro, and
> +# it should therefore be added to the LICENSE_FILES variable of
> +# packages using this macro. Also, remember to set REDISTRIBUTE to
> +# "NO". Indeed, this is a legal minefield: the EULA specifies that the
> +# Board Support Package includes software and hardware (sic!) for
> +# which a separate license is needed...
> +#
> +# $(1): full path to the archive file
> +#
> +define NXP_EXTRACT_HELPER
> +	awk 'BEGIN      { start = 0; } \
> +	     /^EOEULA/  { start = 0; } \
> +	                { if (start) print; } \
> +	     /<<EOEULA/ { start = 1; }' \
> +	    $(1) > $(@D)/EULA
> +	cd $(@D) && sh $(1) --force --auto-accept
> +	find $(@D)/$(basename $(notdir $(1))) -mindepth 1 -maxdepth 1 -exec mv {} $(@D) \;
> +	rmdir $(@D)/$(basename $(notdir $(1)))
> +endef
> +
> +include $(sort $(wildcard package/nxp/*/*.mk))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
