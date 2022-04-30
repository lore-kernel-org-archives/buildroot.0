Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9085CC433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 18:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BE6B60B6A;
	Sat, 30 Apr 2022 18:50:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7L3UBKTCI3DK; Sat, 30 Apr 2022 18:50:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E2C960B58;
	Sat, 30 Apr 2022 18:50:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 77CAE1BF5AE
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73D3B60B58
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:50:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LKnNpRx11CSK for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 18:50:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A528360B4D
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 18:50:18 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id k23so21082953ejd.3
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 11:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3XFmJYUfmwtSdyDKo4vXW2XDn6w9RwjHLUnFPdOKdh0=;
 b=JjIwAyfYqX8e6mbzdFdGs1MgFmTDzIlYvGUnOtKR5TjiGMB2pO7Lk4UCptglN1cg03
 RvgP58Wf+0ObJ8qUJk9CXhOGlqfeT/uFe7Da8JSEAlOdVFMDBdmuw0HkDWmZfucpJj5O
 tlqecCLAUe7tjshxqyKzySIsETWV21PoII+tCtT+0LSVZf9+69p57m0goeVRGMw6hf2d
 7lXcl0BVIkcokojnSGdqK5dp8gCwhF07NoWrhyaBJ9HXYN5t8X7vpNxXD0QnDIIt+Vac
 3C9WBsN4WGiy62GE/7piTYWxhuevWIWpWYKFzKuOfjnkP3U+PBlOQJDKfqmA9ZWeFbwl
 KYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3XFmJYUfmwtSdyDKo4vXW2XDn6w9RwjHLUnFPdOKdh0=;
 b=Mrh6uhRz3ojZZnRZOuliZgL15O3V00YDtaRYR2Hb6utrg90dKkwGGlgsMtfT6Mz2z9
 9seuRfOXAbWBRvcZx0ZkUq4vd9VFe99V9Jkr265by9Aq0kxRINoA+32w6J+xuT6EX2sn
 E8W6U72itHLil5QoWtLIwAiim3WaSjekUc/xcF4VQkplgK8ccDZL+UVzllFjxdsAuLzH
 ikKPxjD5L5lkpzterMfmxtgdq6yJ5XettHFrg4cJ22c8B2OZI6EsuSnlZdmLCcQ4Cuob
 QgE7t9vu+C54L8cI0Zh+GH1hogUKZbrKpoZHUxJJIImV7fimIM+HQlCSjLrICwiLbVIc
 GtHg==
X-Gm-Message-State: AOAM5325j7FfgcbRkytTYXkEgavkHx/JBlawECKkzbgrRJ9trfAEArpm
 wnoqHHhyGRL/8wE2tdtG4jdAmQ==
X-Google-Smtp-Source: ABdhPJzJ/gbknUi/frWxHGkA6ImZ6muJXay9cu3ghw+YjYdKVeHxdSyhzHpZRC+O/HQ0cax8MJGaqA==
X-Received: by 2002:a17:906:c0d6:b0:6ca:457e:f1b7 with SMTP id
 bn22-20020a170906c0d600b006ca457ef1b7mr4797765ejb.399.1651344616837; 
 Sat, 30 Apr 2022 11:50:16 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 cz9-20020a0564021ca900b0042617ba63b3sm4380162edb.61.2022.04.30.11.50.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 11:50:16 -0700 (PDT)
Message-ID: <d1b94f78-77de-166f-7cc5-5496a14a68fc@mind.be>
Date: Sat, 30 Apr 2022 20:50:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20220428162738.1243794-1-yann.morin.1998@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220428162738.1243794-1-yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH] package/dhcp: add explicit option disabling
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
Cc: Andreas Ehmanns <universeiii@gmx.de>,
 Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, Jan Havran <havran.jan@email.cz>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/04/2022 18:27, Yann E. MORIN wrote:
> Commits 4db37c663cc0 (dhcp: add config option for delayed-ack feature
> of dhcp server) and 40f7adae3c03 (package/dhcp: add security options to
> DHCP server) forgot to explicit disable the option when not requested.
> 
> Fix that now.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Andreas Ehmanns <universeiii@gmx.de>
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
> Cc: Jan Havran <havran.jan@email.cz>
> Cc: Eugen Hristev <eugen.hristev@microchip.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/dhcp/dhcp.mk | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
> index b73137506d..cbc95cb152 100644
> --- a/package/dhcp/dhcp.mk
> +++ b/package/dhcp/dhcp.mk
> @@ -76,10 +76,14 @@ endif
>   
>   ifeq ($(BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK),y)
>   DHCP_CONF_OPTS += --enable-delayed-ack
> +else
> +DHCP_CONF_OPTS += --disable-delayed-ack
>   endif
>   
>   ifeq ($(BR2_PACKAGE_DHCP_SERVER_ENABLE_PARANOIA),y)
>   DHCP_CONF_OPTS += --enable-paranoia
> +else
> +DHCP_CONF_OPTS += --disable-paranoia
>   endif
>   
>   define DHCP_INSTALL_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
