Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16F5C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 12:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8007A4371A;
	Fri,  5 Jan 2024 12:55:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8007A4371A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u_xwxCJCLSUP; Fri,  5 Jan 2024 12:55:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9753443739;
	Fri,  5 Jan 2024 12:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9753443739
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 257391BF422
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E588D41EE7
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:53:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E588D41EE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id djmSMv1Okx5M for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 12:53:31 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E495A41E49
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 12:53:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E495A41E49
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C68E20002;
 Fri,  5 Jan 2024 12:53:28 +0000 (UTC)
Date: Fri, 5 Jan 2024 13:53:28 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240105135328.3370dcf5@windsurf>
In-Reply-To: <20240102221350.2438550-1-fontaine.fabrice@gmail.com>
References: <20240102221350.2438550-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704459209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pOLatcewrwlpEYgJUBA0ivTin1BhJZwTKOkba3kfFLQ=;
 b=fdhsFArHR8hTaKFB5KThjWV/p0uf3plYJxvA6WXem9o7WIDDNcPu1uy7kunpuQyQi17gAP
 pcKtSvBKeC+pDpqYC0B/F/JnkXUoQ7MSM47YHiGU3DVnDTtMbZRCJ5EkLLUBJUjDGq7IBf
 RnE8AuAq+SNCw8q8Mq2EhQQ9mDd7Tzv4M6XYU+7pUEOFLW7TXl1dAkqnHC2nCucsaQ7nkE
 q0knsSPvIgr5LjE81BQxs/8uXQdNZRtNCMjwfHeHcDfU5AMADdPKuVDJY7osxgdWQm1Dxf
 rZLQy95FF7vtPk2CIk/68OubVu0RPWa84R3QYWdczv7+hcVolfS5ufR4FnbVMQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fdhsFArH
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/irqbalance: bump to version 1.9.3
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
Cc: Karoly Kasza <kaszak@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  2 Jan 2024 23:13:50 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/Irqbalance/irqbalance/releases/tag/v1.9.3
> https://github.com/Irqbalance/irqbalance/releases/tag/v1.9.2
> https://github.com/Irqbalance/irqbalance/releases/tag/v1.9.1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Fix tarball hash

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
