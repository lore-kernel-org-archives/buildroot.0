Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD4CC433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 12:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F71E4178D;
	Thu, 17 Feb 2022 12:56:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 94B2KLnm9-Ms; Thu, 17 Feb 2022 12:56:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E6CB41730;
	Thu, 17 Feb 2022 12:56:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 92CC41BF3DF
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 12:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80DD241730
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 12:56:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zkeuFsSbJoja for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 12:56:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5492141727
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 12:56:18 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id o2so9828891lfd.1
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 04:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vrabhngZWlCNEk9q4+We+sal9iIchEB9Ueo2baJKN3c=;
 b=AveuzETCeADbH2+s/r1jUGiqZfP4WypPyhwuSEXiNuzVeBvQ74G+zOc6xgqsVYyX7e
 rAEJ/j4nCqtaEFqxO3MMs7nKf4rcY61dKaKiiJ77D8KvjwnziCcRLLq268AXTh9J+umA
 4rfjKeIPhMgMWSm9+WviQG1VgBIkNylNLnJHycpj/Tz+TENHfHg8tcSB34GYZB97U0wX
 ksU/I+/Rb0v1hwaEia6YvBTDHrJfBTDYeqEy7UP00VVKH6PifIMISvq1uzUB4U+1QjYH
 9cLl+LWJXFvyqHkn2A9gcr5k7EC4b41qectgnofOHAj5wk10Y3HosUxWDDzY4GfmpsZC
 n7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vrabhngZWlCNEk9q4+We+sal9iIchEB9Ueo2baJKN3c=;
 b=33v7u/eI0Ez+npiZYvkJv4INREqz4RyS9BIki+jY7sMbHS8c60q+2EkLbkVPwT7WpW
 O0GTniEq6yfFeW7pktHIoqwQUwU+3TJwDU/zKrEg9z/OsJi+ef+8xK2rNpJwNKluxqla
 ubcmCFoCpr14+xc5LJaFyjxHsopeWuNPdaFLwcdn5LMGXRVW9Yp+FYaKkJcy7EBO88Uc
 7n7iTVA2CTpRKMS8CGEZ9c6AA23RcmtHGOcT+J2wMeSkaY0FTOVzGRFUfLrFyNhwe12t
 2m0KnXM6M4p1Q7TKj+QVgumF5R4Ae2qTnvkcYF1976MhlQ84ujabeOpVDiqYiSqOrEnd
 5DtA==
X-Gm-Message-State: AOAM530dreWqWokibyd/JGIV+ddayb/l5ZF5RIcER0r9A16y/oRvhANg
 o99CJ8c/6GChCKcMvXfho94=
X-Google-Smtp-Source: ABdhPJycgnO+fXJdmBSfbqivVZqOdmtSpQRKwdHZfLyNckQTAiCdrKGKGLssfVIWGf2UczxQo/6NXA==
X-Received: by 2002:a05:6512:1048:b0:437:73d2:2b12 with SMTP id
 c8-20020a056512104800b0043773d22b12mr2014969lfb.477.1645102576038; 
 Thu, 17 Feb 2022 04:56:16 -0800 (PST)
Received: from curiosity ([5.188.167.245])
 by smtp.gmail.com with ESMTPSA id u13sm911035lfo.148.2022.02.17.04.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 04:56:15 -0800 (PST)
Date: Thu, 17 Feb 2022 15:56:15 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Michael Nosthoff <buildroot@heine.tech>
Message-ID: <Yg5F7yEy65+nvr5p@curiosity>
References: <3f79-620e1780-1-7f8ee50@116634595>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3f79-620e1780-1-7f8ee50@116634595>
Subject: Re: [Buildroot] wpa_supplicant 2.10: ignored build options
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
Cc: hostap@lists.infradead.org, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Michael,

> Hi Sergey, all,
> 
> @Sergey: I put you on the list of recipients since you provided the version bump to buildroot.
> 
> Since hostapd 2.10 the wpa_supplicant build ignores the two options CONFIG_BUILD_WPA_CLIENT_SO and CONFIG_NO_WPA_PASSPHRASE.
> 
> This leads to the following build error in buildroot when BR2_PACKAGE_WPA_SUPPLICANT_WPA_CLIENT_SO is selected:
> 
>   /usr/bin/install: cannot stat '/buildroot/build/build/wpa_supplicant-2.10/wpa_supplicant/libwpa_client.so': No such file or directory
> 
> The Bug was probably introduced with commit [0] which reworked the .config parsing.
> The two mentioned options are now evaluated before the .config file is parsed an thus ignored.
> 
> I'm not familiar enough with the wpa_supplicant build to come up with a proper patch. But maybe someone is willing to take a look at this.
> 
> Regards,
> Michael
> 
> [0] https://w1.fi/cgit/hostap/commit/wpa_supplicant/Makefile?id=a41a29192e5d196444fc8859100762b04ff0d1c2

Thanks for heads-up ! Buildroot CI has already reported this problem:
http://autobuild.buildroot.net/results/001981339f3b895ecd9208a747a0e47d07c9583a/

I plan take a look at hostapd/wpa_s failures over the weekend.

Regards,
Sergey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
