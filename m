Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB7FEB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 20:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD4C060D64;
	Tue, 18 Jul 2023 20:55:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD4C060D64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tULdc_LwvdcT; Tue, 18 Jul 2023 20:55:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 237FF60C2E;
	Tue, 18 Jul 2023 20:55:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 237FF60C2E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E3901BF350
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E404B417A5
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E404B417A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CYnXPE9iIbq1 for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 20:55:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC19541615
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC19541615
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 20:55:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A2779C0005;
 Tue, 18 Jul 2023 20:55:47 +0000 (UTC)
Date: Tue, 18 Jul 2023 22:55:46 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230718225546.08847fea@windsurf>
In-Reply-To: <20230716075438.3026838-1-bernd@kuhls.net>
References: <20230716075438.3026838-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689713747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=93UUmLtPCelKjVFpA1A9kLi1OZw1XmcZdtprIr9Z4eY=;
 b=ogcYGW3RZqJMrCgAh6AfjCsFUxCdxwwgJEB3ykSALDhPeYKAHVJEMFM/dY/1ERf7mILugh
 v/NHFpN+0xvVPlBo2Pl2vPMB/ygM929uA+3ScAZlSxRcxihlw3z3GKBPnj18XBu1L5RJss
 X82NNet3IbuFM5hZ0jbbyLRN79htgOELjJuRHP14WmiuhVlWtusbuw1MbjT+LzdUJ+n0Tl
 V62Hy43krNYAdU80EpSibHQN8Tvsd4FuFxPN/ws/d51+lzX38GDUz5iGpYC1aIzCS2fXgS
 45bqIWcDkA8qGI6A7JMAy7ssX1IZXLK2LXMAsaNvHnFL05OwVrlEdawhbgBqJA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ogcYGW3R
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi: add optional dependency
 to clang
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

Hello Bernd,

On Sun, 16 Jul 2023 09:54:38 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> +ifeq ($(BR2_PACKAGE_CLANG),y)
> +KODI_CONF_OPTS += -DCLANG_FORMAT_EXECUTABLE=$(HOST_DIR)/bin/clang-format
> +KODI_DEPENDENCIES += clang

I am not a fan of this, because you are testing whether target clang is
enabled (BR2_PACKAGE_CLANG) and having a dependency on target clang,
while what you need is host-clang.

What does clang-format brings to Kodi feature-wise?

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
