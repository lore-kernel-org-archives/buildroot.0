Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28794C48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 13:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEBDE60FE1;
	Mon,  5 Feb 2024 13:23:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEBDE60FE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dp1v5-MvtfpK; Mon,  5 Feb 2024 13:23:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E2F860F83;
	Mon,  5 Feb 2024 13:23:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E2F860F83
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D2E7D1BF40D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8A0182664
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:23:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8A0182664
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LpqP1OUdo7Q0 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 13:23:16 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B90D88258A
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 13:23:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B90D88258A
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40fc22f372cso33858485e9.1
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 05:23:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707139393; x=1707744193;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z6pcN+RCCwBE/+305AMNXfh/ak/tNYiMzBZtyExf9YI=;
 b=TxKUYl487WXjUJTN2mma5DfuQoEyCNBiibbOuTXY42NZQ2ot+SlDkpkIBQdcszRffZ
 59L1ya6SFaz0TMAwOSuvXdTHduRkD/yGwQwh5Z/YFHOfrR68F/MTx9yKixLVoHpc0TD6
 N/jVONK/Rrd/YDU7BPC+huh/GqcDDynIy+BagO3z/sEh3hmb9gNXb6gsKjpJyR0HzEZP
 RdzrSEPUvEKhtGAgNzh/+8R+TlxQK1JJSxDOkOR+aYkb4Cyuw3kR9bRJOZPWubGZtdjW
 4ZXwRfrnUAkGLp2c69Kl2KVDMyFoCPf3Dmp3cEs/wSWsLatsWAZJwN8iDnDePX+HtPwf
 mRNg==
X-Gm-Message-State: AOJu0YxVs+PnINCkx+HN+tVF68Jvt1uJiL2T20OsLETbw0jWp7PIxiJu
 PtLxZzlljesOQwJ9t7CrRP7d1gFZu7kRwTxfibcE0M4LDaxIn/823NPEjmDoYtGN4rr/907Un6E
 G
X-Google-Smtp-Source: AGHT+IErDzV+OIaKyL89kINCkONcUQdUkJG4hrxenh/2cNJcLlVwpEPx7JiaUXrHBVTm+JcJqLk0jQ==
X-Received: by 2002:a05:600c:1390:b0:40e:c6a6:5111 with SMTP id
 u16-20020a05600c139000b0040ec6a65111mr4536795wmf.11.1707139393669; 
 Mon, 05 Feb 2024 05:23:13 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVa/VQ30/w/Hr39bHsD0/9MrepImxlOU9TNqCwqQHEfe5fG3jRKy/wVd5r1BerSh5QUQzsBpg+Mjso70roqNoZJMssSqPi8Q32jvl7xPs6oUHdgi+xg7MJBWSQ=
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a5d4e04000000b0033b3ceda5dbsm2282272wrt.44.2024.02.05.05.23.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 05:23:13 -0800 (PST)
Message-ID: <eb443061-2bf5-441f-841b-d8836f019ea5@mind.be>
Date: Mon, 5 Feb 2024 14:23:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240108070725.3469629-1-james.hilliard1@gmail.com>
In-Reply-To: <20240108070725.3469629-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707139393; x=1707744193; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z6pcN+RCCwBE/+305AMNXfh/ak/tNYiMzBZtyExf9YI=;
 b=amNFEy4wAAHszrOp/TXyBY5VFzx07b8sQvt2gX4+Q39WpkHrQYavLp71mZtlV1hmQ4
 LDt/K3E56+gZnE32Pj2tvUYDkbZmGR5UpkU22VBMFj4kl9mA/SytLURSJ2Rf4/Ns//jh
 kVdJUSGGIbPPmwGlEJo+VV0LrDNz88rm9jxSuOk6L++a3RGJmy4T/BmTcEKPG7WKUsOs
 hPfzw97KkwMRxEZDaA4gp2Wru9nD6VHr0fWtM/NxHynqqHKEW4YYeI7YF+Mvps/AiIE6
 WmHUJoiQU+QOcHnomZGW1Pq2yBfrEeKXBvHNXqAR49SIs+GIvmWGRuntdtXTi87UwtBB
 SbLw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=amNFEy4w
Subject: Re: [Buildroot] [PATCH 1/1] package/python-babel: bump to version
 2.14.0
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
Cc: Lionel Flandrin <lionel@svkt.org>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/01/2024 08:07, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-babel/python-babel.hash | 4 ++--
>   package/python-babel/python-babel.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-babel/python-babel.hash b/package/python-babel/python-babel.hash
> index dc48831c44..ab4e022564 100644
> --- a/package/python-babel/python-babel.hash
> +++ b/package/python-babel/python-babel.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/babel/json
> -md5  3162229c2daa7c32674ed26f87b63127  Babel-2.13.1.tar.gz
> -sha256  33e0952d7dd6374af8dbf6768cc4ddf3ccfefc244f9986d4074704f2fbd18900  Babel-2.13.1.tar.gz
> +md5  3bec3f4c842144c15d839bdde41a44d4  Babel-2.14.0.tar.gz
> +sha256  6919867db036398ba21eb5c7a0f6b28ab8cbc3ae7a73a44ebe34ae74a4e7d363  Babel-2.14.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  908e0ad72053ae27c1d17e3340bd14cff9bf935992ed56526d17c983ab6e7af7  LICENSE
> diff --git a/package/python-babel/python-babel.mk b/package/python-babel/python-babel.mk
> index f8d2ccd258..eb39b9aef7 100644
> --- a/package/python-babel/python-babel.mk
> +++ b/package/python-babel/python-babel.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_BABEL_VERSION = 2.13.1
> +PYTHON_BABEL_VERSION = 2.14.0
>   PYTHON_BABEL_SOURCE = Babel-$(PYTHON_BABEL_VERSION).tar.gz
> -PYTHON_BABEL_SITE = https://files.pythonhosted.org/packages/aa/6c/737d2345d86741eeb594381394016b9c74c1253b4cbe274bb1e7b5e2138e
> +PYTHON_BABEL_SITE = https://files.pythonhosted.org/packages/e2/80/cfbe44a9085d112e983282ee7ca4c00429bc4d1ce86ee5f4e60259ddff7f
>   PYTHON_BABEL_SETUP_TYPE = setuptools
>   PYTHON_BABEL_LICENSE = BSD-3-Clause
>   PYTHON_BABEL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
