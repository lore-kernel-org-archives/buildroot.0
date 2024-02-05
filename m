Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60029C48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17E124185C;
	Mon,  5 Feb 2024 10:36:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17E124185C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hwENfKhX6bOF; Mon,  5 Feb 2024 10:36:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55904417FC;
	Mon,  5 Feb 2024 10:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55904417FC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9A5CB1BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BCBE417FC
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BCBE417FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zqFqELJlQY7T for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:36:34 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 629B5417A1
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 629B5417A1
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40f02b8d176so37107455e9.1
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 02:36:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707129392; x=1707734192;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bt/UguNMlX5g+uDhIoTfIIJ55q9EsVSQGqz0M8egimk=;
 b=sYcEtdxoUs38LXbwpo1mPratufG7R5F7nfS0sRV/bDN/Hsf1iBNBEhryC8PnuSh3HM
 gnYmolNNXzpZKrpploznjD0rwArptArENtBMVfTuNQfLwo97azZhYXZ/mVhZz6GUdMv2
 S0CAdTiNpJD7ekiatixAxMHQFSQptmm7NQl3XWNdCHVERh7R+64hl3S6nTez/iMUQPze
 n/jVuiV6KCQ5zvm4RfrAasTUxAOV2tfEm9lN7m94MPFMn39QzwCnahe/EPvWaNdemRFp
 kZfh/pjfg8eZ86RtWyHXhvher81UFtbnuNMHaCRKPYFehzxG8Kg9HbHZN01yBXtBPiWI
 6NRw==
X-Gm-Message-State: AOJu0YwaN3WCfE494od1NS+BxCgMAldKQVS36Jf54hLuQtYGuRJYlUGx
 Me7mN2IJsMNXUqbbr834B0FecikbZZa/uXZ7onZi+EjmYhtoWv8NlOgicUMFqJM=
X-Google-Smtp-Source: AGHT+IFMhzW8AAAVNsqEiFH4LDmDejq3LkRJ8/8c7Y4wpFWNEn5xfztin2BeewdhN6Do9+3oCJ608A==
X-Received: by 2002:a1c:4c04:0:b0:40e:e6ce:71ff with SMTP id
 z4-20020a1c4c04000000b0040ee6ce71ffmr4395033wmf.41.1707129392505; 
 Mon, 05 Feb 2024 02:36:32 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVrJYTksHXuG5njoRwiaIZHTE9k2LIpRZP+WSQOqE/Zu9KZwd4vDGQwpWl2cedQ8LqXj+eut2r0sW+lZCagBxz61WVCj2ko5g==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 l30-20020a05600c1d1e00b0040e541ddcb1sm8173530wms.33.2024.02.05.02.36.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 02:36:31 -0800 (PST)
Message-ID: <354c59e5-1320-476d-a18a-5f8ca6991d74@mind.be>
Date: Mon, 5 Feb 2024 11:36:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240111041757.2707481-1-james.hilliard1@gmail.com>
In-Reply-To: <20240111041757.2707481-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707129392; x=1707734192; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bt/UguNMlX5g+uDhIoTfIIJ55q9EsVSQGqz0M8egimk=;
 b=HxTBGbaQogYLuZlxXk8XTRMkBvAvzwOHnZgXW8216QH2AIStqLeI3Rf1jkFP893K9E
 A8Egei2YQxXiZs2xqXhFWLu1YF8LGOkHB0aFtNv/T6Z7D1mKccy+JV6nuWVK8GRyA+m0
 fmJxQvBdudY427R6hpLETmUUkJZUDX7lh6Wd0Hu9HMffvgv9MB8pT3tyf996aDZiOUxS
 oizJd+u0gycZJONCg1JJrMm6vi4Ta5baTWkM9urA1AeDOExrZIVdwZNjwxSSpsf9BkCf
 RGJGlFpWDI/tpIe3lFDKfks2nnZpaqsX3pppHj7MsshoLBPn5PH99iRcxnIbYXKhQOQm
 7O+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HxTBGbaQ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyudev: bump to version
 0.24.1
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



On 11/01/2024 05:17, James Hilliard wrote:
> Drop no longer required python-six runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pyudev/Config.in          | 1 -
>   package/python-pyudev/python-pyudev.hash | 4 ++--
>   package/python-pyudev/python-pyudev.mk   | 4 ++--
>   3 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-pyudev/Config.in b/package/python-pyudev/Config.in
> index e0da067cc2..aa98c2cc61 100644
> --- a/package/python-pyudev/Config.in
> +++ b/package/python-pyudev/Config.in
> @@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_PYUDEV
>   	bool "python-pyudev"
>   	depends on BR2_PACKAGE_HAS_UDEV
>   	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
> -	select BR2_PACKAGE_PYTHON_SIX # runtime
>   	help
>   	  pyudev is a LGPL licenced, pure Python 2/3 binding to
>   	  libudev, the device and hardware management and information
> diff --git a/package/python-pyudev/python-pyudev.hash b/package/python-pyudev/python-pyudev.hash
> index 014bf20933..72eb323e1f 100644
> --- a/package/python-pyudev/python-pyudev.hash
> +++ b/package/python-pyudev/python-pyudev.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/pyudev/json
> -md5  17c0a41f0e4dfc016350806a0a60f630  pyudev-0.24.0.tar.gz
> -sha256  b2a3afe1c99ea751f8296652557eac559874da2a1b1ec0625178706ec5a345f3  pyudev-0.24.0.tar.gz
> +md5  fecaabe9eaa890d2173c7b49ab63a412  pyudev-0.24.1.tar.gz
> +sha256  75e54d37218f5ac45b0da1f0fd9cc5e526a3cac3ef1cfad410cf7ab338b01471  pyudev-0.24.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
> diff --git a/package/python-pyudev/python-pyudev.mk b/package/python-pyudev/python-pyudev.mk
> index 5d48cd4f7c..53d60572a8 100644
> --- a/package/python-pyudev/python-pyudev.mk
> +++ b/package/python-pyudev/python-pyudev.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYUDEV_VERSION = 0.24.0
> +PYTHON_PYUDEV_VERSION = 0.24.1
>   PYTHON_PYUDEV_SOURCE = pyudev-$(PYTHON_PYUDEV_VERSION).tar.gz
> -PYTHON_PYUDEV_SITE = https://files.pythonhosted.org/packages/00/8d/810750cb2fc64d7e0dbefc106a9137b157616a95be3f0ea51ca3cf6c762a
> +PYTHON_PYUDEV_SITE = https://files.pythonhosted.org/packages/20/b6/16961ac3575575260c72928f17df9c99c2a696871e486965ec6e2fa2aff4
>   PYTHON_PYUDEV_LICENSE = LGPL-2.1+
>   PYTHON_PYUDEV_LICENSE_FILES = COPYING
>   PYTHON_PYUDEV_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
