Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42E7C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Mar 2022 21:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 501A160C1E;
	Sun,  6 Mar 2022 21:02:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EHvnHU50TK3c; Sun,  6 Mar 2022 21:02:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CD9760B7C;
	Sun,  6 Mar 2022 21:02:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 63FDD1BF401
 for <buildroot@lists.busybox.net>; Sun,  6 Mar 2022 21:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5331A40871
 for <buildroot@lists.busybox.net>; Sun,  6 Mar 2022 21:02:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r-qEkoCjRwpk for <buildroot@lists.busybox.net>;
 Sun,  6 Mar 2022 21:02:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B945402BD
 for <buildroot@buildroot.org>; Sun,  6 Mar 2022 21:02:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b52b:1138:2d2c:406c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 50B63B004FF;
 Sun,  6 Mar 2022 22:01:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1646600518;
 bh=qKb6lEcAyqgwvfXkJfBng1mnqBxyLOTSn6FzsMtrQW8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kJEy396XSSq6xOEoz39/TdS76phIEQdrm/82hFREQatWVc2EOQv3jGnVbgBwpS4m/
 1Q4RKuMwXqyjHTHVQDrT4wmeZO84u3YPWRxA3iy6adhDs5jUEZd8FGDKZy4Pq2C9ET
 G7vrGcuzyrrM771SBU7Xo9srAVXH8Z8ItN1pAl+hhuQ+tRoXk1H8zqSrNeksL/CQim
 7S+FBZiDb6gvKgtul4+n8VzAz6x1LEJHfQLNxsQgJzWH02MOGALyujFYt8ovlRo7vL
 t5EptqjHXPPB8CPtfDQTPWZiN/Zt4f2T53cAaDNMTZ+TwvyCzXaHBC6XO/6Dkb0VVO
 ViSj8+l0Y658A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 06 Mar 2022 22:01:55 +0100
Date: Sun, 6 Mar 2022 22:01:55 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220306210155.GF228549@scaer>
References: <20220305204446.823802-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220305204446.823802-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/azure-iot-sdk-c: drop custom
 install rules
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-03-05 21:44 +0100, Fabrice Fontaine spake thusly:
> Drop custom install rules which have been added since the addition of
> the package in commit 2d837933e55216dc31a2206b063689cfd04a4c01 but are
> now resulting in a broken installion
> 
> Fixes:
>  - https://bugs.buildroot.org/show_bug.cgi?id=14636
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/azure-iot-sdk-c/azure-iot-sdk-c.mk | 58 ----------------------
>  1 file changed, 58 deletions(-)
> 
> diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
> index 3f00db3ff4..e6de8c851b 100644
> --- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
> +++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
> @@ -14,62 +14,4 @@ AZURE_IOT_SDK_C_INSTALL_STAGING = YES
>  AZURE_IOT_SDK_C_DEPENDENCIES = libxml2 openssl libcurl util-linux
>  AZURE_IOT_SDK_C_CONF_OPTS = -Dskip_samples=ON
>  
> -# The project only supports building one kind of library.
> -# Further the install target installs the wrong files, so we do it here:
> -ifeq ($(BR2_STATIC_LIBS),y)
> -AZURE_IOT_SDK_C_LIBS += \
> -	uamqp/libuamqp.a \
> -	c-utility/libaziotsharedutil.a \
> -	iothub_client/libiothub_client.a \
> -	iothub_client/libiothub_client_mqtt_ws_transport.a \
> -	iothub_client/libiothub_client_amqp_ws_transport.a \
> -	iothub_client/libiothub_client_http_transport.a \
> -	iothub_client/libiothub_client_amqp_transport.a \
> -	iothub_client/libiothub_client_mqtt_transport.a \
> -	iothub_service_client/libiothub_service_client.a \
> -	serializer/libserializer.a \
> -	umqtt/libumqtt.a \
> -	deps/uhttp/libuhttp.a \
> -	deps/umock-c/libumock_c.a \
> -	libparson.a
> -else
> -AZURE_IOT_SDK_C_LIBS += \
> -	uamqp/libuamqp.so \
> -	c-utility/libaziotsharedutil.so \
> -	iothub_client/libiothub_client.so \
> -	iothub_client/libiothub_client_mqtt_ws_transport.so \
> -	iothub_client/libiothub_client_amqp_ws_transport.so \
> -	iothub_client/libiothub_client_http_transport.so \
> -	iothub_client/libiothub_client_amqp_transport.so \
> -	iothub_client/libiothub_client_mqtt_transport.so \
> -	iothub_service_client/libiothub_service_client.so \
> -	serializer/libserializer.so \
> -	umqtt/libumqtt.so.1.1.12 \
> -	deps/uhttp/libuhttp.so \
> -	deps/umock-c/libumock_c.so \
> -	libparson.so
> -
> -define AZURE_IOT_SDK_C_CREATE_SYMLINKS
> -	ln -sf libumqtt.so.1.1.12 $(1)/usr/lib/libumqtt.so.1
> -	ln -sf libumqtt.so.1.1.12 $(1)/usr/lib/libumqtt.so
> -endef
> -endif
> -
> -define AZURE_IOT_SDK_C_INSTALL_LIBS
> -	$(foreach l,$(AZURE_IOT_SDK_C_LIBS), \
> -		$(INSTALL) -D -m 0755 $(@D)/$(l) $(1)/usr/lib/$(notdir $(l))
> -	)
> -	$(call AZURE_IOT_SDK_C_CREATE_SYMLINKS,$(1))
> -endef
> -
> -define AZURE_IOT_SDK_C_INSTALL_STAGING_CMDS
> -	$(call AZURE_IOT_SDK_C_INSTALL_LIBS,$(STAGING_DIR))
> -	cp -a $(@D)/c-utility/inc/* $(STAGING_DIR)/usr/include/
> -	cp -a $(@D)/iothub_client/inc/* $(STAGING_DIR)/usr/include/
> -endef
> -
> -define AZURE_IOT_SDK_C_INSTALL_TARGET_CMDS
> -	$(call AZURE_IOT_SDK_C_INSTALL_LIBS,$(TARGET_DIR))
> -endef
> -
>  $(eval $(cmake-package))
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
