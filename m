Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71008C433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 17:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1552860D76;
	Tue,  4 Jan 2022 17:13:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TmXFdhG3NL-B; Tue,  4 Jan 2022 17:13:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E8F160E21;
	Tue,  4 Jan 2022 17:13:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 625361BF32A
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DD3860C05
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:13:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dUeUW4IdnWTr for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 17:13:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 23A0560BDB
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 17:13:04 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id q14so143293891edi.3
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 09:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fobSIiUPyy7Wry7leiwVGlWt4oNAILSh8u6ilKejSrw=;
 b=CP2t8pZG4pi5gOt6PKcwtSfjh2g8BmvipS6TAYwRsOG2LmmtdyeH4oKWLj/B7IXnVe
 Goofz9nBevVH7mk2gLa19homQ/3lpiq1SKJmhgdyRLrKsXVCus104ek2ouobkdWTEumT
 tlK9FimURzQP1WEBm9MqDoFxWporyyWtpf55yZlCWLyhcN3ujRS7gDY7jRkQklhefhkx
 OmeydbM4qyTaWmAXqaTqtnUkU8ndp7BoNvhFcKqh/AFv+DgyQey0B8VZZzIFi+D/5mwO
 e7XFVn7o/7krCCOIGLRhRbzdcy3a2tgCcXlvSq0yFU46iCWqSqE6mU7Lf9eFFpjYIpu8
 1aIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fobSIiUPyy7Wry7leiwVGlWt4oNAILSh8u6ilKejSrw=;
 b=JlsXScP1GJklHtM0wWzMqM6VCdNyL7FhIzNSfphnPNH9da/FHpJMhNjlq4daeUTj6I
 7o6+s/U3v3pVKog1Ae51IVVUsdOgMrR3xqU3BQrEzuHCjWoUvZae4ylEqqzFpBUjI9bz
 4p4gZICejwkERSTGN7hejdkJA8FGhi/XDQq67xllXdieswVCPSWzh689tm9Iar6dbAYs
 i0ZsNGRiHQS8Go7KfTC6zyem4ag6iNst5HpcRAy1FCS1vp5ohwye1A9AmkRR+0zm6pdr
 QcteFv38PbTA1fDWOeVGxEZwqg6h8t2dgAU9K+FfoXcmsPb+c187g+U5tipZosKnJl62
 9WPQ==
X-Gm-Message-State: AOAM532bHFPUHrpx9BzGzLZagxV8tu8VK0mxtinjAIfxxNLS82/16iIg
 dyKJzf65iaStVKESH4s9h+ZA/w==
X-Google-Smtp-Source: ABdhPJwlefrqytUkgLrCKsX1at187qnus1Y+X4rTbMzV7v4PL0L0qa/lBHEPLWR3MdnsalXGl29d3A==
X-Received: by 2002:a17:907:168b:: with SMTP id
 hc11mr42122964ejc.518.1641316382320; 
 Tue, 04 Jan 2022 09:13:02 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id s5sm11646081ejn.205.2022.01.04.09.13.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 09:13:01 -0800 (PST)
Message-ID: <a8ffaa16-6255-f3be-e910-f722d8a114e8@mind.be>
Date: Tue, 4 Jan 2022 18:13:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220101155950.1784485-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220101155950.1784485-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/tvheadend: disable execinfo
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/01/2022 16:59, Fabrice Fontaine wrote:
> Disable execinfo to avoid the following build failure if libexecinfo is
> built before tvheadend since the addition of the package in commit
> eea8ba446c10701a273432552108d80fb2224ef4:
> 
> /home/peko/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: /home/peko/autobuild/instance-0/output-1/build/tvheadend-b8710206eb073c72b142bce95846b77a0ffa34a6/build.linux/src/tvhlog.o: in function `tvhlog_backtrace_printf':
> /home/peko/autobuild/instance-0/output-1/build/tvheadend-b8710206eb073c72b142bce95846b77a0ffa34a6/src/tvhlog.c:522: undefined reference to `backtrace'

  I was thinking, why not simply link with libexecinfo when needed? But since 
the patch was anyway accepted upstream and I don't care about execinfo in 
tvheadend:
  Applied to master, thanks.

  Regards,
  Arnout

> 
> Fixes:
>   - http://autobuild.buildroot.org/results/ee9ad2c999b622097fe0f1522e7e32184722e548
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   .../0002-configure-add-execinfo-option.patch  | 55 +++++++++++++++++++
>   package/tvheadend/tvheadend.mk                |  1 +
>   2 files changed, 56 insertions(+)
>   create mode 100644 package/tvheadend/0002-configure-add-execinfo-option.patch
> 
> diff --git a/package/tvheadend/0002-configure-add-execinfo-option.patch b/package/tvheadend/0002-configure-add-execinfo-option.patch
> new file mode 100644
> index 0000000000..c55d127d58
> --- /dev/null
> +++ b/package/tvheadend/0002-configure-add-execinfo-option.patch
> @@ -0,0 +1,55 @@
> +From 04c01e631cb1bf47dd50b1ef92a086308e380eff Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sat, 1 Jan 2022 16:53:29 +0100
> +Subject: [PATCH] configure: add execinfo option
> +
> +Add execinfo option to allow the user to disable the feature even if
> +execinfo.h is found on the system
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upsteam status: https://github.com/tvheadend/tvheadend/pull/1431]
> +---
> + configure | 17 +++++++++++++++--
> + 1 file changed, 15 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure b/configure
> +index 4dad024c4..c087502bf 100755
> +--- a/configure
> ++++ b/configure
> +@@ -75,6 +75,7 @@ OPTIONS=(
> +   "ddci:yes"
> +   "cclang_threadsan:no"
> +   "gperftools:no"
> ++  "execinfo:auto"
> + )
> +
> + #
> +@@ -150,11 +151,23 @@ if [ ${PLATFORM} = "freebsd" ]; then
> +     # If we don't have libunwind then fallback to execinfo.
> +     if ! enabled libunwind
> +     then
> +-        check_cc_header execinfo
> ++        if enabled_or_auto execinfo; then
> ++            if check_cc_header execinfo; then
> ++                enable execinfo
> ++            else
> ++                die "execinfo.h not found (use --disable-execinfo)"
> ++           fi
> ++        fi
> +     fi
> +
> + else
> +-    check_cc_header execinfo
> ++    if enabled_or_auto execinfo; then
> ++        if check_cc_header execinfo; then
> ++            enable execinfo
> ++        else
> ++            die "execinfo.h not found (use --disable-execinfo)"
> ++        fi
> ++    fi
> + fi
> + check_cc_option mmx
> + check_cc_option sse2
> +--
> +2.33.0
> +
> diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
> index 4e84e496bf..58ebdcb054 100644
> --- a/package/tvheadend/tvheadend.mk
> +++ b/package/tvheadend/tvheadend.mk
> @@ -161,6 +161,7 @@ define TVHEADEND_CONFIGURE_CMDS
>   			--enable-dvbscan \
>   			--enable-bundle \
>   			--enable-pngquant \
> +			--disable-execinfo \
>   			--disable-ffmpeg_static \
>   			--disable-hdhomerun_static \
>   			$(TVHEADEND_CONF_OPTS) \
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
