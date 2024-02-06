Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7944C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 17:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A9B582951;
	Tue,  6 Feb 2024 17:47:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nHu2i2CSvijy; Tue,  6 Feb 2024 17:47:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01FE5830AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01FE5830AB;
	Tue,  6 Feb 2024 17:47:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 085481BF3A1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFB5F40A39
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:47:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFB5F40A39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5cYWG027Vt-c for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 17:47:25 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CBF20400E5
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 17:47:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBF20400E5
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40ffd94a707so1238065e9.1
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 09:47:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707241643; x=1707846443;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MyUIbEGThZexg7G9Z+FydLO/dsutNi0EnKI+EyxyksA=;
 b=tENKr5q5fsS0kjI4aiTrSeNxaX5N1F+gGP9/rpaZJG3rHlkivLAMAu8/ieL7m1Urh6
 YCR/fr3puQN5ekD4CJ3gTaIuRxzbJP2Bg5bd9gDe4orPrPqDDzaNG0htAFb4ooCYbRaN
 W7fMO3r1A4dsrhkQSOEnvnzgvOgyJbAx4QNkxgSHVeLCgMBFVFunukzLiEnZytmHePPb
 9R7wMuTDWPCuQvhZECah0X7GWYcuUM7x23sILA84Ru8+EQajwN8/pd3BjUfUV84f1xPp
 3Py1R9LRQ6Yl2HpkcJiYz/xVzJMfmuJO7lQz6hMLoLiLjh/aNmJE2gJGZa8PRssXk2F6
 Ye+g==
X-Gm-Message-State: AOJu0Yxz2vUK3JKIVsmYAnRpU5tetFz61m57yZuJEd6q7fsPXJR/84Hv
 rR39G4WRZdETeWdWtsenKO92dXHbITJk/Cgw3IFWsjyOawENWMYP8JBaaICgED4=
X-Google-Smtp-Source: AGHT+IFWMk/5aT9KKvLX/s8uenF3PaTHvJ+jR0rDsxAVo2yOI7U/nKk/XFj9OQXDS2DILq3DBpuUtw==
X-Received: by 2002:a05:600c:1551:b0:40e:f626:483d with SMTP id
 f17-20020a05600c155100b0040ef626483dmr2189516wmg.13.1707241642947; 
 Tue, 06 Feb 2024 09:47:22 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXAeP1DC8wCVA/ZUrdifCEt27CV1cR0ufVzdIklcJl61Dp8EBqxkMYphk8DVcsppYQX7mSmw4SRf2NE3KIxTOgSG+dDF3tS2CuUHasNLCwzvvOm7Mr8I7RrnK3VREJEfGI+jI24wQ==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 m14-20020adffa0e000000b0033b43d7394bsm2574259wrr.55.2024.02.06.09.47.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 09:47:22 -0800 (PST)
Message-ID: <28d526e3-7700-4588-881e-2aeaf63e742c@mind.be>
Date: Tue, 6 Feb 2024 18:47:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20231214091504.101102-1-james.hilliard1@gmail.com>
 <20231214091504.101102-2-james.hilliard1@gmail.com>
In-Reply-To: <20231214091504.101102-2-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707241643; x=1707846443; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MyUIbEGThZexg7G9Z+FydLO/dsutNi0EnKI+EyxyksA=;
 b=hd8YNXMHouVoKQ5CJ8jki8EQT3x8JtsEC/KWFcyuFh7IFA2j7rneb/ljWTwS7XVeY6
 q3yKGFm9CXvlLSBQum4TYmnex7uQIhrOfUNrYQm+jkDVnsvLVYtC46hu50OOk9IZ9EaI
 NoISkzyT3HrqpnIYuRZoe0UBqtsbYdNrt778ZHcBAuQeonqu86qM+saC2Hk7gKuTpDJ9
 wStl8LukVUQ6Ugb2hC7f+JFtV6GABNtefjUy/MH4J4LFYkZfUNkAcF7h45L7P2bbWUqR
 Pv9PH2kbERCeTSi94ervGGv9WhZ8h+dem3zw4JfKeyYAqG2nuaJ9/Um6ZQYYFDka97GR
 5NVw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hd8YNXMH
Subject: Re: [Buildroot] [PATCH 2/4] package/python-aiosqlite: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/12/2023 10:15, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   package/Config.in                              |  1 +
>   package/python-aiosqlite/Config.in             |  6 ++++++
>   package/python-aiosqlite/python-aiosqlite.hash |  5 +++++
>   package/python-aiosqlite/python-aiosqlite.mk   | 14 ++++++++++++++
>   4 files changed, 26 insertions(+)
>   create mode 100644 package/python-aiosqlite/Config.in
>   create mode 100644 package/python-aiosqlite/python-aiosqlite.hash
>   create mode 100644 package/python-aiosqlite/python-aiosqlite.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index fcc09b07c4..d24db2550e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -971,6 +971,7 @@ menu "External python modules"
>   	source "package/python-aioredis/Config.in"
>   	source "package/python-aiorwlock/Config.in"
>   	source "package/python-aiosignal/Config.in"
> +	source "package/python-aiosqlite/Config.in"
>   	source "package/python-aiozipkin/Config.in"
>   	source "package/python-alembic/Config.in"
>   	source "package/python-alsaaudio/Config.in"
> diff --git a/package/python-aiosqlite/Config.in b/package/python-aiosqlite/Config.in
> new file mode 100644
> index 0000000000..950c879a49
> --- /dev/null
> +++ b/package/python-aiosqlite/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYTHON_AIOSQLITE
> +	bool "python-aiosqlite"
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
