Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D856C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 18:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B535A40363;
	Mon,  4 Apr 2022 18:03:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a_AVm9a9zTYV; Mon,  4 Apr 2022 18:03:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 987874030A;
	Mon,  4 Apr 2022 18:03:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 70EA31BF35C
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 586476100A
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:03:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TaxqTyvYY3Ot for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 18:03:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39E3360FE2
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 18:03:13 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id qh7so11605607ejb.11
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 11:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=bIWUsurWS7hbZh1/Pwlicbf8WJY8tHGRg8EYixzr3Dg=;
 b=JXGn2UT1QgoH0FijqGEjRzkydbEvwlOM8q4TcS4/98xSX+hXYEd2bbAA0xf+XN5S2C
 jQ5uhZ4I3O0tVWvtUJ/hTF96HviOgrSyQwxfGDFYPaDPXYxMv68FQrJcSCdhGhKim9hY
 sF777FKOt0y1lxSZQQqQfskJaGyDsM2mT77HbEDKFPoySNcnXxNH0OOfSwfd1vrFZ6HX
 ysKZU15kfNrlleNBbFkRPdLO6dSKQJ2rzERKx8NTvu3oJTH/mHgytmM9876TY5ngsIDb
 lY9pYtqSZ2JpQ8A67ewiWFUcRGWKFVozpgVIYRruyA9xUAgdrD7vAQWWoCVR9NekcHWj
 AFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bIWUsurWS7hbZh1/Pwlicbf8WJY8tHGRg8EYixzr3Dg=;
 b=wBvWxxPmZl9mbyUc7tvOdAwifGGQsTGUzanfnksrhB5+CtS7wIlDZ3jLnHvCENMG+H
 tct9OHZQP/c11XEbw5/+ZaxSfz53rQptzuE6htA8K2M3+xSb0hr+KrXiIDAqVHbXgTfC
 zP65TrpT/fqDCNCN/ookK5UVF6E8mtEuGk8EvgJNKx0v+1d5TLKqXg3BVLSWOUBx6CR/
 i8DmcW46xGDbeG21Pv79gGklMhSLXqqIGGgwtk2yOZE4y5eqT4dWdvhxhkJnkWME9bkP
 mBHGf50GzyvOqKOsINQcUbLpn9vlVoi6s5EFVUCOgU9cMqNP7oGXzgk9PT2M0ptE2+Uh
 2dhQ==
X-Gm-Message-State: AOAM533nqmi7GAcZYZrPoX2FBnlIwNamWIXF7yjZMDlJjPfLXN77xNFn
 P4ma8EQgHqBLWnxEH1GQTFoMHQ==
X-Google-Smtp-Source: ABdhPJw3nV9E5mwwE5Z3o9R92z85EzbqNNpMGm3DSfumSbNCJPfCSIwvSaC2jq4ghIE43cq9drtJ3Q==
X-Received: by 2002:a17:907:6ea4:b0:6e1:260e:a232 with SMTP id
 sh36-20020a1709076ea400b006e1260ea232mr1319470ejc.15.1649095391059; 
 Mon, 04 Apr 2022 11:03:11 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a170906161900b006d43be5b95fsm4647652ejd.118.2022.04.04.11.03.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 11:03:10 -0700 (PDT)
Message-ID: <a99bc0b0-3222-2134-94b1-6ce6fad4ef40@mind.be>
Date: Mon, 4 Apr 2022 20:03:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220401204411.942428-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220401204411.942428-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libcap-ng: bump to version 0.8.3
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/04/2022 22:44, Fabrice Fontaine wrote:
> https://github.com/stevegrubb/libcap-ng/blob/v0.8.3/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libcap-ng/libcap-ng.hash | 2 +-
>   package/libcap-ng/libcap-ng.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libcap-ng/libcap-ng.hash b/package/libcap-ng/libcap-ng.hash
> index f775ae6fc9..d4590dd739 100644
> --- a/package/libcap-ng/libcap-ng.hash
> +++ b/package/libcap-ng/libcap-ng.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated
> -sha256  52c083b77c2b0d8449dee141f9c3eba76e6d4c5ad44ef05df25891126cb85ae9  libcap-ng-0.8.2.tar.gz
> +sha256  bed6f6848e22bb2f83b5f764b2aef0ed393054e803a8e3a8711cb2a39e6b492d  libcap-ng-0.8.3.tar.gz
>   sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
>   sha256  f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  COPYING.LIB
> diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
> index 4fb0cf4777..46f72c702e 100644
> --- a/package/libcap-ng/libcap-ng.mk
> +++ b/package/libcap-ng/libcap-ng.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBCAP_NG_VERSION = 0.8.2
> +LIBCAP_NG_VERSION = 0.8.3
>   LIBCAP_NG_SITE = http://people.redhat.com/sgrubb/libcap-ng
>   LIBCAP_NG_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
>   LIBCAP_NG_LICENSE_FILES = COPYING COPYING.LIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
