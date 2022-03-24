Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9BFC433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 20:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 303AB60BAD;
	Thu, 24 Mar 2022 20:13:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 98_nHE48aa4b; Thu, 24 Mar 2022 20:13:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7125960AF4;
	Thu, 24 Mar 2022 20:12:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A42FE1BF333
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 20:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92A0460ADC
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 20:12:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5arRNs_EyZ58 for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 20:12:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7AFB960BAD
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 20:12:56 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id bi12so11443967ejb.3
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 13:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=IILry4OH98FdqL2CyQaSukECGl4ALFZEllxjCU2c2xs=;
 b=gLNbQHhjtdm5Wv/dwZbSl7rAVW9gFhU06u4nRJM/SdJQQ5QV0yyU59T0082v+1k0A1
 HjpGISydxEh6kvkQ6P/4zbtPKCWCWCqPEQg6bowUICuQ5qDyrh5trn0hiPdrEvFHpN4Y
 hPovK2vAnWQfjVvH6K0TIskeZnJiGTWnK5P9C/3RLUKoDrEPER67THbiv4PGvKipOeFc
 4PONSuCPxPYt5E8LSMu/fEjjEO+mOGKJW7ZpY0CHH8Ybwl8mmItVioQzIytNhGbWIlQ9
 jAlVUDYE/vrRvYYB/RCU+58F0MEHMqSi5MekWejYXfpLB8PywecnxY30fkoYmvDFrWGE
 GVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=IILry4OH98FdqL2CyQaSukECGl4ALFZEllxjCU2c2xs=;
 b=KJL9zCIEBmldyD31MbKq9Tb2Q2RRQDWtwKSweCaBJnbGJGc+u5nYoCkRu3QmOjauVY
 tA944TfQyoMXOGu7FjtyyM0D+NQCGBjCPjhrv8alJuL0wxniPUneXKQrkCixXB3CVc7I
 XRZ616bWeCM8OuBoe1idAEzC6B2xiCqZsaoq6ubojZX/8b2HRJTt447nMdPCXDMUmE/T
 lTSfdS+TCPNGa162kNFR9jf7cCwroYscUq/hygQGqN5ulWqupfWDfu+o68qETvcGWG+6
 N6VO0XLsx+78ORm66feIOJNFmlrSPB2gtm+DSmUVRhJfjoj/N3Dk1g4mtKqHNmzX8wz/
 HZTQ==
X-Gm-Message-State: AOAM530VbsvXIRwNnK1z0k1Nia/39aVF5LYSqPtMjiRsk8NzeCyi0KO8
 DpCEZCPzxyMaCbuIj8JyVNJN0x6mY+snkg==
X-Google-Smtp-Source: ABdhPJxnLOsNEUEoxgBLwg84gj57UimmUXWwDLl7cS7CsXHTeARrfLdOD98YeCebfiku+iVu3bxdKA==
X-Received: by 2002:a17:907:2d06:b0:6e0:2ec:c7bd with SMTP id
 gs6-20020a1709072d0600b006e002ecc7bdmr8079388ejc.656.1648152774678; 
 Thu, 24 Mar 2022 13:12:54 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a170906708700b006da8440d642sm1536450ejk.113.2022.03.24.13.12.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 13:12:54 -0700 (PDT)
Message-ID: <b4af61e1-671f-153a-b45c-2c263e5a1bd7@mind.be>
Date: Thu, 24 Mar 2022 21:12:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Thomas Ruschival <thomas@ruschival.de>, buildroot@buildroot.org
References: <20220312104402.33075-2-thomas@ruschival.de>
 <20220314181347.190747-1-thomas@ruschival.de>
 <20220314181347.190747-2-thomas@ruschival.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220314181347.190747-2-thomas@ruschival.de>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/pistache: bump version &
 switch to meson build
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



On 14/03/2022 19:13, Thomas Ruschival wrote:
> While upstream pistache has not yet released a stable 'tag'

  I don't think they ever will :-)

> a lot has changed since June 2020:
> 
> * project has moved to meson build system, cmake builds
>    do not install headers.
> * patches in buildroot are no longer required
> * project-implemented Pistache::Optional was replaced by
>    use of std::optional. This is only available in C++17
> * dependency to rapidjson has been introduced
> 
> Signed-off-by: Thomas Ruschival <thomas@ruschival.de>
> ---
>   ...-add-C-language-to-project-statement.patch | 70 --------------
>   ...eLists.txt-respect-BUILD_SHARED_LIBS.patch | 95 -------------------
>   ...de-pistache-typeid.h-include-cstddef.patch | 38 --------
>   package/pistache/Config.in                    |  9 +-
>   package/pistache/pistache.hash                |  2 +-
>   package/pistache/pistache.mk                  | 10 +-
>   6 files changed, 12 insertions(+), 212 deletions(-)
>   delete mode 100644 package/pistache/0001-CMakeLists.txt-add-C-language-to-project-statement.patch
>   delete mode 100644 package/pistache/0002-CMakeLists.txt-respect-BUILD_SHARED_LIBS.patch
>   delete mode 100644 package/pistache/0003-include-pistache-typeid.h-include-cstddef.patch
> 

[snip]
> diff --git a/package/pistache/pistache.mk b/package/pistache/pistache.mk
> index 4d6bd283ea..65d9b2412c 100644
> --- a/package/pistache/pistache.mk
> +++ b/package/pistache/pistache.mk
> @@ -4,18 +4,20 @@
>   #
>   ################################################################################
>   
> -PISTACHE_VERSION = f2f5a50fbfb5b8ef6cf1d3d2a9d442a8270e375d
> +PISTACHE_VERSION = 3ec9d7c4f8b828fdd391550fff81b01e72dd6269
>   PISTACHE_SITE = $(call github,oktal,pistache,$(PISTACHE_VERSION))
>   PISTACHE_LICENSE = Apache-2.0
>   PISTACHE_LICENSE_FILES = LICENSE
>   
>   PISTACHE_INSTALL_STAGING = YES
> +PISTACHE_DEPENDENCIES += rapidjson
>   
>   ifeq ($(BR2_PACKAGE_OPENSSL),y)
>   PISTACHE_DEPENDENCIES += openssl
> -PISTACHE_CONF_OPTS += -DPISTACHE_USE_SSL=ON
> +PISTACHE_CONF_OPTS += -DPISTACHE_USE_SSL=true
> +PISTACHE_CONF_OPTS += -DPISTACHE_ENABLE_NETWORK_TESTS=false

  I've applied to master as is, but this sounds like we would always want to 
disable it (we don't build tests if we can avoid it). Follow-up patch to move it 
out of the condition (if that's the right thing to do) welcome!

  Regards,
  Arnout

>   else
> -PISTACHE_CONF_OPTS += -DPISTACHE_USE_SSL=OFF
> +PISTACHE_CONF_OPTS += -DPISTACHE_USE_SSL=false
>   endif
>   
> -$(eval $(cmake-package))
> +$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
