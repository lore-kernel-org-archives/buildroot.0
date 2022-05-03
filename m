Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E2AC433F5
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 19:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23164833A3;
	Tue,  3 May 2022 19:56:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gCA5SAUsrKIm; Tue,  3 May 2022 19:56:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38CA482B2F;
	Tue,  3 May 2022 19:56:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4B611BF963
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 19:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E118B40207
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 19:56:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zeqCwlc8JtEM for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 19:56:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9DCD400F8
 for <buildroot@buildroot.org>; Tue,  3 May 2022 19:56:14 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id i19so35368212eja.11
 for <buildroot@buildroot.org>; Tue, 03 May 2022 12:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=a6HJwuM4qMTCKX/XADa0wCibt5wYeODtmEXURqSxM2Q=;
 b=Xfi3MHRJ6gLDfmS8XBaBk2sDrp4CyOxAeCXE2KuFp76r1nfweWXWw3atfFTHCoqk21
 kps+Rre6fkeLcxAmorGWHKdt5kaIrTcmjRRXVn+FkgOczvI3w6kpmV7cfETrPpVoX68h
 2mAxOo0QrwUBOLYxmTO2potBJyFUHU7g1Ey0yh12esU33fR1c//hEK64eWF0RSgmac0z
 JGzvS7B3RBLHWsY2UDlAI+P6psQADive5t48s4IsDL/LIAxWiMq2+ZewDbUSUFYrLZR1
 UyjJzeEk4c8YyZOr/oWrLxSUhNasPMKWpG+3qmbjvAmfSj872BQB+V3rsCppe7JRx1Ne
 2CZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=a6HJwuM4qMTCKX/XADa0wCibt5wYeODtmEXURqSxM2Q=;
 b=DRRjDJjx9ewX6as4GpTFyZhHyLrX/m0MZKvdPHkvH6mSySrLqt2J2fCq5moCR1u0Qq
 9X0uRZyhFwhY4uYEOHZofskr0IQGbnH62C5quj7r5UN+UhJSVMceJe+vz26Rljg0YFu+
 iEV7bZ86QM/nj+0lMcnJBzzqIMA00Afnhv+DsP36VVSClSCL6jQ9Iwg6rGcoymaC5bIK
 yt7a6sVCjKh2MI9aGImKPqk6QrX5umkrxVUTftWytS3xMJes6rrf0LygT7rzapKBho19
 HtIXYsj+tm1O20loOg26hdmClc5E841594G3xhMesgtDvLFISXawNdq2kE3sxiJe9WH4
 lqKQ==
X-Gm-Message-State: AOAM531L47afpB6qxdERZZREPc0cCbuCdplfsOjr8aVr5EbAhvDw9GHL
 5piWtJL/3r1InpZDwJW9NHTAIA==
X-Google-Smtp-Source: ABdhPJzrBMtS83M5hO2KJwHqBs64tuqmh/OCSmJT70ekJWtbRi3C7V/kvnOFfdZDFJTeldB2SCecug==
X-Received: by 2002:a17:907:6e08:b0:6f4:a749:f483 with SMTP id
 sd8-20020a1709076e0800b006f4a749f483mr2373741ejc.225.1651607772909; 
 Tue, 03 May 2022 12:56:12 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 r20-20020aa7da14000000b0042617ba63cdsm8152033eds.87.2022.05.03.12.56.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 12:56:12 -0700 (PDT)
Message-ID: <64724d12-b398-5c89-896f-068113f0f554@mind.be>
Date: Tue, 3 May 2022 21:56:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220426012311.1738027-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220426012311.1738027-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pep517: migrate setup
 type to flit
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/04/2022 03:23, James Hilliard wrote:
> This package is moving to flit, we need to use flit-bootstrap
> since host-python-pypa-build depends on host-python-pep517.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pep517/python-pep517.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-pep517/python-pep517.mk b/package/python-pep517/python-pep517.mk
> index 99aa62d51d..45c4f8dd39 100644
> --- a/package/python-pep517/python-pep517.mk
> +++ b/package/python-pep517/python-pep517.mk
> @@ -9,7 +9,7 @@ PYTHON_PEP517_SOURCE = pep517-$(PYTHON_PEP517_VERSION).tar.gz
>   PYTHON_PEP517_SITE = https://files.pythonhosted.org/packages/0a/65/6e656d49c679136edfba25f25791f45ffe1ea4ae2ec1c59fe9c35e061cd1
>   PYTHON_PEP517_LICENSE = MIT
>   PYTHON_PEP517_LICENSE_FILES = LICENSE
> -PYTHON_PEP517_SETUP_TYPE = distutils
> +PYTHON_PEP517_SETUP_TYPE = flit-bootstrap
>   HOST_PYTHON_PEP517_DEPENDENCIES = host-python-tomli
>   
>   $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
