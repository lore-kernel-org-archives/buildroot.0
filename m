Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEC1C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 17:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8004D408A8;
	Sat, 12 Mar 2022 17:07:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R59qmCgG_nQI; Sat, 12 Mar 2022 17:07:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AD0C40867;
	Sat, 12 Mar 2022 17:07:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 76A2D1BF5F8
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73BC740867
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:07:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9znmoSM-4A6K for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 17:07:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 25E5B40866
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 17:07:16 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id c25so12381911edj.13
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 09:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=3mJt2NWwlhEHEEYAad+ksZ0FpXDiW7R23aVA2ZLZzhI=;
 b=RwGR44fr9YPhAbxTcRbfK1p4P5qqdNIOCiKls+604fx5K9TC2HtIwasj87GomDqjV2
 P9WLnJqi/Xkj+i4YAOQ/2OOrQSjk+THt+5oK0+mma+Umu3w6UMep4wedclKnmzvKA5cJ
 f0O0BkBO+yQi7sWfwPmmMdJZyeJcnmM5GQV8HBy4ABBMzYYvA7Ja/LCNZ7b2wtBxhaII
 4hVJFE3TWrpt5v13kjgnJuqQex63nNLwzMZ5ZmNyBCVuC6Jg0u0NdNZJBTaClGR8b4Rm
 Cm+rPg/XwD6uUis3ZRB6EmYb99N8YUoNTSTBdkeXAfLSLUyG3kUiFPP1h/0Yvdvv14J+
 MvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3mJt2NWwlhEHEEYAad+ksZ0FpXDiW7R23aVA2ZLZzhI=;
 b=FWTWdT7P1BMBKv2vQSP3qYLvrgXx/f9SO7q5cG6q4lOImGKbX9bfcCYRG1mNt8pkcT
 QYyySY0Ytve6i1STaOxrrvuTo4J8dbSuG6ZIh/zteXnen9z9+YL207LgCCDJCMB1k0tp
 +rq4T02oUcMkFr1JoCiqgb9lgHFSGuBlD9LwqbYi2SwbfXwnNfDYzK7AxNbkFKf6GVny
 UFWIAUOrXEEJ0IE9XgljR6vzm46l5wBdqaGsEIS5XeDf8jlhf+Li2nPnULe8WzeqN+Qi
 MwJmKv6WIrMeLeyzijtbKgzylTzbjZiVGI44cgktdgsilTr1pfk8LFfzl0tLdEn4tJ5t
 RMxw==
X-Gm-Message-State: AOAM532nJURfaWq8x5YiGJQJeq9nGi8bsPgYt6Hu5VIeJR8hNbFUbG4+
 +tVLsVNbNoYy2wVQqCG3Tof2yw==
X-Google-Smtp-Source: ABdhPJzPpHLpds5FLWqeVJThWgTzHChznnTOPNYrccLgBNA08QJgrzfWrd9VG9Ej2LmV1/TtsbJTag==
X-Received: by 2002:a50:ab53:0:b0:415:d2cc:de46 with SMTP id
 t19-20020a50ab53000000b00415d2ccde46mr13470859edc.193.1647104834390; 
 Sat, 12 Mar 2022 09:07:14 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 c26-20020aa7d61a000000b00416c75bdd88sm3089335edr.56.2022.03.12.09.07.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 09:07:14 -0800 (PST)
Message-ID: <110c08a2-a1ec-6a20-b758-66126f605338@mind.be>
Date: Sat, 12 Mar 2022 18:07:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
References: <20220222113354.2609277-1-angelo@amarulasolutions.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220222113354.2609277-1-angelo@amarulasolutions.com>
Subject: Re: [Buildroot] [PATCH] package/python-pydal: bump to version
 20220213.2
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



On 22/02/2022 12:33, Angelo Compagnucci wrote:
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pydal/python-pydal.hash | 2 +-
>   package/python-pydal/python-pydal.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/python-pydal/python-pydal.hash b/package/python-pydal/python-pydal.hash
> index eef00030bd..46271dfd91 100644
> --- a/package/python-pydal/python-pydal.hash
> +++ b/package/python-pydal/python-pydal.hash
> @@ -1,3 +1,3 @@
>   # sha256 locally computed
> -sha256  9634f34a31d4411588b73825c8acc7f73ca69ba8a665bb00d0a9b5baff69498b  python-pydal-20210626.3.tar.gz
> +sha256  40a2cafb5aa830d51ababfe34a8f8a0e3b630bc4f931f04db75ed84c3f55ea38  python-pydal-20220213.2.tar.gz
>   sha256  1f711e93f1e0c2eec576e2e60597dc2ed6f0a661e4749c6b8a39f0d4a72be468  LICENSE.txt
> diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
> index 428999f5c1..c3be683dda 100644
> --- a/package/python-pydal/python-pydal.mk
> +++ b/package/python-pydal/python-pydal.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYDAL_VERSION = 20210626.3
> +PYTHON_PYDAL_VERSION = 20220213.2
>   PYTHON_PYDAL_SITE = $(call github,web2py,pydal,v$(PYTHON_PYDAL_VERSION))
>   PYTHON_PYDAL_LICENSE = BSD-3-Clause
>   PYTHON_PYDAL_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
