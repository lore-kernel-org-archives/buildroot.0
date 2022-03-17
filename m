Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0FBC433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 18:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE5D0401FE;
	Thu, 17 Mar 2022 18:03:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kw4kd0kqqqcI; Thu, 17 Mar 2022 18:03:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9B9D401D8;
	Thu, 17 Mar 2022 18:03:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CF98D1BF25F
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 18:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC3EA4023D
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 18:03:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dgi3227KIkYc for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 18:03:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0FE4E40004
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 18:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647540188;
 bh=oYSPH449TDQLfPqCcvLXOeqHvZt9IlWB1q5dLovGrKs=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Ji43e9R18+jXkiA2MzwlnYMqPk3D0mEeDgO/X4YyBmhYM7KEMuXC7+OS/FfE0QRZr
 54iqiPeLFUPi/dp+f7IyDV/QaW1r1xgVZ9gSyxKLbCYr2a77aZ/Aq2uSaRZWMoMmaE
 /4snbza+pcaun+MHeELwAEHBlU94J+HHZ6nbWVeU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.203]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MmlXK-1nvxE20PLi-00jpzi; Thu, 17
 Mar 2022 19:03:08 +0100
Date: Thu, 17 Mar 2022 19:03:06 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: "Sassen, Rutger" <rsassen@comecer.com>
Message-ID: <20220317190306.1e427303@gmx.net>
In-Reply-To: <YQXPR01MB61216162093E0D5F17304D0BAE129@YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM>
References: <YQXPR01MB61216162093E0D5F17304D0BAE129@YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:7pZmUTRhcr8rN/wup7GlLLHRclPNZ3qRUF/D4IVQS/cgpqfh1Jq
 BIkuPD9vZExFIQbOukrt+rwhooVdn8OfPM78M3EHqZawaNYW83O2FB2oGsZE9uWA0ZHYs7A
 JtdNggItUzq0VU2vJx2gtYu8PBWZHC0iSHNYpJ3QKYuAH7IcZUNEaKkZeR28bHwYrZXogOx
 2RIJehplk1MQSyoUQKq/g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FInnU3fVQVo=:AzV9toaN90uh/szHXNgOXy
 w1u7W0EJ6II8eh4B1YOUmWD0uZGSPuJrekIrijzOrvMqbtDLQfXdVKGFVnnP6Eaoc9bsiFntE
 hlw3CVXnd5ABWlf1py6Dvke3f+K6wA88AtfcyHqIF20im197gpJAslmH6iWwb5Ti8PlIoIqYU
 vu7r9J5En/0HcgXeMxgd2GFcclB5zQFIp/dsqd8okVCnFmCLLl0ajz9YCOQx8ecGGONmIEdDk
 v2b89S68b43yoSrvaAkRGpVZf1xox5++7zt2IeFqfLUU4ttoQTGxdzreeeTDfvy4G/WSF6qQZ
 1Cwk9XftaE0bGLkjFy52xPNgjXSg9Po41c73bdcgTufRJJwCbBFVx4wqV7cFgYzYHtV5bKJl8
 S1zvHqnC0VAIyg9IZQ1cKD3xzMxsVYnSo31rkV5/pqMb2prmw0Qg4/qi65oBKDG2lMrlw5f7d
 14k2JAr07E96LwUSFuCEbt3IpXoPfhRE4ulZE7VrGlwfoedNE3GPY38KBc3Dt7NHJpr8dvhN8
 D5S4zbFe54qCx9gDB/GsLisPbTF1zA/ft68hPRRSfzComi8PQiw+acCM3bLqo48bxlWWSYH/n
 DM4OstIA+BI0MzzpfwFw0UOF+8itlP6XeZvKv/h3bv6vySqlmJIgPgNrFxV9Z5BXQK5CnAgfD
 54f8a141YN8U2OnjKaC1HvtLoqPfFFJXP4vrdTUXAbTXJ7sSGkxa+rTZ2CHv9rvobx3xprAp5
 3TFRmhm/urAQy9rWTkMh38oGk6sJTbh2LtNNgYjpvBceCmuhXLBVJpAX3X9eK6KDkjrpv7a7c
 GmCR9oMMC1ju0qpFBXtew2zWOYSRziKoDQBZ5tg+RKmL7RbxErIHLl3Wt6+2PwwAvKJw3DhQ3
 rNroJ4rwkHy/NkisaHj9nXyb6Oz1E1wLG67VzBrF5YlyBy8YlxUbVk95MSqXF32QACtobyK8g
 9yI9Vzt576hdIDc+MKAVKoBleM2v4lpEUHebAej1qVXmGK6iD74+xCsG0VE6rfa+Ef+0AT/dj
 TPBqs5nWfkRwY8YGp9QPB1szDYDAnRXUb8HlFs0hl6/LNIR+MIwnztseCAUIZVttzIXoO/rde
 PtgrHq3pc/FlQU=
