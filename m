Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A206C4332F
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 22:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C23E81BB0;
	Tue,  1 Nov 2022 22:27:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C23E81BB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zADqoht4IRKK; Tue,  1 Nov 2022 22:27:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5279A8190B;
	Tue,  1 Nov 2022 22:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5279A8190B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A0A31BF3E8
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E801A4161B
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:27:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E801A4161B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jTv3JgEyrQUD for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 22:27:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AB7A415D8
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8AB7A415D8
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 22:27:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B3D27240003;
 Tue,  1 Nov 2022 22:27:41 +0000 (UTC)
Date: Tue, 1 Nov 2022 23:27:40 +0100
To: Wolfgang Grandegger <wg@grandegger.com>
Message-ID: <20221101232740.5dc5e8f0@windsurf>
In-Reply-To: <44ae3630-5f21-54d4-8d77-9cb9fa137289@grandegger.com>
References: <44ae3630-5f21-54d4-8d77-9cb9fa137289@grandegger.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667341663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iCGpknTcFlbdw/TPfG/ljhQQ+KbC25R6MebjD8z/Ih0=;
 b=EIgZfq6hZ1uURIdgADp2ZByQLac+he4aHO3kJ74q7Xorg1O4RcsWVQ9kvUEBi+qgQr78eE
 omqXH85kkiRsN+U+3HmM0SyzeP7+bsFRNnC5nGXEfUKum1ToiyOjNbXf+BFKs9YVhuqWQU
 kC7K0U3+sAJMS1BiIPfCUPPx6ZaOnlUlSw6+EpLer+3JwqJF9Ny2xI8fGDXU21upjJ1LLa
 xoCSy9fl0mTSWzmSbt93ssdlzVkWFFWmSwYYaFRKIhFUL7YXBFsgCukFNIOCfcYt5vC7ko
 TKKTYB6NY8QwTj8BFlbLp/FLvD+KO7c1tLSFQf31pwuMFKnaQI6ApnM77sZMjw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EIgZfq6h
Subject: Re: [Buildroot] [PATCH v2] package/udisks: install to staging
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Marek Belisko <marek.belisko@open-nandra.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 7 Oct 2022 09:27:37 +0200
Wolfgang Grandegger <wg@grandegger.com> wrote:

> UDisks2 provides a Library API [1] for accessing the UDisks2 service
> via "libudisks2.so". For development of UDisks2 clients, install to
> staging as well!
> 
> [1] http://storaged.org/doc/udisks2-api/2.9.4/ref-library.html
> 
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
> ---

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
