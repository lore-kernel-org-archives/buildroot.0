Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0D5C48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45D2D40A5D;
	Mon,  5 Feb 2024 10:39:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45D2D40A5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id olmzUMlFzJJB; Mon,  5 Feb 2024 10:39:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2B5D40AEE;
	Mon,  5 Feb 2024 10:39:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2B5D40AEE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B1B941BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A22340129
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:39:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A22340129
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Lnmqx1ag9ah for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:39:11 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56699417BC
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:39:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56699417BC
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-33934567777so2840990f8f.1
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 02:39:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707129549; x=1707734349;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0EIZyg4Tmb8EjUc8uWr4HZvC0+QFQiUY1/KiFJ/HbTc=;
 b=vXTPhJdKxqAO5QA1pCL5kt+2gYUAUQcv5KGWftsuOHWU/TWdkbAjZpQXe9wx/VmLwB
 +uIV3FdZvrl8ZMSj0A4fEdu3T5iVxxAb5Rp6/cIYs02EaqoXtodN9cstFIQHD8PpQbtt
 C3PU5D2rBz0RBFU3QkLx+PXzZa5NpBqTxZzjJKE8L0Gkt+guUPXWqSjZwTtP7YxiUI6D
 3H0Sgi6OY37E+15e39uR4Dj3dy80hySdZtj9GkzuEBOEZkBr/u5xv/AalVV1TIFe63KH
 KeZZ+qIU1CGDTRNXmaz6SWlJmEvWWpjQNnYykl4/0feRk4KbRijmFhXacnmFb3//VUNf
 fc1g==
X-Gm-Message-State: AOJu0YwxHHMsdiEp2/ATKbckfqT6g/dqbevjoavJed9KNOtls7WMlKpk
 NXQAMUHgCTJyjU1tLlnIE3p/aLwzldoSm1qoFrVOdlqtmjJD+iCHslq2rVXxw2w=
X-Google-Smtp-Source: AGHT+IGgyTLSZ/LGp725MTgg60qV3/td0CqOcW9oqHkjz2QF+YprEGoV4K2/TeFI0Zqxvde9aZ2peQ==
X-Received: by 2002:a5d:588b:0:b0:33b:247c:d61a with SMTP id
 n11-20020a5d588b000000b0033b247cd61amr7325205wrf.31.1707129549416; 
 Mon, 05 Feb 2024 02:39:09 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWfo+saeME8/r2ZOnIRqi18iSZQ2uOr3Yn6+sJJ2rqwQcP2Y21rYEpw0b2zBdnTWTZJd0Y71t7pQjT08HJqr06S4wyZO7j7fQ==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 t18-20020adfa2d2000000b0033b1a4cc2a1sm7863711wra.7.2024.02.05.02.39.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 02:39:08 -0800 (PST)
Message-ID: <1be43d03-99b9-47ff-b63b-b418c9cf5981@mind.be>
Date: Mon, 5 Feb 2024 11:39:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240111043052.2880841-1-james.hilliard1@gmail.com>
In-Reply-To: <20240111043052.2880841-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707129549; x=1707734349; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0EIZyg4Tmb8EjUc8uWr4HZvC0+QFQiUY1/KiFJ/HbTc=;
 b=gqy/LTqP7oi21jLUaPIUs7H30PRCwi7QjVDuEzL0FIxdqel4Nl4RwXLb4FYwPA1Urm
 jw0fs0e7EPAOUIE7IqT4sD0nBJdlnQIPa4eW901kFUD7GucXCBR89iBDWBcvhiMbKiWQ
 /6PgOo44tWSVDlbWtHVXsw3Mg2ZnOwAui7UAuEikzOojk2j/UfvCs7YI3RPGOynqyoJo
 fl4ErzA5kufENXY0Mr0AESHTMMkUSssFvfp5x8gbwbpsTQ1wr7aawv6UuRiqq8trzrPm
 qGkxxJfRdAR6xBCQTYZE3ACAbzjTkq1E/E3Eb8QXwVRX4QvyIfMoZWdj8TjnoIzxcVc+
 R3lg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gqy/LTqP
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
