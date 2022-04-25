Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4053CC433FE
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 21:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB58582C7C;
	Mon, 25 Apr 2022 21:38:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NXoK3KzHOqEt; Mon, 25 Apr 2022 21:38:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F241A82C89;
	Mon, 25 Apr 2022 21:38:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 253951BF3A6
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 21:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1362582C04
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 21:38:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TVkxarqa9T7r for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 21:38:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48FD682B2F
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 21:38:06 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id y3so11825652ejo.12
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 14:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wCGsG+cnKh+TThe6B+xjvvPqr//kH2pxJtXeeH78EOY=;
 b=NXY9OOkM2yKBXy/zYo0Gc/ZXvTIO3Tj8EmYqNOfpNMIzDkn2qeI/BYrbsYs9TcEGcc
 CBuR8pCtnmlC6a3N3UDEJpkPaY5nF7bAWlBbEBAJvSCWZ1u97EjPOuTWEc5VIZd2hUns
 c4wV3XwTHRZuc9wQCXi1AjYdqRfDYxyK4IirTc7ipovulKjoaG/buJv55GNePI+QmVkB
 16Vergk7mwPEdjDQ6AIMgOTaXkXA6wvUHHML6a2zKBbQzl82QojbjXMy8BiorEJvYgCy
 D+DC4J5+02bVn1PJV93+amHK416QPjOuAYFSCEX4S2tvZgyL9IZDNvwYRZjvB+SCL2PA
 2fSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wCGsG+cnKh+TThe6B+xjvvPqr//kH2pxJtXeeH78EOY=;
 b=ebf4j/z2DUqCOMkJSmCBxl56psJ6j0fll5OcQC7zDjijQd49pwD1JnGSau12B8qzg5
 Aa3QNsclnl9NwZjmjjK6G6fE8HwnqEQtF9+ncHdlPLDPHlxEPlw1y7c/crxBU8Gk8ymQ
 Ug+otCot34KyIQInMbDg0a9z0R3IeW6AJEkvz9pxSri35C5JwdNdSCTpzL2UbVOb7Ufs
 qUmZZMPZFGsCLEry2GlL4ubL9P1pssTQSndchwfFxNbVonA5Z0e/iRuZpYqHQT/0yYDs
 FmUvO3E4y4d5y2Nhut569himK3fp+UidUyqs673sFNLXoz9B/Pq3MC8pDdp0g+8Z6i/F
 ABFA==
X-Gm-Message-State: AOAM530kZAEiOVAm2N02fvtz4UaswqLB1z6TY4keYj/V2VD+nHx/3zf/
 a7dIcEKb4zGoBK/RpJ2ANpEi+w==
X-Google-Smtp-Source: ABdhPJwlMXuvW2bG4BrobUOD3LaqmRA8jKVxx21FQN3ZEOWiM3aVXwsFRfV5ibZQLUjEF9pmdZv7IA==
X-Received: by 2002:a17:907:9803:b0:6db:ab21:738e with SMTP id
 ji3-20020a170907980300b006dbab21738emr17984589ejc.112.1650922684571; 
 Mon, 25 Apr 2022 14:38:04 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 lf5-20020a170907174500b006f3806fc9cdsm2488796ejc.39.2022.04.25.14.38.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 14:38:04 -0700 (PDT)
Message-ID: <07ebcbc5-8bd4-b209-4dfb-971c0917a380@mind.be>
Date: Mon, 25 Apr 2022 23:38:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220424213958.1747120-1-james.hilliard1@gmail.com>
 <20220424213958.1747120-5-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220424213958.1747120-5-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH v7 5/5] package/python-pyparsing: bump to
 version 3.0.8
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/04/2022 23:39, James Hilliard wrote:
> This package now requires flit and must use the flit-bootstrap setup
> type for the host build since it is a dependency of
> host-python-pypa-build.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v6 -> v7:
>    - only use flit-boostrap for host-python-pyparsing
> ---
>   package/python-pyparsing/python-pyparsing.hash | 4 ++--
>   package/python-pyparsing/python-pyparsing.mk   | 7 ++++---
>   2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-pyparsing/python-pyparsing.hash b/package/python-pyparsing/python-pyparsing.hash
> index 1e56e878a1..e7137d55c9 100644
> --- a/package/python-pyparsing/python-pyparsing.hash
> +++ b/package/python-pyparsing/python-pyparsing.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/pyparsing/json
> -md5  9d38774991175444e21a3dfa865876cc  pyparsing-3.0.7.tar.gz
> -sha256  18ee9022775d270c55187733956460083db60b37d0d0fb357445f3094eed3eea  pyparsing-3.0.7.tar.gz
> +md5  971252e99e1e02a4c27f001894e0422d  pyparsing-3.0.8.tar.gz
> +sha256  7bf433498c016c4314268d95df76c81b842a4cb2b276fa3312cfb1e1d85f6954  pyparsing-3.0.8.tar.gz
>   # Locally computed sha256 checksums
>   sha256  10d5120a16805804ffda8b688c220bfb4e8f39741b57320604d455a309e01972  LICENSE
> diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
> index 2fb705bc7a..7e458042f5 100644
> --- a/package/python-pyparsing/python-pyparsing.mk
> +++ b/package/python-pyparsing/python-pyparsing.mk
> @@ -4,12 +4,13 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYPARSING_VERSION = 3.0.7
> +PYTHON_PYPARSING_VERSION = 3.0.8
>   PYTHON_PYPARSING_SOURCE = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
> -PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/d6/60/9bed18f43275b34198eb9720d4c1238c68b3755620d20df0afd89424d32b
> +PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/31/df/789bd0556e65cf931a5b87b603fcf02f79ff04d5379f3063588faaf9c1e4
>   PYTHON_PYPARSING_LICENSE = MIT
>   PYTHON_PYPARSING_LICENSE_FILES = LICENSE
> -PYTHON_PYPARSING_SETUP_TYPE = setuptools
> +PYTHON_PYPARSING_SETUP_TYPE = flit
> +HOST_PYTHON_PYPARSING_SETUP_TYPE = flit-bootstrap
>   
>   $(eval $(python-package))
>   $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
