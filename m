Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7353DC433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 21:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 136404048E;
	Thu, 17 Mar 2022 21:38:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hK7923hH-Ela; Thu, 17 Mar 2022 21:38:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6BEA40486;
	Thu, 17 Mar 2022 21:38:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D5C51BF315
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 21:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0ACDA81494
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 21:38:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gP1tvDL1iv4D for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 21:38:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D46E981446
 for <buildroot@busybox.net>; Thu, 17 Mar 2022 21:38:44 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id bg10so13438143ejb.4
 for <buildroot@busybox.net>; Thu, 17 Mar 2022 14:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=dJb5G2Y03cxVk6j6XsfnuJDeWZmaklSG20sAXVKoT+g=;
 b=htAbgSlJYZtZLkwjLiNGGh9+NryVz8cwZn3lpOekZjQ3URSElczbZFBk6MuX+9UzJz
 P2T++BRrMzIQydsZjMMGu/R6QshOTIPDkPF0Y8pWy2Jf7BDQPxcEEu5ROmRSiBE9Q1UZ
 LyIIV+zqM+pgF9jGxJIbqEGIo7IBXSAuqqRbOCkZIZ0DZu5zB9UFMNzzUjlTVDrpVrrz
 393vULJ694AHLNeh2tar5m8e7wU9GbM8a/uFbv9rq6c4/aSLYldfwzElOCcpRaR4gjg9
 vEiRmNM99JNHLxF+lk8dqSntNhDVsOawiYkJBYfteYLZg3OkPqbO0J3OkMW/o+Fhxw4P
 qdew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dJb5G2Y03cxVk6j6XsfnuJDeWZmaklSG20sAXVKoT+g=;
 b=a7JaYLjcY7jSW3ydBsSspc+cfPLjzjgM5IrrGfHONWy7luOorWHQQtgq7ZgLnrPI51
 b9kj+i2MpKUvNrzxC1SINDWtsLhTIwlulSmER1Bg5DtiyOLbd4bC+eW02Weq+xTUw2Xg
 ERePDlOC9aioMRhdZpMSZeHyCFs+AKl7rVhlWbBUspcjtQIySk2xMvYzFg4qgDDCjDUi
 xQ55wWDX511AS126Wojx4hpB4Rtf2F//DRHtQhwshooqVWeHRQKLoL2fcxe9QfQTzaMN
 HQKmA78fKPRfcpRcUGpF1xEYJpaDoRAnV/FpowDApLwGkQ3CHc3YKxUaDjPqxyBic3k6
 WWHQ==
X-Gm-Message-State: AOAM530y0qUvmSqnPa6lMNMHXBTbpHa5uocJ1Jk5Zmp8ASPIv+dgiwy5
 sSsT7qPmcrbclSLXt3lr6lrgdQ==
X-Google-Smtp-Source: ABdhPJwn2BcDXnzjlvGPqtuciDVtQcUpKh3g85PCAkz4zoH+c35jmvrHXLHhK40/mUZj02SWk7n6UA==
X-Received: by 2002:a17:907:2daa:b0:6da:924e:955 with SMTP id
 gt42-20020a1709072daa00b006da924e0955mr6518446ejc.1.1647553123029; 
 Thu, 17 Mar 2022 14:38:43 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 b19-20020aa7dc13000000b00418eef0a019sm2500518edu.34.2022.03.17.14.38.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 14:38:42 -0700 (PDT)
Message-ID: <122db5b6-14cf-a4aa-e9e1-ad2d4749c0eb@mind.be>
Date: Thu, 17 Mar 2022 22:38:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220310114211.920001-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220310114211.920001-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/pango: bump to version 1.50.5
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



On 10/03/2022 12:42, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/pango/pango.hash | 4 ++--
>   package/pango/pango.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/pango/pango.hash b/package/pango/pango.hash
> index a6c924a8c..319d9778c 100644
> --- a/package/pango/pango.hash
> +++ b/package/pango/pango.hash
> @@ -1,5 +1,5 @@
> -# From https://ftp.acc.umu.se/pub/GNOME/sources/pango/1.50/pango-1.50.3.sha256sum
> -sha256  4add05edf51c1fb375a1ccde7498914120e23cb280dd7395b1aeb441f1838a4c  pango-1.50.3.tar.xz
> +# From https://ftp.acc.umu.se/pub/GNOME/sources/pango/1.50/pango-1.50.5.sha256sum
> +sha256  6d136872da6207fe88c5cd2c95c36bcaf4ed29402b854663a86cd7efe99b0cf5  pango-1.50.5.tar.xz
>   
>   # Locally computed
>   sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
> diff --git a/package/pango/pango.mk b/package/pango/pango.mk
> index 684407228..69ec5bb49 100644
> --- a/package/pango/pango.mk
> +++ b/package/pango/pango.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   PANGO_VERSION_MAJOR = 1.50
> -PANGO_VERSION = $(PANGO_VERSION_MAJOR).3
> +PANGO_VERSION = $(PANGO_VERSION_MAJOR).5
>   PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
>   PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
>   PANGO_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
