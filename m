Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E895FC48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91FD3417A2;
	Mon,  5 Feb 2024 10:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91FD3417A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Dq9U0JFO1j8; Mon,  5 Feb 2024 10:25:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C859341798;
	Mon,  5 Feb 2024 10:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C859341798
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D1CA51BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4B7340A7F
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:25:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4B7340A7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q1vFHLGwr0Hp for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:25:46 +0000 (UTC)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B07E40168
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:25:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B07E40168
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d0aabed735so10382341fa.0
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 02:25:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707128744; x=1707733544;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JmT8PJ5Jhrlzq0q9BrS/eGsSP6m0BIQfzBKomwkzVmI=;
 b=ARgyVcdOkNrOUL+fzjK6EHESbidlAKfbOCfmOQ6fJoIl8yWGK+uMlDsNbt78DhS1a0
 7PZJN7a/wLwTPX8jBJa8rOPnyYl0fZrq2RAcWJ/j4J4/xGBdJcW7wBbsmBJtpDeqvpIX
 gF/dNF8f3/SW0Sd5GwwLakXLBDPpygTwEIzdRxUZkDy5igAyWPFdlt0EBfqDL4YjHS1q
 9NySEBLF25x0TsPjDNMet+hzgP971HO3UF0DCE8ZPeC9FScgZCm55G0ZfFlE4cKMRdOT
 QteYIABRFUPXkqWDj71I7WhybYLJYIhemsB1AKnuW93t8/qNQ5n0tKhxrVeKOvGzYK+7
 UnYA==
X-Gm-Message-State: AOJu0Ywm/ExiXIXjpCEqW/Qk0aXS3aJFzoTMb7ePMI6Rfx8d+FZ5ESYD
 O2veQBEX80AJkXkRHMPMDdv8RK++Es3Uly3gBgGCa1wIgTJ24VrbIV3mOTs5mz4=
X-Google-Smtp-Source: AGHT+IGU2+qGykd7UULvSHhFf9XDucj+8dYEJRV0or3q8PCMMxXNpRbHHJLNT8bOjg+mWZV3680FJw==
X-Received: by 2002:a05:6512:280e:b0:511:3ed7:ca7c with SMTP id
 cf14-20020a056512280e00b005113ed7ca7cmr5419440lfb.65.1707128743719; 
 Mon, 05 Feb 2024 02:25:43 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCX+Bz0fXa4VRWqQ5eoG3aJNJRoLmw23ISM5nAQ9tHz2GhymDzLL/R4gwulaaMYIdrdc0bRtoeBhx3x5DvvbvGf7snC5cMPdDw==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a05600c19c800b0040fb0c90da6sm8099964wmq.14.2024.02.05.02.25.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 02:25:43 -0800 (PST)
Message-ID: <7636c39e-89a7-43a9-a758-c08c11d04735@mind.be>
Date: Mon, 5 Feb 2024 11:16:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240111021434.2655120-1-james.hilliard1@gmail.com>
In-Reply-To: <20240111021434.2655120-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707128744; x=1707733544; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JmT8PJ5Jhrlzq0q9BrS/eGsSP6m0BIQfzBKomwkzVmI=;
 b=Z6Gb+NBNYnLL74YO6eryP24X+bWddv0z6Gx7iALzE1o1zfpQc1cWY5PZE5VdnEvAaU
 IPJPX5Olij64yI6amABmCjGHl6uoUGLmod9pWEqY0xsLvgU7Be6E7viUgV7V4KhQ5S/x
 oMT+VDLU1Eptl2btoNoYEZf5qfxzCsvabQadURG2hXTg3oxlMaPqaf19XZ/LyGifgidD
 7KzwPSaWDaM0zbW0FQ60yGTaRCmvgvvfVjMIDFNuJGVeL4wo3x1RZ4VGn7zD0EWp/FXx
 ZzlRKmArALkddUDpsbPq8HNrk6+PrBT5L9DMUCWtTR1d25Tz+Dh5fLhOpqpz0xeiRHZn
 m2bQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Z6Gb+NBN
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyrsistent: bump to
 version 0.20.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/01/2024 03:14, James Hilliard wrote:
> License hash changed due to year update:
> https://github.com/tobgu/pyrsistent/commit/acdffe6967a821165155ac16bee48054fd61385a
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pyrsistent/python-pyrsistent.hash | 6 +++---
>   package/python-pyrsistent/python-pyrsistent.mk   | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-pyrsistent/python-pyrsistent.hash b/package/python-pyrsistent/python-pyrsistent.hash
> index d5c9a22656..780a7f09d9 100644
> --- a/package/python-pyrsistent/python-pyrsistent.hash
> +++ b/package/python-pyrsistent/python-pyrsistent.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/pyrsistent/json
> -md5  761266eab1f9dc9280cdb0a6d2dedb08  pyrsistent-0.19.3.tar.gz
> -sha256  1a2994773706bbb4995c31a97bc94f1418314923bd1048c6d964837040376440  pyrsistent-0.19.3.tar.gz
> +md5  dce0f9a13668dbf8bb76f74954b4a42a  pyrsistent-0.20.0.tar.gz
> +sha256  4c48f78f62ab596c679086084d0dd13254ae4f3d6c72a83ffdf5ebdef8f265a4  pyrsistent-0.20.0.tar.gz
>   # Locally computed sha256 checksums
> -sha256  3ea56753cbd0cc897d3f4414a902f5694991db7c1b3abb8230216381185f9112  LICENSE.mit
> +sha256  3fd3d3d1ab9c733ee453fbf3bbbaa845440d0d8c20d7b5a039d2e46a2ed7fc01  LICENSE.mit
> diff --git a/package/python-pyrsistent/python-pyrsistent.mk b/package/python-pyrsistent/python-pyrsistent.mk
> index f3457feebe..6c52d7dbc8 100644
> --- a/package/python-pyrsistent/python-pyrsistent.mk
> +++ b/package/python-pyrsistent/python-pyrsistent.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYRSISTENT_VERSION = 0.19.3
> +PYTHON_PYRSISTENT_VERSION = 0.20.0
>   PYTHON_PYRSISTENT_SOURCE = pyrsistent-$(PYTHON_PYRSISTENT_VERSION).tar.gz
> -PYTHON_PYRSISTENT_SITE = https://files.pythonhosted.org/packages/bf/90/445a7dbd275c654c268f47fa9452152709134f61f09605cf776407055a89
> +PYTHON_PYRSISTENT_SITE = https://files.pythonhosted.org/packages/ce/3a/5031723c09068e9c8c2f0bc25c3a9245f2b1d1aea8396c787a408f2b95ca
>   PYTHON_PYRSISTENT_SETUP_TYPE = setuptools
>   PYTHON_PYRSISTENT_LICENSE = MIT
>   PYTHON_PYRSISTENT_LICENSE_FILES = LICENSE.mit
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