Subject: Re: [Buildroot] [PATCH v3 1/1] package/rpi-firmware: fix missing
 files in overlays
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
Cc: Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Rutger,

On Thu, 17 Mar 2022 11:06:22 +0000, "Sassen, Rutger" <rsassen@comecer.com> wrote:

> When supporting multiple hardware targets, overlay_map.dtb might
> be needed to map overlay names to one of several implementations.
>
> Signed-off-by: Rutger Sassen <rsassen@comecer.com>

Thanks for new patch iteration...

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter


> ---
> Changes v2 -> v3:
>  - in Config.in use if statement instead of depends (suggested by Peter
>    Seiderer)
>  - mention the filename overlay_map.dtb in the help text (suggested by
>    Peter Seiderer)
>
> Changes v1 -> v2:
>   - instead of always copying overlay_map.dtb, make it configurable
>     (suggested by Peter Seiderer)
>   - do not copy README since it a special case, only needed when
>     installing overlays to a non-standard location (suggested by Peter
>     Seiderer)
>
> When supporting multiple hardware targets, overlay_map.dtb might
> be needed to map overlay names to one of several implementations.
>
> Signed-off-by: Rutger Sassen <rsassen@comecer.com>
> ---
>  package/rpi-firmware/Config.in       | 12 ++++++++++++
>  package/rpi-firmware/rpi-firmware.mk |  7 +++++++
>  2 files changed, 19 insertions(+)
>
> diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
> index 8070dc3019..36054353f8 100644
> --- a/package/rpi-firmware/Config.in
> +++ b/package/rpi-firmware/Config.in
> @@ -93,6 +93,18 @@ config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
>  	  overlays, to support HATs (Hardware Attached on Top, add-on
>  	  modules).
>
> +if BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
> +
> +config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP
> +	bool "Install DTB overlay map"
> +	default n
> +	help
> +	  Say 'y' here if you need to support multiple hardware targets
> +	  and you need overlay_map.dtb for target dependent mapping of
> +	  overlay names to one of several overlay implementations.
> +
> +endif # BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
> +
>  config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG
>  	bool "vcdbg"
>  	depends on BR2_arm # prebuilt arm binary, rpi-userland
> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> index b46a7f5270..800b560070 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -57,6 +57,12 @@ define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
>  endef
>  endif
>
> +ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP),y)
> +define RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP
> +	$(INSTALL) -D -m 0644 $(@D)/boot/overlays/overlay_map.dtb $(BINARIES_DIR)/rpi-firmware/overlays/
> +endef
> +endif
> +
>  # Install prebuilt libraries if RPI_USERLAND not enabled
>  ifneq ($(BR2_PACKAGE_RPI_USERLAND),y)
>  define RPI_FIRMWARE_INSTALL_TARGET_LIB
> @@ -83,6 +89,7 @@ define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
>  	$(RPI_FIRMWARE_INSTALL_CONFIG)
>  	$(RPI_FIRMWARE_INSTALL_DTB)
>  	$(RPI_FIRMWARE_INSTALL_DTB_OVERLAYS)
> +	$(RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP)
>  endef
>
>  $(eval $(generic-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
