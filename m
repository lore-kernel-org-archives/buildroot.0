Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D558D1CA07
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 22:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D78D60831;
	Mon,  4 Nov 2024 22:41:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bOuQtKoZ6CNF; Mon,  4 Nov 2024 22:41:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7557460802
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7557460802;
	Mon,  4 Nov 2024 22:41:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 301C6723
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 22:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09D388101D
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 22:41:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PotYWghLRlU0 for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 22:41:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EC72480A82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC72480A82
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC72480A82
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 22:41:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF2FA240003;
 Mon,  4 Nov 2024 22:40:57 +0000 (UTC)
Date: Mon, 4 Nov 2024 23:40:57 +0100
To: Arnout Vandecappelle <arnout@mind.be>
Cc: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 romain.naour@smile.fr, michal.simek@amd.com, yann.morin.1998@free.fr
Message-ID: <20241104234057.21de4c2c@windsurf>
In-Reply-To: <c9bfc18d-9590-40d1-8e77-15ae3f4dc85a@mind.be>
References: <20240812052101.2920141-1-neal.frager@amd.com>
 <c9bfc18d-9590-40d1-8e77-15ae3f4dc85a@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730760059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/yXi06Xe+9Om+Ck5sp2K/sfLg7OJS21/48qhCcU6UEo=;
 b=ovFHGgapfD9T/7nfzs74Bry0UiTdzQVy8gvbXQyPWVv+n/c2ISKrIHb1BhDVn1cGQ3EKAe
 DR+Utbi0YWwU/38RhxZ9JZvmWW0Nau9Lcb8xwD8l8MaUcTv4lnBSIGxdxsaOXkoc0Bob16
 GCdzY5406HkUAcUj2Qik1wfmo++YfuRYRo0tRRTu0K1ScqmG0hhxyfXUzJo2KMHncg56aC
 684MS4ca7eqanVAmmLy0DHW08bqxhIWjPA//4+Bjce3DrA8I16A+550VXPoMBIe+JlqGTW
 nE0HZtvYDt+4HTVEcCgAEiYM9EF+Un9VNQi4n4Qs8ReukysvZFQwtNm7d2serA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ovFHGgap
Subject: Re: [Buildroot] [PATCH v4 1/1] configs/versal_vek280_defconfig: new
 defconfig
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

On Mon, 4 Nov 2024 20:31:35 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

>   This DEVICE_TREE= option is already used in 21 defconfigs (and 13 of those are 
> Xilinx defconfigs ;-)  Perhaps it is time to create an explicit uboot/Config.in 
> option for it? Ideally the config interface would be similar to the options we 
> have for Linux.

It's indeed an option that almost always *must* be passed these days,
unless by luck there is a board-specific U-Boot defconfig that
references the correct Device Tree.

So I would tend to agree with you on this one.

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
