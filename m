Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DF6C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 15:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 739D1400CD;
	Sun,  9 Jan 2022 15:55:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lazSqZuRhSOb; Sun,  9 Jan 2022 15:55:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EFEA40130;
	Sun,  9 Jan 2022 15:55:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E8781BF4D5
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48BDD8143E
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:55:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u02HS9wHKlcm for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 15:55:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3744281438
 for <buildroot@busybox.net>; Sun,  9 Jan 2022 15:55:33 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id s1so22120697wra.6
 for <buildroot@busybox.net>; Sun, 09 Jan 2022 07:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=HuC+lyuPQWkoMs2IPxxsxunG43SWMxMBaFexiFhRT6I=;
 b=hvoc30ZAgIYPEwEft3KkGICkCAy1wkRE7RV31VnCB5cEnPFpz8Pr/13XKEe6uc9SNr
 SRVbOJlEyI6Rta7WFx39CEowT8zvimxWeNbfSI/oR4L3sR42kOWDlVNENwERW65Mir23
 05PvtR6QUMcIfNvHQ+ci2o39UTb7cy2AjbUdgsbK29TV2dQzChoRUw/HTC48ybuysmX0
 0pQKZS4XRoaEWqJgNpelEMI6fcjTy16kicWixcHyxQmsF89BB0izyOsCyiRvSCSBKY3c
 DCytGg+01VXXm9zYukY9ybhe6RKsLeZPKFFBsuqmcvutxlRNJryeDDM3jbsYjs9nfWh0
 1UaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=HuC+lyuPQWkoMs2IPxxsxunG43SWMxMBaFexiFhRT6I=;
 b=qrmFTaqGyTbgLUrS+PgYJqAcstsoW7T8Kk/Lu8gSV9sIvhwVLKZiRljsBoXVaoomZf
 dmD8TUpJKylPLyW9VGTz9r9f6SeX7EDp+3HeIc7AqJhjj7DxJcwFJ1M2kqe49+MrbMJC
 BErY/N+eM2OA9RV+mmeQRthROpSnhtyS+TvCRfEIia32t4DT6esTa8i9oUfIGonzd3b0
 2F+cGOTah71K1OpmaVnuYFHPzaGG5Ex9Al/SniEZAx9puXfvIcpolGL9goRCX6WK9ktt
 4a1nNGdies6ZC6SKiRTCp2GxvG2gYh/lo9eEyi0PMoI3BA+40qxd11cBSSJRC0THgazH
 Gi8A==
X-Gm-Message-State: AOAM533hAp6K0bzrrS2TLt6g1CtZAWBeXsPhAE+3kiWDmGK+SYm9rdm5
 4s3Uy8SDpObTCOW5VUgfVgad6w==
X-Google-Smtp-Source: ABdhPJy/tai3X8ho4q5puG8TQbL1go58gOf8BOGT0/Oh50icqAEpj4FoTHAegcsThkSiSd4TGh6fsQ==
X-Received: by 2002:a05:6000:1548:: with SMTP id
 8mr61695777wry.195.1641743732184; 
 Sun, 09 Jan 2022 07:55:32 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id z5sm3269259wmf.25.2022.01.09.07.55.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 07:55:31 -0800 (PST)
Message-ID: <b40720d6-4d50-9073-f421-9fcdcec0676c@mind.be>
Date: Sun, 9 Jan 2022 16:55:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Howard Mitchell <hm@hmbedded.co.uk>, buildroot@busybox.net,
 Peter Seiderer <ps.report@gmx.net>, Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20200306092504.30340-1-hm@hmbedded.co.uk>
 <20200306092504.30340-2-hm@hmbedded.co.uk>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20200306092504.30340-2-hm@hmbedded.co.uk>
Subject: Re: [Buildroot] [PATCH 2/2] package/mesa3d: get glxgears working
 for v3d/vc4 minimal builds
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



On 06/03/2020 10:25, Howard Mitchell wrote:
> Currently a minimal build for rpi2/3/4 (i.e. only v3d and/or vc4
> selected, no dri drivers selected) results in working X11 except that
> glxgears shows a blank window. This commit effectively results in the
> following conf options being added: -Dglx-direct=true -Ddri3=true
> 
> Signed-off-by: Howard Mitchell <hm@hmbedded.co.uk>

  Instead of this patch, I applied [1]. Based on Howard's observation, the key 
is in fact the -Dglx-direct=true. I did a bit of investigation and I concluded 
that we can always enable that if GLX is enabled.

  Bernd, Peter, could you shout if that doesn't work for you?

  Regards,
  Arnout


[1] 
https://git.buildroot.org/buildroot/commit/?id=6a51177af14a2ddaa6431bb7fc618fe138b59b72


> ---
>   package/mesa3d/Config.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 3950170533..59b8f60773 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -274,6 +274,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
>   	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
>   	select BR2_PACKAGE_LIBDRM_VC4
>   	select BR2_PACKAGE_MESA3D_OPENGL_EGL
> +	select BR2_PACKAGE_MESA3D_DRI_DRIVER
>   	help
>   	  Driver for Broadcom VC4 (rpi2/3) GPUs.
>   	  It requires a vanilla 4.5+ kernel with drm vc4 (open) support.
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
