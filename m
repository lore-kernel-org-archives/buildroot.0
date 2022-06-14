Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BB6C43334
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 18:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 069AC40B2B;
	Tue, 14 Jun 2022 18:48:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EIv9awi008Yt; Tue, 14 Jun 2022 18:48:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04A9940B0B;
	Tue, 14 Jun 2022 18:48:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 382951BF306
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2752E60A78
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:48:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EybaMDDPaCGx for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 18:48:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46EFE6068A
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 18:48:08 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id eo8so4697217edb.0
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 11:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=JGVGRlFIc344HLHxazzmGVletMD+idBAHppjg7bE8dY=;
 b=JeGX0FZtWiHs78h66sy/6JgEeRkdOntIddVkPhCKU4EJHswW/NmT+eYVAdcWwDrBii
 Cpicprfz3A4zj46Cko2Y0anth+FPRZYzAUxX3LTjfwKdhZwiZFKOFzvzZ7dDudtCupGW
 KYFEQ/+pegwqSNZ6I02F44a0VmW0kPJqLgb3lIVM356k7sLFcsXs9IqiOfgdmY6LDJ71
 vI/ePEKx3EDKC7xYSphdY/vZUPHpiuvdQt63GoAvEv+iRmEHUN4AoEfMjeYR8Sn89EYb
 c82TBiWP0TNHRTbTmUlvOq4A7LJow6YIN2GqJtc7vJGgKAYQN6XWBtUG0hxegQjNu8oR
 +Zsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JGVGRlFIc344HLHxazzmGVletMD+idBAHppjg7bE8dY=;
 b=cR2NAag0eTQw6DqPf2ZUvROlyDby54ReaZjzNqcXopjRpsI+6XShbcIkkM2JUSNgx1
 qXp9/CwdbSf4w0Rb7hcA3aiiqPFc7HoKNRdUVUPJcOCpH8aCIDgqw8GOsJbvBok2ybP6
 qAUn6fECbeKgoSTyhWGK1RtAuWDKVMaC2I8NonZkrOh1YU899J4QjjclPv2N2hg7L2zp
 Boa5bm4VsKBBRURCSYrDrJ9DNwCL0gTKSWaWMlBelTwybaT2uRmlnuCX2lfDahrJSyHc
 3XdoFqjhAafBjZ8eAuEjaTO82DCY7X4PmRfycc8FOugVgM9e3RpUJhQebtRPAp5fX5yX
 jeUw==
X-Gm-Message-State: AOAM5314nS5hgByPJsNvhlGJGI8k0kx+QU1C+dIQoK0fpzIZdo73aa9M
 n+mxsmY2FS+13AYJKyHZFWTjWg==
X-Google-Smtp-Source: AGRyM1uvNfQ+RqQx7Mp/jYSjJ3cl7QIROqzicRPLPLmHrbqy3Ia82CIHquqsNoLhJ0w9Z9bEkP+2hg==
X-Received: by 2002:a05:6402:2211:b0:42d:cb9e:cbf with SMTP id
 cq17-20020a056402221100b0042dcb9e0cbfmr7867427edb.76.1655232486562; 
 Tue, 14 Jun 2022 11:48:06 -0700 (PDT)
Received: from [10.1.0.138] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 w4-20020a17090652c400b006f3ef214dc0sm5377762ejn.38.2022.06.14.11.48.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 11:48:06 -0700 (PDT)
Message-ID: <8e080aee-ded6-8df1-ab45-888a05fa3ee5@mind.be>
Date: Tue, 14 Jun 2022 20:48:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220611172347.2956493-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220611172347.2956493-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/gptfdisk: bump version to 1.0.9
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



On 11/06/2022 19:23, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/gptfdisk/gptfdisk.hash | 6 +++---
>   package/gptfdisk/gptfdisk.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/gptfdisk/gptfdisk.hash b/package/gptfdisk/gptfdisk.hash
> index caded358ec..0b98677afb 100644
> --- a/package/gptfdisk/gptfdisk.hash
> +++ b/package/gptfdisk/gptfdisk.hash
> @@ -1,5 +1,5 @@
> -# From http://sourceforge.net/projects/gptfdisk/files/gptfdisk/1.0.8/
> -sha1  c8824e779056158fa32887e415f5399a8646c3c5  gptfdisk-1.0.8.tar.gz
> +# From http://sourceforge.net/projects/gptfdisk/files/gptfdisk/1.0.9/
> +sha1  284bd000edaf7874b472bd01719c6a71a8030e13  gptfdisk-1.0.9.tar.gz
>   # Locally computed
> -sha256  95d19856f004dabc4b8c342b2612e8d0a9eebdd52004297188369f152e9dc6df  gptfdisk-1.0.8.tar.gz
> +sha256  dafead2693faeb8e8b97832b23407f6ed5b3219bc1784f482dd855774e2d50c2  gptfdisk-1.0.9.tar.gz
>   sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
> diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
> index 9869975f51..0df9cda08f 100644
> --- a/package/gptfdisk/gptfdisk.mk
> +++ b/package/gptfdisk/gptfdisk.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -GPTFDISK_VERSION = 1.0.8
> +GPTFDISK_VERSION = 1.0.9
>   GPTFDISK_SITE = http://downloads.sourceforge.net/sourceforge/gptfdisk
>   GPTFDISK_LICENSE = GPL-2.0+
>   GPTFDISK_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
