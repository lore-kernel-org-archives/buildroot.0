Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA958C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 15:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AF0860B28;
	Sat,  8 Jan 2022 15:12:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MUHaTIp84xpi; Sat,  8 Jan 2022 15:12:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E331260AA9;
	Sat,  8 Jan 2022 15:12:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9F91E1BF5A1
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BC0260B28
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:12:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GjJZHwjJwwrJ for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 15:12:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47ECC6076C
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 15:12:47 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id q8so17091326wra.12
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 07:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4TrEX/7HD7w0enjs5hHBYKO1A9914xYe+FAyjPPWi+c=;
 b=evzBdC91iVFPKd/IBzUHipRqOj3vYNKdkL6rcBQjeL2Sud4IWaiJM8M51Adfj+huRz
 sjLlUgU7rIhDdD03ucxtn8oRXBq/XGB3xeQ0tJR59G95IT3eL1W68EkG/th928qRr5m9
 zeLpl53l8nU+aWhiom5ycYpfa8uPs34WF7NoOH0Ie7Qoh2CBj6j/NXl/4NM6g5HV9S2j
 A9mWu4d0b49QtZWmSspaUfSPEhyg5l+KVdTrFBydIdjpFYEpl2053xR4mPKOEDXlC4J8
 XViC7HBzfp0geBPJeMpXJo9N2kFRugET4HmujjvWC3MLwwjz3ro3m5VE3mBCm7YuZNQf
 ytqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4TrEX/7HD7w0enjs5hHBYKO1A9914xYe+FAyjPPWi+c=;
 b=CQbCmqp26yXtkQmSY27BGpJE+C817xHj7AnnzR2xGi96BQhUifBxxWBfDUim6TnaN5
 zzckE8TcnieXTQ31y5W5VD37PRF7iLJ+KpVSvxozSB85lsEgtlX8BwAGrg/dZJt2EA8c
 DXvc5U1wU1Qc/hFniysB0Aj4vql2Y/Ja4Kw450bF+2m41xzHn+KctB3JgAuh4s8ZeSWB
 xvZOkackx9xIjWPzVkIrNtqM7oSeri9b4NL/TXigJtUgDzx9jQA9Zda3q3vLCiyQ32MK
 jsQVQRWMtGy7fQJwEcej0bpz/k/ppmr0ohp2hUhrHauaCyNtGsIKde8dlqr+VH7gdLpR
 Df/g==
X-Gm-Message-State: AOAM533YuXSrRVD8Iyi0Tn9g7MTGKGugFpr0rFnJSVV/5wcbsKoPPcMD
 bAhop4KN6BcyPB/SD8xVksRQKg==
X-Google-Smtp-Source: ABdhPJw+YeOle0XzYfGiqRqDoWz71QrfAYePUoUrUnoC/tdfULSyA2ceJa4GIM6Gsuq2w4VIZK1VXQ==
X-Received: by 2002:adf:fa83:: with SMTP id h3mr8200065wrr.444.1641654765606; 
 Sat, 08 Jan 2022 07:12:45 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id d22sm1829938wmq.17.2022.01.08.07.12.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 07:12:45 -0800 (PST)
Message-ID: <3f5b1b5f-5c4d-0968-923b-43b8c004ca49@mind.be>
Date: Sat, 8 Jan 2022 16:12:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
References: <20220107231253.1546336-1-thomas.petazzoni@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220107231253.1546336-1-thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH] package/python-numpy: simplify
 PYTHON_NUMPY_FIXUP_NPY_PKG_CONFIG_FILES
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
Cc: Samuel Martin <s.martin49@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/01/2022 00:12, Thomas Petazzoni wrote:
> The PYTHON_NUMPY_FIXUP_NPY_PKG_CONFIG_FILES macro was introduced in
> commit
> 2426002d6fc81d0b023e3f3b3ee4e94ab29438cb ("package/python-numpy: fixup
> npymath.ini for numpy extensions").
> 
> However, it turns out that by using $(PYTHON3_PATH), we can simplify
> the intermediate variables, to the point where they are no longer
> needed. Not having the intermediate variables makes the logic a bit
> easier to understand.
> 
> Also, the logic is changed to use a single sed expression, which we
> pass to $(SED).
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-numpy/python-numpy.mk | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
> index f367b556ef..9e8b032b78 100644
> --- a/package/python-numpy/python-numpy.mk
> +++ b/package/python-numpy/python-numpy.mk
> @@ -40,12 +40,9 @@ endef
>   # it uses host libraries (like libnpymath.a).
>   # So, the numpy distutils extension packages would explicitly link this
>   # config path for their package environment.
> -PYTHON_NUMPY_STAGING_DIR = $(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy
> -PYTHON_NUMPY_NPY_PKG_CONFIG_PATH=$(PYTHON_NUMPY_STAGING_DIR)/core/lib/npy-pkg-config
>   define PYTHON_NUMPY_FIXUP_NPY_PKG_CONFIG_FILES
> -	sed -e '/^pkgdir=/d' \
> -	    -e '/^prefix=/i pkgdir=$(PYTHON_NUMPY_STAGING_DIR)/core' \
> -	    -i $(PYTHON_NUMPY_NPY_PKG_CONFIG_PATH)/npymath.ini
> +	$(SED) '/^pkgdir=/d;/^prefix=/i pkgdir=$(PYTHON3_PATH)/site-packages/numpy/core' \
> +		$(PYTHON3_PATH)/site-packages/numpy/core/lib/npy-pkg-config/npymath.ini
>   endef
>   PYTHON_NUMPY_POST_INSTALL_STAGING_HOOKS += PYTHON_NUMPY_FIXUP_NPY_PKG_CONFIG_FILES
>   
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
