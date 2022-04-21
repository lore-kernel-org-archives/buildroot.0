Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DB4C433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 20:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA006611A7;
	Thu, 21 Apr 2022 20:19:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3FEDaKQQyle5; Thu, 21 Apr 2022 20:19:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A659A60E2F;
	Thu, 21 Apr 2022 20:19:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C9241BF3DB
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 20:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42EBD4115F
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 20:19:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qIS6koaogP_V for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 20:19:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BFF4C41174
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 20:19:16 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso4143884wml.5
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 13:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=tGptoQOqbIJu4/HzokuyxP9jyxSf8mwqQW2SfSNu5o0=;
 b=M4gt0dwY1fggfqivKZ2rdqlYPO9QcoEshL+gu7j4dlbrWUtRPxBmFDvJ1jH1oPzgvS
 GKWjg6DRiQNNjFJ0ytN8/aY73QdORtTNAUqa+58yGJSE2EJ9oKO+Oxk8408Rl/UaXZtp
 sGVVGIa6Myw0RvMZ9nht8zW3CHiHPLAL6ybHOG9f2TdYOjDsQ5U2ikwxU/1Xrqnu/rSU
 dJ3vzkhuWf62yFreo9Vtg0UZaiiHC93O2pWSAwCMlA7CIO3d1NdExKN7+hoIjKbPGSRR
 NFxrFlysVjOKVN8cGFzOKAHAJuBwVN5vl3r73Uu00+rMvazCnWyAel/b3t50pvpW/FDW
 1ziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tGptoQOqbIJu4/HzokuyxP9jyxSf8mwqQW2SfSNu5o0=;
 b=H8Roggt4geAIX6E86BS6h3rGgN7UDCr0BCntXRIwPbXtN3las0RUK4h5Wipokf7X9y
 4Q4yUYZGHdf+CkpR/SCX8AVxZ8lL3Hwzo80MEGjA0xZLbh4nSvxSKKFDZunAsZ3kDfyI
 9A1gpunsq1Ism4ZdGsOXyyRHR0aaapWObEduS2dFCPjNLgBzzeYQRYK0TP0X42SOZXtR
 qDUvwUYPXQPOn+tQ/b7ldl4d8yXJ9Di6bSKnuGwixoJKgNPsekECQ1QtEGVGqb6miF2A
 sGL4rrwYa0ObCVBCqH8+iJMsLUmBt9e7yfpMNDicYBaR2xYsU1kzkZHDmjYd8YeAUGqq
 3VLg==
X-Gm-Message-State: AOAM530rf7vpiNMkoqE+3PQDjEnwd/XUsVYX2/WXIMMM0rrv8KyNuT3P
 1ZIyAyirucLRiQ1eJRl9vEvsew==
X-Google-Smtp-Source: ABdhPJwtKSuo0eKC7flIdZcE7rd0jAHQuAh+2ZVCzylROp1mYylI4+rpfPPp9/em+Gem02kB2VIVAA==
X-Received: by 2002:a1c:2706:0:b0:391:822c:83da with SMTP id
 n6-20020a1c2706000000b00391822c83damr923343wmn.100.1650572354734; 
 Thu, 21 Apr 2022 13:19:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 d11-20020adfa34b000000b0020ab3201c50sm38309wrb.17.2022.04.21.13.18.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 13:18:25 -0700 (PDT)
Message-ID: <8bb8f809-cd50-32ae-f8e8-29ea40116288@mind.be>
Date: Thu, 21 Apr 2022 22:17:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220419132805.2571073-1-fontaine.fabrice@gmail.com>
 <20220419132805.2571073-2-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220419132805.2571073-2-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 2/2] package/netsurf: use HOSTCC_NOCCACHE
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



On 19/04/2022 15:28, Fabrice Fontaine wrote:
> Use HOSTCC_NOCCACHE instead of HOSTCC to fix the following build

  Rather than this workaround, let's fix the real issue.

  The offending code is (I think, untested):

$(MAKE) install --directory=$1 HOST=$(BUILD) CC=$(BUILD_CC) ...

in top-level Makefile. Since BUILD_CC may contain spaces, this is going to be 
parsed incorrectly by the shell. Just adding quotes should be enough.

  Regards,
  Arnout

> failure:
> 
> /home/autobuild/autobuild/instance-11/output-1/build/netsurf-3.10/tmpusr/share/netsurf-buildsystem/makefiles/Makefile.tools:413: *** Unable to detect toolchain.  Stop.
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/b4ba19d7dcff1b0ee2b1546598b5ae6e9257a16d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/netsurf/netsurf.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
> index 574c1423df..b61372bb78 100644
> --- a/package/netsurf/netsurf.mk
> +++ b/package/netsurf/netsurf.mk
> @@ -106,7 +106,7 @@ NETSURF_MAKE_OPTS = \
>   	BISON="$(HOST_DIR)/bin/bison" \
>   	FLEX="$(HOST_DIR)/bin/flex" \
>   	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
> -	BUILD_CC="$(HOSTCC)" \
> +	BUILD_CC="$(HOSTCC_NOCCACHE)" \
>   	CC="$(TARGET_CC)" \
>   	AR="$(TARGET_AR)" \
>   	TMP_PREFIX=$(@D)/tmpusr \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
