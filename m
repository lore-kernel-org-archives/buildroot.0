Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46457CFA472
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 20:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E28660623;
	Wed, 23 Oct 2024 20:57:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XXKwcXtJiiu4; Wed, 23 Oct 2024 20:57:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3007B60771
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3007B60771;
	Wed, 23 Oct 2024 20:57:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E5A42972
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C722640247
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:57:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q2O6sIeK1TbY for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 20:57:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8971640294
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8971640294
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8971640294
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:57:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4517FE0005;
 Wed, 23 Oct 2024 20:57:00 +0000 (UTC)
Date: Wed, 23 Oct 2024 22:56:58 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>, Falco Hyfing
 <hyfinglists@gmail.com>, James Hilliard <james.hilliard1@gmail.com>, Asaf
 Kahlon <asafka7@gmail.com>
Message-ID: <20241023225658.09b233bd@windsurf>
In-Reply-To: <20241009115915.922298-1-buildroot@bubu1.eu>
References: <20241009115915.922298-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729717020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pENILfV0w8T1ck9t/YFIGfgqjwkHYGD3TjLedMA/FNM=;
 b=hyIkYMlho5cubekGdAIDOSKrqJb/zK+2yZd01vddTEKTRlOcyo2UUFEFEqf1tZaRPbbqdr
 /OayOuLe4YBnwQcJz7tpJR3IiBDch2rV+0mK8X18islRZ/u2AY7Y97Rr9jSxfUKAwhEB4L
 RyMoCP0JcinHAeY0vk5Jt6ld4YeN+AhncNLUVoamOBKLjFrPyEzjhUoY3ZzXCMWKpUeB5w
 6m/ums1rX5A5NLLh5XDVxwTegosCWADYYTBYHWLYwi/lU0B663A3mnxo/X3mJ4thxaIWtj
 asveKC8Nknq843qZkpNFvnElkOGTP0tkzVklC4Ua8iFwnWIV3eEsUWVHtrh9XA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hyIkYMlh
Subject: Re: [Buildroot] [PATCH] package/puython-pymodbus: bump to version
 3.7.3
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

On Wed,  9 Oct 2024 13:59:14 +0200
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Changes: https://github.com/pymodbus-dev/pymodbus/blob/dev/CHANGELOG.rst#version-373
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/python-pymodbus/python-pymodbus.hash | 4 ++--
>  package/python-pymodbus/python-pymodbus.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

My apologies, I'm only discovering this patch now, and I have already
merged a similar patch from James that was submitted after yours. Sorry
about that :/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
