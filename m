Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38C7C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 14:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B6998401F;
	Sun, 10 Apr 2022 14:47:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NjpNcrbLbsUy; Sun, 10 Apr 2022 14:47:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 930FD8400F;
	Sun, 10 Apr 2022 14:47:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9CF1C1BF3B5
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A71460C01
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:47:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Upqtc_eiUIUL for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 14:46:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E87660BD6
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 14:46:59 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id l7so20632776ejn.2
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 07:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Dt0kwbSWvedFGkU2WqMyqibahczprZkp96h2Q36f5WA=;
 b=BQOvTKH8hkd9RD7Rn0PWDOUzCXG+x0BJCcbPfr1ONtRmw66cEL+jQaSIJX+3CeQMtU
 ZIAIfGxZ2glQsWnb1pZvJ3HIiAWMUe0fO09Rw96gI7eVbR5ojewFZwxNXTPm0j3ttTjC
 jkxYY/YpkGM88koyh6wTXMrQSO/+h8b2ykMKvcLXxIONKAqW1K8g26kzavY4xTdnFCbK
 E/e9V01KHRurus6jy0ek6kHhKfBDkpVbwtaBt332Tdsf+e38KoSxB8oLpzue7yyDxKBi
 6W76+L1P2oaTlRPYnm0uRtWCsDjEvqWLaPSpYmVU3oYwBMdBfgNP0PRnG6txMrNkEPdw
 cleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Dt0kwbSWvedFGkU2WqMyqibahczprZkp96h2Q36f5WA=;
 b=SQLKF2KrQPdNJOaNNPiZ2jb6xRgzqq6PxtdY0hWLlzrUUT5GbsV8mM4dgRkwM6YTfM
 170Mm8CWR0sVQz0PSKVTxFTw9ukeekrv6yiEmnM4bWd0cFeJG9nogRYNcsZGcwCF+pvt
 1vPLcZ2ULQ8P8dcddoGKsvmjhfsO/Rdcbl355yhzQpFI4wHWKnyqwIlQwrSloCOXw0xt
 o930gzyCeBH+4O+r/3VuELfgWAbezi3WR0gcZCQr7DKnejNA+xx1QJdcdSfmiaaBs0to
 wexv3W4lwIKcohrDre8Th7jSiN3uRLN9cSYZNdWR4C8q2Ntpv2dR/HjJKa/IXhAZAj1+
 hUMQ==
X-Gm-Message-State: AOAM530fhb4puWAvCMnCqerxi3Tob8d5iWvqBz2bSR8YA8GStJcGw3lp
 lXl92rjSBVzlQBIm/IG4qgCkzg==
X-Google-Smtp-Source: ABdhPJzEUac7wBXVFosnns0wuo31xDbBCezf8OfTJn6sUUUaNbWLpcgOM6DBsMbyqsP83crKRcgnDA==
X-Received: by 2002:a17:907:7252:b0:6df:75cc:615e with SMTP id
 ds18-20020a170907725200b006df75cc615emr26905413ejc.683.1649602017704; 
 Sun, 10 Apr 2022 07:46:57 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a170906284500b006cc551d6cabsm10951081ejc.63.2022.04.10.07.46.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Apr 2022 07:46:57 -0700 (PDT)
Message-ID: <31c48db8-f8b2-23fb-f3a0-ce67e4e5243d@mind.be>
Date: Sun, 10 Apr 2022 16:46:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220404211941.721192-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220404211941.721192-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libest: fix build with libressl
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
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/04/2022 23:19, Fabrice Fontaine wrote:
> Fix the following build failure with libressl raised since the addition
> of the package in commit f6f0e1e58168dfa9194db2e073efd20a98c15728:
> 
> In file included from est.c:28:
> est.h:27:10: fatal error: openssl/srp.h: No such file or directory
>     27 | #include <openssl/srp.h>
>        |          ^~~~~~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/0dd755effbdddfa1b578fec9f1b1c9366b6822bc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libest/Config.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/libest/Config.in b/package/libest/Config.in
> index d8271ad69e..6abe9d2848 100644
> --- a/package/libest/Config.in
> +++ b/package/libest/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBEST
>   	depends on !BR2_STATIC_LIBS # libexecinfo or glibc
>   	select BR2_PACKAGE_LIBEXECINFO if !BR2_TOOLCHAIN_USES_GLIBC
>   	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
>   	help
>   	  libest is a C implementation of RFC 7030 (Enrollment over
>   	  Secure Transport).
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
