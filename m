Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512F9C433F5
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 10:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0C22405DF;
	Wed,  5 Jan 2022 10:08:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vxXBwx6S68Kf; Wed,  5 Jan 2022 10:08:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6ED1C408D5;
	Wed,  5 Jan 2022 10:08:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 344181BF589
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 10:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2144A6FB62
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 10:08:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hOqJnNObggyD for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 10:08:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3501B6FB5B
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 10:08:07 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id z29so159760725edl.7
 for <buildroot@buildroot.org>; Wed, 05 Jan 2022 02:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=04fUAQ5DnaJA6F/PdEi3/APt66sdLE7Ymv9wPzndZ1Q=;
 b=d0Zfm5w9jYyg+Z9mTOCHRgXDrdyA7MglqApp6se6fcWAbX9qB0gEo1b9Don/WcWU4B
 Rkatcram0Ib+rPtZez83wGutAnyHCkVyHeJcFwUitSMUVPM7EnmsE3ZgBOu1Jvrcrxvd
 XNyFPBS2J16oNGy39B8hrvH4kfLbBePd58Jn3csxcZA94dG7+ZjlbESC3O5ZaWDxfhhC
 GLaNAPcJFJk/fRlUB3OqiPi29hjwz5Qly1oeWHvTUD1LJ8exzDNUmU/zsq6lBAKs0zqD
 wH2nJQ/J0AiqvQANPeJ68QpqjoWKvECpFkPIwPPC3jae8fHZpHWxW51BxSS62CiKmLwz
 Kbug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=04fUAQ5DnaJA6F/PdEi3/APt66sdLE7Ymv9wPzndZ1Q=;
 b=aIsWDoZYamEa958YVihznt/tDrrOZJXRdBtjwgmrc9rUUUT1UujzJxV5LErwPSFh0o
 7TwuZazF56JvenaphwBUHrlrop7ksHJlz6W8/vylp/1fXgv8f5e6SW53UXva7xJ8IqUG
 Rm7LauMX9sAFzCxaTlSRKEEi7LgaHymBaXNOnIUHjzrB940izsNAuI3D9AydJo1f3hcY
 Kexu0jBIPftGN7sn6B3Ylhp9/2ITdHlBmPxxwg+uQQNhAcHyNaQ2t2IYNG2y3U9ldS1k
 pLt+mHUKSyKcm0PZhZ3zwuMycyGdSoGWGRuKn015Z1RDj2oeGfDwpTps1zRyGqFz082f
 wHBQ==
X-Gm-Message-State: AOAM533YMpCR9lI8fc1OCPmkG2ApnpfHw8UboMQJ2RRD/1+1OlP+Z/c0
 3cmB8fp5OEnaxb/+jzVsEbB3IvHq1nQ5kw==
X-Google-Smtp-Source: ABdhPJzg8uXpUUiQdJ2uooDYKV+AnGbrZx6idK9x511QKerhRned0FScHI4sDeaf0bQcAiW2qkqYNA==
X-Received: by 2002:a17:907:90c1:: with SMTP id
 gk1mr41149894ejb.517.1641377285449; 
 Wed, 05 Jan 2022 02:08:05 -0800 (PST)
Received: from [10.101.1.216] (ip-185-104-137-32.ptr.icomera.net.
 [185.104.137.32])
 by smtp.gmail.com with ESMTPSA id b22sm12975582edt.96.2022.01.05.02.08.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 02:08:05 -0800 (PST)
Message-ID: <980403ed-3b13-39a0-b8c6-01df3fb5be20@mind.be>
Date: Wed, 5 Jan 2022 11:08:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20200410123207.3145145-1-bernd.kuhls@t-online.de>
 <20200410123207.3145145-2-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20200410123207.3145145-2-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 2/2]
 package/x11r7/xdriver_xf86-video-amdgpu: fix glamor dependency
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



On 10/04/2020 14:32, Bernd Kuhls wrote:
> Copy glamor dependencies from xserver_xorg-server omitting libgl/libegl
> because this package already depends on both options:
> https://git.buildroot.net/buildroot/tree/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk#n192
> 
> Fixes:
> http://autobuild.buildroot.net/results/4da/4da87d30e6f5a10aafae60abce1b89ed92204a4e/
> http://autobuild.buildroot.net/results/74c/74ceb71bd48ea3a2bf6ff68aec0af76a11662f1f/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>   .../xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk  | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
> index e7196956a3..ccb5b30d90 100644
> --- a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
> +++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
> @@ -15,6 +15,12 @@ XDRIVER_XF86_VIDEO_AMDGPU_DEPENDENCIES = \
>   	xorgproto \
>   	xserver_xorg-server
>   
> +ifeq ($(BR2_PACKAGE_LIBEPOXY),y)

  libepoxy is already select'ed in Config.in, so this condition is useless. 
Thus, this patch does exactly nothing since glamor is always enabled.

  But I guess the select could be removed from Config.in?

  I thought that maybe the issue was that libepoxy has to be added to _DEPENDS, 
but in fact, in the autobuild failures libepoxy is already built before this 
package (indirect dependency through xorg-server). So I'm not sure how this 
really should be fixed...

  BTW, the issue is still happening in autobuilders [1], just very very rarely 
(once every 4 months or so).

  Regards,
  Arnout


[1] http://autobuild.buildroot.net/?reason=xdriver_xf86-video-amdgpu%25



> +XDRIVER_XF86_VIDEO_AMDGPU_CONF_OPTS = --enable-glamor
> +else
> +XDRIVER_XF86_VIDEO_AMDGPU_CONF_OPTS = --disable-glamor
> +endif
> +
>   # xdriver_xf86-video-amdgpu requires O_CLOEXEC
>   XDRIVER_XF86_VIDEO_AMDGPU_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
>   
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
