Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891CFC433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 21:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C90E408ED;
	Thu, 10 Mar 2022 21:22:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jqzWjTC_IHtO; Thu, 10 Mar 2022 21:22:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00E2040360;
	Thu, 10 Mar 2022 21:22:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6FCE71BF2C1
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B123841BC
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:22:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KSovY0Bah_wv for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 21:22:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7DFCB841BB
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 21:22:27 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id yy13so14980063ejb.2
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 13:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3VveoToXRU/K/BqMg0xE/HUjLuZJYrU/4V3uGJ4uGqc=;
 b=dzlVO+dSGEtKwpG9c0dDvEK8JEleLSUy/anKBp6cxXUT1Ui7rp5+RTn0omFLcAFzO/
 PEmbGINIahHC6x8Mok1gl1PmLd0qADQvtUSFKZjzQ0f4CAsGuTuX1SCPQPOnd6I3Upnj
 YnIaBR05amYyU3qKL69x6FcaFhezo/qAYbzNUeDaWiqL5OqhM1jdIFsC7hgn9KS5xbdN
 bePFpE8yniTMLgZxr5F6BaSQUTzlyjKuPtQBAQGKngNnzI9AXVNIsMsCqBLXH+awoTo/
 rCWqmlF/E1iqOrBdFSYAqEkwnr2tg4AH0ZUlQg7VPA13eLsjYDjebU/vCcO6o7ur6CFZ
 JWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3VveoToXRU/K/BqMg0xE/HUjLuZJYrU/4V3uGJ4uGqc=;
 b=CrmEJaU6y2eEtdxOUcR6FSJvGgEzjtaCRjGJIFIqH9K5kdT9OCLoyU8vR2qKEPeP1M
 ssNkNHIXXOK+YCglZkLvWHQYprN95WlTAhsNsdsyC5htRYBEMwNfNx7/55vDva/ywpJF
 ppoytZ04m10kv3EsGiy3BZnUyglJQ7zNXDxFFqU6SdCRoFYro2FDmpX4sdb55aEljN6d
 h7bN9r1IocxFHcb/FTLulUNXWXde+FU9jJHYVdT+daMF+p06UInm8TG51KQ3Src4gWIG
 D+AUKpWOYWCMPnugp5bbTDWHjHxvVwgxDm6fo3LqQL+eLGOha2Er1UeMs9x10mjeoduM
 t1kA==
X-Gm-Message-State: AOAM532dijrBxgm3DY+TXx8+CQr7QRZZCzcaGgkU1G3vkmxBzquqKBDl
 IugqalyfAbdi4H1Fe+gHKxlHEvMEOxP++g==
X-Google-Smtp-Source: ABdhPJyiwVDHuB9UcIf4c6Ti3oxjwfyTstM2q299moTvPLtCEkXOmr9lm0OHUFQNkQIEcvuoKwboUA==
X-Received: by 2002:a17:906:a20c:b0:6ce:a87e:5013 with SMTP id
 r12-20020a170906a20c00b006cea87e5013mr5748288ejy.379.1646947345635; 
 Thu, 10 Mar 2022 13:22:25 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a170906380a00b006a68610908asm2204819ejc.24.2022.03.10.13.22.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 13:22:25 -0800 (PST)
Message-ID: <b19d5ade-2a6c-0186-2991-255340b9cb5b@mind.be>
Date: Thu, 10 Mar 2022 22:22:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220206212405.1787998-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220206212405.1787998-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt5declarative: bump to
 version 1d49a5b678957adde7e2db23a485a3f48157bc8f
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/02/2022 22:24, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/qt5/qt5declarative/qt5declarative.hash | 2 +-
>   package/qt5/qt5declarative/qt5declarative.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
> index adda7e03ba..e5b016fc20 100644
> --- a/package/qt5/qt5declarative/qt5declarative.hash
> +++ b/package/qt5/qt5declarative/qt5declarative.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  14a4b9640a2cd94771108dc3658a77c04c680f3d6444750d55e313b20774ce00  qtdeclarative-9349f3975d26632befc036fc9f2ea6e03aee2182.tar.bz2
> +sha256  afea60cbfa48f88c1f0f54b8dbbf90370f6d2535179b4ccaf489db8133ff37ea  qtdeclarative-1d49a5b678957adde7e2db23a485a3f48157bc8f.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
> index e63a78021a..54aa3be1cb 100644
> --- a/package/qt5/qt5declarative/qt5declarative.mk
> +++ b/package/qt5/qt5declarative/qt5declarative.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5DECLARATIVE_VERSION = 9349f3975d26632befc036fc9f2ea6e03aee2182
> +QT5DECLARATIVE_VERSION = 1d49a5b678957adde7e2db23a485a3f48157bc8f
>   QT5DECLARATIVE_SITE = $(QT5_SITE)/qtdeclarative/-/archive/$(QT5DECLARATIVE_VERSION)
>   QT5DECLARATIVE_SOURCE = qtdeclarative-$(QT5DECLARATIVE_VERSION).tar.bz2
>   QT5DECLARATIVE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
