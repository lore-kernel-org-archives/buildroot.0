Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A893C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 439ED40168;
	Mon,  5 Feb 2024 10:56:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 439ED40168
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZK7dC7K1nf9a; Mon,  5 Feb 2024 10:56:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2764B40A5D;
	Mon,  5 Feb 2024 10:56:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2764B40A5D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 299B71BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E8F060F7B
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:56:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E8F060F7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oSCx-JLCnpyD for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:56:03 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B783D60F31
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:56:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B783D60F31
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40fd72f71f8so6086565e9.1
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 02:56:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707130561; x=1707735361;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0EIZyg4Tmb8EjUc8uWr4HZvC0+QFQiUY1/KiFJ/HbTc=;
 b=jryKcxeSLzajT6fcOs43J0uJG1DHPTm9qNuaZn82HAoSFHFLYuTa4YaNn+FTnERjYJ
 0a1S4z2pldNUVYAHpOK1LXXY+bur0dOAuGedyO8Jxj9hKyaKSTKua4FRpihdqjmjr3Mh
 vUOKg73N3LBCeVP7ktQM/aPtII/T+djye8/Cd2Xm98AB7B37498pyHA0IbxSrCKTf0Xa
 eKpK8/3g6g/ceRddwDod6FgCcO7mUm4eRkWIQ8qFTlQDv/dlel9VUDLxFSIVJiwx88C1
 cN7nhv/YbLj41goL9GRYjkxLzNCsy793ybwulDH/MRw6KshFb9QdDg0wCtvIRpLgOVbC
 GCCw==
X-Gm-Message-State: AOJu0Yz/CugIhveT/atck70RheHrj/UXXx4x7jD16M3ct8xRY4wpYJVA
 +z1uqeXTKCyLLFrEqBDB7kc3eG3O4ppwI8imIMwSOYjWwPLv7D/h4ES9RGpAhtE=
X-Google-Smtp-Source: AGHT+IHCtf56TAXnb+mDtG4ENDUpismcwyyo4mpRr/pwuGnG3q0LRmC0p2ziukztfFyEbg4s0S/pfw==
X-Received: by 2002:a05:600c:1d82:b0:40f:ba24:77 with SMTP id
 p2-20020a05600c1d8200b0040fba240077mr3893042wms.7.1707130560630; 
 Mon, 05 Feb 2024 02:56:00 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXA/gKFUaNLnvzaEJlUdzhtmKg5AMSKtJe0HVyugQSBligcmvObLP+Ym/tIkvZxD9AHgyCr+pq8au6FFtPsoE8ksb+J3ZOnwg==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c310600b0040fdd8f5e18sm1155061wmo.34.2024.02.05.02.55.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 02:56:00 -0800 (PST)
Message-ID: <a3e81bc0-ea49-461b-bd9a-04c3a74ad6fd@mind.be>
Date: Mon, 5 Feb 2024 11:55:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240111043052.2880841-1-james.hilliard1@gmail.com>
In-Reply-To: <20240111043052.2880841-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707130561; x=1707735361; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0EIZyg4Tmb8EjUc8uWr4HZvC0+QFQiUY1/KiFJ/HbTc=;
 b=ggikTMm1bUgMhtNonlbIdVFp7fHuMGVAYRIS7f7b+I+Xps7eEveQJ3M0+hr0Boo59T
 fPp/CqSD4rnqMYe4CN/kuX5AqjTG16V2FQWRlpjEcuaee4+/x+yYxkkUg6wfSLANV35F
 7L8XF9IHDCmKOHuzaG0KMKKrhvT2qsfo8HiepIEPLD92kaKaIsjD1FmDGbRYySNDFwIN
 87Vy6uOB4Z67Lv+zHqantjwDxJ/ls0VHSntOjD5ZrW4KIaB5mQhwAnH2+65JfhIe0HkD
 Ef3a1uLHGZZFXy21K94I80af1mkksnLVCHxyEnvBuuxrxZNxyBNDXZbkuJINz+ALHGAv
 x6ww==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ggikTMm1
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyzmq: bump to version
 25.1.2
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



