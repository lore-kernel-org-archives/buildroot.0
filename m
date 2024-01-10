Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7210BC47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F5FB400C1;
	Wed, 10 Jan 2024 20:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F5FB400C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3VTzuDrI9o1q; Wed, 10 Jan 2024 20:37:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07CB343770;
	Wed, 10 Jan 2024 20:37:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07CB343770
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0BAB41BF5B3
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D814261431
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:37:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D814261431
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p-p9jnCjJ_Kp for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:37:18 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B45B461404
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:37:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B45B461404
Received: by mail.gandi.net (Postfix) with ESMTPSA id A57251C0002;
 Wed, 10 Jan 2024 20:37:14 +0000 (UTC)
Date: Wed, 10 Jan 2024 21:37:13 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240110213713.676d0fbf@windsurf>
In-Reply-To: <20240106163344.1116986-1-ju.o@free.fr>
References: <20240106163344.1116986-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704919034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u0xN298jrebaOrifg1DD8ERrNu3sRxIlKC5Nbni52oc=;
 b=MQ9jQGCMxr1SY1ZZdrvLME4Qcr1R1rt1D8skOI+hw8OMxRYnoYj/2SRB6o3CJZrZ7QRjJc
 +GxsWwymc7Z+5NC/AUUiOkH8oTXLZ3XYS5cjsI0B+mpR4SrIWwD0zxELxg8hqNiJkMNqMe
 SNDRrwKZSMBLnIy6XfOoqVZV9yssizZZbRqC9Mmdoo60+67XxMbHCYqcZF5aakalLCxxGd
 v+w4E7CfTc4sXMSs8sWq4gzsNlwqOy2Vs6fNDe17WAYC938B2nD18kigqz6+B1+84jsX+5
 /GRS7X9+uXPME5AjKy1o+xbG6dy98CwRLxEaJVHM6bjrTbPzEF/7nWspWvpVbA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MQ9jQGCM
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/imx8mpico: bump bsp
 components to version tn-kirkstone_5.15.71-2.2.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  6 Jan 2024 17:33:44 +0100
Julien Olivain <ju.o@free.fr> wrote:

> Those components are aligned with NXP BSP lf-5.15.71-2.2.0.
> 
> This commit introduces arm-trusted-firmware upstream patches to
> compile the needed version with newer gcc and binutils.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/5083366622
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Changes v1 -> v2:
> - Add BR2_TARGET_UBOOT_NEEDS_OPENSSL=y to defconfig
> ---
>  ...low-lower-address-access-with-gcc-12.patch | 62 +++++++++++++++++++
>  ...dd-support-for-new-binutils-versions.patch | 62 +++++++++++++++++++
>  configs/imx8mpico_defconfig                   | 10 +--
>  3 files changed, 130 insertions(+), 4 deletions(-)
>  create mode 100644 board/technexion/imx8mpico/patches/arm-trusted-firmware/0001-fix-build-allow-lower-address-access-with-gcc-12.patch
>  create mode 100644 board/technexion/imx8mpico/patches/arm-trusted-firmware/0002-feat-build-add-support-for-new-binutils-versions.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
