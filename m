Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713E7C4725D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jan 2024 11:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2F2041B58;
	Fri, 19 Jan 2024 11:23:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2F2041B58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iDBlXCGvuV3A; Fri, 19 Jan 2024 11:23:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3687E41A42;
	Fri, 19 Jan 2024 11:23:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3687E41A42
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 679981BF5A6
 for <buildroot@lists.busybox.net>; Fri, 19 Jan 2024 11:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1C2360F01
 for <buildroot@lists.busybox.net>; Fri, 19 Jan 2024 11:23:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1C2360F01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v05YgCajRQVt for <buildroot@lists.busybox.net>;
 Fri, 19 Jan 2024 11:23:46 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 55B4560EE9
 for <buildroot@buildroot.org>; Fri, 19 Jan 2024 11:23:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55B4560EE9
Received: by mail.gandi.net (Postfix) with ESMTPSA id 71DCCC0007;
 Fri, 19 Jan 2024 11:23:43 +0000 (UTC)
Date: Fri, 19 Jan 2024 12:23:42 +0100
To: Yang Li <yang.li@amlogic.com>
Message-ID: <20240119122342.6230902d@windsurf>
In-Reply-To: <20240119031503.2967130-1-yang.li@amlogic.com>
References: <20240119031503.2967130-1-yang.li@amlogic.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1705663423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aadPElnqU7AXl9ahFQS2SRuM058a+vVrqy48IjsSDSM=;
 b=fA+RXAk2/VzeyGpfgrswe4nRqyQa6G0USDuS+7/NnFnLHD7ywwT6UdatSLcRRJoiTwMcAI
 2IDDUpfnixSAeTMsKi+YT9UkKsRyJnPWx5YsiGBd3mx8EKCpfw7K628lIYru42yArJ6Xdk
 K3Oxwr2kh29HXd73HaAX58WsaoWSzbbbLNuJ6gtDowitzceNF+qmIPwFiD02z7ii0dObdt
 j3nG/yH6l/MTEN4qeK/O7L+lU9yw0cr9oVIhf5D2BHUAPh9wUu+8LuAaGJ04WLybqRe4hO
 dAbgXSdR+x7kOAwqdIDru+G/dtvX+zIMsSRvvCKOyWu6SRiBKVZvnAtxRIrVAA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fA+RXAk2
Subject: Re: [Buildroot] [PATCH] package/linux-firmware: add scripts for
 Amlogic
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E.
 MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, 19 Jan 2024 11:15:02 +0800
Yang Li <yang.li@amlogic.com> wrote:

> Add scripts for installing Amlogic firmware.
> 
> Signed-off-by: Yang Li <yang.li@amlogic.com>

Thanks for your contribution! See some comments below.

> ---
>  package/linux-firmware/linux-firmware.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index c09dbc523e..735d4b7e53 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -856,6 +856,12 @@ LINUX_FIRMWARE_FILES += v4l-cx23885-avcore-01.fw
>  # which is installed unconditionally
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AMLOGIC),y)

This option does not exist. Probably you forgot to add some changes in
package/linux-firmware/Config.in?

Also, usually, our options are not per vendor, but more per device or
class of devices. Which devices are supported by those 2 bluetooth
firmware files?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
