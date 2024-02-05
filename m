Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E691C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 275E2417D2;
	Mon,  5 Feb 2024 10:15:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 275E2417D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BV9H4Fs_Thtp; Mon,  5 Feb 2024 10:15:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 616D441568;
	Mon,  5 Feb 2024 10:15:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 616D441568
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D7B5F1BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE52840ACE
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:15:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE52840ACE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KZrYdOgkyOV4 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:15:20 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC2DF40A8F
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC2DF40A8F
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-33b2960ff60so1014301f8f.1
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 02:15:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707128118; x=1707732918;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9wOfcBgbg1K8LSd2uln/6rQ3LoAEmsiMj8zw9va8Wj4=;
 b=JgB3s8eG6N65KkCdJNAysSNiBwISgzV1eNKL7oLdbrjdLQmBloZAhkDkV2GB32IP+v
 PjJFWrMR/MEu2vVSTwU1fRbH/fsvtHgPH290HKcLhdJQR99vTAPCxgdyy1rWFd2P5usL
 HVKQtC8lDOd2hbycNTacKUI00SE2poUggxQ3othOp7yzhbf6M+Yl73Y+wLaBJn3yAKCY
 Efv5du3oaD0C/qCpoDUrRolylFri/w9FHT06wbTGh9ga9064JO3lLptaZc7SJDn/Na0f
 KeFh3qhwSZV5FRqn3Yl7GEwpaPRU7QtDcNkzzrklfxfqQv8CP+naVmtgVBmnpdWXMrrh
 dq5g==
X-Gm-Message-State: AOJu0YzGPjIkIjRR/0Xez5CVozit5GMBgRXM78azWSBG8IP9yYWr14oj
 F/SdQk431gxQQwG3ZHmFuur9CXz8IjsREVMiHHY28HoQOAUvYgAa0/QbPp413W0=
X-Google-Smtp-Source: AGHT+IFEEWCTkCBVvo6P8VNi1GQru2MJ7cYvHd6ZoKZKjOgEMI7rbPUb3mnqMxrRpLp/jZsldZ1wsw==
X-Received: by 2002:a5d:6d09:0:b0:33b:d5e:46e1 with SMTP id
 e9-20020a5d6d09000000b0033b0d5e46e1mr5154861wrq.5.1707128117988; 
 Mon, 05 Feb 2024 02:15:17 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWiiOXPQ814MyKRD1QyAWsBnVI1kVIDH01rRvUfG0rE7lb0pHukuf9NAkuDnw5CesK+9XoIaj46ypkIvxem/vDZwf7JSlG7rw==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 e11-20020adfef0b000000b0033b14f22180sm7761934wro.20.2024.02.05.02.15.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 02:15:17 -0800 (PST)
Message-ID: <3a627241-c297-44bf-bf25-8006c2498451@mind.be>
Date: Mon, 5 Feb 2024 11:15:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240111015855.2645577-1-james.hilliard1@gmail.com>
In-Reply-To: <20240111015855.2645577-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707128118; x=1707732918; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9wOfcBgbg1K8LSd2uln/6rQ3LoAEmsiMj8zw9va8Wj4=;
 b=QxjbingaOK9wTa8N90mbenQnjiz4Y+V7PX7OleaJx/rDNuHEi0CRcn9FGgCptpClEi
 fShVl5p5pfmOD4ZgQlfliv35HnJIOF0ap12aKD55LYP8DTNg6+mC73Z7a+QVWSNrHjdi
 u2E3WbnGLxFWQ4O9anbn5VTqMRhN3kbmJjooS1MsM/yoMnhymAwDssyep8wGcOQladrA
 iPigJ1QV1TWOuvIz7a6wg13T8WaRBkkhbCXWdQ7mQfq1XUSvGS7SRDi75PUDD6M8pE36
 DFAjHV18YY1YDHlXR1o5xk8hH2F2Rd5yPi6jFkL4lsDBUuFAIeMcUonhaXPvDBWsZleu
 Dtzg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Qxjbinga
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyopenssl: bump to
 version 23.3.0
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



On 11/01/2024 02:58, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pyopenssl/python-pyopenssl.hash | 4 ++--
>   package/python-pyopenssl/python-pyopenssl.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pyopenssl/python-pyopenssl.hash b/package/python-pyopenssl/python-pyopenssl.hash
> index f9b1e4a86b..fb5f75db96 100644
> --- a/package/python-pyopenssl/python-pyopenssl.hash
> +++ b/package/python-pyopenssl/python-pyopenssl.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/pyopenssl/json
> -md5  1be2c02bf3c0c4e5e7c51b9ac90ebd72  pyOpenSSL-23.0.0.tar.gz
> -sha256  c1cc5f86bcacefc84dada7d31175cae1b1518d5f60d3d0bb595a67822a868a6f  pyOpenSSL-23.0.0.tar.gz
> +md5  4c4f6f9e1c731b8ee7adcd9fbeccec62  pyOpenSSL-23.3.0.tar.gz
> +sha256  6b2cba5cc46e822750ec3e5a81ee12819850b11303630d575e98108a079c2b12  pyOpenSSL-23.3.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/python-pyopenssl/python-pyopenssl.mk b/package/python-pyopenssl/python-pyopenssl.mk
> index 1d89f5b696..9865f2bb00 100644
> --- a/package/python-pyopenssl/python-pyopenssl.mk
> +++ b/package/python-pyopenssl/python-pyopenssl.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYOPENSSL_VERSION = 23.0.0
> +PYTHON_PYOPENSSL_VERSION = 23.3.0
>   PYTHON_PYOPENSSL_SOURCE = pyOpenSSL-$(PYTHON_PYOPENSSL_VERSION).tar.gz
> -PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/af/6e/0706d5e0eac08fcff586366f5198c9bf0a8b46f0f45b1858324e0d94c295
> +PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/bf/a0/e667c3c43b65a188cc3041fa00c50655315b93be45182b2c94d185a2610e
>   PYTHON_PYOPENSSL_LICENSE = Apache-2.0
>   PYTHON_PYOPENSSL_LICENSE_FILES = LICENSE
>   PYTHON_PYOPENSSL_CPE_ID_VENDOR = pyopenssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
