Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDE9C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 17:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D14B382021;
	Tue,  6 Feb 2024 17:17:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dD_TgyuAulQ2; Tue,  6 Feb 2024 17:17:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD5B68203B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD5B68203B;
	Tue,  6 Feb 2024 17:17:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA7EE1BF3A1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9307360BEE
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:17:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9307360BEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c1UQRokYNafW for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 17:17:43 +0000 (UTC)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BE6E960BB5
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 17:17:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE6E960BB5
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-5d8b70b39efso5233971a12.0
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 09:17:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707239863; x=1707844663;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=23bJb7x5Zagpk6F/N1AINzzrbp3QeuUaovYg3ii6yNc=;
 b=Y+dGqU8zwYlU6UXI2oGAkzXPLeBj1L5HlP5i+SPdxq1+jEtOMQ5IG9lO17rx1favHQ
 0xDHJf/GBgh4G7mEBiEZ3cl5fbmDk1NQNrpuLTv9A5sb50Ts2Uhy+gv1uKmVGX6c67iP
 6cwZaVtRJ2Mr8IBXCFjUmVavl/B4TCbK7eng7IR2TnA7L3L1pVNIOnlK0Bx/jl77oNCj
 rrvbfiSW3Gk8Zmeu7A2eQr4HkHUKjUXQ3I3rlshGNzRjuysWqzjb0KmxYH/q+wuHWKO8
 ByBqU43tLQ/k0XXRlgiZCQ9ouQhx6anUlgcEZOyjfdTEQ5TxIao3RMc4dpG0qwXcUwFL
 RoFg==
X-Gm-Message-State: AOJu0YzZnNrTpe2wecc+TzB5Yyst6vN7MUt1xmMBnDeleqDSEphdUKX9
 IxcQOm6odH/C6P7MkZtf6UQ7f3WBBYtk2TBriUL+F74h2mrX8cIaiKCj/8nwMAo=
X-Google-Smtp-Source: AGHT+IEX2rDdllUu7I1dZ9esvh21UDqnC/I72HfAUDH9u3qSngHNCREfM3Vs6hQ5n+UOqZhqsqi/XA==
X-Received: by 2002:a05:6a20:6f8f:b0:19e:9c82:b139 with SMTP id
 gv15-20020a056a206f8f00b0019e9c82b139mr1044875pzb.45.1707239862867; 
 Tue, 06 Feb 2024 09:17:42 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXsn5iXMjYvLj8/ag6jxNaGtyy13R9TaGJh+K5XOe3ld8u7zgrIAWXKX4BC2SfPgAYCLNQ/q34bkM3s3mGRoD1XvK6P6cC6C4njajo6vTGkvbYR7VtiwB/SVRI=
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 s18-20020a056a00179200b006e0479cd9ffsm2195164pfg.118.2024.02.06.09.17.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 09:17:42 -0800 (PST)
Message-ID: <e0a5819f-4370-4386-896a-7e736f45b54b@mind.be>
Date: Tue, 6 Feb 2024 18:17:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240106214410.3294887-1-james.hilliard1@gmail.com>
 <20240106214410.3294887-2-james.hilliard1@gmail.com>
In-Reply-To: <20240106214410.3294887-2-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707239863; x=1707844663; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=23bJb7x5Zagpk6F/N1AINzzrbp3QeuUaovYg3ii6yNc=;
 b=PzbquZMjVW7T56OghVA/A8yIC/rgcxQ2FWdt6lQnHQsHNCgBEspbgOiRRfNvMr05pY
 HMk8ggAhL4vygq22Y/dHbZsOf84a0Rg6S7htYJREoivb/bP6eLDygzs9KQrXC6ELJ6oI
 udRuW/rVVe0xTm8K37iMv91e2VfdxRZNf/TV9Csm9XgeXyd51vrcuOo/EQjgQ2zdbw4z
 Ih5ld2tKB/9PMqEnA9471x/L6qadTxiAmTzIINxEeyIEbF8jjkLe1PykW/I+ZvA9sKiU
 SrryK97gvAEdq3tL3yIT1T8jdpdLsxvL7OLHsj0bI9TacZG911JFEoAR8wyQ+Qo+6/u8
 5Fog==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PzbquZMj
Subject: Re: [Buildroot] [PATCH v2 2/4] package/python-aiosqlite: new package
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



On 06/01/2024 22:44, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
>    - add missing python sqlite module
> ---
>   package/Config.in                              |  1 +
>   package/python-aiosqlite/Config.in             |  7 +++++++
>   package/python-aiosqlite/python-aiosqlite.hash |  5 +++++
>   package/python-aiosqlite/python-aiosqlite.mk   | 14 ++++++++++++++
>   4 files changed, 27 insertions(+)
>   create mode 100644 package/python-aiosqlite/Config.in
>   create mode 100644 package/python-aiosqlite/python-aiosqlite.hash
>   create mode 100644 package/python-aiosqlite/python-aiosqlite.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index f5d0c06334..ea023a84ef 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -978,6 +978,7 @@ menu "External python modules"
>   	source "package/python-aioredis/Config.in"
>   	source "package/python-aiorwlock/Config.in"
>   	source "package/python-aiosignal/Config.in"
> +	source "package/python-aiosqlite/Config.in"
>   	source "package/python-aiozipkin/Config.in"
>   	source "package/python-alembic/Config.in"
>   	source "package/python-alsaaudio/Config.in"
> diff --git a/package/python-aiosqlite/Config.in b/package/python-aiosqlite/Config.in
> new file mode 100644
> index 0000000000..77c78ea25d
> --- /dev/null
> +++ b/package/python-aiosqlite/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_AIOSQLITE
> +	bool "python-aiosqlite"
> +	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
> +	help
> +	  asyncio bridge to the standard sqlite3 module.
> +
> +	  https://aiosqlite.omnilib.dev/
> diff --git a/package/python-aiosqlite/python-aiosqlite.hash b/package/python-aiosqlite/python-aiosqlite.hash
> new file mode 100644
> index 0000000000..e06061346c
> --- /dev/null
> +++ b/package/python-aiosqlite/python-aiosqlite.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/aiosqlite/json
> +md5  e829bf8f641ab115c1a9ca0494d35278  aiosqlite-0.19.0.tar.gz
> +sha256  95ee77b91c8d2808bd08a59fbebf66270e9090c3d92ffbf260dc0db0b979577d  aiosqlite-0.19.0.tar.gz
> +# Locally computed sha256 checksums
> +sha256  ab0c171dc3ef8bf325a84bb77d855421f2611335ddf6e08816b2922c4edc0f76  LICENSE
> diff --git a/package/python-aiosqlite/python-aiosqlite.mk b/package/python-aiosqlite/python-aiosqlite.mk
> new file mode 100644
> index 0000000000..e513d53c02
> --- /dev/null
> +++ b/package/python-aiosqlite/python-aiosqlite.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-aiosqlite
> +#
> +################################################################################
> +
> +PYTHON_AIOSQLITE_VERSION = 0.19.0
> +PYTHON_AIOSQLITE_SOURCE = aiosqlite-$(PYTHON_AIOSQLITE_VERSION).tar.gz
> +PYTHON_AIOSQLITE_SITE = https://files.pythonhosted.org/packages/ea/51/060efa10a814145acd4e42c6e5ed540b8714cad52ca026c5930e7c473049
> +PYTHON_AIOSQLITE_SETUP_TYPE = flit
> +PYTHON_AIOSQLITE_LICENSE = MIT
> +PYTHON_AIOSQLITE_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
