Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAD8C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 13:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6982F60E50;
	Mon,  5 Feb 2024 13:23:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6982F60E50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0pQ9_MlQ0j-7; Mon,  5 Feb 2024 13:23:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A51BB61016;
	Mon,  5 Feb 2024 13:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A51BB61016
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF1B91BF40D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9819D41767
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:23:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9819D41767
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5tclzqWn6MGK for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 13:23:01 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8DD3441734
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 13:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DD3441734
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40fdf2b69b2so189535e9.1
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 05:23:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707139380; x=1707744180;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oyeyt6uj+mKNWspoAfGffwQbroUaG0z3QdFpFvlOQWE=;
 b=Hnn1TbypUkiiTtwUj9EfGjOd1mJruR686PITECLxuJYdxPTsUfzOWtSGCjJyasWLdl
 +RhtE4kIdNCO+9iWVn/Ov6YEx4DnQyAfjHU+oXc+EgruGO6vKVPPckR5YYDwGocGbu/e
 MUleUeCZO/Q8ftsiqIi57mKOCbOFxIUexVmxND2EEYPdobhxUX9k/Nsz4VGPGF14YCEo
 ly3C8lHrVkQ8ZkuhGCz7vJJ7nhlK2KRsDzo9mZkm9ChzVmypoq8XTbwS6S/1h/8sAiAP
 PA2pqvbS3I2kp7h2gJX9MgSZzoAu8pGX9Wphw2ALp1Ri7FXJ1FJRpUWkB7drzQPfX3Wz
 jZjg==
X-Gm-Message-State: AOJu0Yy16tr5bQ1L3cwFd7wX2LhHI2FlxZXVS/a5sLvRT/HP6MinN6bA
 9WvdBPy0ikC7V7qoS6Ub1VC3iYyOdm3KxC7lwE+NffklU/tnetxpwplHwjEL77o=
X-Google-Smtp-Source: AGHT+IGCqp3MjKzrsWfmIOQZG/d5FqyKio92NdNy+J5Wu3k5gEf+Y4CDqgDnlHfvybGVSn9LtrjNSQ==
X-Received: by 2002:a05:600c:1c84:b0:40e:8655:d48f with SMTP id
 k4-20020a05600c1c8400b0040e8655d48fmr4322189wms.11.1707139379793; 
 Mon, 05 Feb 2024 05:22:59 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCV1ZYj4FuRxW+2QueZW+3c6RGtjIIIhYpay2wLA+WAoHAegKlp2ZPoS/2m3iGdSQQo11ojPxRG7fhmqsk8D+1vNkQ61do68yA==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a5d4e04000000b0033b3ceda5dbsm2282272wrt.44.2024.02.05.05.22.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 05:22:59 -0800 (PST)
Message-ID: <92589d57-9db6-45d2-a7d0-47db210d1146@mind.be>
Date: Mon, 5 Feb 2024 14:22:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240108070310.3462577-1-james.hilliard1@gmail.com>
 <20240108070310.3462577-2-james.hilliard1@gmail.com>
In-Reply-To: <20240108070310.3462577-2-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707139380; x=1707744180; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oyeyt6uj+mKNWspoAfGffwQbroUaG0z3QdFpFvlOQWE=;
 b=blTrbdoTD8GM43sNn4WhSogBgd8a4CcxFtKM52Pr2x3kXoKicIhuT07K3Kc9KkQq51
 m4V2Kt7pAupbTf5cZ+c9vhBlCFrBI9uO6aeF9aL1oUqjqbaLWHOpzYK/Kr1NX3wngDTB
 u5UFyTDqXd78Kqt3Xx6dhOhh1fkx5R6/XHFkaY/pQgw/pq7XiPkbW9bcz4f6SdS3Ansb
 tHSGYUBgvJUZZu3YMorv5LP7XBMQy2Kq4ckbujsXjPKY1ZhMhPrlc4lEvBHz5bOldd3e
 1ZvSx6+ArQlvRN8wPh3gaAd6iA8uMM3xIYb/nhXpRvkxue3qLjUZEUOIkFIV6Bs2PYdf
 rfXQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=blTrbdoT
Subject: Re: [Buildroot] [PATCH 2/2] package/python-attrs: bump to version
 23.2.0
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



On 08/01/2024 08:03, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-attrs/python-attrs.hash | 4 ++--
>   package/python-attrs/python-attrs.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-attrs/python-attrs.hash b/package/python-attrs/python-attrs.hash
> index 0e94c7cef4..d8c6d147d5 100644
> --- a/package/python-attrs/python-attrs.hash
> +++ b/package/python-attrs/python-attrs.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/attrs/json
> -md5  6623fed7ffa22261ba25fccaf4d99539  attrs-23.1.0.tar.gz
> -sha256  6279836d581513a26f1bf235f9acd333bc9115683f14f7e8fae46c98fc50e015  attrs-23.1.0.tar.gz
> +md5  60588a146fb413a997c7519d77198a5e  attrs-23.2.0.tar.gz
> +sha256  935dc3b529c262f6cf76e50877d35a4bd3c1de194fd41f47a2b7ae8f19971f30  attrs-23.2.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  882115c95dfc2af1eeb6714f8ec6d5cbcabf667caff8729f42420da63f714e9f  LICENSE
> diff --git a/package/python-attrs/python-attrs.mk b/package/python-attrs/python-attrs.mk
> index 0d704ea111..8a1236cc44 100644
> --- a/package/python-attrs/python-attrs.mk
> +++ b/package/python-attrs/python-attrs.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_ATTRS_VERSION = 23.1.0
> +PYTHON_ATTRS_VERSION = 23.2.0
>   PYTHON_ATTRS_SOURCE = attrs-$(PYTHON_ATTRS_VERSION).tar.gz
> -PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/97/90/81f95d5f705be17872843536b1868f351805acf6971251ff07c1b8334dbb
> +PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/e3/fc/f800d51204003fa8ae392c4e8278f256206e7a919b708eef054f5f4b650d
>   PYTHON_ATTRS_SETUP_TYPE = pep517
>   PYTHON_ATTRS_LICENSE = MIT
>   PYTHON_ATTRS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
