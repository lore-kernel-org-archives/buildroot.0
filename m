Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8846C433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 09:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0C1560F0A;
	Sat, 14 May 2022 09:49:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BV0CJuhyc3MB; Sat, 14 May 2022 09:49:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD8A260B42;
	Sat, 14 May 2022 09:49:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 418A71BF85D
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CC1241680
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:49:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3j2ADBz-lhLM for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 09:49:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55AA14055D
 for <buildroot@buildroot.org>; Sat, 14 May 2022 09:49:07 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id s11so8779726edy.6
 for <buildroot@buildroot.org>; Sat, 14 May 2022 02:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=y6BoJJOYMxMnm1jtbcxnlKjzYxpa3h39kakTPMeJYww=;
 b=aKTaXybLY8hRHaC8tU4JDiydkFAwlNlO7klyZwYAuiXoCePb0cQqI6boJ7Mbu8Ag+g
 Uw4mWZNBHxWlrBcckPPWVvf6GmmkXI2Y7MjPWdGF2hzPgisOSkgAgnN0uTO+mD/R5VAg
 eHfWQr3xhLb8foTLvVI/mpgQXJS3ja5paJL2bJLbb0DiUyIiRfU922BMjOTT8dUGE2HZ
 xeyZ+5Q6qPMqkNA6s61s91t/SOuMTHef3hsggUq8t9Qhux44bIlvpRrPokUCXTD2PQ1N
 BRnrPARso4Pl8jEhtdTuUyxjL1H6AMjz9haBrvpDCyGbYhwyZ33tkW4Zqh9X1vT7e44D
 x4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=y6BoJJOYMxMnm1jtbcxnlKjzYxpa3h39kakTPMeJYww=;
 b=fEhFrnAu+WZueAcY4d8FGI3Ah8ecxki8a4zffTEA7X8YAsn2QiFBkzko7rzmzrDADr
 XdGYrUP+2kk/2dR17DGenpbYQR81lKb7sy83PW7gnBZHVeL+Jd4KTNTBLPIFtRK+fXrN
 NXJoXzDmdg5Pe+Hs/ye0MXOhXcO0y9XxOQGjUC6/AnIGhxxQgnsBf4ZvXC9trtkUE4zb
 O9FWqRfW0Jo9WXCZtod2IIAxZAr04LD/sXS8PmGtFfD2E4osDwSRLr73Ee2LNSQv1jkE
 KO4MK9RucSj5RY8dlJY3R9pMx1NbnYTnuN47gmyhSH1lfDlpI+BVZNLC07/1ooQl1h3B
 DKGw==
X-Gm-Message-State: AOAM5337/73zXr1Iz85aZ9sOkfEf/GAunytbmSeXafE1BycK8Mf0qQqu
 +YWVtBlJHIY2ySNve0N7gkR6Sg==
X-Google-Smtp-Source: ABdhPJyA+MGwKdhNoPspxogeGeBVk58hdLzhuypraN2eXtyrT1ROOFuisLd6+ryHOkvwgJK+V5q4fQ==
X-Received: by 2002:a05:6402:2204:b0:426:34f1:1d2d with SMTP id
 cq4-20020a056402220400b0042634f11d2dmr2959645edb.335.1652521745488; 
 Sat, 14 May 2022 02:49:05 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 en8-20020a17090728c800b006f3ef214e0bsm1586605ejc.113.2022.05.14.02.49.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 May 2022 02:49:05 -0700 (PDT)
Message-ID: <45b465f4-6f74-2efc-18e8-b6328c818291@mind.be>
Date: Sat, 14 May 2022 11:49:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220512203435.1735055-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220512203435.1735055-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/nut: fix typo in comment
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/05/2022 22:34, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/nut/nut.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/nut/nut.mk b/package/nut/nut.mk
> index abb6433559..98891225a4 100644
> --- a/package/nut/nut.mk
> +++ b/package/nut/nut.mk
> @@ -62,7 +62,7 @@ else
>   NUT_CONF_OPTS += --without-cgi
>   endif
>   
> -# nut-scanner needs libltdl, which is a wrapper arounf dlopen/dlsym,
> +# nut-scanner needs libltdl, which is a wrapper around dlopen/dlsym,
>   # so is not available for static-only builds.
>   # There is no flag to directly enable/disable nut-scanner, it's done
>   # via the --enable/disable-libltdl flag.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
