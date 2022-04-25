Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132DBC433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 20:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D02D540576;
	Mon, 25 Apr 2022 20:24:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wZh9E2u5L_C6; Mon, 25 Apr 2022 20:24:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEF4C40574;
	Mon, 25 Apr 2022 20:24:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F2D981BF2AB
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFED640526
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:24:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HUtwzS9_xQBz for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 20:24:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 155E2404FF
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 20:24:16 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id l18so5243679ejc.7
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 13:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1dKUzh09V2eRMxe1wriDzigjWxFrzy1wokJ7xEVbvNM=;
 b=SjeTEO7yKGaTNcuJiNkPVD5gx3fmm24a+q9NG0IDDBruXGXAaXJ/M7/x/NG2T1pivN
 ZRdTHzdDlqFl9FKuYo1U0PFlgtQTN5DdV9laj5a5XxfGtc4KoQqqEJWOM9WYbvrhQUqf
 9S3yy0YboEL7RD4xTJCkS2MBjeQd+/CMZRCjWN8us3qUQDpsQIDQftd3llXpLqcriSNH
 uNMiVSvaYbxkDTmk2ss0VVJyLPDpuGak2RpXhrvCMdKz7Ox+higtI/WRzeV/lezBH7XX
 qYEwOIwv8w1BaLa5MtfltlNxM20J/qHzo7gSl7+rXGNmhU1Fx0bZRH5Q8hne8aObnFWs
 r/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1dKUzh09V2eRMxe1wriDzigjWxFrzy1wokJ7xEVbvNM=;
 b=jISHpZiMOrzZPsNLn6T7auO9WHmKjN3xuGtMayD1yn0LmruLa8OvBbZaAN3xjlBmkX
 SDaDxeF/sbABoSImn+xeYjt1xXcYxJSpZeAXi2XlhS8l5YdXiYi2bOBbWqGQOFCjn5e3
 ERPZjBiyvI55eGBkPHq8ZY9XcsJNBd/PvL3SRtAlssnocolfUpf3kOwUclv8wPrAuw/R
 3Lve+EtODCabf0qQcPJKf5QRLCIqL6cDzxXGt3/unhL/m7dSbvLDBsXrEbcJaCPz/coX
 92C7iOMADvTNh9zYmIhfRApGYR122h0lnV0VFwKYw1uoYepr48w+C3fWwFsj14ovHDZf
 y6DA==
X-Gm-Message-State: AOAM531uxFM3VbDTBs68LJQL93xo6O49CjUD6wVZ6Lnfwi5TQcRVpB8W
 dkV8CYaTQ+bMzIzzALSvTT+W2g==
X-Google-Smtp-Source: ABdhPJxzm9JMXbmk9KUGwvY4CfPpx6KN8oevhbGmdPOXlbanEMUISZuf5oveSZitNvAGQ343BgHRqw==
X-Received: by 2002:a17:906:c116:b0:6f3:832f:3c8 with SMTP id
 do22-20020a170906c11600b006f3832f03c8mr10089976ejc.235.1650918255259; 
 Mon, 25 Apr 2022 13:24:15 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 lb26-20020a170907785a00b006ea4d2928e5sm3923967ejc.218.2022.04.25.13.24.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 13:24:14 -0700 (PDT)
Message-ID: <dbb77a4f-ff40-89d6-ac77-50a5835c36cd@mind.be>
Date: Mon, 25 Apr 2022 22:24:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220423174858.2445604-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220423174858.2445604-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/clamav: fix libxml2 build
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



On 23/04/2022 19:48, Fabrice Fontaine wrote:
> Pass ac_cv_path_xmlconfig to fix the following build failure with
> libxml2 raised since bump to version 0.102.0 in commit
> 007f49962a961f96ff87795217758ec3786d03ac and
> https://github.com/Cisco-Talos/clamav/commit/083ca38727b0ebd3979cf1ebc7b31148f6d5e7f7:
> 
> aarch64-none-linux-gnu-gcc: WARNING: unsafe header/library path used in cross-compilation: '-I/usr/include/libxml2'
> In file included from /usr/include/libxml2/libxml/parser.h:810,
>                   from others.c:62:
> /usr/include/libxml2/libxml/encoding.h:31:10: fatal error: unicode/ucnv.h: No such file or directory
>     31 | #include <unicode/ucnv.h>
>        |          ^~~~~~~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/5bb3bea6d13ac8d497f6862374d65a59bea7ed09
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/clamav/clamav.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
> index cd2d06e6b3..e2ee99d02b 100644
> --- a/package/clamav/clamav.mk
> +++ b/package/clamav/clamav.mk
> @@ -69,6 +69,7 @@ CLAMAV_CONF_OPTS += --without-libjson
>   endif
>   
>   ifeq ($(BR2_PACKAGE_LIBXML2),y)
> +CLAMAV_CONF_ENV += ac_cv_path_xmlconfig=$(STAGING_DIR)/usr/bin/xml2-config
>   CLAMAV_CONF_OPTS += --with-xml=$(STAGING_DIR)/usr
>   CLAMAV_DEPENDENCIES += libxml2
>   else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
