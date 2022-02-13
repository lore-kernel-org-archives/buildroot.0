Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319D9C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 11:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFABA60A9C;
	Sun, 13 Feb 2022 11:45:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TMkKchXe3qKt; Sun, 13 Feb 2022 11:45:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 122C360706;
	Sun, 13 Feb 2022 11:45:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7FC041BF842
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E4FD60671
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:44:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iQVE1ZPOf_Cq for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 11:44:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6396D60648
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 11:44:32 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id g7so7040918edb.5
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 03:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4dO6q3pu+aGDtMe/ZD/KiKznFRZojOHkKVrFf2dgkV4=;
 b=QdEhlaVW7TwUM8mdcX5967iixSi3V6N6rLGRzsROYKhs4jK0edwd9sgM3jhnLJVlgj
 mU8aMR8K2QUFpGQYf5sp2AJNkb82tAOALuVLn3EGjhLoddv3HF/fbDOZSRQeDQUiHrc9
 w4dO5K4GuqAZmJnTiMGv4477MpCs875wu7oQiDrsdLbXtnCC7vP7g3IlHqFyYGsFu1/Q
 usJ4zr6uxteIPHyM9ua68/GAmPtJGsWB+InjkSWtTE08IcsNpoRZEuQ1H20EBE+O+gkV
 VS1Dj+/EADhYz2XyUm5puY+AhQCTPEC4TeFDIjwPLxjfpbRJLAiJ1SV0Tetv1BxTugO0
 7W6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4dO6q3pu+aGDtMe/ZD/KiKznFRZojOHkKVrFf2dgkV4=;
 b=ZVsY7rCWhUIu2L0I8riC4Jw2uHZ5GKdpWbKl43FhktfFwf6F7PUC2GMgSKIdVhhe3B
 ecAxaSZtuCNbKbUBy+fanLNr/OFHIdiKA7YCGA2fvbUTYARcp7bGJ7J8mEFbEWu8OgON
 aAy2SLKx5JuQmhOLpJja6h61Rat5CrDMU9+qv1CtYU8PASI0qnUldDh/LV1iELGdK0c6
 zw9rQzRSzlaKe6I2pz5fnjs7SQ3cQFBVGJ/bpXxIgGtR2qn5irTqM5IzvNIxe1FQFfUu
 g5GtzKvSm6EzQXMYW42QePaDgpkHxapZhz3Yk6Th2wkIDkbjEhDVjY0quQVw3dKOpK7T
 zDXA==
X-Gm-Message-State: AOAM531Z0tDIlSz+llQ+v3QZRWQU+1j80haAVTIay/a/fbRkqW49Wvfc
 3CG6/XEX0nTH6Od4jqX6iNBYAA==
X-Google-Smtp-Source: ABdhPJxivy7S3gg3WHdVIwtEVo5IV3BnGyrV0YRqlIPd0wpe4VVPVI6tCEGnCZLTUzb8vvXQp14W7g==
X-Received: by 2002:a05:6402:2747:: with SMTP id
 z7mr10339226edd.227.1644752670729; 
 Sun, 13 Feb 2022 03:44:30 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id j12sm7200183ejc.83.2022.02.13.03.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 03:44:30 -0800 (PST)
Message-ID: <19a05780-b4ed-08a5-8a95-4320fe9e7f42@mind.be>
Date: Sun, 13 Feb 2022 12:44:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220202173306.42559-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220202173306.42559-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/sconeserver: fix build with icu
 and libxml2
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
Cc: Simon Dawson <spdawson@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/02/2022 18:33, Fabrice Fontaine wrote:
> Fix the following build failure raised since addition of icu support in
> libxml2 through commit 49d7c85421e87d9d762be9352805cb47a2f0bbeb:
> 
> In file included from /home/peko/autobuild/instance-1/output-1/host/mips64el-buildroot-linux-gnu/sysroot/usr/include/unicode/ptypes.h:52:0,
>                   from /home/peko/autobuild/instance-1/output-1/host/mips64el-buildroot-linux-gnu/sysroot/usr/include/unicode/umachine.h:46,
>                   from /home/peko/autobuild/instance-1/output-1/host/mips64el-buildroot-linux-gnu/sysroot/usr/include/unicode/utypes.h:38,
>                   from /home/peko/autobuild/instance-1/output-1/host/mips64el-buildroot-linux-gnu/sysroot/usr/include/unicode/ucnv_err.h:88,
>                   from /home/peko/autobuild/instance-1/output-1/host/mips64el-buildroot-linux-gnu/sysroot/usr/include/unicode/ucnv.h:51,
>                   from /home/peko/autobuild/instance-1/output-1/host/mips64el-buildroot-linux-gnu/sysroot/usr/bin/../../usr/include/libxml2/libxml/encoding.h:31,
>                   from /home/peko/autobuild/instance-1/output-1/host/mips64el-buildroot-linux-gnu/sysroot/usr/bin/../../usr/include/libxml2/libxml/parser.h:812,
>                   from conftest.cpp:61:
> /home/peko/autobuild/instance-1/output-1/host/mips64el-buildroot-linux-gnu/sysroot/usr/include/unicode/localpointer.h:224:41: error: 'noexcept' does not name a type
>       LocalPointer(LocalPointer<T> &&src) U_NOEXCEPT : LocalPointerBase<T>(src.ptr) {
>                                           ^
> /home/peko/autobuild/instance-1/output-1/host/mips64el-buildroot-linux-gnu/sysroot/usr/include/unicode/localpointer.h:224:41: note: C++11 'noexcept' only available with -std=c++11 or -std=gnu++11
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/be043792e6e5501631517881b10096291a654364
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/sconeserver/sconeserver.mk | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
> index 17407c29f5..2b28f8015c 100644
> --- a/package/sconeserver/sconeserver.mk
> +++ b/package/sconeserver/sconeserver.mk
> @@ -29,6 +29,8 @@ SCONESERVER_CONF_OPTS += \
>   ifeq ($(BR2_PACKAGE_LIBXML2),y)
>   SCONESERVER_CONF_OPTS += \
>   	--with-xml2-config="$(STAGING_DIR)/usr/bin/xml2-config"
> +# Needed to fix build failure when icu is enabled in libxml2
> +SCONESERVER_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
>   endif
>   
>   ifeq ($(BR2_PACKAGE_OPENSSL),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
