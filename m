Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0FCFC433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B3EA40904;
	Sun, 27 Mar 2022 16:28:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qF18ZnFcW_0L; Sun, 27 Mar 2022 16:28:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 723A34032C;
	Sun, 27 Mar 2022 16:28:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8DA1E1BF303
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A68960681
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:28:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pLFa0_3g3nej for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:28:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D56B360625
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 16:28:49 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id p15so24128241ejc.7
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 09:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dOOsfu+JdfDscN72lFFFfk3e3fcmNFCl54g8r/CtDOI=;
 b=ZP34L3FQz5qWfP7WmxKE3FgYo2QqjaTqWixUMGeVNdJs4K/2w4QsGtEEXaqQ6h0x9p
 EFCiQygijj1++DSnt9J6uiOmjRsDEUsQ1d5mRMStfngskNdDE5a5WKIyUHnmIg/H5QPY
 wkTR0xwkMvKGW1lG+dlD0TyE7X63NVRD+2Oo2uaYxQcY5o5ls+TPa4MUiaqKXgCs399J
 9hfaIvjcDPVjuDn5sq4faX0WaBSeu5Fx0RiZl0Ipme0UhzeZWQ0nv1Q8RsailPEtpzv/
 hnSW1Y8b4IhMtrokCvIj0H792DJrf8qq3kaNSg2aftL7QQSC8CtNmFw8BmL71jqjmeqi
 I0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dOOsfu+JdfDscN72lFFFfk3e3fcmNFCl54g8r/CtDOI=;
 b=HIeKR/YO+/HjZ7BB9d6HyizE9c009/E2Bci5EZD8GfELRssd7HBi/3/PjvuD259wXj
 sGHyb34abUwuribdg1r64E8gpw5OFxqLnoGZWHS4h8apce0CNCUIaaNnc2JqK1hSY5py
 V0KBHoEMuq0msw8ma6SE9JRR0cOcY9G4EOa0aT6dvyccrWcfQEMTs62OrGDX8TWhvwV9
 7At3QCcoYAkZSCmQUCjlSETNbgmJOIINabCSeIndXQ90u8XNAf1WVxzwd+m8sS0t0vV5
 +56FwoqNEYhfkUJ7VVX8zaEEs4yuAw47lGYt0dMS8i1jFXTBjAGq/dWYJ2VEboY8wRUB
 vRHw==
X-Gm-Message-State: AOAM530PqFoM+XcrsMrgbqEAFhKvtKSRqyNMRbNkwyrQPpwP/bdzXI/P
 e5uwlFLLG5lY7okYZUuIBsJqjA==
X-Google-Smtp-Source: ABdhPJzn8zZakiFiUSk0j02bFuGCYh+/Ud/WUqkQjbbbhcMl3+cmDGMTWS40kKAM47PSpfm8Ju3MFg==
X-Received: by 2002:a17:907:60c8:b0:6da:83f0:9eaa with SMTP id
 hv8-20020a17090760c800b006da83f09eaamr22399334ejc.605.1648398528126; 
 Sun, 27 Mar 2022 09:28:48 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 n6-20020aa7c786000000b00410d2403ccfsm5887183eds.21.2022.03.27.09.28.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 09:28:47 -0700 (PDT)
Message-ID: <a683b71e-5b92-f75a-07b3-1137a405a9bb@mind.be>
Date: Sun, 27 Mar 2022 18:28:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20220325190934.24982-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220325190934.24982-1-ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v1] package/wireshark: fix compile with
 ccache enabled
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
Cc: Dan Ambrosio <dambrosio@outrider.ai>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/03/2022 20:09, Peter Seiderer wrote:
> - use HOSTCC_NOCCACHE (instead of HOSTCC) for LEMON_C_COMPILER
> 
> Fixes:
>    [...] /usr/bin/cmake [...] -DLEMON_C_COMPILER=.../host/bin/ccache /usr/bin/gcc [...]
>    [...]
>    [  0%] Building C object tools/lemon/CMakeFiles/lemon.dir/lemon.c.o
>    .../host/bin/ccache: invalid option -- 'D'
> 
> Reported-by: Dan Ambrosio <dambrosio@outrider.ai>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/wireshark/wireshark.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
> index a5ca4b1f73..1a549f7037 100644
> --- a/package/wireshark/wireshark.mk
> +++ b/package/wireshark/wireshark.mk
> @@ -25,7 +25,7 @@ WIRESHARK_CONF_OPTS = \
>   	-DENABLE_ILBC=OFF \
>   	-DENABLE_PCAP=ON \
>   	-DENABLE_SMI=OFF \
> -	-DLEMON_C_COMPILER=$(HOSTCC)
> +	-DLEMON_C_COMPILER=$(HOSTCC_NOCCACHE)
>   
>   ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>   WIRESHARK_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
