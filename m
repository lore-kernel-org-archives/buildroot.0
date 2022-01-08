Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD06C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 19:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF74C81066;
	Sat,  8 Jan 2022 19:01:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tOqR4PhcoLps; Sat,  8 Jan 2022 19:01:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 395BA80D69;
	Sat,  8 Jan 2022 19:01:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB9661BF593
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 19:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A82C1400E3
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 19:01:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MQEIzFMbuN_y for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 19:01:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8ED97400C1
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 19:01:27 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso6851567wmj.2
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 11:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Y5476dYOHc+Ks9hYa9crleQFweVr0sQ/nJWuQa1QLio=;
 b=gV+CZhdIbtyvZbp5jyy1mlw/pnGDNEtmTanK5w/13aNrADZKmFazPaMSt1TjZrEZai
 j0w7D+Fj2RSBwbKHDaDNp6okv6yfpAbwe4mdJbuXjsr0lOJiLIggLAa898yVmhJdKf3/
 bKZvnex8s30uVqmuTF4U+MJVb+7UriOYEG2WExsnX9SK2MawVzpUrUrMO3AU5WgNTM5K
 iCr1Bbr+YpGt8NA6C5HOnwStfp4V1DgKZPU7otJDU29zgsla+FkdycH3/NMGtlNNmEUY
 vSC0oPSc1U59oSoxltgGHlm9cYjCptdMEqY8GXDIWXthRnJXBCZaqC2hq2J/SvSbqbNS
 zDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Y5476dYOHc+Ks9hYa9crleQFweVr0sQ/nJWuQa1QLio=;
 b=eD7ueY7ergD+Uh0ipIaNKkHKHDDE71VWUiMVl0X30a9YDRf+U6BZnwwmAqTVlmulta
 mjIKojOsRuq8rmAXLQ/MrehjD2V0d2no6b5CRLB/uWgjmSYYzO8/JutrLlWfVDG15VdN
 yZzgS4RGiI5PDIcMEoniwEJEo8H+mzbCd0FDORmpoQYFHC4siu0g0yyObp+8yKTtbyBC
 yG7w9tLOJY54LNfb3f4F6JmbmdI9mUwic2oO6uk+z8GdA+fPe/nsgDElxQTkNTw66iFx
 3uuKdcgcR4JawhWr/1BVmp84+S5rtHBjHVGL0/codLUEAnDmNlhZ/8A86zlpxjk2JyEx
 NY1A==
X-Gm-Message-State: AOAM533YGSveIEkF+WE1lCqkouS4M11YAAz5ET2hV+7viKC+3fXkdp4h
 /Kb3xW8yRuC9kBlJSiDLWflcMg==
X-Google-Smtp-Source: ABdhPJyuIqSPxtOmnDeWJ81A76uX0fFUuInzIFSm1p0vMAGOo+UgtrIDlBvMmZ+aBM/N7EvDYL4gTA==
X-Received: by 2002:a05:600c:354c:: with SMTP id
 i12mr15781883wmq.139.1641668485871; 
 Sat, 08 Jan 2022 11:01:25 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id d22sm2383750wrb.83.2022.01.08.11.01.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 11:01:25 -0800 (PST)
Message-ID: <2d3fc713-d7dd-3821-338d-768a17102abc@mind.be>
Date: Sat, 8 Jan 2022 20:01:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220108154118.2320814-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220108154118.2320814-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/trinity: fix build with
 libexecinfo
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



On 08/01/2022 16:41, Fabrice Fontaine wrote:
> Fix the following build failure raised on uclibc and musl since the
> addition of libexecinfo package in commit
> eea8ba446c10701a273432552108d80fb2224ef4:
> 
> /home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/10.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: debug.o: in function `__show_backtrace':
> debug.c:(.text+0x10): undefined reference to `backtrace'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/bf78e4be9b9d9ca7d32f922d72ea6cd39a78d3d8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/trinity/trinity.mk | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/package/trinity/trinity.mk b/package/trinity/trinity.mk
> index befb8de826..4dca50c0b6 100644
> --- a/package/trinity/trinity.mk
> +++ b/package/trinity/trinity.mk
> @@ -11,16 +11,24 @@ TRINITY_LICENSE = GPL-2.0
>   TRINITY_LICENSE_FILES = COPYING
>   TRINITY_CPE_ID_VENDOR = trinity_project
>   
> +TRINITY_LDFLAGS = $(TARGET_LDFLAGS)
> +
> +ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
> +TRINITY_DEPENDENCIES += libexecinfo
> +TRINITY_LDFLAGS += -lexecinfo
> +endif
> +
>   define TRINITY_CONFIGURE_CMDS
>   	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure)
>   endef
>   
>   define TRINITY_BUILD_CMDS
> -	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) LDFLAGS="$(TRINITY_LDFLAGS)"
>   endef
>   
>   define TRINITY_INSTALL_TARGET_CMDS
> -	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR)/usr install
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> +		LDFLAGS="$(TRINITY_LDFLAGS)" DESTDIR=$(TARGET_DIR)/usr install
>   endef
>   
>   # Install helper scripts
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
