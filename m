Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0548BC4707B
	for <buildroot@archiver.kernel.org>; Thu, 18 Jan 2024 13:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86FB360BFC;
	Thu, 18 Jan 2024 13:48:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86FB360BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PRTUMRs6uzjc; Thu, 18 Jan 2024 13:48:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD76F60BE1;
	Thu, 18 Jan 2024 13:48:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD76F60BE1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A5581BF429
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 13:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 539DF60BE1
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 13:48:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 539DF60BE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CehPqz7KxTed for <buildroot@lists.busybox.net>;
 Thu, 18 Jan 2024 13:48:31 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B01860BE0
 for <buildroot@buildroot.org>; Thu, 18 Jan 2024 13:48:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B01860BE0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4BF39E000C;
 Thu, 18 Jan 2024 13:48:29 +0000 (UTC)
Date: Thu, 18 Jan 2024 14:48:28 +0100
To: Stefan Ott <stefan@ott.net>
Message-ID: <20240118144823.5105c00f@windsurf>
In-Reply-To: <20240118134301.GA81291@mort>
References: <20240118002834.76578-1-stefan@ott.net>
 <20240118135820.6fcfebb5@windsurf> <20240118134301.GA81291@mort>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1705585709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Wf/rhwa4dlPWBGPemxuAr0UZwBDNBezpPwUsdNYhE0=;
 b=PDmd+NO6k6qTL0UXOCyxaBIRdciwoW8RAn5AZgP+Xqj3NcpeT/tDn9SMwzVbF4tuAi4JiF
 B3+LSl94QO2bLQxl78V170Eub7G7Wqtquv9G2L9PJn49X82qcveUHfWXTBfdwXJuGR/5pq
 yD0Cft5/ieu6rpnkspZHnQ6HZZoHRYLu1SCddQP31xkarO2XJ+Vbf2Olky+ne4ARPYApSf
 /ZR4KnI2RYS8zcGdpPyyiBr51pcq+Kz12s9CgH6dAkpGKUNqQvCG1CTyiI2bKQaYTR/xnJ
 euiO1IDt4PrU7ydsBDduMEz7+l/FnQ//03EddJaNAwv3FMNM3DhEuEICOp0/Eg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PDmd+NO6
Subject: Re: [Buildroot] [PATCH] package/sway: make systemd optional
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
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Stefan Ott via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Stefan,

On Thu, 18 Jan 2024 14:43:01 +0100
Stefan Ott <stefan@ott.net> wrote:

> That would indeed seem to be a more reasonable approach. The
> reason I chose to turn it into an option was to make the user
> aware of the fact that there is such an option at all and that
> they might get additional features when using systemd.
> 
> Whether this is relevant or not, I cannot say. But if you think
> it would be acceptable to do it automatically, I'll update the
> patch accordingly.

There's rarely a super clear-cut way of deciding whether an option
should be added, or the dependency be handled implicitly/automatically.
But in this particular case, it seems relatively obvious to me. In
addition, the systemd integration is mostly relevant if you use systemd
as your init system, in which case systemd will anyway already be
enabled, and therefore the systemd support in sway will be
automagically enabled.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
