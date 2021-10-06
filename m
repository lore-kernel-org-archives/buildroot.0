Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B50BC433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 17:09:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D064861075
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 17:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D064861075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9902040406;
	Wed,  6 Oct 2021 17:09:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id omaSMbtHz1o0; Wed,  6 Oct 2021 17:09:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 054DF403C1;
	Wed,  6 Oct 2021 17:09:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 94E9F1BF369
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 17:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 846F760EDC
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 17:09:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 41eg34GFo6Ga for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 17:09:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 666006063B
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 17:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1633540164;
 bh=lNlxxWeJostZ/iozN6q29qjQW5JbZB9ExpAUzBdN46c=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=QETq7wOLYrE8cXmM5SBtl3Bb6Z5f5N9L8NTdPrH3OzBNy7sYsCUdN5oFz79oXYnkK
 Ro6GDVgYpqMlo2n6UxaGMz8/sYQElLBBuxzZrllc8fep1vPegRVUTXCrpppWyUM1NO
 tm+mf08G7ItQmyxueGSFj+ed9SDpWJ3H7oqGA9LA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.251]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MI5UN-1mblb90L7n-00F8K6; Wed, 06
 Oct 2021 19:09:24 +0200
Date: Wed, 6 Oct 2021 19:09:22 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Takumi Takahashi <takumiiinn@gmail.com>
Message-ID: <20211006190922.5baf43b9@gmx.net>
In-Reply-To: <20211003175446.3076312-1-takumiiinn@gmail.com>
References: <20211003175446.3076312-1-takumiiinn@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:GjGkCN0Gd9zvx7JT97ypfl48Fv4xZ+QHwGI8j12iFXcWrqYFihZ
 bBMJyxTz5me0fcyBpicMF5SdoqpmUENWnWpgMmCXiXE/BZRVx/Xss7XhS5Ko+9NAOc6gENp
 HTpL7NsCKI7u7yYA8b9+X7xshefsVZfImf05pJreiYl9o3cHrex9rJn3fPj+dX/BEFQYUgO
 2UYmNvmdblDHfKM+iTn9g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fWheELxDZss=:1cy2g4ptF24DwE193+oFqe
 OM9iP/6S7rNBmaJrEbZmjYjKqb1l30ZzC39gNBaxT2Z82q1m9B2545eiA/h0ngm159YBSni0I
 Hv9EGvF6utROL41wvezAB+pkcZ5VIYMd9m820gpNwZeBT3/AlORSYVqr3dN+eRmyf1NzbAFv/
 II6G57Ikt/Bw2xz2iIV2fnCg2GrwtZJcW61nINlS6ZQXd9iSc0TOlBiUhyERYj2H5J8lez/a4
 4R8ToeHoNvDSm4CP8rwDQZRW+8G/5ImPLqH9dDqVuAVBGdBQMy6fbpx8HiNxMfoMn0civZDT9
 6OS9l7ZgouuSGq21C+Y8X8y0u1dZGVgp3YR739rx4f5fqRPWd/Esqq7kOLajax20pI6pM0Ydl
 rFDE+3yS+ynpm1ZGv+RN3jvhtFjDy3P30sQ4Gi+zddxYg3YV9dRjaecliLGmrxmu3F++DL1Gv
 ccyuJzVhBRyIIh6aqIdngvOZ4xjAMTxWDCyJcLgHNwXh5cdmlR4LAH2D3VsKZ0DJ4F78h7kPT
 ecgwIgbywD1d7y+6vtnnPiAFbxCknQfuBxnNKuKEbfrv0mu94XOLqNHkIzEbqDTGgFLt+Qz3u
 wSDCGAmjkomZ+Z1cej7xawiRx7S7J3hVoy4nzz7FxFDcXM+guwIeZW2BoteOmOUaU86tUDKLe
 rnX1e3cgofRNF/gaYsxNMfqoTifeEPtLRM5U5fZ6hhRupwV475pRMbbgOb4KOsCdg5Li8cS5n
 /y0ltSHfbmzwASQ7R8BVtSUcnAvYoqJm7lkPT3n+nd/ZH3Nqm82/UFrffECWrPXII+QKbOEcg
 fIA858BR/lmORAUnierF+Hy48t/BL+e/n49/R6Ee2Y9yZ1QNHxox+E5v2IAgiF9bIMFoH87SZ
 S2lP13cZZtae3sbJVpPGbjzYID//JnETKFgjDVzdiCV0XwOX6rq8JzX0gZcxoPb5BE4y3gmPi
 n2MxlYsjURSxwWzTU6VeImDEZhGqlpLwN2I/9c7Pnl+Pr2cT842Ao6SZxnbF1wV6vHhiHvRyH
 9yRon+A5OF2QiLNGe9MIjdxxTiyI6A5azyfReaK1d0mJfp2jhmLfp8n8bIcEqep9ySAE//NHi
 cuUkgndi5y9sVw=
Subject: Re: [Buildroot] [PATCH 1/1] package/rpi-firmware: Support Device
 Tree Overlay
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
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Takumi,

thanks for suggested patch...., comment below:

On Mon,  4 Oct 2021 02:54:46 +0900, Takumi Takahashi <takumiiinn@gmail.com> wrote:

> Building the Raspberry Pi GitHub official kernel repository
> will generate a Device Tree Overlay Blob files under
> `$(LINUX_DIR)/arch/$(KERNEL_ARCH)/boot/dts/overlays`.
>
> This commit changes to install the Device Tree Overlay Blob file
> generated during kernel build under the following conditions:
>
> - `$(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS)`
>   - `n`
> - `$(BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT)`
>   - `y`
>
> Signed-off-by: Takumi Takahashi <takumiiinn@gmail.com>
> ---
>  package/rpi-firmware/rpi-firmware.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> index 181650fa08..39962b3d70 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -30,6 +30,16 @@ else
>  define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
>  	$(INSTALL) -d $(BINARIES_DIR)/rpi-firmware/overlays
>  endef
> +ifeq ($(BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT),y)
> +# If you are using the official raspberry pi kernel, dtbo will be created under
> +# the overlays directory, so use that.
> +define RPI_FIRMWARE_INSTALL_KERNEL_DTB_OVERLAYS
> +	for dtbo in $(LINUX_DIR)/arch/$(KERNEL_ARCH)/boot/dts/overlays/*.dtbo; do \
> +		$(INSTALL) -D -m 0644 $${dtbo} $(BINARIES_DIR)/rpi-firmware/overlays/$${dtbo##*/} || exit 1; \
> +	done
> +endef
> +LINUX_POST_INSTALL_IMAGES_HOOKS += RPI_FIRMWARE_INSTALL_KERNEL_DTB_OVERLAYS
> +endif

I believe this is the wrong place to copy the linux-kernel generated overlays
(as they are independent of the rpi-firmware package), a better place would
be a BR2_ROOTFS_POST_BUILD_SCRIPT script...

Regards,
Peter

>  endif
>
>  ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG),y)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
