Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6364C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 15:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98F7160F21;
	Sun, 27 Mar 2022 15:57:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zP3kQW99j1RJ; Sun, 27 Mar 2022 15:57:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD82660EC6;
	Sun, 27 Mar 2022 15:57:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CB7CE1BF3B9
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB0B9401D0
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:57:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Rkr36xzbXcv for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:57:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2BE340088
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:57:33 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id z92so14345589ede.13
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 08:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Q3rhrOOvJwipQMy0S7uWk1/6AhE7nayEoSa9etsD69s=;
 b=ER026D57VvNvg/fLlmKCFxT3rH18V3xqSLIgatY0/elnS53t47KfrL8GKJSgQoDxXg
 T7lRG7b2xZo+2YTjMm0+qt/1/jFosDQc8Y2ILISNwtNrqN2pGZUuZ0oXSNwViaKEfRu4
 cWSSQ+vyFi/Uwoh9cuYGkQ99Mf+Sc7H4tdfAIbSajIgtbBrqhhT5e7Pyif/WFiQLPWL/
 /poyjbq6f8kFuFTL+joHx9m39uGjlF/XDaqPsA4LY6Fq9tZiZ/2sale9GxQKFXqnzpV/
 JKrkmsvGClgnx1sb7mxpzQ6Q5YsU54YoW0y8E4HRG7yqA/afkxE6+OD1NOtQAge5VMKI
 27qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Q3rhrOOvJwipQMy0S7uWk1/6AhE7nayEoSa9etsD69s=;
 b=0lmmslzFVRpfA3Pz5lr4e+2WUDVfEmOr1N6hQfbx8gWKU+0PujxXch55Wi0r8Cygpc
 qpLXgYpgsXwLnvMJQF9eePuo5JhpP568YbIYYql8F2T7EtfCQPTfcM8UuakfxFPbJWf/
 Dw2oGjgC9hb5QZYoBpCT97NW4c143qAQuvtIpfQD1fIKk04FjZFQTThNga+FvNEQMp7n
 1RY7MCkxZAvuTk3+/wpR/5w1CVFU/8ExVYZLO/sxalksywl37XXCyQnUOh3tApjxzH4G
 10M3ZAnjCTmZ4mWGn0pMBwOP9kWQbisLwFq5sCnj7pmtuOK9nOo2pXwhWvhC0i/dzUvs
 99Aw==
X-Gm-Message-State: AOAM531OFM25b1Bm2k4EauwTn1iby+B3rQ/r80adU9MmXfb/7GG25QeG
 1ApH0sqvgUN+LYa5abpN26JRiXbaYOOh9w==
X-Google-Smtp-Source: ABdhPJxukrkFkxYqyYFXby/iNi5F3B9ZHp4WLtI3RMDmfZKmSVb6TXOY/s1/lZqyg/wUMZ5gWHX02A==
X-Received: by 2002:a05:6402:295:b0:419:2533:f821 with SMTP id
 l21-20020a056402029500b004192533f821mr11104891edv.64.1648396651781; 
 Sun, 27 Mar 2022 08:57:31 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a509d02000000b00412d53177a6sm5934460ede.20.2022.03.27.08.57.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 08:57:31 -0700 (PDT)
Message-ID: <8cec0c22-baa7-c9b5-6185-dcb7da137938@mind.be>
Date: Sun, 27 Mar 2022 17:57:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220320154750.1273563-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220320154750.1273563-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/pkcs11-helper: fix build
 without threads
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



On 20/03/2022 16:47, Fabrice Fontaine wrote:
> Fix the following build failure without threads and openvpn raised since
> commit 0199dc161769e5f28e9aebc634230ece08ff5008:
> 
> /home/giuliobenetti/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: /home/giuliobenetti/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libpkcs11-helper.so: undefined reference to `_pkcs11h_slotevent_init'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/fcaa70cc035d6f9d35dfa8d564e9948c7e1cfd9e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...h-core.c-fix-build-without-slotevent.patch | 37 +++++++++++++++++++
>   1 file changed, 37 insertions(+)
>   create mode 100644 package/pkcs11-helper/0001-lib-pkcs11h-core.c-fix-build-without-slotevent.patch
> 
> diff --git a/package/pkcs11-helper/0001-lib-pkcs11h-core.c-fix-build-without-slotevent.patch b/package/pkcs11-helper/0001-lib-pkcs11h-core.c-fix-build-without-slotevent.patch
> new file mode 100644
> index 0000000000..5b2829c5ca
> --- /dev/null
> +++ b/package/pkcs11-helper/0001-lib-pkcs11h-core.c-fix-build-without-slotevent.patch
> @@ -0,0 +1,37 @@
> +From 754911f553414a77d5b52001f5ef6e3a1314c4d5 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 20 Mar 2022 08:50:15 +0100
> +Subject: [PATCH] lib/pkcs11h-core.c: fix build without slotevent
> +
> +Fix the following build failure with --disable-slotevent:
> +
> +/home/giuliobenetti/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: /home/giuliobenetti/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libpkcs11-helper.so: undefined reference to `_pkcs11h_slotevent_init'
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/fcaa70cc035d6f9d35dfa8d564e9948c7e1cfd9e
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/OpenSC/pkcs11-helper/pull/50]
> +---
> + lib/pkcs11h-core.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/lib/pkcs11h-core.c b/lib/pkcs11h-core.c
> +index d7bb4cd..0bf11e8 100644
> +--- a/lib/pkcs11h-core.c
> ++++ b/lib/pkcs11h-core.c
> +@@ -726,9 +726,11 @@ pkcs11h_setProperty (
> +
> + 	switch (property) {
> + 		case PKCS11H_PROPERTY_SLOT_EVENT_HOOK:
> ++#if defined(ENABLE_PKCS11H_SLOTEVENT)
> + 			if ((rv = _pkcs11h_slotevent_init ()) != CKR_OK) {
> + 				goto cleanup;
> + 			}
> ++#endif
> + 		break;
> + 	}
> + cleanup:
> +--
> +2.35.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
