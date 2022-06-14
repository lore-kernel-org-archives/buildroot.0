Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2ADC433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 16:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 815F283332;
	Tue, 14 Jun 2022 16:55:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J0YWIiX2H91W; Tue, 14 Jun 2022 16:55:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A562A83312;
	Tue, 14 Jun 2022 16:55:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0EA121BF37A
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F29268330B
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:55:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kx7-JIrIz00K for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 16:55:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09D5F832B3
 for <buildroot@busybox.net>; Tue, 14 Jun 2022 16:55:12 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id n28so12498719edb.9
 for <buildroot@busybox.net>; Tue, 14 Jun 2022 09:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=aVKFp30fk0MafaBefYOb+2QU1YVj8kPQBLJVQA5RrnA=;
 b=TBxAqkWn9t26NZt7Akpg9asOCkZElcpuncgIY7Yej2Vn8sWYZ60TLwgApgLjWJO9KF
 yjn0Jcgq4NfxiyX4OMgJIcMnA9QBQh0H3GxoHX6cP0knqNYWFUo+5KVKarjjD9dpHfv9
 ISycAWjH1AHs5ADfVOZtH6qiB1PtlAvQFDTOJjEzzyxAeXB2O/9Exz6Lp1MxgKJrWF8J
 Gwp/9Z2pDCT1/75zzZjYf+1LKMFvZK0O89Ph94zUn1JijX60MmY2k+BN3aaHZnUwtwJD
 iT/6BZ3oxytyBlrxm7H9ksXn0gzfNt7Pm8mr/8Ur1uf2ziHst0RDK0f+qaV6dd3CYCww
 cYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=aVKFp30fk0MafaBefYOb+2QU1YVj8kPQBLJVQA5RrnA=;
 b=U/Ty83gu2oolObOuH/LopOpc9FPC7rCy08D8dGXlP0kCYZgRn6oYAN3P+bbuQ0WxK1
 l7mjEKRuwgkFbzVsqW76QWjs6nhY+v4m+kUtgYt4DYzdsuXQuppBOz2v/5T9IDmW6s1i
 RSD2IrO4BLKnlSEs42CKLBw7DD0xxlf80NMAc+xzVxrWF/nrrBNdnW3/6jWC5QVVy+OF
 MUp0SuGILrg6iKfYq074JTShMmReb9fleKwCFmJWOAUL4yR1bWT5grJxcctAzxiSmARP
 3Yhwmk5xlT7cfWLjs81+GkfS3AVacvmwuuJyvauv3KKFqHmn5xTDiPcnWeieCDvt36sC
 ktyA==
X-Gm-Message-State: AJIora8dCAZnVUTfAYDchA1DD6qe5GXy2zaURPb78IbchTsbPJmCOdtE
 8tu5N04L5Z1xK/tFY7wLoTNeUA==
X-Google-Smtp-Source: AGRyM1vWmbpDQ7k8VuIXqjNk4aOhU8mTpzT3CTXSz51P1Rxx3aJ+LA8eVQ7xF+xVSPeEsceYaL96cw==
X-Received: by 2002:a05:6402:2553:b0:431:6e08:56de with SMTP id
 l19-20020a056402255300b004316e0856demr7294512edb.406.1655225711291; 
 Tue, 14 Jun 2022 09:55:11 -0700 (PDT)
Received: from [10.1.0.138] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 q4-20020a50aa84000000b0042617ba638esm7430337edc.24.2022.06.14.09.55.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 09:55:10 -0700 (PDT)
Message-ID: <6cf3d23a-d030-7a29-6bb0-98ce094e119b@mind.be>
Date: Tue, 14 Jun 2022 17:57:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220610165541.2574405-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220610165541.2574405-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/gnutls: bump to version 3.7.6
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



On 10/06/2022 18:55, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/gnutls/gnutls.hash | 4 ++--
>   package/gnutls/gnutls.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
> index c09e4665e..ff191278c 100644
> --- a/package/gnutls/gnutls.hash
> +++ b/package/gnutls/gnutls.hash
> @@ -1,6 +1,6 @@
>   # Locally calculated after checking pgp signature
> -# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.4.tar.xz.sig
> -sha256  e6adbebcfbc95867de01060d93c789938cf89cc1d1f6ef9ef661890f6217451f  gnutls-3.7.4.tar.xz
> +# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.6.tar.xz.sig
> +sha256  77065719a345bfb18faa250134be4c53bef70c1bd61f6c0c23ceb8b44f0262ff  gnutls-3.7.6.tar.xz
>   # Locally calculated
>   sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  doc/COPYING
>   sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  doc/COPYING.LESSER
> diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
> index f7f3e046e..f1af1e7b3 100644
> --- a/package/gnutls/gnutls.mk
> +++ b/package/gnutls/gnutls.mk
> @@ -6,7 +6,7 @@
>   
>   # When bumping, make sure *all* --without-libfoo-prefix options are in GNUTLS_CONF_OPTS
>   GNUTLS_VERSION_MAJOR = 3.7
> -GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).4
> +GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).6
>   GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
>   GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
>   GNUTLS_LICENSE = LGPL-2.1+ (core library)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
