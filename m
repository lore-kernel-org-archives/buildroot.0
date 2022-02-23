Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FC5C433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 20:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E08860FC4;
	Wed, 23 Feb 2022 20:05:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O8jCvyY5TEmh; Wed, 23 Feb 2022 20:05:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B826560FA0;
	Wed, 23 Feb 2022 20:05:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6618D1BF5AA
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61A5360FA0
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:05:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wCrPH6sK_1cy for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 20:05:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75AD760F76
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 20:05:46 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id i11so44234842eda.9
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 12:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tMQEARmqhEp1tdDwkvKfxqNEa6UkGlSi0eXZewQX0/4=;
 b=M7gz+xZn9tqGwMc2JLg87tQoGE3ca9PzR6pASveADGffFN5wSYt4sGYrGmwBs24j/V
 mLiPnMjtmrRP7blCSXBq9b0zf92pN6QOgI17sKWrx3Cl4v5Fkry6dn3UWgv0YMQPGbl6
 A1V5VKHGnX6qo5spNd/kE7xJab+YAEQQFkyQ8ZvcVyeDjhe3VS0nIuWyllB2C2UwheVr
 ZI65HiX4SmvGVCeYiPq/GScerJTf/VR9XRRbbOKt1RPmkkZrYMQad0bBMJ9YBm7lsPy4
 04LUKIdKEovtLWDJibi24b6MuR6lkpH0IG6j4Jup/faRTwNnRYFfCW0Ci1pJzWROF5Lb
 wIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tMQEARmqhEp1tdDwkvKfxqNEa6UkGlSi0eXZewQX0/4=;
 b=c6xKAZ2Mb8/N67v+vmYwxK25IJAmNg99hiEVd6//VJW9ZpF4qZwG68oY6o75ew+eHw
 /vzRye+UYz/J44XxdH1iw82af/ElvXOeaS4HP6itJpc9XQ+26gAapVunLYlPcT/JkODx
 NTxHbqkfnOnEObZcsTqaTHfJE6AoYDiUVpejeqLboVQGpcPrg7Dzyy3ubX4+heanD+Ea
 zd8ScLpH8wrWhdS3MLCmTwr8jZbzdQ2QG+XUqAN5BPHOr9zMVp6rNI+JzjdjBG85Lc5C
 FfLzgQBPVZ68ZpsdlqprzEMv1bG4cRcg6Nu7xjalEHhfo5mkJ7mxPP0ohrkTOcybJloH
 8lfw==
X-Gm-Message-State: AOAM5301iTUbLlSOteHisTvHtvj4LdmGilXq94il+zjRgHB5GjNw8agA
 l5Ejqr6qmxP+F7VrJysH6lFyX5gYojfRfw==
X-Google-Smtp-Source: ABdhPJwi+UgCqfeel56rzrXtqVD1A5BkkRtsXSL4cqOs0kZH6nF4G4Vu1JaNOPiS5FS8s7JpdBBDKw==
X-Received: by 2002:a50:9b45:0:b0:410:7cdb:5d3a with SMTP id
 a5-20020a509b45000000b004107cdb5d3amr1033790edj.275.1645646744611; 
 Wed, 23 Feb 2022 12:05:44 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id p16sm293706ejn.33.2022.02.23.12.05.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 12:05:44 -0800 (PST)
Message-ID: <d8ca7ab8-3aa3-20aa-c39a-10fc2e4466af@mind.be>
Date: Wed, 23 Feb 2022 21:05:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220214212301.4142823-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220214212301.4142823-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/ghostscript: disable tesseract
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/02/2022 22:23, Fabrice Fontaine wrote:
> ghostscript embeds a local copy of tesseract-ocr which is enabled by
> default since version 9.53.0 and
> https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=7322ef87546c55b29056c1d96d8bdbb7f3ba53ef
> 
> Since version 9.55.0 and
> https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=5459f7aca1ded3b7cf96c339a2419f418aa406c7,
> ghostscript expects that tesseract is disabled if threads are not
> available resulting in the following build failure since commit
> 7a4944569ce83b0b7b0cabd6e8aa184b8cb72a22:
> 
> configure: error: Threading disabled or not available. Tesseract OCR relies on threading. Rerun configure with "--without-tesseract" to exclude OCR from the build
> 
> So disable tesseract as there is no way to tell ghostscript to use a
> system provided tesseract-ocr package

  I understand that v1 of this patch was not OK for that reason. However, we 
can't we keep on using the bundled tesseract in a build with threads?

  Regards,
  Arnout

> 
> Fixes:
>   - http://autobuild.buildroot.org/results/fd35a47b2a77cf57c243ec1c88802b53ddca8f52
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>   - Unconditionally disable tesseract
> 
>   package/ghostscript/ghostscript.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
> index 24a0c489a8..b2e5fe16bb 100644
> --- a/package/ghostscript/ghostscript.mk
> +++ b/package/ghostscript/ghostscript.mk
> @@ -44,6 +44,7 @@ GHOSTSCRIPT_CONF_OPTS = \
>   	--disable-gtk \
>   	--without-libpaper \
>   	--without-pdf \
> +	--without-tesseract \
>   	--with-system-libtiff
>   
>   ifeq ($(BR2_PACKAGE_JBIG2DEC),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
