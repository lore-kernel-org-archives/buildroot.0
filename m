Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60BDC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 17:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 996F6400BD;
	Sat,  4 Nov 2023 17:59:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 996F6400BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LQAc2O1t2Cch; Sat,  4 Nov 2023 17:59:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D7C74014D;
	Sat,  4 Nov 2023 17:59:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D7C74014D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9EDC51BF21A
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DDF541C4E
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:59:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DDF541C4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zfRZPu4pFsMb for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 17:59:05 +0000 (UTC)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6DBF741C46
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 17:59:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DBF741C46
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9d267605ceeso457374166b.2
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 10:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699120743; x=1699725543;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DZRjA9+KEpTu7kU/iSJ1sy5r9G1aUAtQ+ngD+p6JZE0=;
 b=gxLVktsGqtG4Nbq8ogOxAar9toUVr8Fsuu5E8JeYeAZsUfaBIY3+d3EnYYhgIhkfYO
 nZi33iyz5ifZ0iOH6zEaeCwMNuqYXaGGxXZWSiVDUEDA5ZGbE6HYgfv0MoEwm0nyAGUf
 9zH89oA35NBTLwajY83c4R/rCaOLVIyRJ849qJiv0ka7YPbt4tnUdTsaQx4SWOLu9dHi
 eSNr1Tnw7ZZkWpCV1wU1sv1VYlfKUOuj4AXnhMJBmF4Np5opkZJb91a3Nx++tLCsIni2
 qRuuTUKEwFcpTxyQJfTc2WuylDnrZf6GwOm4L6sccBuqYjz5/T2Qf9hggpTPQNRAHyUl
 6yuw==
X-Gm-Message-State: AOJu0Yy51z96ag9KP2SvDf0Fd7xptSX46xPvJ6dLLWj21HY1rT5g5D0w
 dnHhj8pi1H3A6e5TwLQ/AxuweA==
X-Google-Smtp-Source: AGHT+IEbNk9du/iss55dINuW0e+rfoZBRs6FZtrSG2CIx/zV4Vv1XB+goLPyZSEAXjqHiJ0RGGzomg==
X-Received: by 2002:a17:907:60d5:b0:9c7:4d51:af26 with SMTP id
 hv21-20020a17090760d500b009c74d51af26mr10508061ejc.65.1699120743477; 
 Sat, 04 Nov 2023 10:59:03 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 si29-20020a170906cedd00b009928b4e3b9fsm2182925ejb.114.2023.11.04.10.59.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Nov 2023 10:59:03 -0700 (PDT)
Message-ID: <c8d0027d-7754-43da-beb8-670bdb78403b@mind.be>
Date: Sat, 4 Nov 2023 18:59:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
 <20231026092701.12345-18-adam.duskett@amarulasolutions.com>
In-Reply-To: <20231026092701.12345-18-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699120743; x=1699725543; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DZRjA9+KEpTu7kU/iSJ1sy5r9G1aUAtQ+ngD+p6JZE0=;
 b=T4piaqnh9mvcTsCoKX8plpQ3PKzezuRhciZX8Emx68NEzu0jmUwRttiuDnf+T4U3Cz
 VK8xcLY0/wQwaAl9yCNgVuZszQkkcT0cAdMsGPOnPX3L0oG1Qdcw5lNAM3EXmzGjesyp
 JkfKkO07QKiXr0MrEFLQAOKll08EcmalFBDtwE+BCmxL8ZhZStD3EM9aUljyCYoYTT0+
 aM97Q6ONNIvxmc5OrvLHNoKBwIbMonvQeEvKJiRCBmLEZ7fd63565R34XjUryZVge5rE
 hsWjMwUZrDJhbh+bVNqBWT67231S8BqQEQ7xmio+sPxAPU09X+oP6+M1Mmu9eJ94VdSg
 ty3g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=T4piaqnh
Subject: Re: [Buildroot] [PATCH 17/30] package/python-systemd: bump version
 to 235
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/10/2023 11:26, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>   package/python-systemd/python-systemd.hash | 4 ++--
>   package/python-systemd/python-systemd.mk   | 6 +++---
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-systemd/python-systemd.hash b/package/python-systemd/python-systemd.hash
> index 789b48590d..6cc6639218 100644
> --- a/package/python-systemd/python-systemd.hash
> +++ b/package/python-systemd/python-systemd.hash
> @@ -1,5 +1,5 @@
>   # md5 from https://pypi.python.org/pypi/systemd-python/
> -md5  5071ea5bcb976186e92a3f5e75df221d  systemd-python-234.tar.gz
> +md5  93f3ca09f35719ca6a4edd1d62d38dd4  systemd-python-235.tar.gz
>   # Locally computed
> -sha256  fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895db83e7  systemd-python-234.tar.gz
> +sha256  4e57f39797fd5d9e2d22b8806a252d7c0106c936039d1e71c8c6b8008e695c0a  systemd-python-235.tar.gz
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.txt
> diff --git a/package/python-systemd/python-systemd.mk b/package/python-systemd/python-systemd.mk
> index 3ccfd57ce5..24ba84df76 100644
> --- a/package/python-systemd/python-systemd.mk
> +++ b/package/python-systemd/python-systemd.mk
> @@ -4,10 +4,10 @@
>   #
>   ################################################################################
>   
> -PYTHON_SYSTEMD_VERSION = 234 # Should be kept in sync with $(SYSTEMD_VERSION)
> +PYTHON_SYSTEMD_VERSION = 235 # Should be kept in sync with $(SYSTEMD_VERSION)

  SYSTEMD_VERSION is 254.5, not 235... What gives?

  (We should anyway probably put that comment in systemd.mk, not so much here...)

  Regards,
  Arnout

>   PYTHON_SYSTEMD_SOURCE = systemd-python-$(PYTHON_SYSTEMD_VERSION).tar.gz
> -PYTHON_SYSTEMD_SITE = https://pypi.python.org/packages/e8/a8/00ba0f605837a8f69523e6c3a4fb14675a6430c163f836540129c50b3aef
> -PYTHON_SYSTEMD_SETUP_TYPE = distutils
> +PYTHON_SYSTEMD_SITE = https://files.pythonhosted.org/packages/10/9e/ab4458e00367223bda2dd7ccf0849a72235ee3e29b36dce732685d9b7ad9
> +PYTHON_SYSTEMD_SETUP_TYPE = setuptools
>   PYTHON_SYSTEMD_LICENSE = LGPL-2.1
>   PYTHON_SYSTEMD_LICENSE_FILES = LICENSE.txt
>   PYTHON_SYSTEMD_DEPENDENCIES = systemd # To be able to link against libsystemd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
