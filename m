Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B2CC02196
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 21:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E89D7831D5;
	Wed,  5 Feb 2025 21:13:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Az2BMOwzh574; Wed,  5 Feb 2025 21:13:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 420E483231
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 420E483231;
	Wed,  5 Feb 2025 21:13:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A7AFE12A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 21:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97B29831D5
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 21:13:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1N5d1h6uGI02 for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 21:13:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 738CC831F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 738CC831F5
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 738CC831F5
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 21:13:39 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43618283d48so1382405e9.1
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 13:13:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738790017; x=1739394817;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g34Hwo1CtrluMct/CLxDzCWDtkE75S6Jtb/Fq3Ey5BY=;
 b=VPobFON5Zot/bwt9ah2ZYPCR5QJTKSK91rn3Mc/cdY2xSBA+zq2kF/x2T16sW4E1m9
 vB40VB0zJGhv0CzzQn01yJjcSugTSdJWGDTIySUJbF+0O8PAjtkq3Pjzl1wblSIsfmi8
 AP00TzRHj0vg8Sw3fD7BELnEYTPbMv2/oT0rVV9Ruh2nXHhI3nE8aJcGlMZpZ8eJ3HIA
 kveR4/+jxFflTy4H5ucU2Qo3TkyLUa1zqSdLk4QT4VW/tF81wGGXz+A3p4ZwON8/X7uu
 uA7jtms9Zf1qsdVZVd266cSHW5iqr0/xdQEr/i1vQ74j5g0/4OaxUht/gTCIHyvpoeg8
 rFYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVP+e8d+/Lz95xrqrQDKiXaYeHZ4ioP/91bWDmhr74n3bsxNSTGlBLalUk+cy3DAk8pt8/CHejxa7o=@buildroot.org
X-Gm-Message-State: AOJu0YzcHWfdXqxQU4hZXhu4g3/Y+miDeuoAY7nm7aN6g/0VV6hz3NM7
 GpWyQ0Mt04IADyNDx3YVjVYMaC25JEOB73cv5q8V0PJu06w+0m3WhxGq2CAfo0E=
X-Gm-Gg: ASbGncvLGZMia9XmfLnX6L4TY+EGfEFdHOQb3lbfsiTidYV5EdhrhOgWhORcbLj/UvV
 UqJstNNjrnflaAiUcHAM/0jNANaegj442/pZESS40uy8inmBHe9V4Z/fEmV5ceRIe6FZN/mVzkw
 P1vRbGb5g5hr85ya5cOyT0+AWnRFZ72gT9nDtCutgngnt4T9keId2nf2ntFKDwCo2CyuMRBQIS/
 sPcVQ7FIFrt/1xCWGiMnkEU9VP1KhnPF7pkMUIzsL0qIO8S4pVKI1mMSAvM6muToA3BCWjy9Xd7
 OxsGbaEMi84rVlbgHW3PyEYAfmxcaI/3P/wdsqqOjJPHSalE4N5jh2VmCFO5yfmeY+ZllohsgWT
 vbrr4IJmkN5bM438sBLnPS/+kNfqankiN/1IGUSeHA0T/iw==
X-Google-Smtp-Source: AGHT+IFaR59ar+FVtt6OJvj0pKL4SX2ewzQVroWBcN1xsHFyFdGegZaJmtIH0vpI9h3pSDNyU94FpA==
X-Received: by 2002:a05:600c:1c29:b0:434:a4b3:5ebe with SMTP id
 5b1f17b1804b1-4390d55fcdbmr33716975e9.24.1738790017189; 
 Wed, 05 Feb 2025 13:13:37 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391400b9f4sm638105e9.31.2025.02.05.13.13.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 13:13:36 -0800 (PST)
