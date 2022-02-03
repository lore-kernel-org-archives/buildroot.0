Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA92C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 20:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07AB583F20;
	Thu,  3 Feb 2022 20:37:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FmL5bv1yIrSU; Thu,  3 Feb 2022 20:37:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 552C583EB7;
	Thu,  3 Feb 2022 20:37:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF89A1BF38D
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 20:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9828B401DD
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 20:37:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aOYfuZ1x-DC3 for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 20:37:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73E2A405C8
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 20:37:52 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id w20so4622800edc.1
 for <buildroot@buildroot.org>; Thu, 03 Feb 2022 12:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=EPzeJ84G/ayTIt+hNFp/fgWfD+HxO3dxoEMSVCbr1yQ=;
 b=D6nhqfknu+2RsqgHGLWtL392gNPEGL71CB+AJtDfW3Wd2yKZ6m55nxHPfWYnZ2U+aa
 uJL9c5mNjrTPtW4t40Zq7sAswn5zjwXwKIZTVWqc8qaoVu+cE6sG5uofDpYODiJZTJgI
 A+YyhW59T5Van6knL8U6tqNz7EpeJJw4CwIym1ccWb3AatONVVe55UOziD4SkxKVEtgr
 if4H64f0q3kHujEl4T/JUy73113OKmkSssYM8HU8IyeockW+hQm5bsyzxCrGB+nHIPXw
 bnK2TU/J0nE+h4OSKJJa31XHF9NYncKrdh8JAHxnKus8jA+ykDAArIgHbb1j54lplfc1
 tnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=EPzeJ84G/ayTIt+hNFp/fgWfD+HxO3dxoEMSVCbr1yQ=;
 b=zPcgdcnz+KMakuER1EsYPgx5RxCEz2VMIo6cnvlbvmoCW1nH6+WUy/RvIIEKDZNhHf
 gk42XwBPWTf7LQ1eGWdC/Hat3PrqT2otWUbp5TOQh/YHnAx7KutdpsANVGMNc792HEWB
 nB3Hf2VcXnjTjx51hFco8Mnh4ZN6NvKO/Qdd0XMYKIma6b2xDqDX5IteOglQU8pdgBsc
 p6iyHqBZbZK6370dfpobBn72JRu3sZDKo3R47eDTF2LaeIf8Zd9H4tIK20H8iq1MnQCA
 Oqz6gXJ4PZKhRzFLPSy4yVXkr0U9CqATFRLuvnTtnjjOKBHX3O1odwTXZwrEn2BcroqS
 IZ4A==
X-Gm-Message-State: AOAM531i5q6q8wwZ+mzZ1S+HPtfrrRW7Ei6U6/sksEY+9dFPbjyIjdZk
 /1hXBmOefs5mNmda9WrbfQGZUg==
X-Google-Smtp-Source: ABdhPJy1YtCiVsVNN9Gt30Ywuj6za+31+3sKQDy58HylCYaJ9/4A7vM/OrMB03Tziw55gIBL+/Pdvw==
X-Received: by 2002:a05:6402:f0c:: with SMTP id
 i12mr37492948eda.156.1643920670585; 
 Thu, 03 Feb 2022 12:37:50 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id lt2sm17002858ejb.50.2022.02.03.12.37.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 12:37:50 -0800 (PST)
Message-ID: <14d0cf8a-c3bd-55d8-c18d-6488d266d69e@mind.be>
Date: Thu, 3 Feb 2022 21:37:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20220113212605.13343-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220113212605.13343-1-ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v1] package/mesa3d: fix glvnd option handling
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/01/2022 22:26, Peter Seiderer wrote:
> - enable glvnd option only in case OPENGL_GLX or OPENGL_EGL is enabled
> 
> Fixes:
> 
>    - http://autobuild.buildroot.net/results/e97ad48f20a325f5757754a8be2bdb613c86e4ea
> 
>    .../build/mesa3d-21.3.3/meson.build:542:4: ERROR: Problem encountered: glvnd requires DRI based GLX and/or EGL
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>   package/mesa3d/mesa3d.mk | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index aa365838ab..fb178c10b3 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -271,10 +271,14 @@ MESA3D_CFLAGS += -mlong-jump-table-offsets
>   endif
>   
>   ifeq ($(BR2_PACKAGE_LIBGLVND),y)
> +ifneq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX)$(BR2_PACKAGE_MESA3D_OPENGL_EGL),)

  Hard to read, but I don't know a better way to do it :-(

  Applied to master, thanks.

  Regards,
  Arnout


>   MESA3D_DEPENDENCIES += libglvnd
>   MESA3D_CONF_OPTS += -Dglvnd=true
>   else
>   MESA3D_CONF_OPTS += -Dglvnd=false
>   endif
> +else
> +MESA3D_CONF_OPTS += -Dglvnd=false
> +endif
>   
>   $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
