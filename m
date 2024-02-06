Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24E4C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 17:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BD5882E29;
	Tue,  6 Feb 2024 17:43:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iRjoTnDbeRdx; Tue,  6 Feb 2024 17:43:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F19D82F80
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F19D82F80;
	Tue,  6 Feb 2024 17:43:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BEF381BF3A1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4DF541EDA
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:43:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4DF541EDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pi0Dq28Ch69L for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 17:43:12 +0000 (UTC)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8957341EAB
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 17:43:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8957341EAB
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33b29b5ea96so538539f8f.0
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 09:43:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707241390; x=1707846190;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IG+5MXPYkZH3VZo8Vd0zTkdduK5+PMwVdW3eUaOHf8E=;
 b=F3EYF5LuUWYnP4hcd1PuvjBElObGAsKvfVSePITp0WRWCYEHUFYEqQhy862KRShcKZ
 2ZvOsHN3iGiVXpHIOjwBXpPznCpOqcn7k2hHKm6KJF+LH9yz0jZy3KuzhH/6t24leDGc
 0fiVMnVkbK9N9qQGIW25K2HSzJZVn0E3365tUnvETpPG4p1WkTG1uuy5jt3c+sVB97wy
 Raz2RXySs8wHDHlR/hQ/EFm2sPjsFV+S1RPYaYkEbGQQjYLpsO5JWCJjLFSDYnyqp7Jh
 KJWKWfwwi01m3t0+GoNfkgzjok19im0eGjZ6WfK5ToLf+bufkgGb8P+vYxCSKknn0ZEM
 zbmQ==
X-Gm-Message-State: AOJu0Yw56Dxe7PaPOrkjjHzFOc8r17QRrtC3kX9MupYszCBx3DQLiH/H
 rqJExjOFf6AZt/Abvqm2IP9uyD/p5EpMERDwkDNwUubPqxJUKRVO8uuELgWMbJ8=
X-Google-Smtp-Source: AGHT+IHuMCcMvtc2mtWb0qyeJspS5ur5ZY2tJhDNG5n5A6tfRZp7nLZELmvtC0nAskIC75PcqLfT4g==
X-Received: by 2002:a5d:4989:0:b0:33b:fed:656a with SMTP id
 r9-20020a5d4989000000b0033b0fed656amr1578510wrq.35.1707241390452; 
 Tue, 06 Feb 2024 09:43:10 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVBKg/1itr6J4a7SqbZYOOSGqNJ0WAR/2Ul09GQrCTF1zV7OqpD9pOXaiFfKWlsSTMk4AcfH6G3t0G1/oCIyTucQisCLB7yfdNZ5UtprPZxhAYHt7KJ0sE9Wyk=
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a05600c354600b0040e9d507424sm2685934wmq.5.2024.02.06.09.43.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 09:43:10 -0800 (PST)
Message-ID: <d2c62f63-c48e-4969-a287-b10ecb7b3b21@mind.be>
Date: Tue, 6 Feb 2024 18:43:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240106214410.3294887-1-james.hilliard1@gmail.com>
In-Reply-To: <20240106214410.3294887-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707241390; x=1707846190; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IG+5MXPYkZH3VZo8Vd0zTkdduK5+PMwVdW3eUaOHf8E=;
 b=ebN3+Vpcv/cL88dSqXC8uZ/TLUrNCLasF6aFKLF5nVJuq+2Ct1ufQKuVwNJPwA+70W
 zHkfLQmdmuEj/kZuN6FTtnQmcjvLha3UOgVHqmkuDDKlIxTLkHHa/OHPNAopK8XviVy7
 A3zsY7Aatp+9QDjrjUR0i52DXVtQzpl37hYfoFx1xFCF8EISgdePmhIb3683k5jR7mrN
 qMzydqU6prwURIRZAUbB1vefFfbPx+XnhyXcyRyKYYibd7esrDAw8eNy5IbUmUiXF8Zz
 pOmCGbxV5Y4nZE07/3QkjCX1q/4XUjOS0VYSorqJOD9wc+ALA1uvWHvcWytBqbKMYdyK
 TKYQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ebN3+Vpc
Subject: Re: [Buildroot] [PATCH v2 1/4] package/python-poetry-core: new host
 package
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi James,

On 06/01/2024 22:44, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/python-poetry-core/python-poetry-core.hash |  5 +++++
>   package/python-poetry-core/python-poetry-core.mk   | 14 ++++++++++++++
>   2 files changed, 19 insertions(+)
>   create mode 100644 package/python-poetry-core/python-poetry-core.hash
>   create mode 100644 package/python-poetry-core/python-poetry-core.mk
> 
> diff --git a/package/python-poetry-core/python-poetry-core.hash b/package/python-poetry-core/python-poetry-core.hash
> new file mode 100644
> index 0000000000..3c07fef04f
> --- /dev/null
> +++ b/package/python-poetry-core/python-poetry-core.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/poetry-core/json
> +md5  9ed2f2e9244165b34d7233c306a34a2a  poetry_core-1.8.1.tar.gz
> +sha256  67a76c671da2a70e55047cddda83566035b701f7e463b32a2abfeac6e2a16376  poetry_core-1.8.1.tar.gz
> +# Locally computed sha256 checksums
> +sha256  f1978133782b90f4733bc308ddb19267c3fe04797c88d9ed3bc219032495a982  LICENSE
> diff --git a/package/python-poetry-core/python-poetry-core.mk b/package/python-poetry-core/python-poetry-core.mk
> new file mode 100644
> index 0000000000..e1acf3179c
> --- /dev/null
> +++ b/package/python-poetry-core/python-poetry-core.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-poetry-core
> +#
> +################################################################################
> +
> +PYTHON_POETRY_CORE_VERSION = 1.8.1
> +PYTHON_POETRY_CORE_SOURCE = poetry_core-$(PYTHON_POETRY_CORE_VERSION).tar.gz
> +PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/36/66/6af2891495d12020419c8447d0b29c1e96f3be16631faaed6bda5b886d5d
> +PYTHON_POETRY_CORE_SETUP_TYPE = pep517
> +PYTHON_POETRY_CORE_LICENSE = MIT
> +PYTHON_POETRY_CORE_LICENSE_FILES = LICENSE

  This package has 4 vendored dependencies, each with their own license. Those 
should also be specified in the LICENSE and LICENSE_FILES.

  In addition, for lark, there's a file under MPL and a file under GPL, even 
though neither if those licenses is mentioned in the lark license. Ideally those 
two should be mentioned in the LICENSES as well. And of course, this should 
ideally also be done for the python-lark package which suffers from the same 
issue...

  Regards,
  Arnout

> +
> +$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
