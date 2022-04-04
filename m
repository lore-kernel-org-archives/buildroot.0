Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7592DC35276
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 046F460FE1;
	Mon,  4 Apr 2022 18:46:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6PYb_N3fzXWK; Mon,  4 Apr 2022 18:46:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2248D60AF4;
	Mon,  4 Apr 2022 18:46:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7EE531BF294
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E23A410A4
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:46:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QW20po0EqONq for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 18:46:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B1094058C
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 18:46:47 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id k2so4995260edj.9
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 11:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=XEq0Lv5WWj4PC5RWrfgCTv8LOaDxmHBQ2pBKPeXr964=;
 b=OgzZmBQ7JJ9NSw9Sb0Ha4SokNKYXs8Hz8V1NSPdK3HLONldpTJxaT22OAZ5n9DHSEG
 EkUOmP0Jgs4OMeUlcbMGFJhzBiLSTWrxBZkTu6CiZxA2TGeXz6wnmqMBGDSHAdNoWE/E
 m7KBWSBUXDv/96x9a3/6JCZi5d/upgpNmpResfiCz9c5+1oeV/WCYynRuZ5sAjHN23+0
 qQnJhnimFPzvG5TYrkW2J5E0ELgkLBLVF+SVTf51hw9UjxkE2vkqkmarPocDgDc8eIFz
 krkAjbM0wKoc+qJIrzfQLId5w2+KxY7Nv3rp+t4kKhjhwV1+8xT2ZIchWPkHDhfbxJc7
 M1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=XEq0Lv5WWj4PC5RWrfgCTv8LOaDxmHBQ2pBKPeXr964=;
 b=5om7yvUJ0jknYj0mq0xsaSXGp9dm6XcSJPPIeAg+ts37bsN6q60XLWvxtLqjwqgp2h
 maeLAbh0ScldtVWyCRAySs4iJTWgKmxlGDWfWEP3aVNjEpbBCz5aL/09AhtUTpjQL4FZ
 XjWy1Av0Y0IeJC/z7KnyUVT9NZbNvblRl5VBUfhL2LhWn55P6c/JGa+fx2QLCGBL6/M/
 IxYJMOE2BCtFNuNcD7EqwhJ3T/og4C43KVHtu01c7bbWFshTqH3+0zme3nt70R7eR+Zp
 2eLL4h1qSF+crHyFcbb/wy286xYFYs3eIFGGZMVjMQvQi14xJw9LvLuIGKXuWn+FJaRP
 CtIg==
X-Gm-Message-State: AOAM531TOyiaK5LxvfinTfP1jr7joPxOb0/vmDu38nt8SSuNhd+LV6kH
 VH/pLbBGq2SQb+aDeO0sDGsmCQ==
X-Google-Smtp-Source: ABdhPJwHCCP3qLvsxDPfu4H5SUXWQ46nbVpa829q/dpXGV158A1hNyrMjzbpDqMwTxX/tg8KasqMSA==
X-Received: by 2002:a05:6402:11cf:b0:41c:dbc7:79d2 with SMTP id
 j15-20020a05640211cf00b0041cdbc779d2mr1699276edw.50.1649098005744; 
 Mon, 04 Apr 2022 11:46:45 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 da19-20020a056402177300b00413583e0996sm5507168edb.14.2022.04.04.11.46.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 11:46:45 -0700 (PDT)
Message-ID: <6e4caa2c-f86c-8a4b-5b40-f9942e6b89de@mind.be>
Date: Mon, 4 Apr 2022 20:46:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220402082715.1497098-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220402082715.1497098-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH v2,1/2] package/ipmiutil: drop dead code
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
Cc: David Bachelart <david.bachelart@bbright.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/04/2022 10:27, Fabrice Fontaine wrote:
> ipmiutil depends on dynamic library since commit
> 670095b4739c898a8f270b003ee19294206d91f6 so test on BR2_STATIC_LIBS
> added by commit 9f31cd14d01e306e6475b750c30554043c57491a is not needed
> anymore
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
>   - Keep disabling lanplus if openssl is unavailable
> 
>   package/ipmiutil/ipmiutil.mk | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
> index 4c9de26583..97a644e314 100644
> --- a/package/ipmiutil/ipmiutil.mk
> +++ b/package/ipmiutil/ipmiutil.mk
> @@ -17,8 +17,7 @@ define IPMIUTIL_TOUCH_CONFIG_H_IN
>   endef
>   IPMIUTIL_PRE_CONFIGURE_HOOKS += IPMIUTIL_TOUCH_CONFIG_H_IN
>   
> -# forgets to link against libcrypto dependencies breaking static link
> -ifeq ($(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yx)
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
>   # tests against distro libcrypto so it might get a false positive when
>   # the openssl version is old, so force it off
>   # SKIP_MD2 can be used only if ALLOW_GNU is defined.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
