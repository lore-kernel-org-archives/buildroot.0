Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FC4C433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 17:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DD324032A;
	Sat, 30 Apr 2022 17:57:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PecgzpHVH3ye; Sat, 30 Apr 2022 17:57:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8249440148;
	Sat, 30 Apr 2022 17:57:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 902971BF94B
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 17:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E1CD60899
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 17:57:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cu01e5g_PPxI for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 17:57:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4DD4560687
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 17:57:08 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id l18so20885805ejc.7
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 10:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=eL1XSr67bM2Ml0C5t8DQQ+J9SNDPsW6XdQi+E4W8p+s=;
 b=QTplwDuyNh/nbPtiTi+MraCl5clnpOX0a9JNaNCb+pNLAO+/h2AYohPrCO8ueaI5cp
 EoCtfUkyiRs/uAOuKY+Ug/YdbAoi7EXxqOFo59Zci/bvOUVHKmEpVHNAystJ3er6fclz
 fsAkEKLAWXqm7uzKFgH4jcZO8iOtNc+hSqdSl0vIA6RjcmOa5+6X2+iu6xiRoEviL2GX
 bsWR4AqdeSSi+IKhZBO3wK0hpEf76nmWz6C4P8tNvK+lHY/rPyIOKi+EqQK5XySydyiD
 HtsQELI2qgcFCn6+3qAkbJlZTtfR++jvwhaYC97Tx+vKZ9MHN5KBqsmH9npsr4fHmj1Z
 OPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=eL1XSr67bM2Ml0C5t8DQQ+J9SNDPsW6XdQi+E4W8p+s=;
 b=E/hhixyAFhk6tRuK+EbKubk/R8r/dmqoYnN01j7HyvojIGmONt+kt5s/c9N6kwhpdp
 LkWh+qqMZoo3Tm4IBh0pw0UGQAXzavtEjYpo8l61DOMZKhhhElD0Jr6PX4wYfL263pXO
 g00xpyJAteEeMhYRtnH079CgqqbZX0iW45d9ZeZwSv28b/MRcyiriAHKJyS9ox2ZwdRa
 7NnbWxW9JGfAxPrVKM06ZRkWt9kQJJxdXSAlh7RF1Eo+0TAxke/kCoGC7UdpZVQ8CTNy
 MsaCpcOb8MgZ1vFanAhTPZ3oGSgdFGoDwLsgFZU1WzU3HD2pjY2bph8dlfL6GE1eHTbd
 /aUg==
X-Gm-Message-State: AOAM532tBRZaz8a7Ggr1674Ec4v6AAua4/Lpu/T6LbojhmEvz7TdxDic
 z4A2jukdQsJ8q81sGHYg+1/sMw==
X-Google-Smtp-Source: ABdhPJyzHG20bpvJN0JYy6q+omWGs0EvovmjzTNakXvHt51qm7pk1YjKe5F1j704dZQc09kCbYNMfw==
X-Received: by 2002:a17:907:9621:b0:6d7:355d:6da5 with SMTP id
 gb33-20020a170907962100b006d7355d6da5mr4536282ejc.195.1651341426294; 
 Sat, 30 Apr 2022 10:57:06 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 my11-20020a1709065a4b00b006f3ef214e28sm1236292ejc.142.2022.04.30.10.57.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 10:57:05 -0700 (PDT)
Message-ID: <bd76474e-7711-7bc2-83b8-5babd021cc39@mind.be>
Date: Sat, 30 Apr 2022 19:57:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Francis Laniel <flaniel@linux.microsoft.com>, buildroot@buildroot.org
References: <20220425164319.24788-1-flaniel@linux.microsoft.com>
 <20220425164319.24788-2-flaniel@linux.microsoft.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220425164319.24788-2-flaniel@linux.microsoft.com>
Subject: Re: [Buildroot] [RFC PATCH v4 1/2] falcosecurity-libs: add new
 package
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/04/2022 18:43, Francis Laniel wrote:
> Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>

  I've added a bit of explanation both in the commit message and in the .mk file 
itself that we're not building the userspace components and why.

> ---
>   DEVELOPERS                                    |  1 +
>   package/Config.in                             |  1 +
>   ...cmake-Permit-setting-GRPC_CPP_PLUGIN.patch | 34 ++++++++
>   package/falcosecurity-libs/Config.in          | 30 +++++++
>   .../falcosecurity-libs.hash                   |  5 ++
>   .../falcosecurity-libs/falcosecurity-libs.mk  | 80 +++++++++++++++++++
>   6 files changed, 151 insertions(+)
>   create mode 100644 package/falcosecurity-libs/0001-cmake-Permit-setting-GRPC_CPP_PLUGIN.patch
>   create mode 100644 package/falcosecurity-libs/Config.in
>   create mode 100644 package/falcosecurity-libs/falcosecurity-libs.hash
>   create mode 100644 package/falcosecurity-libs/falcosecurity-libs.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index ca9decb58f..d45d3d2a7b 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -969,6 +969,7 @@ F:	package/ipmitool/
>   F:	package/odhcploc/
>   
>   N:	Francis Laniel <flaniel@linux.microsoft.com>
> +F:	package/falcosecurity-libs
>   F:	package/pahole/
>   F:	package/sysdig/
>   F:	package/tbb/
> diff --git a/package/Config.in b/package/Config.in
> index 24f7af5ea8..3070094cc0 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1935,6 +1935,7 @@ menu "Other"
>   	source "package/eigen/Config.in"
>   	source "package/elfutils/Config.in"
>   	source "package/ell/Config.in"
> +	source "package/falcosecurity-libs/Config.in"
>   	source "package/fftw/Config.in"
>   	source "package/flann/Config.in"
>   	source "package/flatbuffers/Config.in"
> diff --git a/package/falcosecurity-libs/0001-cmake-Permit-setting-GRPC_CPP_PLUGIN.patch b/package/falcosecurity-libs/0001-cmake-Permit-setting-GRPC_CPP_PLUGIN.patch
> new file mode 100644
> index 0000000000..6141d8ef72
> --- /dev/null
> +++ b/package/falcosecurity-libs/0001-cmake-Permit-setting-GRPC_CPP_PLUGIN.patch
> @@ -0,0 +1,34 @@
> +From 2e8a50cd4975df3ab60ee07c9675831cd5ad397f Mon Sep 17 00:00:00 2001
> +From: Francis Laniel <flaniel@linux.microsoft.com>
> +Date: Tue, 12 Apr 2022 19:54:11 +0100
> +Subject: [PATCH] cmake: Permit setting GRPC_CPP_PLUGIN.
> +
> +This patch enables users to set GRPC_CPP_PLUGIN while calling cmake with:
> +cmake -DGRPC_CPP_PLUGIN=/path
> +
> +Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>

  Could you send this patch upstream?


  Applied to master, thanks.

  Regards,
  Arnout

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
