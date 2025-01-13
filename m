Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A6BC02180
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 20:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 958ED60627;
	Mon, 13 Jan 2025 20:33:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ks-loBCk51Y; Mon, 13 Jan 2025 20:33:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA6EB60807
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA6EB60807;
	Mon, 13 Jan 2025 20:33:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EEA3D940
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9A37401D5
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:33:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JaDFtnghIvzw for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 20:33:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9074B400BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9074B400BD
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9074B400BD
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:33:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E3DC860002;
 Mon, 13 Jan 2025 20:33:00 +0000 (UTC)
Date: Mon, 13 Jan 2025 21:33:00 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20250113213300.4ba5d4b8@windsurf>
In-Reply-To: <20250113200454.3108562-6-fiona.klute@gmx.de>
References: <20250113200454.3108562-1-fiona.klute@gmx.de>
 <20250113200454.3108562-6-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736800383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xFHN93tbep21GGk/6QR4WHSwbbfvZR9rVI565/sYqLI=;
 b=AwALkR4eKFwbIp9VxaU+sswktk1YKDgG1aSvPJBE/0mJdFWwuAMvwSlqhfF/VEoBLqvg0Z
 LFhOfYB5TLhCkhRaYaE1EHmyCqNpbWAWhgb4owzCJW0hfKpYpG/b223zIMNYIZZ+MrB+8D
 X3blitPOSbvNOgjNyAj7BHocBLwwaSYiV4ghK9tow26AuCKaid4kpwIiugBPtEbrd0VuYK
 enMLU1fdnTGe7ReIrhi2TRplqGxmefNO2XvXZDb4a1Onn+L9G1sqkHGoSUQycjjMIVGXHF
 I2FKej0xjk/ASWky22Q+I/FqTOYHFT00AamxEG5iXn90Llo9275C0XgO9IVsaw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AwALkR4e
Subject: Re: [Buildroot] [PATCH v7 5/5] package/json-glib: bump to version
 1.10.6
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon, 13 Jan 2025 21:04:54 +0100
Fiona Klute <fiona.klute@gmx.de> wrote:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> Fixes a build failure due to warnings from g-ir-scanner:

Does this happen due to the bump in PATCH 1/5 ? Does it happen already
before ? If it is happen due to the bump in PATCH 1/5, can this patch
be added *before* PATCH 1/5 in the series, i.e does it work with
earlier versions of glib/GOI ?

We're ideally trying to keep patch series and our commit history
"bisectable", i.e, every works between every patch. So when what patch
introduces an issue, we don't expect the issue to be fixed several
patches later.

Could you clarify this?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
