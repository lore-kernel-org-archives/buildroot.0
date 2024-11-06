Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70F1D59F75
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 21:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B32F402AA;
	Wed,  6 Nov 2024 21:59:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pw_-bo3qa5eV; Wed,  6 Nov 2024 21:59:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05FDC40298
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05FDC40298;
	Wed,  6 Nov 2024 21:59:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3895B4C49
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26E0580F08
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:58:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6UjnhYpT6KD1 for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 21:58:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DE66980EEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE66980EEC
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE66980EEC
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:58:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B216FF804;
 Wed,  6 Nov 2024 21:58:54 +0000 (UTC)
Date: Wed, 6 Nov 2024 22:58:53 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Fiona Klute via buildroot <buildroot@buildroot.org>, Eric Le Bihan
 <eric.le.bihan.dev@free.fr>, Asaf Kahlon <asafka7@gmail.com>, Fabrice
 Fontaine <fontaine.fabrice@gmail.com>, James Hilliard
 <james.hilliard1@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Message-ID: <20241106225853.5a1741d7@windsurf>
In-Reply-To: <cf2fd687-9343-4d75-8e37-2510ec03fad6@gmx.de>
References: <20241010135318.3064224-1-fiona.klute@gmx.de>
 <20241010135318.3064224-4-fiona.klute@gmx.de>
 <20241028220010.23cbd668@windsurf>
 <e7853850-e246-46f3-8701-cf1117bcdb9e@gmx.de>
 <cf2fd687-9343-4d75-8e37-2510ec03fad6@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730930335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+/6NO6pRLV0twHKr2WXTeaO5do3WyY67oyfRiHJIG80=;
 b=ZhePKPDsNrzjKzq87+Mpc8h87/ONkz3jfsCxXcQJ7OuQqE9IMjKHGQv+1RsOX/DQUkUitX
 lmHYraTL15Pgma4w5q3X3OZwqyAUVaHzFMYSWKapcZvNQPTG1/9n0+DP0X4K9R4p9yGxFE
 v3PHMIF4wcAQCqk+PfCg0BfD2rGYrKnU6YG7dLEPe2TXskGKQQp/HfyzZw+1eT/+t9u2Mv
 fs7gp0dw2jH7qXpvnuoFGLEq1Wo/aWSywZVgdKiDqMBFgbEFatGe6Vr23qBFGeDP44hEwh
 bNzUMKfZaCxcMl2J7okosMQhbVxWI2vPM5cTOklruhppbEMWdbrpm4whk917WQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZhePKPDs
Subject: Re: [Buildroot] [PATCH v5 3/7] package/{gobject-introspection,
 libglib2}: bump to {1.82.0, 2.82.0}
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fiona,

On Wed, 6 Nov 2024 21:45:13 +0100
Fiona Klute <fiona.klute@gmx.de> wrote:

> I've just sent v6 that does the host-libglib2 bootstrap only if GOI is
> actually built for the host. Any package that needs host-libglib2 with
> introspection (currently only target gobject-introspection) now needs to
> select BR2_PACKAGE_HOST_GOBJECT_INTROSPECTION. I hope that helps!

Thanks a lot for this work! I'm planning to do some BR work tomorrow
evening, and I'll try to dedicate my evening to
reviewing/testing/hopefully-merging this series.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
