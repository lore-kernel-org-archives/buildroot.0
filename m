Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B854C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 19:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B814C82FAE;
	Sun, 27 Mar 2022 19:33:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x7j8jvkWIpw4; Sun, 27 Mar 2022 19:33:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94E8282C84;
	Sun, 27 Mar 2022 19:33:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6DCCD1BF386
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 19:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C08182C84
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 19:33:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yZXz1rE3hZSt for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 19:32:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3BEFD82BBC
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 19:32:58 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id x34so14691287ede.8
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 12:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=eCuD/CjYcj9/nSFEa/JlHapJj97BTSx54L6LHAhOop4=;
 b=H16kcD4ETwOsDRlgnSSJ4oT+hsK13roSV2vp1W9+ocHd0vSj/jbTIDsnOOxObfiJo+
 rI8/dt00lsBJltKENUX+KNANJqFQzB0TfM9aJmuCeWkJUq+REcsAk9e1rW6U85mkRNVn
 g5pIo+/rJANdgqtcmvmE8PnFCAi6i0dZPRM+R4x9WFuEL0KX+6UlCEBKEeSlGpylNStJ
 76WX3fZnxGuV81gRWdJvpnv5Kvrr+fN8DqHPCAlmQ9x8vBqGMe/zNDXfipZdK6tnFvDt
 vFJOY6FPudPcN7fnq9D3dDbo0s6INNzvOcfsmDE9WmWNBxDv/cCVIYH+YOxh/Qb30PX2
 Dbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=eCuD/CjYcj9/nSFEa/JlHapJj97BTSx54L6LHAhOop4=;
 b=roiQj5GG+2LQ+dta7fiHLq7aDZXRt4Y9dUi9UKQmfI7HvBhCYOrvsL+c0IoyWRHCDQ
 fgqUdNQtBFv7GJyVx22xdyucpzJBrfvQHsE+oGJg3m5abe5W2ao0HGCo6su5qaYr/iBd
 Q1AJYty0XsMavGMf+tem+bR0CQBHq7GOUlxPxgSqqcXXszxedWI6gMnSNqXXupANrxnv
 /4jdjHV+Inrq3LCW3pw1/LJQsmKixpWBaEHQS1mpnD+iyhFp+TbnuOwg6ygco1HeuRWK
 qBxRZwdm9YglNYRLuWNdwiDSlxszRlJMqfdqnJ8b/4iNyAQo3h1qdbR+poIA8mMRspac
 AV0w==
X-Gm-Message-State: AOAM531t0EIjsIIm4NeVywchMS7SkZ6hBY1oLxVjvVAL3cIXMBoncv21
 N87zwWE1IPcPQgOLX62zumWcTA==
X-Google-Smtp-Source: ABdhPJxTDojeQ85ZKJ9E/8BhDSLWw130yRcxYN2w2q4MMoUvTtsOIfb/O4y7AqQUqRq+MIQgJu68og==
X-Received: by 2002:a05:6402:35c5:b0:419:2c72:66c3 with SMTP id
 z5-20020a05640235c500b004192c7266c3mr12027991edc.343.1648409576385; 
 Sun, 27 Mar 2022 12:32:56 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 nc13-20020a1709071c0d00b006df4e0d352csm5012397ejc.151.2022.03.27.12.32.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 12:32:55 -0700 (PDT)
Message-ID: <93bae11b-fdd9-dd11-ad47-2a6f09362d3c@mind.be>
Date: Sun, 27 Mar 2022 21:32:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220324063928.3448755-1-james.hilliard1@gmail.com>
 <66f33483-b1ac-640b-8226-a382de57d9c4@mind.be>
 <CADvTj4ruUJ4Do8BYw+-VtKj=gOYXHFJVdhCR82xTbnwxEVz+rw@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADvTj4ruUJ4Do8BYw+-VtKj=gOYXHFJVdhCR82xTbnwxEVz+rw@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: bump to
 version 1.36.4
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/03/2022 19:12, James Hilliard wrote:
> On Sun, Mar 27, 2022 at 10:27 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>>
>> On 24/03/2022 07:39, James Hilliard wrote:
>>> CONTRIBUTING.md hash changed due to various style updates.
>>>
>>> Set new default wifi backend config option to iwd when enabled in
>>> cases where the default wpa_supplicant is not enabled.
>>
>>    Applied to master, thanks.
>>
>>    However, I would like to challenge the order of preference here. If you select
>> network-manager, iwd and wpa_supplicant, and network-manager uses
>> wpa_supplicant, then you end up not using iwd at all, so that was probably not
>> the intention of the user. However, there is a good reason to still have
>> wpa_supplicant around when you have selected network-manager+iwd: wpa_supplicant
>> is also used for 802.1X authentication over Ethernet.
> 
> This just sets a somewhat sane default, which can be overridden by the config
> files as with previous versions by setting the network manager config setting:
> [device]
> wifi.backend=iwd
> 
> Note that upstream considers the iwd wifi backend somewhat experimental and
> defaults to wpa_supplicant even when iwd backend support is enabled.

  Good reasons.

