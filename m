Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57802C04A94
	for <buildroot@archiver.kernel.org>; Wed, 16 Aug 2023 12:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A85E0415C4;
	Wed, 16 Aug 2023 12:23:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A85E0415C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jSpbb_B4e3Jp; Wed, 16 Aug 2023 12:23:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED37840B6E;
	Wed, 16 Aug 2023 12:23:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED37840B6E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1336E1BF2B3
 for <buildroot@lists.busybox.net>; Wed, 16 Aug 2023 12:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DEE4A41904
 for <buildroot@lists.busybox.net>; Wed, 16 Aug 2023 12:23:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEE4A41904
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9YtrJjosN0sC for <buildroot@lists.busybox.net>;
 Wed, 16 Aug 2023 12:23:21 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8673141989
 for <buildroot@buildroot.org>; Wed, 16 Aug 2023 12:23:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8673141989
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A9BE20005;
 Wed, 16 Aug 2023 12:23:17 +0000 (UTC)
Date: Wed, 16 Aug 2023 14:23:16 +0200
To: Jamie Gibbons <jamie.gibbons@microchip.com>
Message-ID: <20230816142316.76d45449@windsurf>
In-Reply-To: <20230816092439.570839-2-jamie.gibbons@microchip.com>
References: <20230816092439.570839-1-jamie.gibbons@microchip.com>
 <20230816092439.570839-2-jamie.gibbons@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692188597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nsBs10UkP+nyHigV9b6qcav7QQqcWBiNWURoINE3pg4=;
 b=om3YnSA5PXOrSq8On+CQONSNBUrDWplc8lKGmx4FMZMghOEmiunaJ0jZeATfhtwPpADnX+
 akN6rIEjFeJ+P8Yg2IVSUHkzGzfXxM7UqTqxJ7I2qTPHDoWKu84M3dPcuY7NtA5/BOYOg7
 a7f/C47e2z0G6vX/yJgg8c4G5rSlAn5GoLGvoNk9U8CHMvqU5GN+m200HTv4FpgOFwVBpO
 teiO2hkOktD1hdaJYEbG1VURTs6XiJhFZnahfN6dNlEdHULDXG8QQH3ehQ5sYemTZpPzYa
 Th8u2+OTrXVL/9nSBCoC7sHz3mUGt5JzhwNkrDvg7sM3uSypve+IxkuyHya2mA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=om3YnSA5
Subject: Re: [Buildroot] [PATCH v2 1/3] arch/Config.in.riscv: update
 instruction set ext
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
Cc: Conor Dooley <Conor.Dooley@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 16 Aug 2023 10:24:37 +0100
Jamie Gibbons <jamie.gibbons@microchip.com> wrote:

> Allow a RISC-V G core to support C and V. Copy custom RVC and RVV
> instructions from RISC-V custom core to RISC-V general core.
> 
> v1 -> v2 changes:
> - copied RVC and RVV kconfigs to both riscv_g and riscv_custom

We don't want to *copy* them. We want to make them available in both
cases.

Also, the changelog shouldn't go inside the commit log but...

> 
> Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
> ---

... here, after the "---" line.

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
