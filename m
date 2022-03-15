Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F65BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16417841A7;
	Tue, 15 Mar 2022 21:49:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0BV8txDYK5Rv; Tue, 15 Mar 2022 21:49:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FE6381C2F;
	Tue, 15 Mar 2022 21:48:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E02021BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCC9E81C2F
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:48:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vy7YmKpyXNI8 for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:48:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF52F81970
 for <buildroot@busybox.net>; Tue, 15 Mar 2022 21:48:53 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id yy13so450425ejb.2
 for <buildroot@busybox.net>; Tue, 15 Mar 2022 14:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=JlW6c9k3hOCE8Vm2aT4dBCRR7leh8z3ip7BVtG6pVeY=;
 b=UJudNRbsBk+duDd/FT+DsyJqGbvU+yGyMDy9kaF+m29uyQLbd8VE66CSl1YB5BKFEZ
 JEmWjJWeYhH+ENtdba2ik5Dx09Yi8hsTaRvSN2Qs+ifk4CLtBTcLcuetPEI0/fmIuCRl
 gG6bMxPYa7KonZcLjbGQ2BLePFdwsQpWK9sy1oPBjdEcqQ//LB/zY4vAHKrB0cNtPxIR
 kxXFhrvkptItuCB8DVQga3Fd/dP9n1BRSxRaBRdHSsc/oZY1PMHDGDLURVXwP2ld0KhN
 n/WFpRKlakYjp4iRmqbmsIXpBn3sDWzpaXojhvNLvvwTqDX9BJyek699F3QozI4QArFG
 GWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JlW6c9k3hOCE8Vm2aT4dBCRR7leh8z3ip7BVtG6pVeY=;
 b=tuzF14RDdVf+trImeBFgYh1ua6GRLu0Kia/ATxfHdbrPRRDq2tUEHV1TKOngw02fK1
 5Fh7uPXAaT2T6bOfgTXB7K0B7bJf1aa49QRsP99UiglymNZdAvIbTJetIWJh9NixsNiI
 WrMWUbDCyoXmQxZ2ShDlbgIyl00EE0pJXqgzzZzB0KxoToK/Grb97uEYNxZkBv4gVtsa
 QjAiIOte3N4mdgfwJwhj3yDqdENHkIoUzmABEQVx43L9NDUg2G30PcZgiZlSIhRGINuw
 a4zPkC5RdW0/5pFVb5ymxnOcaTR+Bsa765nS7CnzCiFO/LY/7/cYGGjU9xDFmynBh4ML
 QYAQ==
X-Gm-Message-State: AOAM531ZzN4ZZ5bpooKzg7giAcfGT965Wb+mI0pPcFPsg8nnUzySIi88
 LFs4BEPJ/pY5rGezuc53srRciw==
X-Google-Smtp-Source: ABdhPJw8Nec/ipVXiPTfVErAXD3E0wz/FfRbAQcgH2rqQKFLj7mlv4XxhH1YVGROMaKQvRjn4s+ENw==
X-Received: by 2002:a17:906:aed4:b0:6da:aa56:c923 with SMTP id
 me20-20020a170906aed400b006daaa56c923mr23708523ejb.148.1647380931783; 
 Tue, 15 Mar 2022 14:48:51 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 mp33-20020a1709071b2100b006db6dea7f9dsm82006ejc.168.2022.03.15.14.48.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 14:48:51 -0700 (PDT)
Message-ID: <73df06d6-44e7-09fb-06ae-6dc5089d338b@mind.be>
Date: Tue, 15 Mar 2022 22:48:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220310114047.919725-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220310114047.919725-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/libgcrypt: bump to version 1.10.0
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



On 10/03/2022 12:40, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../0001-configure.ac-add-an-option-to-disable-tests.patch  | 2 +-
>   package/libgcrypt/libgcrypt.hash                            | 6 ++----
>   package/libgcrypt/libgcrypt.mk                              | 2 +-
>   3 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch b/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch
> index 4ef02fba6..e32f93863 100644
> --- a/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch
> +++ b/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch
> @@ -44,7 +44,7 @@ diff --git a/configure.ac b/configure.ac
>   index e8c8cd39..1a6b61e5 100644
>   --- a/configure.ac
>   +++ b/configure.ac
> -@@ -3198,6 +3198,16 @@ AC_ARG_ENABLE([doc], AC_HELP_STRING([--disable-doc],
> +@@ -3230,6 +3230,16 @@ AC_ARG_ENABLE([doc], AC_HELP_STRING([--disable-doc],
>    AM_CONDITIONAL([BUILD_DOC], [test "x$build_doc" != xno])
>    
>    
> diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
> index 23562d0ed..2ea4d74c2 100644
> --- a/package/libgcrypt/libgcrypt.hash
> +++ b/package/libgcrypt/libgcrypt.hash
> @@ -1,7 +1,5 @@
> -# From https://www.gnupg.org/download/integrity_check.html
> -sha1  1bccc8393482fa1953323ff429c6b5ba5676eb1a  libgcrypt-1.9.4.tar.bz2
>   # Locally calculated after checking signature
> -# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.9.4.tar.bz2.sig
> +# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.10.0.tar.bz2.sig
>   # using key 6DAA6E64A76D2840571B4902528897B826403ADA
> -sha256  ea849c83a72454e3ed4267697e8ca03390aee972ab421e7df69dfe42b65caaf7  libgcrypt-1.9.4.tar.bz2
> +sha256  6a00f5c05caa4c4acc120c46b63857da0d4ff61dc4b4b03933fa8d46013fae81  libgcrypt-1.10.0.tar.bz2
>   sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LIB
> diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
> index e5fdfcfc8..c6c88f607 100644
> --- a/package/libgcrypt/libgcrypt.mk
> +++ b/package/libgcrypt/libgcrypt.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBGCRYPT_VERSION = 1.9.4
> +LIBGCRYPT_VERSION = 1.10.0
>   LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
>   LIBGCRYPT_LICENSE = LGPL-2.1+
>   LIBGCRYPT_LICENSE_FILES = COPYING.LIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
