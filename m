Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0525C433EF
	for <buildroot@archiver.kernel.org>; Mon, 28 Mar 2022 19:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A899940ABD;
	Mon, 28 Mar 2022 19:57:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rjHUWIR2gr7l; Mon, 28 Mar 2022 19:57:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DD7B40AAC;
	Mon, 28 Mar 2022 19:57:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 414E31BF2BA
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E60181A30
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:57:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DrORFVqRdAxL for <buildroot@lists.busybox.net>;
 Mon, 28 Mar 2022 19:57:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 42A8D819F6
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 19:57:03 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id u26so18182950eda.12
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 12:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=/kallNB1tuwMr59gEONM/kg0iLvRl8ttTRqW+ui8EkA=;
 b=Lu7AiA0uYvGcDqeLnXHFq41VBVSVxDLhNaRZABJboI358lY4Nrr+2fdno+19/v5HpV
 5gZdeb+tefC92nroPR3PP2y60/3/483HPA12XmnYYscQ9Adzl0b18vK75d8kfe+qWXKG
 OPdtBaSE8p2Q0SC7S8bfYA5ScGldY62G7pf0UVuE61Omm1yaeKei5zoUpae/rtQnPaVT
 xBAmQGHRTOsScn6Zl6tB74WyjW4cfb1BH9fGPFBhWvpWi9yuiDkjQO70DH0kzwfiLtxc
 kK8sLVEeu6cke908Tf0uF1zCW1ODhdkkHXeiMXpuka8JaMhuq4gZPJQtmiyxyQulvabx
 l/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/kallNB1tuwMr59gEONM/kg0iLvRl8ttTRqW+ui8EkA=;
 b=kNLzkR+SEa7XX7dYs8exWo+5HvoDyfI+zi+T5Wz04cIMvxpId6KADXU+8bqXlNgCd0
 Cnt8MagEYjg0uNKvfl0Z7Ka+KWYF1SfiCe0L34eVHnTGVD9N9Qk8WlF1S2gNcp96Vj/+
 3oBrwZ4XtvDlQicHjxqGxY2/vNGOLdiVuk6emqMs36wXpqBvar8b6lsLWlO4rlJSLATH
 1uoNbL+xIifYatEFZ142xahtY1lgtjD/j5MlSYbXit7jay156H9Otqu0ZXHDi+y8eQue
 qSt/oy1DzMnn4tTEcXvzbBrnxrIQ+mynN5KH2N1DO4OIV3tjbLPIRidYyjtgDL2Qykdo
 PuDQ==
X-Gm-Message-State: AOAM532C+UQfi3UpiEtbOzZmhiiKLSfI0tn1rWnrE+aAq+I2/0SxTj3D
 kupGxXahU+u8DhsOH475/3oCKw==
X-Google-Smtp-Source: ABdhPJykM/Ap3oTPY4qD73ggtCmluuvNB40I8PtU6y3DpCuU4gA5nTKsfWMqv8G9n/kgoalvjD1EHA==
X-Received: by 2002:a05:6402:4315:b0:419:2e38:ab8f with SMTP id
 m21-20020a056402431500b004192e38ab8fmr18500057edc.250.1648497421537; 
 Mon, 28 Mar 2022 12:57:01 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a170906c00900b006d4a45869basm6234483ejz.199.2022.03.28.12.57.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 12:57:00 -0700 (PDT)
Message-ID: <accd788a-75b4-03a1-1bfd-cf4c503db7bc@mind.be>
Date: Mon, 28 Mar 2022 21:56:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220327193955.1277972-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220327193955.1277972-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/opus: enable custom modes
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



On 27/03/2022 21:39, Fabrice Fontaine wrote:
> Enable custom modes to avoid the following build failure with jack2
> raised since commit 618a23100fe5ff54b90ada1a8f23453f6c5a77dc:
> 
> Checking for header opus/opus_custom.h   : not found
> The above check failed, but the checkee is required for --opus.
> 
> It should be noted that before this commit, opus was silently disabled
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/b1c050ccd6152c43a6da5f5d2174c3cc0dc2ff3e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/opus/opus.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/opus/opus.mk b/package/opus/opus.mk
> index 3fb2d5d65f..4f816df477 100644
> --- a/package/opus/opus.mk
> +++ b/package/opus/opus.mk
> @@ -17,6 +17,7 @@ OPUS_CFLAGS += -O0
>   endif
>   
>   OPUS_CONF_ENV = CFLAGS="$(OPUS_CFLAGS)"
> +OPUS_CONF_OPTS = --enable-custom-modes
>   
>   ifeq ($(BR2_PACKAGE_OPUS_FIXED_POINT),y)
>   OPUS_CONF_OPTS += --enable-fixed-point
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
