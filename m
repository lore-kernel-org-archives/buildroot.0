Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970B0C83F2C
	for <buildroot@archiver.kernel.org>; Tue,  5 Sep 2023 07:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10F6160BDA;
	Tue,  5 Sep 2023 07:07:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10F6160BDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u4VUJwj6LtMF; Tue,  5 Sep 2023 07:07:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F33560BFC;
	Tue,  5 Sep 2023 07:07:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F33560BFC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B123B1BF2FA
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 07:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84001401B7
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 07:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84001401B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Krru8r0vGQvb for <buildroot@lists.busybox.net>;
 Tue,  5 Sep 2023 07:07:37 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 23D854013B
 for <buildroot@buildroot.org>; Tue,  5 Sep 2023 07:07:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23D854013B
Received: by mail.gandi.net (Postfix) with ESMTPSA id BAF4F240003;
 Tue,  5 Sep 2023 07:07:33 +0000 (UTC)
Date: Tue, 5 Sep 2023 09:07:32 +0200
To: patrick.oppenlander@gmail.com
Message-ID: <20230905090732.7616c4de@windsurf>
In-Reply-To: <20230905003412.67305-2-patrick.oppenlander@gmail.com>
References: <20230904182649.51e17f8d@windsurf>
 <20230905003412.67305-2-patrick.oppenlander@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693897654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jiqOIRCTPqBoAAU4Av7IZSvjRKMXfVNWV0De8EV5so0=;
 b=aY1v2p8W3UwUpIHvkGksTOMgbDcmiLMe6/7Lj3tD021poTf8bFh+pdK3EeYMRYKEpNy5Xq
 I9EmFvuIlRc9O0PMydi9MCjkzuyufigOzjKjK6qgVSA84yHeTepRxYB1FPuR5gT+FfTAFp
 BzNWNB8stJY+wEuq+y5wCArCBT7VF0LddeVgK38lown2vci2p804/MyMT0VqQPxo8950ZM
 uaY8vu1WTlk9UHHI7pfny8BNEnKWjkWufeNQu1nQ/5TG2gUtdmuLrad5bMDNfxce2KKy/P
 LfDKLMEdrIVmP9Oz3ynYX2v1VD0B8igy7Ii6p6XIXyB7WxFzClkr5ibJuNZa6w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aY1v2p8W
Subject: Re: [Buildroot] [PATCH] ti-k3-r5-loader: support devicetree
 customisation
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

Hello Patrick,

On Tue,  5 Sep 2023 10:33:48 +1000
patrick.oppenlander@gmail.com wrote:

> From: Patrick Oppenlander <patrick.oppenlander@gmail.com>
> 
> This is duplicated from the U-Boot makefile & Kconfig.
> 
> Similarly to U-Boot custom boards sometimes need to adjust the U-Boot
> devicetree. For example, the AM64x SDRAM controller supports inline ECC
> which needs to be enabled in the R5 loader devicetree.
> 
> Please note that some versions of U-Boot have broken external devicetree
> support and may require manual patching to build. See commit
> 3609e1dc5f4d4c238dcd23e045ba6223310feffa in the U-Boot tree.

We're almost there! We now need you to add your Signed-off-by line...

... here!

> ---
>  boot/ti-k3-r5-loader/Config.in          | 10 ++++++++++
>  boot/ti-k3-r5-loader/ti-k3-r5-loader.mk |  5 +++++
>  2 files changed, 15 insertions(+)

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
