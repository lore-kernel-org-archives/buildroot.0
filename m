Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAD7C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 15:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66CBC8332A;
	Sun,  3 Apr 2022 15:02:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VL9eXiwu1KqH; Sun,  3 Apr 2022 15:02:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74B18832C6;
	Sun,  3 Apr 2022 15:02:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2C45E1BF96B
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 15:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29BCE60E14
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 15:02:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2G33MD2ClCqx for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 15:02:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41D7760E09
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 15:02:52 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id f18so3167546edc.5
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 08:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BuxrPpC/YZxtB6cSkWHeNJ+Q6zlNTqPjhjVfJE9hkxA=;
 b=XAs90D0EGO8s4c9U8BWPCdOy+VmD3NwckUHdL14Y7xPrv/JXoszOVVKTPzsbzeAmtm
 4o7QimS1RO832/4RpcyClrGy1s2dX7WupzJ22/4S/fBk14KjmplSmfyH3ix5obvGZyG7
 ACeYhzA+duRXiNXIwmKRZPeexqNJoP8GLFsU7bmiK0Ono0Ux5KxpbK3aqu15Ts5bZtrb
 fpWs5wfW9SXREyjtnDgCfiZZcj/Hv96ZcOGYSeKh8YSSsG0j7fDPrWxRLDDglT3cMBbB
 uR69ErA0iMjdDhVCLqyxVNd0XgUKSELsL2cNqcsem2ZJZI1zqFN/cpxHWJJRAr7xH3Qw
 IgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BuxrPpC/YZxtB6cSkWHeNJ+Q6zlNTqPjhjVfJE9hkxA=;
 b=DII6EDnaz051h0I907TtHPQElaTsTRp6qhfEQ9/pkC8cwDGsxTDdFzwoy1897Y1m1I
 ni+5QCRTBYC/xHheGXaezsUYBW55mbcPQNg9nHiq7xSpuTdGX73j1j2t7aSuGHjHCiwE
 ygAVXjg0tDmrLzLV0MeyTFpwZhuy30atK63gWapd0OYdtosZQUmdjL7WiAEypJ+GTGAB
 OxejxQi/BiQqR8dC0eKRe1ixqx69kL62qh59K5c0nwYd7EB4b9BKsLXj+w1nDRRhxTc2
 PjkTOsQJZRXjz4uATbf7jnsAMt8Etn9AH1AanBNfx0tM1W/atHE/u9II5EfOfKv+VZDF
 hCMg==
X-Gm-Message-State: AOAM530OgVjlyAE+JW1RT7YXrsdZLk0eSw2xQvuDWcip2VYKm+Ghu1ZR
 pp+nQcdvQYRcPBxbF+prBa+tpA==
X-Google-Smtp-Source: ABdhPJzuyoDH0+ipfmEO2hh2dOIM/VGExknCDNoS5vhXGVU4Hh6m8aIO80Cn5cIU/i859wWZx/QtJw==
X-Received: by 2002:a05:6402:84f:b0:419:638f:2bd5 with SMTP id
 b15-20020a056402084f00b00419638f2bd5mr28836619edz.283.1648998170336; 
 Sun, 03 Apr 2022 08:02:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:68f9:c8ef:77ab:7425?
 (ptr-9fplejof7ird5pjql2d.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:68f9:c8ef:77ab:7425])
 by smtp.gmail.com with ESMTPSA id
 rh26-20020a17090720fa00b006e0da7ef847sm3326056ejb.13.2022.04.03.08.02.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Apr 2022 08:02:49 -0700 (PDT)
Message-ID: <d613a2a7-0ffd-bb1a-e296-4d50d1d6a540@mind.be>
Date: Sun, 3 Apr 2022 17:02:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220328202136.7182-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220328202136.7182-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/paho-mqtt-c: bump to version
 1.3.10
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
Cc: Julien Grossholtz <julien.grossholtz@openest.io>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/03/2022 22:21, Fabrice Fontaine wrote:
> Service release. Issues resolved:
> https://github.com/eclipse/paho.mqtt.c/milestone/17?closed=1
> 
> https://github.com/eclipse/paho.mqtt.c/releases/tag/v1.3.10
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/paho-mqtt-c/paho-mqtt-c.hash | 2 +-
>   package/paho-mqtt-c/paho-mqtt-c.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/paho-mqtt-c/paho-mqtt-c.hash b/package/paho-mqtt-c/paho-mqtt-c.hash
> index 4cdedfbf9a..931bf5b9c8 100644
> --- a/package/paho-mqtt-c/paho-mqtt-c.hash
> +++ b/package/paho-mqtt-c/paho-mqtt-c.hash
> @@ -1,5 +1,5 @@
>   # Locally computed:
> -sha256  386c9b5fa1cf6d0d516db12d57fd8f6a410dd0fdc5e9a2da870aae437a2535ed  paho-mqtt-c-1.3.9.tar.gz
> +sha256  c70db96e66adacae411d5d875fbb08bca6ff9945de3d215b3af93cbd22792db5  paho-mqtt-c-1.3.10.tar.gz
>   sha256  83bbba033dc985487e321b6dfde111772affb73460be48726299fed3da684b1c  edl-v10
>   sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  epl-v20
>   sha256  bc0f3f447097eb82a29ad6c2f4929572bb548b6bd4c9e38fde1bf131a771b7a0  LICENSE
> diff --git a/package/paho-mqtt-c/paho-mqtt-c.mk b/package/paho-mqtt-c/paho-mqtt-c.mk
> index 68b58f2e02..d6356a7ccc 100644
> --- a/package/paho-mqtt-c/paho-mqtt-c.mk
> +++ b/package/paho-mqtt-c/paho-mqtt-c.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PAHO_MQTT_C_VERSION = 1.3.9
> +PAHO_MQTT_C_VERSION = 1.3.10
>   PAHO_MQTT_C_SITE = $(call github,eclipse,paho.mqtt.c,v$(PAHO_MQTT_C_VERSION))
>   PAHO_MQTT_C_LICENSE = EPL-2.0 or BSD-3-Clause
>   PAHO_MQTT_C_LICENSE_FILES = epl-v20 edl-v10 LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
