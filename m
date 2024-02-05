Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E40EC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D84D540108;
	Mon,  5 Feb 2024 10:56:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D84D540108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qPQasHptNOvp; Mon,  5 Feb 2024 10:56:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDCA640B12;
	Mon,  5 Feb 2024 10:56:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDCA640B12
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 53F061BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C8F160F7B
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:56:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C8F160F7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0e4hFzITR3_g for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:56:06 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1ED0E60F31
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:56:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1ED0E60F31
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40fd72f7125so10045315e9.1
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 02:56:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707130564; x=1707735364;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bt/UguNMlX5g+uDhIoTfIIJ55q9EsVSQGqz0M8egimk=;
 b=MebmuSGQ0Z1o8LNcJjrZkRpjXy0kThrALfVfvfHeOj3Ssnjs8NkbEEsojlNro9dtSX
 h9p+YxPd0mBdZBMbb+ihHfaJa1IbU83c7iSHalNBsaRCc3T40zbr6qSrLlB1FOvDIFBI
 dLG9XgZG1YDhCNUKDFBoU8Qidk2INMGq7k6gopxJ21iQbpZEav73AX2HbFKkMMvrJhJH
 ftMz2otpHFXTLlo1T2CqDKWD0BeCy4vx3WCLoMr09nW9q5xfkFHRx9dws9uoZGqNxJYX
 lloo9HCJBfVMhcL7O31aVVPb5kabvrA+0NSuUi9rFM7RQ/6/+mIeBVqVT/MNTGptBkTQ
 eJFA==
X-Gm-Message-State: AOJu0YxknaoajbWK9/x/gKmYtpgyAw17NFAUPkmOBqUr1rd/N6vEJBi3
 4G/u1EzGXIsvObjxu1rIGXwdxUQwAJSFA8XFDH9XMhX3nQyyaKNoZXHmWPwJOEDHDCEIQIlFtSR
 d
X-Google-Smtp-Source: AGHT+IExVfon1dSfDn740im1AN3jBoc96XIIm0bVx3zo4YoVIAR3ojXySRDSju2a0S4olZVJIx184g==
X-Received: by 2002:a05:600c:3b97:b0:40f:d25c:41d0 with SMTP id
 n23-20020a05600c3b9700b0040fd25c41d0mr3901060wms.29.1707130564310; 
 Mon, 05 Feb 2024 02:56:04 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXJfXJczwIvm/k3zhkxTVF2rmaYhtYrEz1ALu9jBohq/KhOxWNc/Z5909UmKNfkdzSzODfI5Jeh9bDMdxk6dm+jBhoGgra/dw==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c310600b0040fdd8f5e18sm1155061wmo.34.2024.02.05.02.56.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 02:56:03 -0800 (PST)
Message-ID: <fb2cc08c-59df-435a-b3cd-55341e804b32@mind.be>
Date: Mon, 5 Feb 2024 11:56:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240111041757.2707481-1-james.hilliard1@gmail.com>
In-Reply-To: <20240111041757.2707481-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707130564; x=1707735364; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bt/UguNMlX5g+uDhIoTfIIJ55q9EsVSQGqz0M8egimk=;
 b=IjMdBKMmIacPdGSbs7tfcMDbdK97242OVsm0pJ1Rv40b2tQ6hOOlzO4N3J089wW/ug
 XzGjQX46uM1sBGvUk9AqEpvzuCSewB0jV0iAvCXc4n9xz5GIAF+JvWf3y1bCl2ZX0jCs
 MoH20Qlks3OKkzh6W3lsqjiynUiFWM+XtDEkp7YJikbl0pjdcVCc61EJ8SVelBpoTVdL
 9jMfsF3PK7/HKjAAAMBoQ7ufqw7tdeBQcok1qjK3Y61JH/zwJN7MIEVkR8zscCsPdGeU
 iuigVUbPf5+UB1Lf2BciRAPNBZDdWx4WlM11Mbu/TUNL2+l2I1Cd0YKwVDxUmyUb1bXf
 wsYw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IjMdBKMm
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