> 
>>
>>    Either way, it's pretty hard to guess the intention of the user. So maybe a
>> Config.in choice is appropriate?
> 
> I figured overrides can be just done via overlay for this with a config file.

  Yes, I agree, better like that than adding an explicit Config.in option which 
anyway only sets a default.

  Thanks for the explanation!

  Regards,
  Arnout

> 
>>
>>>
>>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>>> ---
>>>    package/network-manager/network-manager.hash |  6 +++---
>>>    package/network-manager/network-manager.mk   | 13 ++++++++++---
>>>    2 files changed, 13 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
>>> index d25f0e8194..26bcf843c2 100644
>>> --- a/package/network-manager/network-manager.hash
>>> +++ b/package/network-manager/network-manager.hash
>>> @@ -1,6 +1,6 @@
>>> -# From https://download.gnome.org/sources/NetworkManager/1.34/NetworkManager-1.34.0.sha256sum
>>> -sha256  819795d0899076204f5672421a58f1b1d9e393536ee87bb844b911e6243bf0bd  NetworkManager-1.34.0.tar.xz
>>> +# From https://download.gnome.org/sources/NetworkManager/1.36/NetworkManager-1.36.4.sha256sum
>>> +sha256  61304e937dd926471d56715bdede7bab7ccac827356e67f2700d343317cd3c59  NetworkManager-1.36.4.tar.xz
>>>    # Locally computed
>>>    sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>>>    sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
>>> -sha256  ad0abd8e90dd134cc5546f7a13eb4268707b77a5a1a5e3afe31dc4397a573a04  CONTRIBUTING.md
>>> +sha256  f3c5ae3cafa27c24590cf89e732581cbeb4d25d950fe49ce7e4042963012b105  CONTRIBUTING.md
>>> diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
>>> index a90228992c..3479bb3794 100644
>>> --- a/package/network-manager/network-manager.mk
>>> +++ b/package/network-manager/network-manager.mk
>>> @@ -4,8 +4,8 @@
>>>    #
>>>    ################################################################################
>>>
>>> -NETWORK_MANAGER_VERSION_MAJOR = 1.34
>>> -NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).0
>>> +NETWORK_MANAGER_VERSION_MAJOR = 1.36
>>> +NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).4
>>>    NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
>>>    NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
>>>    NETWORK_MANAGER_INSTALL_STAGING = YES
>>> @@ -53,8 +53,15 @@ endif
>>>    ifeq ($(BR2_PACKAGE_IWD),y)
>>>    NETWORK_MANAGER_DEPENDENCIES += iwd
>>>    NETWORK_MANAGER_CONF_OPTS += --with-iwd
>>> +ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT),y)
>>> +NETWORK_MANAGER_CONF_OPTS += --with-config-wifi-backend-default=wpa_supplicant
>>>    else
>>> -NETWORK_MANAGER_CONF_OPTS += --without-iwd
>>> +NETWORK_MANAGER_CONF_OPTS += --with-config-wifi-backend-default=iwd
>>> +endif
>>> +else
>>> +NETWORK_MANAGER_CONF_OPTS += \
>>> +     --without-iwd \
>>> +     --with-config-wifi-backend-default=wpa_supplicant
>>
>>    This is set regardless of whether wpa_supplicant is enabled or not. Are you
>> sure that's OK?
>>
>>    Regards,
>>    Arnout
>>
>>>    endif
>>>
>>>    ifeq ($(BR2_PACKAGE_LIBCURL),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
