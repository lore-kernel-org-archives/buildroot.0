Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAD5C433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 16:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B81A4193F;
	Sat, 23 Apr 2022 16:29:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 41o2ydO_OUD3; Sat, 23 Apr 2022 16:29:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39F6341917;
	Sat, 23 Apr 2022 16:29:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 066881BF5DF
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E707960BC8
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:28:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ifm_pt0U-6sM for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 16:28:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 91484607BC
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 16:28:57 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id y3so1458060ejo.12
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 09:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=77SETMqI/cPnwxYSvexvBLBFPTgTJV4JYOGuCQwwIPU=;
 b=HsLf9F/BmABpuVRyxj12FXDG3Kkx6Z3eco6FNwbjtTEhh8+EOJxQqNhn0kD+Wi9ItH
 8+Xj9xYo034i1wx5TRdy/vN3KDawrEnRFQiaimjYIBKn1yzlRMkN0O/yvYD+RQCpSJVZ
 Cd/iZOIJXOWTwssBqS8p4OP8oyuUzI3IIORAzbj0LTBeIE9nsT6kz8Flc7Z5mkblxeQf
 471eq33y9KuTWPV5nDi46qZU/NCEZyQgYiwDW6b0Y4wW4ZdyJvEwP5/L943MCyVpcYSY
 7+HV2zInEQfHQYOL+ozWk+m58Fq5JRY8tzUHlRt66Uh5O3BY524eaVHyvK17oX6NCYEy
 PU5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=77SETMqI/cPnwxYSvexvBLBFPTgTJV4JYOGuCQwwIPU=;
 b=iuGHdNpZFFvudRht+f1LBRxte2nH/eJRCtHO/p+CA4cABsFNQi0cx6tdtHoarxsn7M
 KymW2pS2DNgvBsU4eqYH1bGHy9QjhImlCyNL6e/Io9sbC1s+XSGI+lbVL5uqKdbzBOvC
 pop2S3TTxauT6+cvCCiIJ0TxMW0ywBSTgFl7/qW2DDIJwPz2mE4s4DhfAntRnUMKemhH
 JKpzzikb8iqlpr5X+lnFdqgat0rQj3rhIXmJ1atE34hFxd1n9czpuGyxB4WaUwEM6EaM
 oEfwM048Axg6pscd9CmgL7C965rjioo2y00dpqYRihIvhu/cupEPBFb2q7+ucSSNZd/W
 YL+w==
X-Gm-Message-State: AOAM532dzL9lNz6LV+Fe89otfFcpxa2dZvX5ZoFK/OY/SOZmAw6XVdwI
 ELU7ChuhmnDfXKkkAKbEGPRYew==
X-Google-Smtp-Source: ABdhPJzU3GcogAIUDIekpLMfSyS7FxiZWyDmkEg3LXlV47NN5lECm7D9Z+P8JHtnTihzzORCBEyC6Q==
X-Received: by 2002:a17:907:7d9f:b0:6ef:f362:f9f0 with SMTP id
 oz31-20020a1709077d9f00b006eff362f9f0mr9453196ejc.522.1650731335729; 
 Sat, 23 Apr 2022 09:28:55 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 gj3-20020a170906e10300b006e8ac161bcfsm1813525ejb.203.2022.04.23.09.28.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 09:28:55 -0700 (PDT)
Message-ID: <3969c6c8-1f92-e07d-ef4a-eb751a86cac9@mind.be>
Date: Sat, 23 Apr 2022 18:28:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220421091907.2774561-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220421091907.2774561-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/vde2: fix build with
 BR2_OPTIMIZE_0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/04/2022 11:19, Fabrice Fontaine wrote:
> Fix the following build failure with BR2_OPTIMIZE_0:
> 
> /home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/mips64-buildroot-linux-uclibc/10.3.0/../../../../mips64-buildroot-linux-uclibc/bin/ld: vde_l3.o: in function `ip_output_ready':
> vde_l3.c:(.text+0xb30): undefined reference to `iphead'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/5eeefcdac0b8974a424a885fdc2e82f7cb4b617d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...de_l3-Add-static-to-inline-functions.patch | 37 +++++++++++++++++++
>   1 file changed, 37 insertions(+)
>   create mode 100644 package/vde2/0003-vde_l3-Add-static-to-inline-functions.patch
> 
> diff --git a/package/vde2/0003-vde_l3-Add-static-to-inline-functions.patch b/package/vde2/0003-vde_l3-Add-static-to-inline-functions.patch
> new file mode 100644
> index 0000000000..7f771dfc7e
> --- /dev/null
> +++ b/package/vde2/0003-vde_l3-Add-static-to-inline-functions.patch
> @@ -0,0 +1,37 @@
> +vde_l3: Add static to inline functions
> +
> +Add static to inline functions to avoid the following build failure
> +with BR2_OPTIMIZE_0:
> +
> +/home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/mips64-buildroot-linux-uclibc/10.3.0/../../../../mips64-buildroot-linux-uclibc/bin/ld: vde_l3.o: in function `ip_output_ready':
> +vde_l3.c:(.text+0xb30): undefined reference to `iphead'
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/5eeefcdac0b8974a424a885fdc2e82f7cb4b617d
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +
> +diff -Nura vde2-2.3.2.orig/src/vde_l3/vde_l3.c vde2-2.3.2/src/vde_l3/vde_l3.c
> +--- vde2-2.3.2.orig/src/vde_l3/vde_l3.c	2022-04-21 11:05:17.393452698 +0200
> ++++ vde2-2.3.2/src/vde_l3/vde_l3.c	2022-04-21 11:10:36.509804404 +0200
> +@@ -100,17 +100,17 @@
> + };
> +
> +
> +-inline struct vde_ethernet_header *ethhead(struct vde_buff *vdb)
> ++static inline struct vde_ethernet_header *ethhead(struct vde_buff *vdb)
> + {
> + 	return (struct vde_ethernet_header*)(vdb->data);
> + }
> +
> +-inline struct iphdr *iphead(struct vde_buff *vdb)
> ++static inline struct iphdr *iphead(struct vde_buff *vdb)
> + {
> + 	return (struct iphdr*)(vdb->data + 14);
> + }
> +
> +-inline void *payload(struct vde_buff *vdb)
> ++static inline void *payload(struct vde_buff *vdb)
> + {
> + 	return (uint8_t*)(vdb->data + 14 + sizeof(struct iphdr));
> + }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
