Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86DDC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 20:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99F8B40C66;
	Thu, 21 Apr 2022 20:53:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S27lQAyQjt2u; Thu, 21 Apr 2022 20:53:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD43640C5B;
	Thu, 21 Apr 2022 20:53:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DAAFE1BF3DB
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 20:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C864C80A89
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 20:53:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5I5V-Ni-WWPr for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 20:53:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A543880A71
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 20:53:08 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 l3-20020a05600c1d0300b0038ff89c938bso4275504wms.0
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 13:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uLk2I8vWZDNrVdNojAUxMTSjF0Cl0oms/tGI/sNcW+Q=;
 b=QoKF8eVI6iNscgec+q1+gTKyQ2h0ekEsoW7ojSpvFu2axhLi76rYJlESFiTB3CnQSY
 qpE2NYF4T+i2TM/6eHYwIixiOOGPfHlZii8t9TFk53wTNPJnVlLgS7l7cCavDYTt1CDE
 HhiWlxLgWCFScocvNqEZfD478L8ItYox06bfZh7CFhKWAnoYf3fMhFb8OORk/mPn82EC
 cNutuFrS5S2VOrCKYi5CYgp+NK82oWyBaMur5Kdjxgfms+T/L9P/FMdOcKe+VAOzylZo
 I3XJp3yv+cP7/gIgY+xYs0t4Uw/avJdSLfZBAn8MN9cMr65ejf7eAPL3Q31F/SNX4lfH
 UBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uLk2I8vWZDNrVdNojAUxMTSjF0Cl0oms/tGI/sNcW+Q=;
 b=gS67kj7RWG/zvEYL7N3QgVgeWlnugIfEbLKwdbJm/9MOITes6QBQIuTFPZs4Rd3MTi
 S3445Xd4MDg96FZvVbgqMhi2ZZu8tAExZoeuycoHi0WY75DTM/WI/dyxUF29SctKSYWQ
 8d42rum2T93lLmZMIIV5vfQlDJHBzvxFpwsL7JPcIFJAU6spoE7S5Dh+xIR61Ga997pN
 ROfpp6TXZWNsU9wC/jSBm4xb8LMRlKQQbjZtB64klbNSKhjPU4jwjvMkfq4tUC86ZniT
 3uqno1SLtqJZRStAdYfln5hqC+eOWU0uQwpQhDgKmDiBeeP1qs0TA3GGLlLqND0BQ3rM
 z2Mg==
X-Gm-Message-State: AOAM53272Gj6uaix3vHGpTYDbCEMCp3DuaMV4A+Q9WWdgTDwZVFsKsId
 xA2zXjIV1pvd/oddwRkGVLDLFABWtn92bw==
X-Google-Smtp-Source: ABdhPJyqEkZ6lR/4JBzKxsWAaTmvPqvDFz5XC8Wt78ZGrV39t/ZN+NCxl79HWjoJPNySgj4VT8l1sQ==
X-Received: by 2002:a05:600c:1c17:b0:38f:f7f6:3de3 with SMTP id
 j23-20020a05600c1c1700b0038ff7f63de3mr10303161wms.142.1650574386761; 
 Thu, 21 Apr 2022 13:53:06 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a7bcb4e000000b0034492fa24c6sm38539wmj.34.2022.04.21.13.53.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 13:53:06 -0700 (PDT)
Message-ID: <5a45ffce-7ef4-73f9-4ffb-9703d4177154@mind.be>
Date: Thu, 21 Apr 2022 22:53:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220416152632.2220173-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220416152632.2220173-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/mc: fix build with gcc 4.8
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
Cc: Mauro Condarelli <mc5686@mclink.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/04/2022 17:26, Fabrice Fontaine wrote:
> Fix the following build failure with gcc 4.8 raised since bump to
> version 4.8.26 in commit e648dfa6f7078a6fbbc5feb83292c6a98300fe8f and
> https://github.com/MidnightCommander/mc/commit/8b4386df83ab5a525f0568113fe1e53d362f433e:
> 
> tty-ncurses.c: In function 'tty_colorize_area':
> tty-ncurses.c:575:5: error: 'for' loop initial declarations are only allowed in C99 mode
>       for (int row = 0; row < rows; row++)
>       ^
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/d9f0a11bde42fe6ae2e9449d3365609d59a6545d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/mc/mc.mk | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/mc/mc.mk b/package/mc/mc.mk
> index ac12c2173a..3858d62886 100644
> --- a/package/mc/mc.mk
> +++ b/package/mc/mc.mk
> @@ -10,7 +10,9 @@ MC_SITE = http://ftp.midnight-commander.org
>   MC_LICENSE = GPL-3.0+
>   MC_LICENSE_FILES = COPYING
>   MC_DEPENDENCIES = libglib2 host-pkgconf $(TARGET_NLS_DEPENDENCIES)
> -MC_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
> +MC_CONF_ENV = \
> +	CFLAGS="$(TARGET_CFLAGS) -std=c99" \
> +	LIBS=$(TARGET_NLS_LIBS)
>   
>   ifeq ($(BR2_PACKAGE_GPM),y)
>   MC_CONF_OPTS += --with-gpm-mouse
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
