Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C15C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 20:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 333074041C;
	Wed, 16 Mar 2022 20:45:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Da-9hcDMZUS; Wed, 16 Mar 2022 20:45:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E21F240126;
	Wed, 16 Mar 2022 20:45:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F009E1BF38A
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 20:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDE5F60BFF
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 20:45:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TJh9gXrl7eY7 for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 20:45:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BE3F460BC6
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 20:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647463542;
 bh=na1HPU1VOLtjmqWYds2OnkSbUSbmGphF+Va+95jhJ2k=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=i7HUGCfWZW8UwarlT2vsle13gfGeEOgfEz4zMlBSFQxgmW9Plk8tifxvXcnV2yPjJ
 b3o7tSqetupbMwYub85HS/XHVLd37wQJmqMYImQ52OKfmbpTeKI0BEVXEGSrYBdHrd
 YcnEnTzdaDwh+dEqBQsMkqdptVNrfRFpkWQc5JaE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.226]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUXpK-1ndLvx3YSe-00QPiD; Wed, 16
 Mar 2022 21:45:41 +0100
Date: Wed, 16 Mar 2022 21:45:38 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: "Sassen, Rutger" <rsassen@comecer.com>
Message-ID: <20220316214538.1d7ff89f@gmx.net>
In-Reply-To: <YQXPR01MB61218BB731C52E212FC43327AE119@YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM>
References: <YQXPR01MB61218BB731C52E212FC43327AE119@YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:BX9ju9LsPpROyFivrR2DpOgxbn3vaVSOFWOy3P/Da7MAYOjDM/h
 pic9aPWO2Jvu+bCzW7jtna/alGjIkQl9qU+FQvA4fWr/aqjPXOWllCas4367xwzHiNkTJLc
 4YQz6tVW2hjuGRNCqJvx8f06pTJMQT5T0O5WGOfnDP9yepHzOxL24LWIbix/QNH4B7Wqejb
 vh3Bu6ncX/XrTypkc4rTg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vqOlDczqMZU=:Tv63k74R52qZqFcuUrpOOb
 w/0F+0GGKaiEmSvBLvWqLX04ntASA/ttHo0LJmOHtrSS0UPbP+DNjRsaVGqFztOJIY/delvoy
 2w1VImEKme59IRN29M4U1463VDL6I1tFzPwi3awGqmyBrfCue64ErjSCoYYLofTMeQg3C4jGU
 HMBFvwvpCQOzLuXFL9jf3G/tO/NVE6AdBahZ+zKsXYp+gBaJE3NrUuUQEM68I33s6eAoDy2g2
 NGoajQ09etbIw4ubbRIgEwRsPDYDoYVZ+cRtJD301NkonsYrBMu85jPurwlxJNXQJvfgjHURX
 /mwYcxkrKLmRCG5HArUBThYNWyLx1xw/e30m1CoRIHyEwtsQVmnn89h8Mc1rMmKWazNCbu0st
 46l81Y8cFQx2S+gc/1LdG5u2ARE3RIIFhMyq78xeoxW0E3OHaw3nZ9Wqm4/2a+b6/zorN8018
 laitXMLuvolRHSMXkuynQJ6urNZBVMIABjMt2fGhEjbHv2N3Z4So+BnUDr4sk8FHpvCWAYic5
 lf0J8bYWhPIQMKqnPzlvLLdahc6fdQrIFoXJx90xnipmyIw5KuU5a36PHaidsvf3wDz7PZRML
 w/utfhERaNfQyIu3eC4bgNoctO5qWuAQEP0CCW1sDFwxmn3WMSQa8YDH6Hy4jSSUCLs+X678O
 912mHm18bW/u5aGQvFy5m0yTxucLzjWp4OFCA6k0cPiD5EbM1KzALNR7RGoAJ0EPaUvm6Gz2R
 QL6Btwky2S9WldguYMdZjYy2pirUBan54yXpzCt1KQAsM86gbvAx5lBrQqqipj8cilT+YswOD
 ff8sPQCk5iEyyQUZpCzeYbHYwqoOyw9Eqw7i8F8+HhRmEHcj9f1Rj1doWVkp5C79gCpy7jsyF
 jUUCwtyWUDB3/JAMqyu1at1aS0VhW6Sf8BQ0R0ZclgY5T/vStX01VpFUH3FH1OLJ+HRoqoIKb
 qRFwwNWTSuAqveRebENqTWAAp1Xu2FGS8Y600YsLxbTpJ3DgiDVOIUBpaG9Nm3QQ7obEd/BUv
 K0thvswv+Fj1K52oZLlYrbjDW5PJ5MviX6nhlqYX41fitiSosJet/4XUMKO2fMLz01gJhpcu5
 0yG2XxWvmjAV20=
Subject: Re: [Buildroot] [PATCH v2 1/1] package/rpi-firmware: fix missing
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

On Wed, 16 Mar 2022 10:08:40 +0000, "Sassen, Rutger" <rsassen@comecer.com> wrote:

> When supporting multiple hardware targets, overlay_map.dtb might
> be needed to map overlay names to one of several implementations.
>
> Signed-off-by: Rutger Sassen <rsassen@comecer.com>
> ---
> Changes v1 -> v2:
>   - instead of always copying overlay_map.dtb, make it configurable
>     (suggested by Peter Seiderer)
>   - do not copy README since it a special case, only needed when
>     installing overlays to a non-standard location (suggested by Peter
>     Seiderer)
>
>  package/rpi-firmware/Config.in       | 9 +++++++++
>  package/rpi-firmware/rpi-firmware.mk | 7 +++++++
>  2 files changed, 16 insertions(+)
>
> diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
> index 8070dc3019..13efa3dc87 100644
> --- a/package/rpi-firmware/Config.in
> +++ b/package/rpi-firmware/Config.in
> @@ -93,6 +93,15 @@ config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
>  	  overlays, to support HATs (Hardware Attached on Top, add-on
>  	  modules).

Would have expected

+if BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
+

>
> +config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP
> +	bool "Install DTB overlay map"
> +	default n

instead of this 'depends' line

> +	depends on BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
> +	help
> +	  Say 'y' here if you need to support multiple hardware targets
> +	  and you need target dependent mapping of overlay names to one
> +	  of several overlay implementations.
> +

And the endif here

+
+endif

Maybe good to mention 'overlay_map.dtb' explicit in the help text like?

+         of several overlay implementations via overlay_map.dtb file.

Regards,
Peter


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
