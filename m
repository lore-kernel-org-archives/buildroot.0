Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3461C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 15:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B8E140103;
	Sat,  8 Jan 2022 15:41:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kkd3ACTtqszk; Sat,  8 Jan 2022 15:41:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36BF9400D9;
	Sat,  8 Jan 2022 15:41:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 661771BF5A1
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51198813A8
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:41:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GKHZxd8m4ziG for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 15:41:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7218A812D5
 for <buildroot@busybox.net>; Sat,  8 Jan 2022 15:41:55 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id q8so17211536wra.12
 for <buildroot@busybox.net>; Sat, 08 Jan 2022 07:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=XznD/tLVB/eJm4r6DdT7pl6A1ugDCoiV5bu+oopdsOU=;
 b=ITN+SfaNQ1NASDQRnEj2OcSSlOAT861ssMMrydVhM8FmR42tm2hMPzgliwmOuyJjtU
 gZUinusL7/j495vcjVxHV29gW4HprsXMtGCxLeDqLn4UDCF3poIhzTmr110lSa7ROo1/
 /qhOW3KkmpLcJ4GVhOhEG/2auWeDyorcLaAivoWADSZpU9+Njk+JwzfldduM2jOkurC+
 hQNpbHfXZ2BNgA8//4+AJrYJ7br4QCiMBWU5iWLeGxJ3VWKuBwgeUbbA5KZDNYLBoo1F
 gtDb62fywLeIw15TfI2942kO0XS4vYJ+UM0oV2kgf2J2VxbkEuiQ+BghSvtWBRhH143/
 Qoxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=XznD/tLVB/eJm4r6DdT7pl6A1ugDCoiV5bu+oopdsOU=;
 b=f/ATdTr8Bshk41U2tA1KaUAnKie/mfr0c4Cbs/poY0y5W8EOpqcdSLLQfQheIojb8j
 D+oKUtDTSDUi/d3500yB9lNkXhCZnfIHqeSjURl1sZE+c7t19rg1ArksBrYnc57O+Cwo
 ifwWG4/AhDrc6LwokpB82ZdrCkQioVpf4POL5e3o877GkxjvkTkrDnIAYm3llu/6XcoS
 lIYFJHAIdiZdHeToEJlhwBzqAN/xWrVzDTVp0DApr5cpH1xiG1rH72cPyRQjxB37IL7Q
 PZFB2uNlRhdQHZ4VLlgu54OjhUbjrUvYWELQg2SvSaz+FuuFPjabmU70w+GsVpX3FRVA
 naXg==
X-Gm-Message-State: AOAM531w/5nyNA5p8Fy9W6Bo7W9V/Seir+03v4465b616zDfPJGKBxPX
 oX5rPfPQsXpojFL8XLprt5v8c/TnIbLtIN/p
X-Google-Smtp-Source: ABdhPJyCvb9WILfBhyJHd1Eam0e0hZR5Ip5tP2MFzTA+xnGbNNmXR9uhC5umTJLdphikPBqtDmKWpA==
X-Received: by 2002:a05:6000:1377:: with SMTP id
 q23mr11825657wrz.371.1641656513583; 
 Sat, 08 Jan 2022 07:41:53 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id s194sm2321271wme.45.2022.01.08.07.41.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 07:41:53 -0800 (PST)
Message-ID: <ffa44730-3281-5345-67cf-389a0045c18e@mind.be>
Date: Sat, 8 Jan 2022 16:41:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: guillaume.bressaix@gmail.com, buildroot@busybox.net
References: <20200627130805.8615-1-guillaume.bressaix@gmail.com>
 <20200627130805.8615-2-guillaume.bressaix@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20200627130805.8615-2-guillaume.bressaix@gmail.com>
Subject: Re: [Buildroot] [PATCH 2/2] package/python-numpy: use fortran
 compiler when available
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



On 27/06/2020 15:08, guillaume.bressaix@gmail.com wrote:
> From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
> 
> python-numpy can be built using fortran compiler if
> available, this is the correct configure flag to do it
> 
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> ---
>   package/python-numpy/python-numpy.mk | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
> index f9c55c9f3c..9e08fd5f2e 100644
> --- a/package/python-numpy/python-numpy.mk
> +++ b/package/python-numpy/python-numpy.mk
> @@ -23,6 +23,10 @@ else
>   PYTHON_NUMPY_ENV += BLAS=None LAPACK=None
>   endif
>   
> +ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
> +PYTHON_NUMPY_ENV += F90=$(TARGET_FC)

  It's better to still explicitly pass --fcompiler=gnu95; same when fortran is 
not available, pass --fcompiler=None. That way, we get an error if it 
accidentally picks up the wrong compiler (e.g. from the host).

  Therefore, I squashed the two patches, and applied to master, thanks.

  Regards,
  Arnout

> +endif
> +
>   define PYTHON_NUMPY_CONFIGURE_CMDS
>   	-rm -f $(@D)/site.cfg
>   	echo "[DEFAULT]" >> $(@D)/site.cfg
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
