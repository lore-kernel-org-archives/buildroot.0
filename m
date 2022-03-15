Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538A8C433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 20:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D91FA40585;
	Tue, 15 Mar 2022 20:18:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5isxluV0Qqbn; Tue, 15 Mar 2022 20:18:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF306403CA;
	Tue, 15 Mar 2022 20:18:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0D7A11BF31E
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 20:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE739403CA
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 20:18:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m1Wwu7zuR-_B for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 20:18:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 937344026E
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 20:18:39 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id w25so244559edi.11
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 13:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BYmdsk6Prt6N1f7atmwXAHlSaqWSC3/GYrmn/PzY71k=;
 b=F9Z1vUdYPDD17eELnpiBZlKzcaMW8R3uiNroC5zPtVYV4+qminl3gxdIRi1JJIhtvX
 wkJQcmdyQqgIN+5cSlxaUpMp90QQK51Lp95dLtuYonkFDju4jXXlFKwe0B3iOGvCpRpc
 O4usPYfo7qum+xpRjhFzivvnMs/XNxul+I5oKCs/mYDVtJkrD1yBC+wO5LrEuWkx+PPo
 K24XlitQhJKL5iw+xzVks8km0S2fa4vs5JMuyMyV+va4NqGD+pkeUP5bJu5DNqY6zWJV
 WmgNPkCpSDmRX+BJxaRBRrnVz1ZAMweMA9w+qoEZchxdVcuirnni4jz701xtVWnV/68F
 qUPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BYmdsk6Prt6N1f7atmwXAHlSaqWSC3/GYrmn/PzY71k=;
 b=mRefrUuC66j5/QKg3G6XYoJmjJucgmvEQK1yaoHHwH7jSSPKWtSyqHqcmlp6X/CnSG
 2jvWJPK5yjGAmUZHPexvYIBPbiZK5GK8IZUGzXID9g0tyHRLhppmNSTj4hZ7tskDXT8c
 /Yu3XP0t0egZgamPCAx/7nJOqFrK3Bw/0YwTb8mLckaxGk9YKFYTRSBIwH5FwJTlJ72J
 o7nXZHa/pfhM8yPsKN5K3YIbHWGQvs+YSMy0WI64NlRMfpxoE8xI+cQjZaHtMvWETb8m
 IRoYtNtV4M8uFAlZF1v426FtA6+9+Kqrgrb+hQyCyDafrImQYGLbe/pqO7P1e+uqWrJZ
 HZfw==
X-Gm-Message-State: AOAM531F4edyWX8zUtqI52BedO7n1stch5jeObqHNmhtCULViVBKgdaE
 648tEPy0i+uqZMqEq4Kw7mtfQM0RwOOyZg==
X-Google-Smtp-Source: ABdhPJw7w1GZV8/wiXFPqX+UeZiQKC0Q7aK2SLsvHr0+PBQXjNN0uwUWXIY0WD6nFw9chkzc4k60Ew==
X-Received: by 2002:a05:6402:d09:b0:418:7a4a:c3f2 with SMTP id
 eb9-20020a0564020d0900b004187a4ac3f2mr12418003edb.366.1647375517872; 
 Tue, 15 Mar 2022 13:18:37 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 h12-20020a1709060f4c00b006b4ec988cc3sm32145ejj.4.2022.03.15.13.18.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 13:18:37 -0700 (PDT)
Message-ID: <ea5de041-fcef-53e5-8695-810cec75907d@mind.be>
Date: Tue, 15 Mar 2022 21:18:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Yunhao Tian <t123yh.xyz@gmail.com>, buildroot@buildroot.org
References: <20220228022840.2140908-1-t123yh.xyz@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220228022840.2140908-1-t123yh.xyz@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/shairport-sync: install dbus policy
 file to target
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/02/2022 03:28, Yunhao Tian wrote:
> This adds two extra commands to install dbus policy config
> to target if dbus option is enabled.
> 
> Signed-off-by: Yunhao Tian <t123yh.xyz@gmail.com>
> ---
>   package/shairport-sync/shairport-sync.mk | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
> index 487e0c05e5..ab67da3964 100644
> --- a/package/shairport-sync/shairport-sync.mk
> +++ b/package/shairport-sync/shairport-sync.mk
> @@ -59,6 +59,14 @@ endif
>   ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_DBUS),y)
>   SHAIRPORT_SYNC_DEPENDENCIES += libglib2
>   SHAIRPORT_SYNC_CONF_OPTS += --with-dbus-interface --with-mpris-interface
> +define SHAIRPORT_SYNC_INSTALL_DBUS
> +	$(INSTALL) -m 0644 -D \
> +		$(@D)/scripts/shairport-sync-dbus-policy.conf \
> +		$(TARGET_DIR)/etc/dbus-1/system.d/shairport-sync-dbus.conf
> +	$(INSTALL) -m 0644 -D \
> +		$(@D)/scripts/shairport-sync-mpris-policy.conf \
> +		$(TARGET_DIR)/etc/dbus-1/system.d/shairport-sync-mpris.conf
> +endef
>   else
>   SHAIRPORT_SYNC_CONF_OPTS += --without-dbus-interface --without-mpris-interface
>   endif
> @@ -77,11 +85,13 @@ else
>   SHAIRPORT_SYNC_CONF_OPTS += --without-mqtt-client
>   endif
>   
> +

  You shouldn't add this empty line. check-package detects that.


  Applied to master with that changed, thanks.

  Regards,
  Arnout

>   define SHAIRPORT_SYNC_INSTALL_TARGET_CMDS
>   	$(INSTALL) -D -m 0755 $(@D)/shairport-sync \
>   		$(TARGET_DIR)/usr/bin/shairport-sync
>   	$(INSTALL) -D -m 0644 $(@D)/scripts/shairport-sync.conf \
>   		$(TARGET_DIR)/etc/shairport-sync.conf
> +	$(SHAIRPORT_SYNC_INSTALL_DBUS)
>   endef
>   
>   define SHAIRPORT_SYNC_INSTALL_INIT_SYSV
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
