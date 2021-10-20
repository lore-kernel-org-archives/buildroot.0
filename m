Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BDEFC433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 16:31:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD0F161260
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 16:31:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD0F161260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EBDA83AA5;
	Wed, 20 Oct 2021 16:31:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JFZFmcjaZGFt; Wed, 20 Oct 2021 16:31:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC77583AAD;
	Wed, 20 Oct 2021 16:31:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 25B631BF372
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 16:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 139AE40577
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 16:31:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cIkSMP7G4WmL for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 16:31:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA7544011B
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 16:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634747460;
 bh=C8POfC97OOw0cWCA+z/C5VpwYOEHl5MBFTe40rUMQVI=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=TXCYxbtq8aaOtApdm33JmeP+pX6sq/Wh1YyRVG6o+lefUA1GrzUFvtghiHbl6usGz
 I7V2Bj+IKeJd56RUe+FdomHF3+NcOp2WmWdSVA4MEvHAkKwUvrtL6+u163W9hzolIB
 G4ImMIVgqSv7hZMOfyhENkGCLZQPUOOoArVjb3Bw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.182]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MjjCF-1n6q9n0qr5-00lE82; Wed, 20
 Oct 2021 18:31:00 +0200
Date: Wed, 20 Oct 2021 18:30:58 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Grzegorz Blach <grzegorz@blach.pl>
Message-ID: <20211020183058.13830eea@gmx.net>
In-Reply-To: <20211020120327.5768-1-grzegorz@blach.pl>
References: <20211020120327.5768-1-grzegorz@blach.pl>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:f+pXBJ+jSG1D2riiQyOTxGzBREkdw781LnW+ccWK7o21Htk8i2P
 jhYOIq5uPcT35vnrDrJqP0J9+WIIUB68YFWutPEkb/nGBhXcLeLEnhafgjsiHZH4C65yYkC
 f/HMI01LNRtkawrPhCGtnUlG3b+WwoR4saw9ai7vLN40tAQZamwAJ7uXvtEsK5MsigRXHa6
 900McYsKOaSDAfAklFxjg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:x0Q3vblORsk=:f+AqjETUFMPzkmxtLlKaYl
 1JimIgz7sC3XfzeEy0LiISSSlYlsZ3anR3lda29CxoQWYwYHO+iXoY0RZuFs51dQPFFJ0Lq6k
 +h6NvFZf6QIW3TJuU7lbTxI4idJ4hBv4uLNSSVYuXB89EYNNhIz63u4qV8rVlFxT5aRV+auh6
 w9dABmj07odqSReXqW84MHVgc/KMDIWTOQYclfwmiaYd6IA1z9bpuODUO4zjiw4b0A7rtJ83I
 /MIm4pusdYHSDCkWW54Odlkd7cBY5RbXDMMbBocblwYKckRHc5ctY+OpQAxMoEqDU1fW0ulxa
 UhuX85tdAMcN2+HT49D1NF5rS6Ch5OPGm+FgZxaSSCxz41F0KhLHQrUiap0xDhZsTDEL451R1
 5xTwRnZtobFGQQ8MQTe/sS+Z23cM7jd3HP58hy+yGLlAz+Paayuj06j0OOTo39T27UECo7udi
 Vw1F+WARACE8knb29VUHnO4+GHEma9++p6zj3QZppP6uqgAajKulC2V54EKGjphSGSLQCeYoQ
 oo6fhGEn123iyEOmAOSBnMmt22IzeVYq7PrxYACtShTdrOvd2OAK0/CtZdTh9EtQCYLmPDEZ/
 +1SibXWOmgurP1MUhlJkkHIwyA58IPJ7oSyAzUt6Q6uZkxx1KKJcOQQgRY7ckm6yljVnjHDvl
 J2Hx9brhXrisCrDNG8baR5RSBBVc9Sw6D14Qmbnq7ih12oDfP//wxio7P3HSIRCHdZlWyVlnY
 mMd7HImdXmfrvtLmRRV4CnEnDJJyijp3xi7/YRIR/UA67IWCIdYX9se9yVwJ6z6OakS/BAB7Q
 tZcnzuD7/6omr4mIK0jzBURK25hrqBacaFUSYyEskAAbpkFlrY77U3Q9p1qF8KtHGHRZBdCcR
 hZR7AQ5Tn3zRM2HW4W483NsQ4hY3dwsctf2y2cY0AH3/taEO78vNYh1fq30q8actnV5ZAUz0T
 lJaa1a9LwMCuT3+3Wvks1DyO6DEh2ilAprpH3GlKJgZvsRkZfTi+5K2XfGJ/Vnus7rGMxs7Et
 8dvssrQ8YifneeIhMErCDzwRHWGj8f22KdKE4i+YvizABrWzq06Pm2zqB8/+y5+OmDqAgEw5/
 hAIluyFJkfxpsM=
Subject: Re: [Buildroot] [PATCH] package/rpi-firmware: Fix config.txt
 installation
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Grzegorz,

On Wed, 20 Oct 2021 14:03:24 +0200, Grzegorz Blach <grzegorz@blach.pl> wrote:

> Variable PACKAGE_RPI_FIRMWARE_CONFIG_FILE is always undefined,
> so RPI_FIRMWARE_CONFIG_FILE should be used instead.
>
> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> ---
>  package/rpi-firmware/rpi-firmware.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> index 8a6a435f63..0929d6af1e 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -28,9 +28,9 @@ define RPI_FIRMWARE_INSTALL_BIN
>  endef
>
>  RPI_FIRMWARE_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE))
> -ifneq ($(PACKAGE_RPI_FIRMWARE_CONFIG_FILE),)
> +ifneq ($(RPI_FIRMWARE_CONFIG_FILE),)
>  define RPI_FIRMWARE_INSTALL_CONFIG
> -	$(INSTALL) -D -m 0644 $(PACKAGE_RPI_FIRMWARE_CONFIG_FILE) \
> +	$(INSTALL) -D -m 0644 $(RPI_FIRMWARE_CONFIG_FILE) \
>  		$(BINARIES_DIR)/rpi-firmware/config.txt
>  endef
>  endif

Thanks for spotting (and fixing) this...

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
