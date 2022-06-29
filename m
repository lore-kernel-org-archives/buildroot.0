Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A52AEC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Jun 2022 07:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20C5082F2D;
	Wed, 29 Jun 2022 07:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20C5082F2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0R627vYLME2m; Wed, 29 Jun 2022 07:09:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1F7C826B4;
	Wed, 29 Jun 2022 07:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1F7C826B4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 631F11BF57C
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 07:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A09C40867
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 07:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A09C40867
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bNosqTC67v1z for <buildroot@lists.busybox.net>;
 Wed, 29 Jun 2022 07:09:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2FFF4051E
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2FFF4051E
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 07:09:06 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id z21so26337527lfb.12
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 00:09:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7fgW9W/xcUNoo+o9gW6R8gULEwan0fEpnVB3tP6rXLs=;
 b=lX0+aV1SDTGg1K+Gk+uHnPHtxJquGucPKEPSqfDZEfuag0EW4Uk8isbq+lIBi7kxnK
 /vECn7v7U8ksI55FRgc1CK03VZfU9AAUBDD7X+1H3PUx4KehCXkqfx4ojn1o4SQNlB4q
 JCBAu+w9wiWWuG4sJBioDTzC0sLVHsNgeVN5kAivF/rkF/djvSjlR9TLTCuohJgPn4Xn
 LfeMPQ0U7PtnLsD827NcdpC6kr4npLc90INZA99mhm1dal6Ols+Ij7+nMgk8XlhetOXf
 po5gR9kONLmHtIX64Nimcx2kmaJorCxTl/NpCplbF7mQXk3OcD/9y+6J2ivfud0jeC2k
 xjaw==
X-Gm-Message-State: AJIora+TF2LpgY03jSzShKV8ozCvVXADa06MbDcYJB5+WwUSDvnynBRw
 LHM9Kj8rsjnisgnanDSckpAhSwu7P5/ZO7pzCJqKuS8LfUE2MA==
X-Google-Smtp-Source: AGRyM1v9KHZI+iJvLIg4D0uadGNsUm/PU0zHdjf1POadybQts0ESIcJNwiLADLhW0bhn07D3TpWA3QzH4MuYhJYOjLs=
X-Received: by 2002:a05:6512:1192:b0:481:4ba:f14d with SMTP id
 g18-20020a056512119200b0048104baf14dmr1074190lfr.662.1656486544455; Wed, 29
 Jun 2022 00:09:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220628164038.2836798-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20220628164038.2836798-1-fontaine.fabrice@gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 29 Jun 2022 09:08:53 +0200
Message-ID: <CABGWkvpChYPA1j-P=rgyByxs=dOwuCF1Rbvajagy2L9CQZ2u3Q@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=7fgW9W/xcUNoo+o9gW6R8gULEwan0fEpnVB3tP6rXLs=;
 b=k1FtvJcPUhEuwAYrsYYTwdsXdZK9EKRj3TXoPenXoVLQaRJ61BJ6DYbPWuD1rMqy3e
 Jacl7k32K3a37S5Q2iE+WZdPB4vwA7I5p8idZ3//uEKu5c+MViq0RLloAuaGqgzzZ1Zg
 POl5ALBGwmh+xv8NScLUUObEFwtiNCtZSOjdc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=k1FtvJcP
Subject: Re: [Buildroot] [PATCH 1/1] package/uuu: add host-openssl dependency
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

On Tue, Jun 28, 2022 at 6:43 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Fix the following build failure raised since the addition of the package
> in commit 776385d645b37cfc43479b37e106244aa9ab2e85:
>
> CMake Error: The following variables are used in this project, but they are set to NOTFOUND.
> Please set them or make sure they are set and tested correctly in the CMake files:
> OPENSSL_CRYPTO_LIBRARY (ADVANCED)
>     linked by target "uuu" in directory /home/buildroot/autobuild/instance-0/output-1/build/host-uuu-1.4.193/uuu
> OPENSSL_SSL_LIBRARY (ADVANCED)
>     linked by target "uuu" in directory /home/buildroot/autobuild/instance-0/output-1/build/host-uuu-1.4.193/uuu
>
> Fixes:
>  - http://autobuild.buildroot.org/results/2f05bc67112a59eba8f59ff707e43d76e41dbad1
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/uuu/uuu.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
> index d1d7824018..9bf9ff123b 100644
> --- a/package/uuu/uuu.mk
> +++ b/package/uuu/uuu.mk
> @@ -9,6 +9,6 @@ UUU_SOURCE = uuu_source-$(UUU_VERSION).tar.gz
>  UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
>  UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
>  UUU_LICENSE_FILES = LICENSE README.md
> -HOST_UUU_DEPENDENCIES = host-bzip2 host-zlib host-libusb
> +HOST_UUU_DEPENDENCIES = host-bzip2 host-openssl host-zlib host-libusb
>
>  $(eval $(host-cmake-package))
> --
> 2.35.1
>

Reviewed-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Thanks and regards,
Dario
-- 

Dario Binacchi

Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
