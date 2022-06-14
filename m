Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CDAC433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 18:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E70C640A07;
	Tue, 14 Jun 2022 18:43:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Zq7lyfun_iO; Tue, 14 Jun 2022 18:43:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D342409DD;
	Tue, 14 Jun 2022 18:43:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CB5951BF306
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C63DA409E3
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:43:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5_PpqAeU9ZLi for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 18:43:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98A3540191
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 18:43:53 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id gl15so18905613ejb.4
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 11:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=znCT2hPIyHn/xM0CTeMA2UKIp+MiXdqE1Qzhow0LM0I=;
 b=S144uHq+CLayS4o40V7MGW0C7nSKSxxoX1ZrVgzqyPgMxWFbXXJCAH61YlGaG8pHCQ
 05VJh4vsLsKnk/yabBAWXF4SGQCW5VyaEVaNVrGkD+KEfys8hQ28V9X9pA8E/19GZvTY
 grbeFd6YG0KMtvwazUUVSrlUzl1iNXk9bB96SptW3viRSSDXP/vbe32DAtLFn2Bsx6/e
 TOyKgbYYNcuYGvXf0v1MnOYqJugO1DKAXTNCMmgukDkl/fJ0EDwdQ85aaElqSSbWqeIR
 p8AtooR40mczz1hwngCCTgQvo+Zbt5/aDXfVuwVlf+jIatju4ZOjDvrBJTMgyGOXkuZ6
 KphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=znCT2hPIyHn/xM0CTeMA2UKIp+MiXdqE1Qzhow0LM0I=;
 b=ltLB61Nk5HQVLmmtEZLBERZ06TMgL4Jo94qYVnhqwTjwPisN9Un9dTPmIBRVAdkNsV
 8Bx78v55EH0Ct+LBntCzOosYw0CDkUdP0IOFb0AnX5bz1IjdTg80qhOkteE0OU/vEl0W
 JJo/Kt1sUSFx1RXi3jOPLx9z1HRl2QQ8+xveysikh2RHyuNevNjOXnlNDSHVlPjaB2YF
 nIHMBd9Y6XFsnl35+6d8CErT6Xq20taeiVLIrS+TuViYZwtHQicyQHtGcXzViFUBk9mN
 hZ18IJZGyaw1ZVyxMvWWTJN0TjWCcVlh4rBiEN+HTeJXxO1yMm3vsb4u8h/k6wRj71sm
 XrzA==
X-Gm-Message-State: AOAM532LxvB0IQR9e/MaEq2F/aEm3vRdl7Oc5BGEb0Q4DPdll+Ka6Rka
 QYqt8WoIFFLs12GkDq7/wYDETg==
X-Google-Smtp-Source: ABdhPJz3hIP6L24o01o+HUnl0GSbZJ00snAq8i+JhqWV3MtjyxeKSdjXAKP1ewxvMx1kTnT0wLOyIA==
X-Received: by 2002:a17:906:5fc4:b0:715:ebe6:7415 with SMTP id
 k4-20020a1709065fc400b00715ebe67415mr5451380ejv.725.1655232231601; 
 Tue, 14 Jun 2022 11:43:51 -0700 (PDT)
Received: from [10.1.0.138] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 oq13-20020a170906cc8d00b006feb047502bsm5309821ejb.151.2022.06.14.11.43.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 11:43:51 -0700 (PDT)
Message-ID: <b8553f9b-b333-c9de-3188-68b18984121b@mind.be>
Date: Tue, 14 Jun 2022 20:43:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220611121614.1172869-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220611121614.1172869-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/3] package/apache: add brotli as optional
 dependency
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



On 11/06/2022 14:16, Bernd Kuhls wrote:
> Fixes:
> http://autobuild.buildroot.net/results/90e/90e3a2aaf0ce0451b80c71743209797abeb83d0a/
> http://autobuild.buildroot.net/results/006/006f94bb216a77f073a5670fa2f393c43f15a977/
> http://autobuild.buildroot.net/results/dd6/dd69e665e51ce6b30e303a4d4670e9edbb159aea/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   package/apache/apache.mk | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/package/apache/apache.mk b/package/apache/apache.mk
> index b2c855aa36..a6fb59d26b 100644
> --- a/package/apache/apache.mk
> +++ b/package/apache/apache.mk
> @@ -45,6 +45,13 @@ APACHE_CONF_OPTS = \
>   	--with-mpm=$(APACHE_MPM) \
>   	--disable-luajit
>   
> +ifeq ($(BR2_PACKAGE_BROTLI),y)
> +APACHE_CONF_OPTS += --enable-brotli
> +APACHE_DEPENDENCIES += brotli
> +else
> +APACHE_CONF_OPTS += --disable-brotli
> +endif
> +
>   ifeq ($(BR2_PACKAGE_LIBXML2),y)
>   APACHE_DEPENDENCIES += libxml2
>   # Apache wants the path to the header file, where it can find
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
