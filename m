Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9DCC48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 13:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 348F660F2B;
	Mon,  5 Feb 2024 13:20:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 348F660F2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MPHh7WDjKycR; Mon,  5 Feb 2024 13:20:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A57060E50;
	Mon,  5 Feb 2024 13:20:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A57060E50
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B9F11BF40D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03952405C5
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:20:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03952405C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ovkgIGSfiRzS for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 13:20:37 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B82BD409C4
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 13:20:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B82BD409C4
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40fdc653665so6137765e9.3
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 05:20:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707139235; x=1707744035;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dGHGXXUWTSF/DZKvlW7QhXnCKVp/qPkr8VFrrtcXAks=;
 b=fV+ydAyXxeNlU7cJBEyLolknqXuG21yiT6NLM+EGhHJYVQ5vq6REf7rALxt7txRWox
 tYLlwMLWSvRoWMxSP9HyiHPhpUFwY/XGnxhTK9PVDqmethVgx7HtSqs0bFaCXNTVALVU
 w5F5QqcMLhoiJPzyKZlVprbG1pC8p3fXEVNGcy+VFYNwwe0YovCR7usGDo7G9Dqwp7nO
 j3vxE5217BtzlDUxKp8VsXXX4MJc1O45o8b7m9qLplpqEnJO0i5Of4S0Wisz5Knp+RqL
 31T1JKF1sbluC8IDjkXG0FbEhndQgzSl+yi6fYyDOXcS8QaERqA+8D7SY+DwePN75Y2w
 qAAQ==
X-Gm-Message-State: AOJu0YwOlqUujO+2Obz7fqY542yvuAjIsGXWaWxNXKBc/yj+dzG6Jtz/
 ZVcMHClgUEfk+yZHOb8nRUUFPfzDegMIOlSkLABNjZkUTizLV0xhz553ISP2Wbs=
X-Google-Smtp-Source: AGHT+IGwMQUn3z0LyKJ6lmdhQ/8WnGOY+gkGd9rGcaSYnCts/HO3OZwpM3QmCAQmnmfRma/o3tYrgw==
X-Received: by 2002:a05:600c:3b95:b0:40e:491d:ac80 with SMTP id
 n21-20020a05600c3b9500b0040e491dac80mr4788124wms.15.1707139234853; 
 Mon, 05 Feb 2024 05:20:34 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXpRK464g+Q/Fyz5kBE0MaF0Z41hRJMwW7B74qfTEycDQS2HUIO4ULyNRCOQhbw8gBsxccm71Lr14k02jErWfrmYoW89iGTDA==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a5d4e04000000b0033b3ceda5dbsm2282272wrt.44.2024.02.05.05.20.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 05:20:34 -0800 (PST)
Message-ID: <240867fc-32ff-45ca-b975-3543ad1946d2@mind.be>
Date: Mon, 5 Feb 2024 14:20:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240108065521.3455564-1-james.hilliard1@gmail.com>
In-Reply-To: <20240108065521.3455564-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707139235; x=1707744035; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dGHGXXUWTSF/DZKvlW7QhXnCKVp/qPkr8VFrrtcXAks=;
 b=YXRYUIKF51y3mM+sgFfXfo7lfQnhLRNTRUI/7OEvX3rjUe6p+7eDCVKyVhRWnuOQf+
 WyWCXJJFxZUFbNEhZzuMAUiqkHjHlCsgWVNFEjMVumXMYukWGQAf2vyFCj28IxuRqBEA
 9/1kVpqafT+O+GTEQ5CVF6at2hp38NKr2i0h5fzkk4joaEB5aE4zMOi2pCoilcagmWoC
 dcVHF1SO47G8tLbuFmfLPvoEc7XeDKFJsY/8YFm9oJq2ngEmnI6FQFBaP6CO9fEG05Nw
 Y4BB5M/fDLVfvfYiw+onXg8i6aazMVj5MTgNh1KdKo5x9ZwAFVOCfckCt4cj2hrVjm+n
 RlBw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YXRYUIKF
Subject: Re: [Buildroot] [PATCH 1/1] package/python-argh: bump to version
 0.31.0
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



On 08/01/2024 07:55, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-argh/python-argh.hash | 8 ++++----
>   package/python-argh/python-argh.mk   | 4 ++--
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/python-argh/python-argh.hash b/package/python-argh/python-argh.hash
> index 8bfb45d1c3..bac9df42d6 100644
> --- a/package/python-argh/python-argh.hash
> +++ b/package/python-argh/python-argh.hash
> @@ -1,6 +1,6 @@
> -# md5 from https://pypi.python.org/pypi/argh/json
> -md5  7001dd9ff619cf1422ddf8bf813bd08a  argh-0.30.4.tar.gz
> -sha256  9fca8e69c4dad4f8d2a7bdfbdd80b0754462b53510a03e1b5cf2b43a87e6e960  argh-0.30.4.tar.gz
> -# Locally computed
> +# md5, sha256 from https://pypi.org/pypi/argh/json
> +md5  2659a6353589156e6aa65a99797f8913  argh-0.31.0.tar.gz
> +sha256  b93093544309ddbfe6c73dc9bfd60dbc4acecef39f3f464774b3084a1ec5d7b0  argh-0.31.0.tar.gz
> +# Locally computed sha256 checksums
>   sha256  2594f46b9b23a5fddeca090faeb270c7ceee8116675fe35082be859aa7466e89  COPYING
>   sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  COPYING.LESSER
> diff --git a/package/python-argh/python-argh.mk b/package/python-argh/python-argh.mk
> index ccb9f61d48..0da3281d49 100644
> --- a/package/python-argh/python-argh.mk
> +++ b/package/python-argh/python-argh.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_ARGH_VERSION = 0.30.4
> +PYTHON_ARGH_VERSION = 0.31.0
>   PYTHON_ARGH_SOURCE = argh-$(PYTHON_ARGH_VERSION).tar.gz
> -PYTHON_ARGH_SITE = https://files.pythonhosted.org/packages/37/3a/175f4a2c47e8c20e59cf25fe69546f76cf1196251a377b182e8f4542b4c4
> +PYTHON_ARGH_SITE = https://files.pythonhosted.org/packages/7c/3c/1b7f3fab380c96d61119178040c0183161fe0f182c4da3933bcb3284538f
>   PYTHON_ARGH_SETUP_TYPE = flit
>   PYTHON_ARGH_LICENSE = LGPL-3.0+
>   PYTHON_ARGH_LICENSE_FILES = COPYING COPYING.LESSER
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
