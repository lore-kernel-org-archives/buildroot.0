Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04C4C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 22:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1C78818C2;
	Fri,  7 Jan 2022 22:11:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T-2yKbcryZb7; Fri,  7 Jan 2022 22:11:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B7C381775;
	Fri,  7 Jan 2022 22:11:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA52A1BF30A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 22:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B70B181775
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 22:10:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9XLtWLV6pFc5 for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 22:10:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 048C281467
 for <buildroot@busybox.net>; Fri,  7 Jan 2022 22:10:34 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 d187-20020a1c1dc4000000b003474b4b7ebcso2979535wmd.5
 for <buildroot@busybox.net>; Fri, 07 Jan 2022 14:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=OR3BlG4l24BkxIFVeMG6tmLpRJGLrlBSTIUV/k/bmT0=;
 b=Kl2J3vSfrjYiQyFCbtt2+nbhu0M2XuhHpgjO9PGxW1YRdLyG/SIJfkt9L0VvyO+fQE
 CGXPxTT7Uu1/1d9/JkgYa9e+bpVZzdwA3PdynUdlQWpV0vS7rfmYkB+Ui6NnFgTIwmlS
 MlD89XtC8YL6w96TXKEPZPWGfPIfjjHkumrjVQSHKpommRLKgV3+9Dbo0R646JLnc1cN
 1SJHxjtPEFWm0EAzHsHgXUv2bvoQyVYkcIuBaoPladio4TyQyvfgd1SXry9A9uzeiaQw
 Ee35lOuiVdH2mbUxt80uSWHzNIB+v8q1E27pN7bSHc1SC1pR5HbnHiir+cdkzjlNhEgW
 Tlug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=OR3BlG4l24BkxIFVeMG6tmLpRJGLrlBSTIUV/k/bmT0=;
 b=3IW6/KqFFUMVOG3QMQBe5sJHZd3CUd2BtFR3KOHy4PxFJleM7Z2Qb9K5XHtcDSEARp
 3HStzvfmX2c+Dgkjs513xUECgZD2dS7RuKlOEt9MRRMo144tjeGMli96UHZB020IHIIR
 7679/RfODj0astXcbhTzaLaQ274vLTCG9cy1fbIWOKISjKgQYKAq6obb08nYAVxlV2w7
 gw/q2yt7gCHEJlfLxLSZ2ACJHt8jl4Xy1tTYIWSBFeyWrq8CQwMhSLAaTkORo/hVV3PX
 EM2mZyiw60GhSbyq8PtBeANwQbjFhqt8zS1w8SbCiQXS7Zf0RWZiIfiNSs8ifBuJH5w/
 4lOw==
X-Gm-Message-State: AOAM530k5WJmR8R1uySchJeEsWcWRfdQ7vCpWHeC3tkZ8JgEBlOR9gY7
 8fOagFP0G/GPVcLXEWBTQ9n+qA==
X-Google-Smtp-Source: ABdhPJw3xN3uJs/+zCh7tuf+WftoOaQBQc0VCe1EAQa9Fn0gSlDhkOcLRHkbcQQEmzRPfhJzAiFHHg==
X-Received: by 2002:a05:600c:3388:: with SMTP id
 o8mr9911198wmp.145.1641593433348; 
 Fri, 07 Jan 2022 14:10:33 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id c8sm6258023wmq.34.2022.01.07.14.10.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 14:10:33 -0800 (PST)
Message-ID: <4f884b01-32c1-5469-b650-2e80a5934989@mind.be>
Date: Fri, 7 Jan 2022 23:10:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: guillaume.bressaix@gmail.com, buildroot@busybox.net
References: <cae0c1b2-34bb-b1a9-f02a-9e98ddd9fbe5@ideasonboard.com>
 <20220104123901.23929-1-guillaume.bressaix@gmail.com>
 <20220104123901.23929-2-guillaume.bressaix@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220104123901.23929-2-guillaume.bressaix@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 2/3] package/python-pybind: bump to
 version 2.8.1
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
Cc: tomi.valkeinen@ideasonboard.com, yann.morin.1998@free.fr
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/01/2022 13:39, guillaume.bressaix@gmail.com wrote:
> From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
> 
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>

  I bumped to 2.9.0 instead and applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pybind/python-pybind.hash | 2 +-
>   package/python-pybind/python-pybind.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/python-pybind/python-pybind.hash b/package/python-pybind/python-pybind.hash
> index a68ac846e2..e1d86a4494 100644
> --- a/package/python-pybind/python-pybind.hash
> +++ b/package/python-pybind/python-pybind.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated
> -sha256  cdbe326d357f18b83d10322ba202d69f11b2f49e2d87ade0dc2be0c5c34f8e2a  python-pybind-2.6.1.tar.gz
> +sha256  f1bcc07caa568eb312411dde5308b1e250bd0e1bc020fae855bf9f43209940cc  python-pybind-2.8.1.tar.gz
>   # License files, locally calculated
>   sha256  83965b843b98f670d3a85bd041ed4b372c8ec50d7b4a5995a83ac697ba675dcb  LICENSE
> diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
> index 442ed3328f..cf6a642922 100644
> --- a/package/python-pybind/python-pybind.mk
> +++ b/package/python-pybind/python-pybind.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYBIND_VERSION = 2.6.1
> +PYTHON_PYBIND_VERSION = 2.8.1
>   PYTHON_PYBIND_SITE = $(call github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))
>   PYTHON_PYBIND_LICENSE = BSD-3-Clause
>   PYTHON_PYBIND_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
