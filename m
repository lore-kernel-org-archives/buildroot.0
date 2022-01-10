Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E35C433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 07:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8128400BF;
	Mon, 10 Jan 2022 07:21:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EE_vMKvSwkFB; Mon, 10 Jan 2022 07:21:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A56C44031D;
	Mon, 10 Jan 2022 07:21:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 592A11BF97F
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4847E408F3
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:21:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kdLKKIhUFNoi for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 07:21:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 788EA408E8
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 07:21:28 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 o203-20020a1ca5d4000000b003477d032384so5058718wme.2
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 23:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZY8zjUs4BHmv/zMusku97grbr55NHrDTvOs3bnu3u00=;
 b=b+vo5FSFucsV0YdmtcQgwZjm8BXlSgFMrQxQRquOarpIkAMhk9X6oab7jK/vkYNGz9
 rXXXcPz3ix08q53quS3w6SZgDq7T2sfLD+8aqfuzevh50giM9wBRSSxIO2F+jvaq6xpz
 Ljwq+67gXNIgOHSldSTDJpgnxqTSxLvB5mfTJ+HTf+I2di1S307naQhUzwW41MFYMuZW
 Yn6Sb7ianA7U2n7jQmO6kI2i0+yiXM7LTIdX5uYCdN5yeivLBwDYEnW7MmXTex41UJfB
 1ZjdrolyDGPZ8adwFN+bDxmjCmaklGCw/YIjc2NJlJ0p9V5kIqU2w5stJU1CM6nlgWzo
 Ipmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZY8zjUs4BHmv/zMusku97grbr55NHrDTvOs3bnu3u00=;
 b=MH2LRhpSkShtxnsgJNcso0ybaMfoJXmbEfEKnH0rp26pmLPUYFvJB2Z8CwMd8geetw
 zUrMoaCM2HP1sd7ofyfEB8bgO82yDckaUqYonl4TmpGAP4n9sCb2EUFSqIjDMIacmccC
 Arm5CFfwVbCtmeHl0Urt4Dv+0M+HuSSWcQNMmRjEO3XvHg4qVcFVD649S5VXupTEqtIc
 W99FRJ3Ai4d4qYdkIpyIV5g8lCv9OWJqGIzic0uxqeOjNBAe6Iv43QW73KbToWepDlGY
 LL8v+069rT82Bwg+UQ53Bh8HcxeQiVQPFWJKgsUlhl4q1jWrIYwL3EPrhmeNA8tL7Gmf
 mS0Q==
X-Gm-Message-State: AOAM5321pXiawI6HobkRtLe+I1mo6IHr3dxzsHP9Gzr2yaj4sfJyU4DQ
 DZsZ+FYio5qWF65JJvf4y1GWfQ==
X-Google-Smtp-Source: ABdhPJwmWJEahLEbJKCamoknIO+9WwslVGedQAF0TRz/eC+48lgPbinY9ot8vID5kaiRnEOrUOQqcw==
X-Received: by 2002:a05:600c:4f94:: with SMTP id
 n20mr20720905wmq.64.1641799286757; 
 Sun, 09 Jan 2022 23:21:26 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id g5sm6206666wrd.100.2022.01.09.23.21.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 23:21:26 -0800 (PST)
Message-ID: <83376eb4-465e-c603-b989-26b0684520b2@mind.be>
Date: Mon, 10 Jan 2022 08:21:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220110062327.1302104-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220110062327.1302104-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyparsing: bump to
 version 3.0.6
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/01/2022 07:23, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pyparsing/python-pyparsing.hash | 4 ++--
>   package/python-pyparsing/python-pyparsing.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pyparsing/python-pyparsing.hash b/package/python-pyparsing/python-pyparsing.hash
> index 2c52ff0843..a21baf46e5 100644
> --- a/package/python-pyparsing/python-pyparsing.hash
> +++ b/package/python-pyparsing/python-pyparsing.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/pyparsing/json
> -md5  f0953e47a0112f7a65aec2305ffdf7b4  pyparsing-2.4.7.tar.gz
> -sha256  c203ec8783bf771a155b207279b9bccb8dea02d8f0c9e5f8ead507bc3246ecc1  pyparsing-2.4.7.tar.gz
> +md5  2f5fad6c8e99ac2562ab08ad9e45b195  pyparsing-3.0.6.tar.gz
> +sha256  d9bdec0013ef1eb5a84ab39a3b3868911598afa494f5faa038647101504e2b81  pyparsing-3.0.6.tar.gz
>   # Locally computed sha256 checksums
>   sha256  10d5120a16805804ffda8b688c220bfb4e8f39741b57320604d455a309e01972  LICENSE
> diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
> index 5741458d65..b6ab353a6d 100644
> --- a/package/python-pyparsing/python-pyparsing.mk
> +++ b/package/python-pyparsing/python-pyparsing.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYPARSING_VERSION = 2.4.7
> +PYTHON_PYPARSING_VERSION = 3.0.6
>   PYTHON_PYPARSING_SOURCE = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
> -PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/c1/47/dfc9c342c9842bbe0036c7f763d2d6686bcf5eb1808ba3e170afdb282210
> +PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/ab/61/1a1613e3dcca483a7aa9d446cb4614e6425eb853b90db131c305bd9674cb
>   PYTHON_PYPARSING_LICENSE = MIT
>   PYTHON_PYPARSING_LICENSE_FILES = LICENSE
>   PYTHON_PYPARSING_SETUP_TYPE = setuptools
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
