Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8DBC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 12:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E812A4204F;
	Sun, 12 Dec 2021 12:19:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tsHki24NxgAe; Sun, 12 Dec 2021 12:19:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4760942050;
	Sun, 12 Dec 2021 12:18:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 36EEA1BF373
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 334FE42050
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:18:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WYhnJW7b0WxQ for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 12:18:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4BA8642043
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:18:55 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id x10so26327509edd.5
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 04:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=7CeAZUCA3cPuOBSWbiBfLTXnRDA23/Qsh5tSLYrPv/A=;
 b=h++lZjxPnxzr4ng2Fm/jcle+d2SVQjDEFOZtmWzxjl2ztI+vSWxOkfUPWzq9ghBRi/
 YRrUzKwjMaInmm1sXopuKkAf0EsPgYhQk5GV3QVRHsN+eBPkD5Ln4IcsZDFoGVjgkRBG
 9jfUtvZ06LncxP+Dt2aKKlhs9EKHcNjBdI4ePxqLUZfOn2KOpXS8FuvLZZVut3TRnEWa
 uxCjwPPJdcSScob3RUrr7/bkSiZlMkmXoR0VSyzOBSqfH6YcD9dExV4exBxxq7ORFc6n
 an5ItloqAW05adN7IMeOqA2C02B25rEbr9ahSd+BAA1iaiqOKbSJq//GzGJsPffyvCS5
 UcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7CeAZUCA3cPuOBSWbiBfLTXnRDA23/Qsh5tSLYrPv/A=;
 b=5S4bvtJd6Iv2GRTqWqz77XOKBeKNElh5PnZsr50xZDe7/2VTASDTATc4+WKFszOmtx
 5BLeA9KW1UdAGDLtWzB/vwcufJ0pptnNwpNrCMGjpoWB/VYjMq/pQGfE0M9vmk/eqhTD
 y296XgHh5p1P92TMGUrl4DDN+ffQoNqxURLZeGmhwpNdqUrBQ0E169iYFBqF+6DXhwEq
 MVCsatoDJQ4b3zTBnlXcBrR9kYnLxPjTlBhGd8hBX1AYAWb+JE0cD8Eeh0dtyGEJkEMX
 bLIlwP/VfsNW4Vk8ggSmiEtGYNLWUwHHloYyQ0iKDOcda6Jc1T6rzJeXgc5BUFPkE5Nb
 HaGQ==
X-Gm-Message-State: AOAM5335Os47ef1QXqe+HTHRDhvTQQ2qafo/kzn8TqmB57reMpcGPDBC
 Vwqq0IoE5PnDO2ADgk16R1Hmyw==
X-Google-Smtp-Source: ABdhPJzpXYqsNWyhx3NI3qqcBWn5z1TX5Ra2y6oEgZwF8TceAYTRSWX6t63S05cTDosfXNIqcv9vpA==
X-Received: by 2002:a05:6402:1450:: with SMTP id
 d16mr55043043edx.144.1639311533505; 
 Sun, 12 Dec 2021 04:18:53 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id z22sm4756232edd.78.2021.12.12.04.18.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 04:18:53 -0800 (PST)
Message-ID: <01884dd0-faac-e210-f743-23ba91c261c7@mind.be>
Date: Sun, 12 Dec 2021 13:18:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211207214658.3314109-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211207214658.3314109-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/lsof: bump to version 4.94.0
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



On 07/12/2021 22:46, Fabrice Fontaine wrote:
> Update indentation in hash file (two spaces)
> 
> https://github.com/lsof-org/lsof/releases/tag/4.94.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/lsof/lsof.hash | 4 ++--
>   package/lsof/lsof.mk   | 5 +++--
>   2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/lsof/lsof.hash b/package/lsof/lsof.hash
> index c7432ffbe8..9e72023d30 100644
> --- a/package/lsof/lsof.hash
> +++ b/package/lsof/lsof.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256	3df912bd966fc24dc73ddea3e36a61d79270b21b085936a4caabca56e5b486a2	lsof-4.93.2.tar.gz
> -sha256	32a728188b19bf86917659d904ab29d0a294b4506e1c98b8b7f1c70ab4975fe1	dialects/linux/dproto.h
> +sha256  c41709c2543ecf9de1e950795790a9786a2f225e51c3cc53d6a9a256f872472b  lsof_4.94.0.linux.tar.bz2
> +sha256  32a728188b19bf86917659d904ab29d0a294b4506e1c98b8b7f1c70ab4975fe1  dialects/linux/dproto.h
> diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
> index 6aa829c2c0..ff09d64345 100644
> --- a/package/lsof/lsof.mk
> +++ b/package/lsof/lsof.mk
> @@ -4,8 +4,9 @@
>   #
>   ################################################################################
>   
> -LSOF_VERSION = 4.93.2
> -LSOF_SITE = $(call github,lsof-org,lsof,$(LSOF_VERSION))
> +LSOF_VERSION = 4.94.0
> +LSOF_SOURCE = lsof_$(LSOF_VERSION).linux.tar.bz2
> +LSOF_SITE = https://github.com/lsof-org/lsof/releases/download/$(LSOF_VERSION)
>   LSOF_LICENSE = lsof license
>   # License is repeated in each file, this is a relatively small one.
>   # It is also defined in 00README, but that contains a lot of other cruft.
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
