Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7253C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 18:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3211E405C2;
	Wed, 27 Apr 2022 18:52:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XVt_XZQLyHvV; Wed, 27 Apr 2022 18:52:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B8B8403A4;
	Wed, 27 Apr 2022 18:52:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 22E3F1BF322
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 189514109E
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:52:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dZiGey29HsXb for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 18:52:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2CBA440946
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 18:52:03 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id bv19so5199932ejb.6
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 11:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cIpTK3cp7hGR4LI8IM6C9J8MzPbj0sARbol/xG2Q3HI=;
 b=YGpKoGWxjb7thaKWHVNEfBJB4g9p0wZqGmdR1g5+St0z21jjUi8OHF630pLYVtCEFQ
 W+zgBKeJHgOhitKGK1DKMJlYkmZF7jide3RJDyHPP6JxVp0iNrbjbQkLeXNCD1MfnAnl
 8L/zLJ8J3VFHCJL8kEd6soe+NOnZWDgz1YUfAIvV3z50AkMemLJST/D2Qn6+SeFXmA1K
 H5aG5ziSe0hhrVF39zMRgH3m4RWxkGMQrsqMin7vO37sNRCOkUlrJyh47NyM7GNqmKhh
 H4u9iQ9gkiWnoN07XoOuMJ3OwHJ2MUt0pTVQZfDYf3olNzKahvWOzAjnqWJ90hF/Jjwa
 GT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cIpTK3cp7hGR4LI8IM6C9J8MzPbj0sARbol/xG2Q3HI=;
 b=CM+VWZ3y+jkGq09hXD+6TMQR4ilrKeqWLO9+M3TqjAHIPaNHfRC1AkvMIGs0yLZYlA
 aZ1OS/v8umPsHs6Jc/TVaXgHoq62c9yPVsGT6r67Qc9RfgGdpYbvjzYQ+4J1tUCJk6nf
 xMP0hGQWK3Ru3d/Kv4y3UOuyTIfcIZxnm75l5VFM7kc9CJLQA6r0ai3h/wONA+fmSa/4
 hm+XSf2y1dJ4iMla/RzRu27SzkmoIlG+sGyAiccfkNiTyAOdLV26EgUZbstritWwWKRd
 Ho6G/6LB0GK21oBtyuIrzkwCzCKmwFVYU9GxW14AybZr7BN9xr+BQlwCS3eQTrxfOkAO
 culA==
X-Gm-Message-State: AOAM530Y4mhMfimpOUIuUrOm58I3Us1pXnDoBwjbzeeA5sqeVZlFIDw2
 UiYQ8uk89FYk/38ahipD0+Aa0Q==
X-Google-Smtp-Source: ABdhPJw45D6NpDY1TwXW/jjtVRZkSfL3z8eTKk8Yq40a675vd6IQq2OIAIU/NKauu459KhIhVhbN5A==
X-Received: by 2002:a17:906:4795:b0:6f3:d1cc:7127 with SMTP id
 cw21-20020a170906479500b006f3d1cc7127mr2883778ejc.461.1651085522034; 
 Wed, 27 Apr 2022 11:52:02 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 w7-20020a056402070700b0042617ba63bbsm21468edx.69.2022.04.27.11.52.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 11:52:01 -0700 (PDT)
Message-ID: <3e31564d-cef4-507b-1b5f-5c4424a5c019@mind.be>
Date: Wed, 27 Apr 2022 20:52:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: TIAN Yuanhao <tianyuanhao3@163.com>, buildroot@buildroot.org
References: <20220425111148.87319-1-tianyuanhao3@163.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220425111148.87319-1-tianyuanhao3@163.com>
Subject: Re: [Buildroot] [PATCH] package/udev: move render and sgx out of
 UDEV_USERS
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/04/2022 13:11, TIAN Yuanhao wrote:
> Moved group render and group sgx into UDEV_USERS_SYSTEMD as they
> currently only appear in systemd's udev rules.
> 
> In systemd, group render was introduced since commit 4e15a73, and group
> sgx was introduced since commit c9c4899.
> 
> In eudev, group render was introduced since commit bb070c1, but was
> removed since commit a8ffcd1 [1].
> 
> [1]: https://github.com/eudev-project/eudev/issues/160
> 
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>   package/systemd/systemd.mk | 2 --
>   package/udev/udev.mk       | 7 +++++--
>   2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 58a1376b51..1f2bc108bf 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -602,8 +602,6 @@ define SYSTEMD_PERMISSIONS
>   endef
>   
>   define SYSTEMD_USERS
> -	# udev user groups
> -	# systemd user groups
>   	- - systemd-journal -1 * - - - Journal
>   	$(SYSTEMD_REMOTE_USER)
>   	$(SYSTEMD_COREDUMP_USER)
> diff --git a/package/udev/udev.mk b/package/udev/udev.mk
> index ce93d98431..40d12ad469 100644
> --- a/package/udev/udev.mk
> +++ b/package/udev/udev.mk
> @@ -4,11 +4,14 @@
>   #
>   ################################################################################
>   
> -# Required by default rules for input devices
>   define UDEV_USERS
>   	- - input -1 * - - - Input device group
> -	- - render -1 * - - - DRI rendering nodes
>   	- - kvm -1 * - - - kvm nodes
> +	$(UDEV_USERS_$(call UPPERCASE,$(call qstrip,$(BR2_PACKAGE_PROVIDES_UDEV))))

  There is really no reason to do it this way. You can simply put it in 
SYSTEMD_USERS (under the 'udev groups' comment).

  If we need additional groups for eudev, we can put them in EUDEV_USERS.

  Regards,
  Arnout

> +endef
> +
> +define UDEV_USERS_SYSTEMD
> +	- - render -1 * - - - DRI rendering nodes
>   	- - sgx -1 * - - - SGX device nodes
>   endef
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
