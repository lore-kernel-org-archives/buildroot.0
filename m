Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33EBC433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 19:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B0BF417A4;
	Thu, 16 Dec 2021 19:38:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q0-sAQy_8Ljh; Thu, 16 Dec 2021 19:38:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A38414175D;
	Thu, 16 Dec 2021 19:38:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6EB331BF3A9
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67455403F8
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:38:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gjriQW5rtEkS for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 19:37:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 22CA140399
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 19:37:59 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id x15so91755427edv.1
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 11:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=gvaPrHqlFDq8BZwmPsrzNWZbz/VZuuwXKLU2O6/23Y4=;
 b=NjqdsngXMxizlLY2VM3GpRQ7IArzJHPljeFYlo0oUjYl+WmFJw/uFxPZPmH0l6NvZj
 PDFijhmznNytDI1h9E8Qzn3PR7/qdAbmwC8afysIstYP8ECcMnS7RXz1pY3xptVY5FxX
 YlOdMvOvdNeP83vmCmR21KT9DXyJP03Vu4pzRSibMl1MGZuL7MGBOtSiqbD21py35eOL
 v/VdtB1PkQH21/0QFC+v5Okfe/snFRg44tLRYJhcsXOQ8l4gSYv13L5LHFt8O7liZqhB
 8lAzES8CO3tHeGv8l4oIyP23N1u8a/2F6Kj7ZKJSQp13Jawry0ih9DRU4zx61avr+dhS
 xI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=gvaPrHqlFDq8BZwmPsrzNWZbz/VZuuwXKLU2O6/23Y4=;
 b=6fq9ZYcNAe5LkVm3/9eQ0JAx2r0qRH/WQWGxH53mEBZzi5GD2XSLry+DJbXQE8EvuY
 mShBR5hjV9AFkrCuEH/fwlnpMNiPXtH0XTKsK/IZVULzNOAm9axoqZ0ArFuIkd6aAl7H
 yXZpq3l23nfe8W9/7RTvvAkfm7mN/DRDRd+2iayippsTgiYyBG4YlPnpf8EUlCeVjQ00
 RV2xX6Fl3FucuglN2E/SKjd2N0XAaRAPI4ziNmTytTZnenfzxACkqv6IF/VWTB+FqIyZ
 FrbZ18mbQ9LSm2qI9btUND38lUcBnuaeCwSauA8T/u0Het6r51PbGTiXmr3zXc85nsYb
 G3sA==
X-Gm-Message-State: AOAM531dLvSdEd5Ac5j+vHNop3wnSoIi09hWoLXMLOpKJLhu4gkOnSbC
 Y+1Nogn07S1e+oRJSvLBG/ksDQ==
X-Google-Smtp-Source: ABdhPJxv+Zj9rlgdciI5sFrnT+kB+/wpBq8PX2jM7qPOBE0Aiog+tbm0lzobnlOTLSRuxYvKQ0qDmQ==
X-Received: by 2002:a17:906:5284:: with SMTP id
 c4mr278307ejm.423.1639683477349; 
 Thu, 16 Dec 2021 11:37:57 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id hd15sm2161368ejc.69.2021.12.16.11.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 11:37:56 -0800 (PST)
Message-ID: <0e655139-ec36-0fcb-4f39-66565bb92809@mind.be>
Date: Thu, 16 Dec 2021 20:37:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211215221013.3985092-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211215221013.3985092-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/pcsc-lite: fix build without
 lib{udev, usb}
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



On 15/12/2021 23:10, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump to version 1.9.5 in
> commit c7233ec2c32c9fbef2738f8de7d59da85cd44b99 and
> https://github.com/LudovicRousseau/PCSC/commit/6f8f170db3c88c59a5ddb5ae5319b921a901a6aa:
> 
> /home/giuliobenetti/autobuild/run/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: pcscd-pcscdaemon.o: in function `signal_thread':
> pcscdaemon.c:(.text+0x444): undefined reference to `HPReCheckSerialReaders'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/6cf323229f32967aa554418410dc94b7094d09af
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...ric.c-fix-build-without-lib-udev-usb.patch | 35 +++++++++++++++++++
>   1 file changed, 35 insertions(+)
>   create mode 100644 package/pcsc-lite/0001-src-hotplug_generic.c-fix-build-without-lib-udev-usb.patch
> 
> diff --git a/package/pcsc-lite/0001-src-hotplug_generic.c-fix-build-without-lib-udev-usb.patch b/package/pcsc-lite/0001-src-hotplug_generic.c-fix-build-without-lib-udev-usb.patch
> new file mode 100644
> index 0000000000..7e93bf5fce
> --- /dev/null
> +++ b/package/pcsc-lite/0001-src-hotplug_generic.c-fix-build-without-lib-udev-usb.patch
> @@ -0,0 +1,35 @@
> +From 2153e165c48e541bb5a8b23f81e87db87a9394fd Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Tue, 14 Dec 2021 08:20:59 +0100
> +Subject: [PATCH] src/hotplug_generic.c: fix build without lib{udev,usb}
> +
> +Fix the following build failure without lib{udev,usb} raised since
> +version 1.9.5 and
> +https://github.com/LudovicRousseau/PCSC/commit/6f8f170db3c88c59a5ddb5ae5319b921a901a6aa:
> +
> +/home/giuliobenetti/autobuild/run/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: pcscd-pcscdaemon.o: in function `signal_thread':
> +pcscdaemon.c:(.text+0x444): undefined reference to `HPReCheckSerialReaders'
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/6cf323229f32967aa554418410dc94b7094d09af
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://github.com/LudovicRousseau/PCSC/commit/2153e165c48e541bb5a8b23f81e87db87a9394fd]
> +---
> + src/hotplug_generic.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/hotplug_generic.c b/src/hotplug_generic.c
> +index a0f34646..e4f19935 100644
> +--- a/src/hotplug_generic.c
> ++++ b/src/hotplug_generic.c
> +@@ -48,7 +48,7 @@ THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> + #define FALSE 0
> + #endif
> +
> +-#if !defined(__APPLE__) && !defined(HAVE_LIBUSB) && !defined(__linux__) && !defined(HAVE_LIBUDEV)
> ++#if !defined(__APPLE__) && !defined(HAVE_LIBUSB) && !defined(HAVE_LIBUDEV)
> +
> + LONG HPSearchHotPluggables(void)
> + {
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