Message-ID: <a459225c-d626-4d1b-8b5b-681e7d5faeda@mind.be>
Date: Wed, 5 Feb 2025 22:13:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20250205154301.3302035-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20250205154301.3302035-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738790017; x=1739394817; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=g34Hwo1CtrluMct/CLxDzCWDtkE75S6Jtb/Fq3Ey5BY=;
 b=EzCn/Ce18vWOhMxGrCAqEqoleQETEPaH9vOiIvqD1TUXDijoAI8edDwsKMmaRDDO6k
 h2MebAexcNfDJIfKzP6fl/4dyxKW22frSlb0Boyph9esTrUpb2BXhzlWEgxzmuNRnsDV
 e5ZGEdxgDibPJ2JDEqPr6BCGOWqKbRgSTtyOGf/W8hvkiV/5ux5v0ybjCB7KkQXS4sJe
 lckHKhEcMj2w8XIqdpnsecaMM6zITK+yiGptN2zcejwcXtjC3EMkU0I8uoljCFvUCpwm
 TCWdWPHIikEAC+JxBw898xg6zMLXq4FR95Znj5kVJy+EJV+wf+lmj1SfWbjAxug9swdu
 cUFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EzCn/Ce1
Subject: Re: [Buildroot] [PATCH 1/1] package/{python-}protobuf: bump to
 version 29.3
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/02/2025 16:43, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  It fixes the build of riemann-c-client and postgis. ola is still broken as I 
mentioned elsewhere. criu is also still broken but I don't think it's related to 
protobuf:

AttributeError: module 'pycriu' has no attribute '__version__'


  Regards,
  Arnout

> ---
>   package/protobuf/protobuf.hash               | 2 +-
>   package/protobuf/protobuf.mk                 | 2 +-
>   package/python-protobuf/python-protobuf.hash | 4 ++--
>   package/python-protobuf/python-protobuf.mk   | 2 +-
>   4 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
> index 06f4924394..98159ad897 100644
> --- a/package/protobuf/protobuf.hash
> +++ b/package/protobuf/protobuf.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
>   sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
> -sha256  3b8bf6e96499a744bd014c60b58f797715a758093abf859f1d902194b8e1f8c9  protobuf-28.1.tar.gz
> +sha256  008a11cc56f9b96679b4c285fd05f46d317d685be3ab524b2a310be0fbad987e  protobuf-29.3.tar.gz
> diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
> index ffed3166c7..4540443702 100644
> --- a/package/protobuf/protobuf.mk
> +++ b/package/protobuf/protobuf.mk
> @@ -7,7 +7,7 @@
>   # When bumping this package, make sure to also verify if the
>   # python-protobuf package still works and to update its hash,
>   # as they share the same version/site variables.
> -PROTOBUF_VERSION = 28.1
> +PROTOBUF_VERSION = 29.3
>   PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
>   PROTOBUF_LICENSE = BSD-3-Clause
>   PROTOBUF_LICENSE_FILES = LICENSE
> diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
> index 8ce6039449..1e1833980c 100644
> --- a/package/python-protobuf/python-protobuf.hash
> +++ b/package/python-protobuf/python-protobuf.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/protobuf/json
> -md5  44b076f3564d3561067bcc2c455e008a  protobuf-5.28.1.tar.gz
> -sha256  42597e938f83bb7f3e4b35f03aa45208d49ae8d5bcb4bc10b9fc825e0ab5e423  protobuf-5.28.1.tar.gz
> +md5  26ee22a630b0dbfce4de03adc5600fbc  protobuf-5.29.3.tar.gz
> +sha256  5da0f41edaf117bde316404bad1a486cb4ededf8e4a54891296f648e8e076620  protobuf-5.29.3.tar.gz
>   # Locally computed sha256 checksums
>   sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
> diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
> index 02bf2a1d70..898a133d37 100644
> --- a/package/python-protobuf/python-protobuf.mk
> +++ b/package/python-protobuf/python-protobuf.mk
> @@ -6,7 +6,7 @@
>   
>   PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
>   PYTHON_PROTOBUF_SOURCE = protobuf-5.$(PYTHON_PROTOBUF_VERSION).tar.gz
> -PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/3c/0b/7a997c8939f698d72bdea14d57116e43d3051fffb3b2964c30938c4a08e6
> +PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/f7/d1/e0a911544ca9993e0f17ce6d3cc0932752356c1b0a834397f28e63479344
>   PYTHON_PROTOBUF_LICENSE = BSD-3-Clause
>   PYTHON_PROTOBUF_LICENSE_FILES = LICENSE
>   PYTHON_PROTOBUF_DEPENDENCIES = host-protobuf

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
