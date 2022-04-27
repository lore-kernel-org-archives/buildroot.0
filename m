Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E182C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 07:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6FF94051D;
	Wed, 27 Apr 2022 07:10:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SHJGDsuLpGfi; Wed, 27 Apr 2022 07:10:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDB90402BC;
	Wed, 27 Apr 2022 07:10:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8CB861BF48C
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 07:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A52260E0B
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 07:10:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SYpWTIP3PLR0 for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 07:10:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3134D605A7
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 07:10:49 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id i27so1525637ejd.9
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 00:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=K6fZQfl//oGxgfzB1He5r5IXxkMxAxRmjZ90fGox3ck=;
 b=fCWghoaGzij+U+P5LdOCHIgJotSJGDSD/0ToNEvdwQnCmapCza0z8/KGONu91UATKV
 OuUEolWawwO43NZFcMk5DLcbq8pcPAZDJInx5vWPpTN7b2Kd/ojjzBDy8ZJiMkLUSHpx
 9q83oYj2K4uqy1bNpvgP2ie5wzcQ6nftL6nA0di6E3eW0qS95flLOAVSc52XcJnDx0gg
 RTMuv1UgA+cJA3ONEjCIR+GLYYe/w3rUdfHJE8YCflF7UHBZwmP1JeuSrbcF04V/KLuU
 pJDJXwvbmBctgOtRZUptaEQO+vBW+uxET9kIPSRi7F9itMGO7R4VonQIDzIsJyxMQ6mh
 zuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=K6fZQfl//oGxgfzB1He5r5IXxkMxAxRmjZ90fGox3ck=;
 b=f+vRqejwhCRh5B/zMhtkFWS0BxakerbuxSDahAq7L5NXGx4IRTm04N+lZpSn5leG1Z
 ybycRkgxZQoVjPV7mec5Ycv/StXg85J39HB2gc8iPltb6nUbutOVdMrphz8MLTzS+gGK
 aeDEOdgkw8aAYT3rYSIAEK+vzDVTCjLHLeVQormHkfMLk1XZyKmPqK/enyvAMf5yBePI
 G2y1WLiw5cwhD8F+ypqdpN0sEHGpsoaj4zHKAt9hdgcHUblEj7UTKmMC6GBE5CghhEdq
 MQCvTY1wMnJDHTlNmPbWS2wOjItfyGQRikoa7964zlpwTaIYmuDAtYQRJLzDKH2qom2H
 u2ww==
X-Gm-Message-State: AOAM533LJDrzvkP9dz12dzXH+e+LC9pH7X9cWegAm6v/2RInZ94uT5ml
 sE6i/IifivC9jSqWpTji55taYX8CRz3flQ==
X-Google-Smtp-Source: ABdhPJzzWzUXVXCaPlu7eui2HOllnU2Ge8FUMbzTCzAGvFUZghwExs0+i/vU9ciVLX5luUJIDxrOwA==
X-Received: by 2002:a17:906:49d4:b0:6d6:e5ec:9a23 with SMTP id
 w20-20020a17090649d400b006d6e5ec9a23mr25179559ejv.79.1651043447341; 
 Wed, 27 Apr 2022 00:10:47 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a170906724d00b006cedd6d7e24sm6186680ejk.119.2022.04.27.00.10.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 00:10:46 -0700 (PDT)
Message-ID: <69c6a8fb-0d05-0ae9-4c7d-b76e388f2958@mind.be>
Date: Wed, 27 Apr 2022 09:10:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220426012311.1738027-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220426012311.1738027-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pep517: migrate setup
 type to flit
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



On 26/04/2022 03:23, James Hilliard wrote:
> This package is moving to flit, we need to use flit-bootstrap
> since host-python-pypa-build depends on host-python-pep517.

  But that only becomes relevant when we bump the version to something which 
drops distutils support, right?

  Of course, we can merge this patch now already, that's not what I'm saying. 
But the commit message says "we need to" which is not entirely correct. It's 
more like "we'll have to". Right?

  Regards,
  Arnout

> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/python-pep517/python-pep517.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-pep517/python-pep517.mk b/package/python-pep517/python-pep517.mk
> index 99aa62d51d..45c4f8dd39 100644
> --- a/package/python-pep517/python-pep517.mk
> +++ b/package/python-pep517/python-pep517.mk
> @@ -9,7 +9,7 @@ PYTHON_PEP517_SOURCE = pep517-$(PYTHON_PEP517_VERSION).tar.gz
>   PYTHON_PEP517_SITE = https://files.pythonhosted.org/packages/0a/65/6e656d49c679136edfba25f25791f45ffe1ea4ae2ec1c59fe9c35e061cd1
>   PYTHON_PEP517_LICENSE = MIT
>   PYTHON_PEP517_LICENSE_FILES = LICENSE
> -PYTHON_PEP517_SETUP_TYPE = distutils
> +PYTHON_PEP517_SETUP_TYPE = flit-bootstrap
>   HOST_PYTHON_PEP517_DEPENDENCIES = host-python-tomli
>   
>   $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
