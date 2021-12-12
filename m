Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3215C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A45B74014E;
	Sun, 12 Dec 2021 14:10:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iG2TBq0EitqA; Sun, 12 Dec 2021 14:10:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB8EF4019A;
	Sun, 12 Dec 2021 14:10:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D3D161BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF4444019A
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:10:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v_kE-wu7EWFR for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:10:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5ACE4014E
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:10:32 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id v1so44668085edx.2
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 06:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=kJz8hJ99GYDndHWYHMl6M+NFqPoTpoIGrZQWH62cj7s=;
 b=MN681JbyNLqozY41m2Yhg8co+VpnapNswOCBEPYj4kdrZnswQKZon+vTJ3IvImLG4T
 Zlt20A2GBxxyXPkNz0+Q0Y566hvEhadwMz/ngjyjWdjefMkSmTsDqMLNDF8MsG2ZZIwV
 YkEQyt0Ew1U9jiKprK/g2ssIyOKIA5/4UBhPUKSvhegdmLnic/rkNleD9NnxuQF66NV/
 DDQ9EqUcy0Wgsk8YIOqEM9kEOCkDRjO551bFtyI7zFvrBjlal1+97jAkZd4PJjipFKce
 XiYdgqng5BrtPQuIjAT7RR9C9mT89jWg8viQnLCQCt85IX0Fa7oh4RoZ91WuhfgtLnNU
 MtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=kJz8hJ99GYDndHWYHMl6M+NFqPoTpoIGrZQWH62cj7s=;
 b=bs1U/CQjBf+nqKkR0fDZ8qlYOkDSIUnZGyQMwOImK5O1Nk77RgANT7kz01t4yjKuNy
 JsNSh8qYTMevp/k0HS8LFcD3LKHf6v705d65kPYhDyNYgoPc+FhdHbNCyQ2btgeoQKD+
 s24XmY+QbPNalH5RJdJm7JTrB4gSuExvb8KYF9wQ0FKxmlJ9WrhPqp7hlw9cdZ2nwj3N
 tCwRctSLcvIkMkz5t2mqjZZDJ2dn/gPHF8QQzQONXGIsLIeBsLHLzvwCU/5Dn3zA2oHM
 80evznelCzkWkGufXw9NSRIHdPd6FsbG7m4Sl43HSyDdWtn9ugUBwOCTeEP2HVa3LDsH
 oijg==
X-Gm-Message-State: AOAM531H3PbfMvAMp1i5iauyLHyT02VgigpHPi3JeHgv1PyooNtJ2GSA
 gJJIOIBE5KAQN4USsR5znBuCDDgt9+gqKA==
X-Google-Smtp-Source: ABdhPJwv58bDFcysYFdF/DuRZNkgzQqxURlNmH5jfv2+KL6UZsQ82UJLc5CNCE5iPxe2C84ZRZtT9A==
X-Received: by 2002:a05:6402:34c1:: with SMTP id
 w1mr54740387edc.179.1639318230953; 
 Sun, 12 Dec 2021 06:10:30 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id gt18sm4458116ejc.46.2021.12.12.06.10.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 06:10:30 -0800 (PST)
Message-ID: <7974dda2-1d7a-4af7-a266-5965ca6d2ad3@mind.be>
Date: Sun, 12 Dec 2021 15:10:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
References: <20211209220123.482608-1-angelo@amarulasolutions.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211209220123.482608-1-angelo@amarulasolutions.com>
Subject: Re: [Buildroot] [PATCH] package/python-pillow: bump to version 8.4.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/12/2021 23:01, Angelo Compagnucci wrote:
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pillow/python-pillow.hash | 4 ++--
>   package/python-pillow/python-pillow.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
> index 3b5bdf2535..d14cb5cff6 100644
> --- a/package/python-pillow/python-pillow.hash
> +++ b/package/python-pillow/python-pillow.hash
> @@ -1,6 +1,6 @@
>   # md5, sha256 from https://pypi.org/pypi/pillow/json
> -md5  a7fc550b80819eab11e01cc097913700  Pillow-8.3.2.tar.gz
> -sha256  dde3f3ed8d00c72631bc19cbfff8ad3b6215062a5eed402381ad365f82f0c18c  Pillow-8.3.2.tar.gz
> +md5  7a1eb5a250c7ccbd549a89e16404f09f  Pillow-8.4.0.tar.gz
> +sha256  b8e2f83c56e141920c39464b852de3719dfbfb6e3c99a2d8da0edf4fb33176ed  Pillow-8.4.0.tar.gz
>   
>   # Locally computed sha256 checksums
>   sha256  5bb11d96b393a698df70018069a986248021f286344c437a13f299c3daf1dfd4  LICENSE
> diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
> index 168c9d632c..5ed57c55cb 100644
> --- a/package/python-pillow/python-pillow.mk
> +++ b/package/python-pillow/python-pillow.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -PYTHON_PILLOW_VERSION = 8.3.2
> -PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/90/d4/a7c9b6c5d176654aa3dbccbfd0be4fd3a263355dc24122a5f1937bdc2689
> +PYTHON_PILLOW_VERSION = 8.4.0
> +PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/7d/2a/2fc11b54e2742db06297f7fa7f420a0e3069fdcf0e4b57dfec33f0b08622
>   PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
>   PYTHON_PILLOW_LICENSE = HPND
>   PYTHON_PILLOW_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
