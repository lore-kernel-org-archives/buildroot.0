Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC97EC433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 20:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A999B81453;
	Tue, 14 Dec 2021 20:09:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GFrfxsBWGfWA; Tue, 14 Dec 2021 20:09:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C2DF813F4;
	Tue, 14 Dec 2021 20:09:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E88511BF30E
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E51F4813F4
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:09:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2epcm5kFkEh1 for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 20:09:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01AA4813AA
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 20:09:37 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id t5so66830974edd.0
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 12:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=KPaShlXSVp2TRcibbr1rLbehRO5cb4Ha+0w8iFskq0A=;
 b=gwIBA4ha2j1o4N/EqNrxpvgEeN44Nj/cjtSlFQ4VshH5wIEt7TQAQW/BSwQLRct/82
 dBmOrlZ6Ni3vAWL77fCA4UCCU7yobk3h4SOU2CPEZ/Tf0AMhO56L6aAh0S08zVHEdpQ4
 ycmISKydtiZJzOI5D88EQnvcF1yoPDClkGzr7C8Gild0oPnfAMT8SV2Wdf2hp2URRtIm
 TwGzA8QFsBBX/7/rfmtNjc3/F1Zc8HIGlWfi64k9Jc8F8/KRiOCJ2bM3m3ez8OVrJ54n
 Nx2D65ymokXWVg4alovVdA4IDYdqVtxSJ+VGY/AxZgUn5VZ0QgUJctTvgL9NCUK2Ip4I
 StaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=KPaShlXSVp2TRcibbr1rLbehRO5cb4Ha+0w8iFskq0A=;
 b=ry1jUiA69Q8FccPhilPL/DW/GHNLJ2mvsLj2wTqcBJoV7wXyJSoO9aNF94F9u3A7Fg
 FeyAQ+AHhAjZ/2YsCYJ8zOCaDew/eCgISxgXorjIVBHmpnIIFbuUnq7uI/bT6gB+V38q
 POZNlTk8R74jXjN0xWi3KSFmnckPC/LYuqOa4G69OLkD20yx81uyr+9yGQreCGqiIvk0
 2jLDbjXiwvsqB4O5CJ0aO4ZyoPZcsJEP0vSrUuueoDHiwdYiXITmeZYij1FJ1RPCWT0N
 psivt8Os48AFWifxdhGVpTs6eIiNkX3ZWd7wb1TVgOyZ3ATGKs1NjvpwwbywPVKPiPc/
 XvEA==
X-Gm-Message-State: AOAM532/PEXt6MQhC4lHNBJSppW+bFUNUp7qzWK/1uTVTwj+y4E0KGSi
 DWmZvZN0SM4zPVM2EEDjSo514A==
X-Google-Smtp-Source: ABdhPJyHeJIAtk703vtccXBplkFDKCFr4M5wtoANlDEPQe1AnCUNfkU2Jrbor+JQLwpqggxlj9i35A==
X-Received: by 2002:a05:6402:40c7:: with SMTP id
 z7mr10739267edb.255.1639512576294; 
 Tue, 14 Dec 2021 12:09:36 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id hx14sm235940ejc.92.2021.12.14.12.09.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 12:09:35 -0800 (PST)
Message-ID: <32fc261c-89e0-5764-98c5-f88f0201a519@mind.be>
Date: Tue, 14 Dec 2021 21:09:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211213221035.1779283-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211213221035.1779283-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/libvirt: fix libvirtd option
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
Cc: Jared Bents <jared.bents@rockwellcollins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/12/2021 23:10, Fabrice Fontaine wrote:
> Replace libvirtd by driver_libvirtd to avoid the following build failure
> raised since the addition of the package in commit
> ccfc90e1010e42e6529afae3a5ea8bf7226dabc1:
> 
> ../output-1/build/libvirt-7.7.0/meson.build:1:0: ERROR: Unknown options: "libvirtd"
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/3a20db6cb39c0d91213adbe82934274659df43e7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Both applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libvirt/libvirt.mk | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
> index 3118de4d58..9a4788c905 100644
> --- a/package/libvirt/libvirt.mk
> +++ b/package/libvirt/libvirt.mk
> @@ -194,7 +194,7 @@ endif
>   
>   ifeq ($(BR2_PACKAGE_LIBVIRT_DAEMON),y)
>   # Network is used by daemon, only
> -LIBVIRT_CONF_OPTS += -Dlibvirtd=enabled -Ddriver_network=enabled
> +LIBVIRT_CONF_OPTS += -Ddriver_libvirtd=enabled -Ddriver_network=enabled
>   
>   ifeq ($(BR2_PACKAGE_LIBSSH),y)
>   LIBVIRT_CONF_OPTS += -Dlibssh=enabled
> @@ -240,7 +240,7 @@ endif
>   
>   else # BR2_PACKAGE_LIBVIRT_DAEMON
>   
> -LIBVIRT_CONF_OPTS += -Dlibvirtd=disabled -Ddriver_network=disabled
> +LIBVIRT_CONF_OPTS += -Ddriver_libvirtd=disabled -Ddriver_network=disabled
>   
>   endif
>   
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
