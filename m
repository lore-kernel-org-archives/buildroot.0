Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DC0C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 13:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DCA060E43;
	Mon,  5 Feb 2024 13:21:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DCA060E43
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zz4rar4cRWaI; Mon,  5 Feb 2024 13:21:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF0DB60EF8;
	Mon,  5 Feb 2024 13:21:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF0DB60EF8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E8BA41BF40D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0F5141767
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:21:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0F5141767
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E37nC7cL78b0 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 13:21:37 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D84741734
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 13:21:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D84741734
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40fb804e330so40183695e9.0
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 05:21:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707139295; x=1707744095;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gdnt3qUiMixdoH/A9u/sK1PLUtS8PGH2mEn4DxWVWt8=;
 b=G1km3cksNb1uHVtPO2l9CnByzl14CA1Oc5+69OqxeLxsp0iWsEfEu4g/IDFdFuCqph
 HoSLNpfiENmSqDUVxzaJCSF7KgbOwZ8KLHNwZJTUZEvB6iOLwUYuJNDpRB6tfNX+eAnw
 Ks/SeYHp17cFvGpmCFykgEhziJZTbbj7bNeANRjYSz8SpMuCX9Wy4CGLP3Xq/Xj4Bm2R
 mLVnfRF4fjWgUoNkxqqs95CZOcZrTkxdTfLad62OOeJ7EpcK31DO7CAtw4LX85vEltu4
 SpPkAecdE+HCTet9+XV+EkVQpvADU159OC/eQw1+a0lQh5wKnQIPRySKd7gg3zbAlUL6
 OcCA==
X-Gm-Message-State: AOJu0YzfAPKEtEtU3HdCDeQQjGbU89HOTOfCU3bxNrbsjOEhKmQSRL2A
 3XmJu/CivGXaTpInL0Aet5c+fsj/PgDWHlvG/Oybsb30XrKF6qdYXM3zBOIZ8XM=
X-Google-Smtp-Source: AGHT+IHJEhgCgGNqQ2rSrc0NqwUwbApWqBhdTvSTPMesn7VqEekxwhVJs8oMzb95fPZjWBdTNM4K5Q==
X-Received: by 2002:adf:cf11:0:b0:33b:150a:858 with SMTP id
 o17-20020adfcf11000000b0033b150a0858mr9756599wrj.5.1707139295572; 
 Mon, 05 Feb 2024 05:21:35 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUL/F6AnQpIzL9e34uppDmfS0jfyYVbO7/2LLvL9nEDr4j8dRb26rNvTyTFIoZhjtYzb3Or+7vrZIcyzSMxk2nE/pGQi00AKQ==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a5d4e04000000b0033b3ceda5dbsm2282272wrt.44.2024.02.05.05.21.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 05:21:35 -0800 (PST)
Message-ID: <d4473b58-387f-469d-93e2-dc000257de97@mind.be>
Date: Mon, 5 Feb 2024 14:21:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240108070310.3462577-1-james.hilliard1@gmail.com>
In-Reply-To: <20240108070310.3462577-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707139295; x=1707744095; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Gdnt3qUiMixdoH/A9u/sK1PLUtS8PGH2mEn4DxWVWt8=;
 b=Igo0eM9eC35xpg7F6K6AqRpmc0uBjwG3xLHGSZSiCBLAWcy3dQq+/nSsIdgsK+5AqB
 pCC5pQMOdgdW6tKFbk+v4KHjPIXI8q7ChWnTCBsMkbB62TFK25riYQE3ZLKEScqw4Q3R
 rc9I8f1nzxDTshPC01yKEIsjogb0nSenjxQp8NeHHgMkAOH/XLx0+te8vqKnC6SbzDsR
 TOr90Czgz3sLRhjvZ7Ypol6gQox4vVbX6H1oehW8ild2N9XP6QJkFr4rHHTj4XS15MKW
 80/dHMMDBkteszRYZybbWG1eaK36xl28kc8zqOJILriT6haPQDx0koif0zh2LFwJm2r2
 3KRw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Igo0eM9e
Subject: Re: [Buildroot] [PATCH 1/2] package/python-hatch-fancy-pypi-readme:
 bump to version 24.1.0
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
>   .../python-hatch-fancy-pypi-readme.hash                     | 6 +++---
>   .../python-hatch-fancy-pypi-readme.mk                       | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.hash b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.hash
> index d9fdb88e1f..e3a6363eb7 100644
> --- a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.hash
> +++ b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.hash
> @@ -1,5 +1,5 @@
> -# md5, sha256 from https://pypi.org/pypi/hatch_fancy_pypi_readme/json
> -md5  8755cce1a4a4d5e5d84992089801acbf  hatch_fancy_pypi_readme-23.1.0.tar.gz
> -sha256  b1df44063094af1e8248ceacd47a92c9cf313d6b9823bf66af8a927c3960287d  hatch_fancy_pypi_readme-23.1.0.tar.gz
> +# md5, sha256 from https://pypi.org/pypi/hatch-fancy-pypi-readme/json
> +md5  f5f9e639f066c91f8e623ec6231beae9  hatch_fancy_pypi_readme-24.1.0.tar.gz
> +sha256  44dd239f1a779b9dcf8ebc9401a611fd7f7e3e14578dcf22c265dfaf7c1514b8  hatch_fancy_pypi_readme-24.1.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  e69ea57f96e599e617f61af3e85bf326b87e833994709fb5e5908a81197730a2  LICENSE.txt
> diff --git a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk
> index 6195a30436..2a26892388 100644
> --- a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk
> +++ b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_HATCH_FANCY_PYPI_README_VERSION = 23.1.0
> +PYTHON_HATCH_FANCY_PYPI_README_VERSION = 24.1.0
>   PYTHON_HATCH_FANCY_PYPI_README_SOURCE = hatch_fancy_pypi_readme-$(PYTHON_HATCH_FANCY_PYPI_README_VERSION).tar.gz
> -PYTHON_HATCH_FANCY_PYPI_README_SITE = https://files.pythonhosted.org/packages/85/a6/58d585eba4321bf2e7a4d1ed2af141c99d88c1afa4b751926be160f09325
> +PYTHON_HATCH_FANCY_PYPI_README_SITE = https://files.pythonhosted.org/packages/b4/c2/c9094283a07dd96c5a8f7a5f1910259d40d2e29223b95dd875a6ca13b58f
>   PYTHON_HATCH_FANCY_PYPI_README_LICENSE = MIT
>   PYTHON_HATCH_FANCY_PYPI_README_LICENSE_FILES = LICENSE.txt
>   PYTHON_HATCH_FANCY_PYPI_README_SETUP_TYPE = pep517
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
