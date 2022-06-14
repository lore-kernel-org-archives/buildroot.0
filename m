Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7A0C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 15:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD7CA8331B;
	Tue, 14 Jun 2022 15:34:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E-ymRQC36udG; Tue, 14 Jun 2022 15:34:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C32F1832EA;
	Tue, 14 Jun 2022 15:34:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 75C921BF4D7
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 15:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6518C83281
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 15:34:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UwbMkryU_crR for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 15:34:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4953582F57
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 15:34:24 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id m20so17886641ejj.10
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 08:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=amsi+mxEDdXClI9wRE9wLDYxRBDX6dmTLySHIHi+Yp0=;
 b=Q2ra91K2tS9MMoZSdVKlQcOBV5rbihSw2R1MlG01QaoWWEZRH5DVCf4RmOq6h9OJg9
 lizEqzHaqNV8iFS5s2wZtr6n5ikIX+Kap77LqmCfItV2qygQRgzl46nP+DGacJxH2P3v
 PghRMUsOFn6k+btz55VfVHVtMdWrVVqHjIYgQZcD7afBPAR6ojszKvrVTyY5+1cs9MPG
 HCBy0eey8/vFaf5phfP/TB8c3MzOqrwAsQFeCeLelVUb7J6T4+/0KRWjcsEealIKxgud
 S5MSmWU40kA4pf6kXQMQhO6A44PyKPJDtdlUlRlT0kV8YEL28EABnHVRBDjYBt25ZXxu
 qY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=amsi+mxEDdXClI9wRE9wLDYxRBDX6dmTLySHIHi+Yp0=;
 b=2RdipoSFC1cKxIpek0X4czF9sXtBdgqGwkWLylqh8wqBHFKcVTsTUbemMvQHrBixk+
 yDHtZxzkqZsXe51JCCRPGOIbmBwspsCXPVVNM/sS0IWSTEJtSu/Mv07GXID1xB3dRErV
 US+AMF1VzCtcApFRjg/4K9FHirHVyN89gqGkvdqG2+XvezUIV4WnI+972A4O3hh6N6ps
 o2kOzsXhta2Fek8ZSX4PRLFrMpCyWlCdk12bnd9B360OCV+BQt7b2QBT5gfoszuFzxA0
 Fd0Ai36/1HixZZD702Jf3RBL+/UZPapeNwIzoshIruzTnclNLx2IsyHEhgH8HUoZx20o
 sDwg==
X-Gm-Message-State: AJIora+LpILC0uHj+I5PhGJJghzC+s6kfuoAEoczaoLY2otvAZYfShMm
 q9UgTUAruML9bK9WAHQWPAhnLg==
X-Google-Smtp-Source: ABdhPJxv4GVwZ19k0UzM11k/TkQYqZ2+wqTxBFTFTWLVkdhw37naLgY3iPbfJ+9poyQ2zeotMDcG7A==
X-Received: by 2002:a17:906:9414:b0:711:dc5b:e42e with SMTP id
 q20-20020a170906941400b00711dc5be42emr4845080ejx.514.1655220862363; 
 Tue, 14 Jun 2022 08:34:22 -0700 (PDT)
Received: from [10.1.0.138] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 h8-20020aa7c5c8000000b0042e21f8c412sm7258199eds.42.2022.06.14.08.34.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 08:34:21 -0700 (PDT)
Message-ID: <12178427-e595-be4e-5da5-d4cf1718b9e2@mind.be>
Date: Tue, 14 Jun 2022 17:34:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
References: <20220608071027.3384469-1-thomas.petazzoni@bootlin.com>
 <20220608071027.3384469-8-thomas.petazzoni@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220608071027.3384469-8-thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v2 07/14] toolchain/toolchain-external: add
 BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER option
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/06/2022 09:10, Thomas Petazzoni via buildroot wrote:
> Some external toolchains do not have gdbserver available, but the
> option BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY is always visible. And
> when enabled, this option aborts with an error when gdbserver cannot
> be found:
> 
>    Could not find gdbserver in external toolchain
> 
> Due to that, some random configurations fail to build when
> BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY=y, for example with the Bootlin
> toolchains for Microblaze or OpenRISC (because there's no GDB support
> for those architectures).
> 
> One solution could be to make "Could not find gdbserver in external
> toolchain" a warning instead of a hard error, but then nobody would
> notice about this issue, in cases where it should legitimately abort
> with a hard error.
> 
> So, the clean solution would be to add a
> BR2_TOOLCHAIN_EXTERNAL_HAS_GDBSERVER. But that means all existing
> external toolchains would have to be modified to select this option.
> 
> Instead, and as an exception, we chose to use inverted logic, and
> create an option that is the opposite:
> BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER. By default, we assume
> external toolchains have gdbserver. If
> BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER is enabled, we disallow the
> BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY option.
> 
> Note that the case of custom external toolchain does not matter: by
> definition they are not tested by the autobuilders, and by definition,
> we cannot now in menuconfig if the custom toolchain has or does not
> have gdbserver.
> 
> This will help fixing:
> 
>    http://autobuild.buildroot.net/results/6315ef7b66ee4ae8f870c92186bc674d65f62f2c/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> Note: if you want me to go with the positive logic option
> BR2_TOOLCHAIN_EXTERNAL_HAS_GDBSERVER, I'll be happy to provide the
> patches.
> ---
>   toolchain/toolchain-external/Config.in | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index 2177e6a678..1a67e5645f 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -155,9 +155,13 @@ source "toolchain/toolchain-external/toolchain-external-bootlin/Config.in.option
>   # Custom toolchains
>   source "toolchain/toolchain-external/toolchain-external-custom/Config.in.options"
>   
> +config BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
> +	bool
> +
>   config BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
>   	bool "Copy gdb server to the Target"
>   	depends on BR2_TOOLCHAIN_EXTERNAL
> +	depends on !BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER

  This could have been simplified to

	depends on BR2_PACKAGE_GDB_ARCH_SUPPORTS

but this way is more flexible so better I guess.

  Regards,
  Arnout

>   	help
>   	  Copy the gdbserver provided by the external toolchain to the
>   	  target.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
