Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC75C433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BE05841FA;
	Tue, 15 Mar 2022 21:50:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AqCeib5-rfuP; Tue, 15 Mar 2022 21:50:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36175841A7;
	Tue, 15 Mar 2022 21:50:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 301DC1BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E78881763
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:50:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eZT2mXCJDOa5 for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:50:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3622381445
 for <buildroot@busybox.net>; Tue, 15 Mar 2022 21:50:09 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id h13so521894ede.5
 for <buildroot@busybox.net>; Tue, 15 Mar 2022 14:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=auROqPGNQTsw6X/PnwWhu3nvTy1TcUkWy/+rNTtmVHQ=;
 b=ZFESKTDoxodIJFoCH9flDWZNs/B5pBRzxfuRObyTZFXKbiD0OyUHEeV3oxz1ijBSIY
 Rii14rbnIEDlyugdSBWCriVWL/uICERb9z4Qp/EGTurZduFGGh3Zvu7p+CyBTcpT5zW5
 yCNAXqUGWfmpeimzAnceB3elV93F2cMa45LzGwcyCvcRirPS3z73wI+LCBUzAczm12bp
 r0oOaWoH5HXB0McDAghvxu9jKgVdil+YeT5e1H87+vtn3hKkACFSvZHNGzZC2tKudRIR
 IZENzWP631ManX8n8xqBRfISoXQdVT2M+EjCIvL2diClti98qMb39w8pEzqLe4M08Sdr
 e37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=auROqPGNQTsw6X/PnwWhu3nvTy1TcUkWy/+rNTtmVHQ=;
 b=onsLnaQ2LgpQhQzUqSbVYLTzOEAYRJFEUmUI7Rr+IJPsP2C/IlueWa6htb5ya6kqRB
 pvoVw/JhPzNjcEdAUU8m/Cep8Dsjk/HwDMNSTAAPV5rudLWRWpQJQV4/O14uIx8JKy9N
 M5YgoxYt6xEbEv4H/3y5L82EMCNgIXHpku0VlPBsHoPu9q3n7hErIt5r8F+XH9629muC
 q6TPndx6Xftn83Ddi+KPW2LNJ2hRc0Gs9RHdwlO/doxYtr3NokEGB7hT6TY9Ok/MG5tV
 CMpuaaH272D0O9eINZTEBerKcOBaMW5AdavspUIyqdl1Z02e/HWbTFh2ZrfTuzi0tIgU
 6YZQ==
X-Gm-Message-State: AOAM531DsLHJETkQVqIPVSaRIY0b1TLv5cKqL1h6RkYO+4KQ55//V+1S
 bzCxO/5lTRrfI21PcCHUH3QKxQ==
X-Google-Smtp-Source: ABdhPJyNZmxCDfqTV1d0d7uXrhQbwdrVvNgxMxo/Ydh4Br2RA0XBh1nUa0BnXEYZ2nuldYVHh6d5xQ==
X-Received: by 2002:a05:6402:370b:b0:413:3bcd:3d0e with SMTP id
 ek11-20020a056402370b00b004133bcd3d0emr27225751edb.178.1647381007452; 
 Tue, 15 Mar 2022 14:50:07 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 w10-20020aa7da4a000000b004161eea5ae7sm86350eds.40.2022.03.15.14.50.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 14:50:07 -0700 (PDT)
Message-ID: <4397d658-78de-2e9a-66a5-69d339caab96@mind.be>
Date: Tue, 15 Mar 2022 22:50:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220310114201.919946-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220310114201.919946-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/nano: bump to version 6.2
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



On 10/03/2022 12:42, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/nano/nano.hash | 4 ++--
>   package/nano/nano.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/nano/nano.hash b/package/nano/nano.hash
> index 80529437d..69ebc27b7 100644
> --- a/package/nano/nano.hash
> +++ b/package/nano/nano.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after checking pgp signature
> -# https://www.nano-editor.org/dist/v6/nano-6.0.tar.xz.asc
> +# https://www.nano-editor.org/dist/v6/nano-6.2.tar.xz.asc
>   # using key BFD009061E535052AD0DF2150D28D4D2A0ACE884
> -sha256  93ac8cb68b4ad10e0aaeb80a2dd15c5bb89eb665a4844f7ad01c67efcb169ea2  nano-6.0.tar.xz
> +sha256  2bca1804bead6aaf4ad791f756e4749bb55ed860eec105a97fba864bc6a77cb3  nano-6.2.tar.xz
>   sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
> diff --git a/package/nano/nano.mk b/package/nano/nano.mk
> index 30db3249e..e3ecbab56 100644
> --- a/package/nano/nano.mk
> +++ b/package/nano/nano.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   NANO_VERSION_MAJOR = 6
> -NANO_VERSION = $(NANO_VERSION_MAJOR).0
> +NANO_VERSION = $(NANO_VERSION_MAJOR).2
>   NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
>   NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
>   NANO_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
