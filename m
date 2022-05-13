Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95478C433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 21:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36E4C41529;
	Fri, 13 May 2022 21:58:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S3vG58JNHZHW; Fri, 13 May 2022 21:58:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6EBE40861;
	Fri, 13 May 2022 21:58:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8A2361BF5A8
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86E3A40861
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:58:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w_-WpiEdFYmF for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 21:58:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F5584043D
 for <buildroot@buildroot.org>; Fri, 13 May 2022 21:58:41 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id s11so7644057edy.6
 for <buildroot@buildroot.org>; Fri, 13 May 2022 14:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=y/CwUFpsoXuIahmK9GYajTdDnn3gnbnrVSaXUpUBB+g=;
 b=MAJkTnu4SPE1Z3wy0aiYaJt8p769FbAQ+mct1UKTbKi04/tQ1gB6GQjQQApunq4Xfh
 T24mCo3MnoAOFbB4DGwbVDoXLPhhfdMmJmGMBno+UGZaTWyS7f5+50q7EjWL5itZlKFo
 OkFphksLxHNK8/+aqYdbiH7zUunW+eUk4BrK4lwNZwyNvOQQlq4LRUF4nIruPSz7SdQ0
 BVjytWGygnIEXO3efry16y512enV6QtmDGQuw7W0Hdbt/DcsLJr+z243SoiZmmOo1Swj
 KTI4Vq1vCCox0yqGWsMpDVo3p2MEPHBhTREUnk9n7fap3p9rg/NOO2iXBoa4/mAg3yZe
 aggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=y/CwUFpsoXuIahmK9GYajTdDnn3gnbnrVSaXUpUBB+g=;
 b=YhlKnSEApDW/iESubiDPpHz90qPgz1SvArwlHpI9pus1QNXkqx7Ho2pHvXqOtYAyZ/
 JpWmDmNQur8M3Fg/hTQtogoz3v+o7ddp6fky7ucuFBA2yThJRPogZWf3KyKTebHP26TP
 c9O5H5JniIdyKfH/dYjJKhB17naPyI9H+j9owXBXwzUvu6ucUQCgRpG/G9cEylBkLs30
 T6LoyLkncbnjWTymXlt2AzHqB10p/CzmTKoZ+eUnouBTRn1ygnxBN7OnIsLc07/x6fuj
 BwtuNp1RgDxkIyyBNnh+GnkmoUHmovL3szA2hcCyv97xYrbRb5xVEaTtr75oITkhK08W
 4Azw==
X-Gm-Message-State: AOAM532eGdt0M85e1j57cvZF5B9Hy/19i1Lbb0NzzkzCss8MqmAGXEi7
 qfGtifSfIFPinWB7ElK8Omnl2TAg1AlpjA==
X-Google-Smtp-Source: ABdhPJxexlKrht5+E3oya6L8z3X4wY1zrzd3gibmMl8DzN7rbVpIFcOUGG4EHq/purIKxxJGUX+keg==
X-Received: by 2002:a50:f14e:0:b0:427:efb9:1bbb with SMTP id
 z14-20020a50f14e000000b00427efb91bbbmr736415edl.322.1652479119591; 
 Fri, 13 May 2022 14:58:39 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a170907272200b006f3ef214dbcsm1176017ejl.34.2022.05.13.14.58.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 14:58:39 -0700 (PDT)
Message-ID: <cc30e61a-025f-5a1f-8b3f-e95fc4d86355@mind.be>
Date: Fri, 13 May 2022 23:58:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220509013830.1862343-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220509013830.1862343-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-jinja2: bump to version
 3.1.2
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/05/2022 03:38, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-jinja2/python-jinja2.hash | 4 ++--
>   package/python-jinja2/python-jinja2.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-jinja2/python-jinja2.hash b/package/python-jinja2/python-jinja2.hash
> index ea7fe71a35..2ab343cce6 100644
> --- a/package/python-jinja2/python-jinja2.hash
> +++ b/package/python-jinja2/python-jinja2.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/jinja2/json
> -md5  b76ae2f0647abebc81e7c03f5fb7b00f  Jinja2-3.0.3.tar.gz
> -sha256  611bb273cd68f3b993fabdc4064fc858c5b47a973cb5aa7999ec1ba405c87cd7  Jinja2-3.0.3.tar.gz
> +md5  d31148abd89c1df1cdb077a55db27d02  Jinja2-3.1.2.tar.gz
> +sha256  31351a702a408a9e7595a8fc6150fc3f43bb6bf7e319770cbc0db9df9437e852  Jinja2-3.1.2.tar.gz
>   # Locally computed sha256 checksums
>   sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.rst
> diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
> index 0503984bef..209ca2e25a 100644
> --- a/package/python-jinja2/python-jinja2.mk
> +++ b/package/python-jinja2/python-jinja2.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_JINJA2_VERSION = 3.0.3
> +PYTHON_JINJA2_VERSION = 3.1.2
>   PYTHON_JINJA2_SOURCE = Jinja2-$(PYTHON_JINJA2_VERSION).tar.gz
> -PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/91/a5/429efc6246119e1e3fbf562c00187d04e83e54619249eb732bb423efa6c6
> +PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/7a/ff/75c28576a1d900e87eb6335b063fab47a8ef3c8b4d88524c4bf78f670cce
>   PYTHON_JINJA2_SETUP_TYPE = setuptools
>   PYTHON_JINJA2_LICENSE = BSD-3-Clause
>   PYTHON_JINJA2_LICENSE_FILES = LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
