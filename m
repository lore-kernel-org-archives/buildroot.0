Return-Path: <SRS0=awcP=NO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04250C4338F
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 21:40:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C0C3613A7
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 21:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C0C3613A7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D58E40192;
	Mon, 23 Aug 2021 21:40:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u453XNsEzlfI; Mon, 23 Aug 2021 21:40:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B39040193;
	Mon, 23 Aug 2021 21:40:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AFDDC1BF32D
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 21:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8E54400F1
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 21:40:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u55_g9leYqIO for <buildroot@lists.busybox.net>;
 Mon, 23 Aug 2021 21:40:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E616C40192
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 21:40:33 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id z19so3843111edi.9
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 14:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7/EnZWDIx/eoHueJYl20eVVPcJqkK7SykC8D11s58+Y=;
 b=KnNyC125icUwobIOtFgtqec+TevixWMvvBwaLAjl8EE6+xOXqMKW9pn8+WzpO8Fk1m
 qGNYELGI2B45JSLBGYokeLuK3W5gNTfVVhmErzxeGGb6KknXO+Txc03GJ7ppeQnnjRan
 WFxejDbngSwT7eQPzYc+dmoDfI5K+/byndnhMDsk+alVNeDBvBDorx7KQx/f5HfBn/dY
 Z4WF3jVPXNJVY4xMwoM692lE/WhxZ5UtLEwPFKuy3IOodOua6uLI95u1905aCHmVlW8y
 pRBCq9wyWjxY+l33GIgllZAmOuGNuPI3hqZVFtl0v3QcUwkUoRL3e9M5eFq0Uvt3+08T
 xGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=7/EnZWDIx/eoHueJYl20eVVPcJqkK7SykC8D11s58+Y=;
 b=UNstBFXrPJYo+Qzvtv5/zJRxO8Yd3fFe48mrBZsjedWCcHwgWvv+nJFjswlW3vlQvS
 bWi8xQezFmqI0sX+KDI93N2vNIIhX3Ka21quAwpDsdT+Uf0wVZrHYRNL0rYPUmicOdZ5
 J+6cV8A5/SU61cwKmXWcWnvSSQk9edjIe3Svbt+sAGLqipcDUv3XVAhMyNWcjfXfckpg
 eOo1HVds3uTah3uzoPG1Qkq0h2PHNYoRCyPOg+g5mKaNZnLTyd75JplurCRH7T+gkQVY
 cDHW0vqny8Tn1fhCd2/xBJ1ZGV7FnQ24FWeMGi1SvtSYtBT0KKMedJt/OtE3vmrId9n6
 MQuw==
X-Gm-Message-State: AOAM532jkEjcw057agEyp+bwW0q0JFGp6pm7bdUnd8vYx1fUr0YJmXUe
 +ndH7ul2Zb9ZX39oOPgv6kcffxYwJPF2qg==
X-Google-Smtp-Source: ABdhPJwwg7TB2uhy8DZn98zKGFLCdzwZIy4EmJGGPG7+Zw3NGQ8mvNiPmjI2H63X9l4Mi7EFs9isFw==
X-Received: by 2002:a05:6402:4386:: with SMTP id
 o6mr38667802edc.6.1629754832173; 
 Mon, 23 Aug 2021 14:40:32 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id r11sm7958078ejy.71.2021.08.23.14.40.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 14:40:31 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210821154123.1433985-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <9da98692-eba0-bade-cfed-59d4c00d5f80@mind.be>
Date: Mon, 23 Aug 2021 23:40:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210821154123.1433985-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/snort3: link with -latomic if
 needed
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 21/08/2021 17:41, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump to version 3.1.6
> in commit e66f2fd310374779d415fa683813cc5f5ccf6be9 and
> https://github.com/snort3/snort3/commit/3e518d86040e74c328bcc0d5bbd49c1da6b7a3ec:
> 
> /home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/9.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: service_inspectors/dce_rpc/CMakeFiles/dce_rpc.dir/dce_smb2_file.cc.o: undefined reference to symbol '__atomic_load_8@@LIBATOMIC_1.0'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/df34a69175e61bc7b180d89c738747e19aaf13bf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/snort3/snort3.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/snort3/snort3.mk b/package/snort3/snort3.mk
> index aabc89e165..7495ab9b0f 100644
> --- a/package/snort3/snort3.mk
> +++ b/package/snort3/snort3.mk
> @@ -54,4 +54,9 @@ else
>  SNORT3_CONF_OPTS += -DHAVE_LZMA=OFF
>  endif
>  
> +# Uses __atomic_load_8
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +SNORT3_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
> +endif
> +
>  $(eval $(cmake-package))
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
