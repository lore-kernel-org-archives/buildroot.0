Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E39CA0ED1
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 16:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFB0D60600;
	Mon, 18 Aug 2025 16:32:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eW6--OdeUWjb; Mon, 18 Aug 2025 16:32:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44BFA605EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44BFA605EF;
	Mon, 18 Aug 2025 16:32:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F0A4196
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 16:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0593340628
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 16:32:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v6934phFJHpL for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 16:32:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0071C40635
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0071C40635
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0071C40635
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 16:32:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 16AC94E40C21;
 Mon, 18 Aug 2025 16:32:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E3ADC606A6;
 Mon, 18 Aug 2025 16:32:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1B55C1C22C93E; 
 Mon, 18 Aug 2025 18:32:14 +0200 (CEST)
Date: Mon, 18 Aug 2025 18:32:13 +0200
To: Philip Molloy <philip@philipmolloy.com>
Cc: buildroot@buildroot.org, Philip Molloy <philip.molloy@analog.com>,
 Michael Hennerich <michael.hennerich@analog.com>
Message-ID: <20250818183213.7cfd72bb@windsurf>
In-Reply-To: <20250818142203.421300-3-philip@philipmolloy.com>
References: <20250818142203.421300-1-philip@philipmolloy.com>
 <20250818142203.421300-3-philip@philipmolloy.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755534737; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=DPMStHbv9GfOzsBxg4yr9D9RPtBmHQjr7Jl8ny/zwow=;
 b=z+nkKMh9rEdQ6JkkE9XEAv+gi1ZJ4fmx/lI4y0t7IUtCQsrYKLTYP3697Vo7rRDS+vLEI/
 GffgyIekonk2PPGFOCYGVvlwlGyXLVb7s7kYbQfHucXRp7+/gq5Fgmkh7kIfqAb/pKnkDj
 rbHT7xRar/yLwwjOpmPgTCQINB775iOwvmkB8SSPfYyywPAu/+TTUmeFg64B8Y9qzB0SNh
 /ofrAD7Qesdk+MKvUKDFqbr505BzQTT+AvdpHEpw/H/NcwwN2FuHHtuxfMxKfh5GbCvh8L
 JmDFEHJ0jbp6+lhinEzQye5euu+FmR5wMgWSJ55Fjg9pEPEKx2/OJm1m7zWQpg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=z+nkKMh9
Subject: Re: [Buildroot] [PATCH 2/4] boot/uboot: depend on adsp-ldr if needed
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

Hello Philip,

On Mon, 18 Aug 2025 14:22:39 +0000
Philip Molloy <philip@philipmolloy.com> wrote:

> From: Philip Molloy <philip.molloy@analog.com>
> 
> Signed-off-by: Philip Molloy <philip.molloy@analog.com>
> Signed-off-by: Philip Molloy <philip@philipmolloy.com>

Considering your PATCH 3/4, I don't think this patch is needed. Indeed,
PATCH 3/4 can simply add host-adsp-ldr in the dependencies of U-Boot
when BR2_TARGET_UBOOT_FORMAT_ADSP_LDR=y.

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