On 11/01/2024 05:30, James Hilliard wrote:
> License hashes/names changed due to rename/reformat:
> https://github.com/zeromq/pyzmq/pull/1837
> 
> Add new host-python-setuptools-scm build dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pyzmq/python-pyzmq.hash |  8 ++++----
>   package/python-pyzmq/python-pyzmq.mk   | 11 +++++++----
>   2 files changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/package/python-pyzmq/python-pyzmq.hash b/package/python-pyzmq/python-pyzmq.hash
> index efbc91d83c..3c91d25995 100644
> --- a/package/python-pyzmq/python-pyzmq.hash
> +++ b/package/python-pyzmq/python-pyzmq.hash
> @@ -1,6 +1,6 @@
>   # md5, sha256 from https://pypi.org/pypi/pyzmq/json
> -md5  f10b7c3dee2c03557e2c5d00b73dfc7f  pyzmq-24.0.1.tar.gz
> -sha256  216f5d7dbb67166759e59b0479bca82b8acf9bed6015b526b8eb10143fb08e77  pyzmq-24.0.1.tar.gz
> +md5  280afc0992b0a9f109dafc1e672d2f26  pyzmq-25.1.2.tar.gz
> +sha256  93f1aa311e8bb912e34f004cf186407a4e90eec4f0ecc0efd26056bf7eda0226  pyzmq-25.1.2.tar.gz
>   # Locally computed sha256 checksums
> -sha256  aef3b80570351d44e29c22d080d4e9e106b34f3fdbc5cdf9636994474c72b1a2  COPYING.BSD
> -sha256  44b23767df3c0fe27f88981f09bc7f50a1695cec4b24252fa5f55f03e76bcd6d  COPYING.LESSER
> +sha256  c0cf5f5c03f8d6772f7a271df1cb671054578bd3d79527c72fc1f28f8cc72a7a  LICENSE.BSD
> +sha256  5f1dac83d6c25674004810ec9e54b304ccbb8303ac5961813b09235966abfd48  LICENSE.LESSER
> diff --git a/package/python-pyzmq/python-pyzmq.mk b/package/python-pyzmq/python-pyzmq.mk
> index 5792957eaf..1d9a7d01cb 100644
> --- a/package/python-pyzmq/python-pyzmq.mk
> +++ b/package/python-pyzmq/python-pyzmq.mk
> @@ -4,15 +4,18 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYZMQ_VERSION = 24.0.1
> +PYTHON_PYZMQ_VERSION = 25.1.2
>   PYTHON_PYZMQ_SOURCE = pyzmq-$(PYTHON_PYZMQ_VERSION).tar.gz
> -PYTHON_PYZMQ_SITE = https://files.pythonhosted.org/packages/46/0d/b06cf99a64d4187632f4ac9ddf6be99cd35de06fe72d75140496a8e0eef5
> +PYTHON_PYZMQ_SITE = https://files.pythonhosted.org/packages/3a/33/1a3683fc9a4bd64d8ccc0290da75c8f042184a1a49c146d28398414d3341
>   PYTHON_PYZMQ_LICENSE = LGPL-3.0+, BSD-3-Clause, Apache-2.0
>   # Apache license only online: http://www.apache.org/licenses/LICENSE-2.0
> -PYTHON_PYZMQ_LICENSE_FILES = COPYING.LESSER COPYING.BSD
> -PYTHON_PYZMQ_DEPENDENCIES = host-python-packaging zeromq
> +PYTHON_PYZMQ_LICENSE_FILES = LICENSE.LESSER LICENSE.BSD
>   PYTHON_PYZMQ_SETUP_TYPE = setuptools
>   PYTHON_PYZMQ_BUILD_OPTS = --zmq=$(STAGING_DIR)/usr
> +PYTHON_PYZMQ_DEPENDENCIES = \
> +	host-python-packaging \
> +	host-python-setuptools-scm \
> +	zeromq
>   
>   # Due to issues with cross-compiling, hardcode to the zeromq in BR
>   define PYTHON_PYZMQ_PATCH_ZEROMQ_VERSION
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
