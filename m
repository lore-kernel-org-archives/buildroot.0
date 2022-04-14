Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8591EC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 19:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 355C283E2F;
	Thu, 14 Apr 2022 19:27:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ApRD7hxOh6As; Thu, 14 Apr 2022 19:27:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 425C283E6A;
	Thu, 14 Apr 2022 19:27:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D09B81BF319
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCE2B404D7
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:27:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Iw2wNEhMpv3z for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 19:27:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 310354012D
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 19:27:27 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id g20so7598365edw.6
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 12:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=V8goRVCDZovnJ0gfLxbDlAl8j6a/SlFk3eMTmW4AUZs=;
 b=en5Sckav3jSReek9wevNr4E5zQXW7oBC4I6+b9o/lvo2/kwFHE7FoVp8k9loiiokNl
 bMrhkYzHrskOGY31GEYeJPZUhmDKEQdUIHfQJLlY2ie1V4HLut5NB6Ugo08Em1MKfrHa
 W5cTFaBXc17yGF3nUUu7+wlkLu7aDUicH54/SjA1R29ItB38IXo0qcQ8pALph8viaV7i
 nXTlY7+lYnFC/0nK7V7OAVuBdYK1ERtynNGiP8Vme9Q00HCP9f7+DhiVHr5Ad7MXmrld
 dQhRHZWtiybdITSkyymvIDhM4SpcEFrCB0qMkmsxMQxWudH+IMaNE9XRMlTB0HDYkGzF
 W4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=V8goRVCDZovnJ0gfLxbDlAl8j6a/SlFk3eMTmW4AUZs=;
 b=WvGd3KVIvDqxqpTpgh2vB0GHwWZ+KiBX9KPWPHT0qMCpm3fP60EZMFjiyEpkcDSYjb
 wDSNQQex/MVvRyQgvRh2FWzbJMK5ZHCzKLCgXE7Uv/s275uotSW27sNUCkwDliAwRm8h
 o5AylLUtrpYLRlTIAzfnBZpGE3PPhkJRUiMvD4geo7TtDc06+iCYsvbDL/s45xD7sQ3w
 n9C1AA277ud4CCQWa9/LI6njN7t93/KTF5j2a06RQGyEB+lxm7JLyuRnoOqFJMR7QUbU
 6uVhrK2WBmGTWXAsrv3ObMKLCKMoyTZco4w63vRQoXXEf0AFNciwMNfOvgnprYM/V6Rx
 xVWA==
X-Gm-Message-State: AOAM532vQaHjoSqQ4DB3U97pio7sXwiYO4I3NCgXmyDB9QaqyRDQhhwO
 uxyQ1wYYNPSrlTrJLELSDP1nPAoc5xn0FA==
X-Google-Smtp-Source: ABdhPJyUop+rfi3Q7Uh0u+PWyT6Yo8g7pzqk/UsshyMSwjdYNJJUKGrx9Bc71tf501mQwosQrkkdyg==
X-Received: by 2002:a05:6402:1907:b0:41d:96ee:d631 with SMTP id
 e7-20020a056402190700b0041d96eed631mr4680324edz.407.1649964445413; 
 Thu, 14 Apr 2022 12:27:25 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a1709067d5300b006e8488d9a80sm954471ejp.59.2022.04.14.12.27.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 12:27:24 -0700 (PDT)
Message-ID: <9406710d-ed6f-d0cd-4a7a-60480a4d4872@mind.be>
Date: Thu, 14 Apr 2022 21:27:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220406172934.4009018-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220406172934.4009018-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/boost: drop versioned layout
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



On 06/04/2022 19:29, Fabrice Fontaine wrote:
> boost.m4 embedded by cc-tool is not able to find boost libraries when
> they are versionned (e.g. libboost_program_options-gcc9-mt-sd-1_78.a):
> 
> configure: error: cannot find the flags to link with Boost program_options
> 
> azmq and i2pd also have the same issue:
> 
> CMake Error at /nvmedata/autobuild/instance-8/output-1/host/share/cmake-3.18/Modules/FindPackageHandleStandardArgs.cmake:165 (message):
>    Could NOT find Boost (missing: Boost_INCLUDE_DIR system date_time thread
>    chrono random) (Required is at least version "1.48")
> 
> So drop versioned layout option

  This is probably going to cause problems for some custom packages that have a 
simple build system that assumes the versioned layout. Oh well, bad luck.

  Applied to master, thanks.

  Regards,
  Arnout

> 
> Fixes:
>   - http://autobuild.buildroot.org/results/4ae98aed925fbb1d54023075deda9a864f52cee6
>   - http://autobuild.buildroot.org/results/de35ca0156d4b6f465e440ed9a3effd471f657fa
>   - http://autobuild.buildroot.org/results/c3d2a066429d5f2889c2232d62e5950eb6a89311
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   Config.in.legacy        | 9 +++++++++
>   package/boost/Config.in | 7 -------
>   2 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 48c5ebb81e..27f19f14e7 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -144,6 +144,15 @@ endif
>   
>   ###############################################################################
>   
> +comment "Legacy options removed in 2022.05"
> +
> +config BR2_PACKAGE_BOOST_LAYOUT_VERSIONED
> +	bool "boost versioned layout removed"
> +	select BR2_LEGACY
> +	help
> +	  Boost versioned layout isn't handled by a number of autotools
> +	  and cmake packages (e.g. azmq, cc-tool, i2pd).
> +
>   comment "Legacy options removed in 2022.02"
>   
>   config BR2_PACKAGE_LIBCURL_LIBNSS
> diff --git a/package/boost/Config.in b/package/boost/Config.in
> index 16c3ef8465..f039d68b1e 100644
> --- a/package/boost/Config.in
> +++ b/package/boost/Config.in
> @@ -36,19 +36,12 @@ config BR2_PACKAGE_BOOST_LAYOUT_TAGGED
>   	  and version, or Boost version. This option is useful if you
>   	  build several variants of Boost, using the same compiler.
>   
> -config BR2_PACKAGE_BOOST_LAYOUT_VERSIONED
> -	bool "versioned"
> -	help
> -	  Boost binary names include the Boost version number, name
> -	  and version of the compiler and encoded build properties.
> -
>   endchoice
>   
>   config BR2_PACKAGE_BOOST_LAYOUT
>   	string
>   	default "system" if BR2_PACKAGE_BOOST_LAYOUT_SYSTEM
>   	default "tagged" if BR2_PACKAGE_BOOST_LAYOUT_TAGGED
> -	default "versioned" if BR2_PACKAGE_BOOST_LAYOUT_VERSIONED
>   
>   config BR2_PACKAGE_BOOST_ATOMIC
>   	bool "boost-atomic"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
