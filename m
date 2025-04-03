Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD085C3600C
	for <buildroot@archiver.kernel.org>; Thu,  3 Apr 2025 19:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85F686F4F3;
	Thu,  3 Apr 2025 19:21:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ikCjq50yJtD9; Thu,  3 Apr 2025 19:21:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6E1E6107D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6E1E6107D;
	Thu,  3 Apr 2025 19:21:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BAA47119
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 19:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABE9B846E5
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 19:21:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6l-59qIUCGv1 for <buildroot@buildroot.org>;
 Thu,  3 Apr 2025 19:21:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=dalang@gmx.at; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 84FB6846C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84FB6846C3
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84FB6846C3
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 19:21:36 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.8.36] ([89.144.222.100]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M89Gj-1u4Wam3jEJ-00HSwb; Thu, 03
 Apr 2025 21:21:32 +0200
Message-ID: <b27907d6-e0ab-4120-8570-5deeefed8e19@gmx.at>
Date: Thu, 3 Apr 2025 21:21:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, Julien Olivain <ju.o@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
References: <20250306203405.3348934-1-bernd@kuhls.net>
 <20250306203405.3348934-2-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20250306203405.3348934-2-bernd@kuhls.net>
X-Provags-ID: V03:K1:xvTklwBhfo74ySqG3CG6A0eHDI0S+YbfyTZlA4FPhPV0uiI2C5J
 iRpQ4MSfRBE0FwO46gCFuJqm7qlq//J6bR6LJQ2C1aqKwkd7aEZuQrYd5JTlMrCDsRt5Dhi
 zR+Wjxu2uE1qd3MNvx8hcfr2OlpcBAXD9pQabMIgVbCW/N0B9iUNELCE9CMbMShEXcF0FoX
 mQxOJ0MOUG/QvonI4hWPw==
UI-OutboundReport: notjunk:1;M01:P0:azF3Xa1fCJE=;hulMWVgIHpIYrVn+6KwSlEPclLQ
 H6K690FAtZR7Dc/WvY/NAYMEnYzc9MTw4gXOrf+9YZYFyTAW+eVA77KMPJkU3MnJjIEkaGwkV
 SibrY2ejZ8xd481DTR3nsUByhc4zRxvi+D/42LVoTN/oyggegbludLNUsb+5ReiJeX+E7jN3T
 yfHg7AKHD0ZAU+JXUA6EvtTvTdUYlzfWbkKMKCT6MpB2ImNRtyPYvwmAdsIdlyA0TnzMKErJG
 CHVJoSmV/wzl+OVxKSJr/SX8NHuhGnVz0GUdBk3HCr4uc1zT69NWPdjlaLOjlV+gagLp86vEU
 VpbDHI3dvg92IT0hxMO/O9j23UYiVBXP6bkOAulbeJpVyF9hI7veKx0V5lerHVTluY3fE5vEc
 8ROfweCrcqj0DOBYXah5RlBf+9yEiS2Ivpmn6gG3P/KB2eyZgXbgsZ+GrC0P0v1iWFmRcUFik
 2fQkscVFXg6Esy2pwW9zUO7eLm2Z9BBIy8mzSkKO7jCq/TplRc1UJGyJHV40p7755G9QBS01Q
 JvNzcwiY+14WCosKwocEkyZwF+zKPSRtPPJiroFSh8V4EzDWIwu+6nUmBhMGgcrMusnMAbRYu
 zSnY3nvRK0/q6WhrY2+zkGwQ85atsHhmdtLoVI4QGiRnBXM4cmuoakAdTZd2hoaXWhrcyAKGp
 dyVl2eX3pUNGACSdOMwZ1FzoDq4VqoGvUuYMBrUbEdySgxsOWlAHHsw64BOrJuMN8i/Y1lBuy
 45p8GywZbjwXz4F2DVYrznjz5wXpqVZvpvlICc8hzNbMEavJMpP9j1rqVVU1GAXvsGGtwgGsr
 YoBDp7Hj9sMEeXlz9sDPdayTa7KJgJh9OAZXaQSC+z3z4Ygsvz2O0UbrY0dt0dHeZff98bvjg
 8X8j4ZBVR8jzL7aLRNVaXIR0BQVOtKPywB2XCNpLiJCCqoM2dgeGuhd523BFHMRd8DDnZ2a28
 yV2zhXVRF01B6SMhzy9UX3r/a7wG6hZpHciJSNcSwanVF06BN72LS7EkMl7pWdjRSrKfBk1X4
 /tsPuyc5E+vh27uDAkZ6f90+JmaQyIbzXFDh39QBe86Q3kxqeV6beVTD1vLRTiJef2+DYny10
 SMs1g95IhTGjcMZXuWTzHgS7C2QElZ2JD3eEbeGe1r0ORQ8ooCPAYz6M+LwYIHrUVITVFzeuQ
 uh7+PXt3n9RTaAB4vZQMNYY1KOWwY4yG6Y9HUDFhbT0XgnKC2MYjFtpkmGMx5LOcelGY71A8h
 O+m6S89EtP7uRKq4lMTGi+EA0FcDuu5eruuOpNL3tCIzEP64SMoSlo3FIuoEDCHudhJsqxnSs
 WcVA07vD7Bm0ZjBgUK4rkpCIKBXGNLDxqcdqsPuEhfX/ANBaHNUDVjMxEsvp7LCbz5uwlnOF4
 REvPerEbPojn7NECME8TRsODjKBNfCHSH7Gg2M5fnMz++egpKWPm86pzJ3D2UvLRt6Ws94d6D
 XocUKWQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.at; 
 s=s31663417; t=1743708092; x=1744312892; i=dalang@gmx.at;
 bh=qa5w5Et9aj6zLx+uWCdT+ARI7PqQ7XhR1GB43mkPN0Q=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Z69XqCdOdcAE+Z/7Wleat4rsHgu+Gc92bj5+9xxMaGzKQ83VMqJGyQqGL+qFyIDd
 Eo1fHl1c8IydrGPCE7oDp7xrEFXUJcLCEb4A4KGkwvFxbTv+efqOLr6d3Rl5aEjT/
 UeAlpeOxUims2111dG3rcmlwvIeuwTP4SXBr3/abTzUpa+TJTbrRkSt6BcVgFHM0x
 fWzp/Zof37BRcHLmN6YtyXMmb1dZUIkyLIihBiAkyEQxt4HS5KcMNZ24zUVnRhhPH
 qQcthjcchHIZ9/zt7y/TsM2mr+c+6Prz5eJl6Phgr6V+qMxvH6AsZ7h7fFH1zKs5n
 UXjy69OTSyCRGBgERg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.at
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.at header.i=dalang@gmx.at header.a=rsa-sha256
 header.s=s31663417 header.b=Z69XqCdO
Subject: Re: [Buildroot] [PATCH/next 2/5] package/llvm-project/libclc: add
 host variant
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Daniel Lang via buildroot <buildroot@buildroot.org>
Reply-To: Daniel Lang <dalang@gmx.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On 3/6/25 21:34, Bernd Kuhls wrote:
> Needed for mesa3d bump to 24.1.0.
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/llvm-project/libclc/libclc.mk | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/package/llvm-project/libclc/libclc.mk b/package/llvm-project/libclc/libclc.mk
> index 9f303d6d2f..cfa978a8ac 100644
> --- a/package/llvm-project/libclc/libclc.mk
> +++ b/package/llvm-project/libclc/libclc.mk
> @@ -11,6 +11,7 @@ LIBCLC_LICENSE = Apache-2.0 with exceptions or MIT
>  LIBCLC_LICENSE_FILES = LICENSE.TXT
>
>  LIBCLC_DEPENDENCIES = host-clang host-llvm host-spirv-llvm-translator
> +HOST_LIBCLC_DEPENDENCIES = host-clang host-llvm host-spirv-llvm-translator
>  LIBCLC_INSTALL_STAGING = YES
>
>  # CMAKE_*_COMPILER_FORCED=ON skips testing the tools and assumes
> @@ -39,4 +40,8 @@ LIBCLC_CONF_OPTS = \
>  	-DCMAKE_CXX_COMPILER="$(CMAKE_HOST_CXX_COMPILER)" \
>  	-DLLVM_CONFIG="$(HOST_DIR)/bin/llvm-config"
>
> +HOST_LIBCLC_CONF_OPTS = \
> +	-DLIBCLC_TARGETS_TO_BUILD=spirv64-mesa3d-

I haven't worked with libclc in a while but I'm not sure if we need to check whether the host
is 32bit and select spirv-mesa3d- as target instead.

Do you have any idea here?

> +
>  $(eval $(cmake-package))
> +$(eval $(host-cmake-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
