Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6223C48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62ADB417B0;
	Mon,  5 Feb 2024 10:07:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62ADB417B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J06mto0Hmysg; Mon,  5 Feb 2024 10:07:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE33941763;
	Mon,  5 Feb 2024 10:07:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE33941763
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B7CFA1BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6075D60F40
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:07:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6075D60F40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AndWiz_r5htJ for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:07:47 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 42E5160F31
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:07:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42E5160F31
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7F8A1C000D;
 Mon,  5 Feb 2024 10:07:44 +0000 (UTC)
Date: Mon, 5 Feb 2024 11:07:44 +0100
To: Uladzimir Bely <wiselord1983@gmail.com>
Message-ID: <20240205110744.17924bc0@windsurf>
In-Reply-To: <10609434cc80f8c547228c26bf16a04ce1f14b72.camel@gmail.com>
References: <20240204085128.5059-1-wiselord1983@gmail.com>
 <20240205101344.7725e2ea@windsurf>
 <10609434cc80f8c547228c26bf16a04ce1f14b72.camel@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707127665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hL2Xq2AeV3eR0s17WWX39ciD8dUm8XrBK8dDwP9HsWk=;
 b=cGok1bTG5j1ZiMNKeIQ4ob6khWc8SpRqOXNLuInpTDtNZ2XERJQpvIXIvyp1Cu8M/uo2b/
 k6iocwomVWnIlTyCh6HrcTqy69hjJSkuOkzn2nAkmMToVM4HfQT42GkOk2ArouOweDzuAy
 8kLnHLVCavBVzICURpPTUbRm2r53y3lX3U/ZbtoENdGJjwziKk8O2fyD0DadXZqX+mlnV1
 yrtKypj7OIWUjRiQmpoF5kSjeK39KeBe0g4NUIYTTOLi6gG4NlkO1RVdVqryVGEfrCV7/+
 blSUB/4n2Y/dgkj2ST/W8TqycJsBehM6VfbGouJOR51WR2NnAIOt8nw3zpYBHA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cGok1bTG
Subject: Re: [Buildroot] [PATCH 1/1] package/python-mpd2: bump to version
 3.1.1
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

On Mon, 05 Feb 2024 12:27:55 +0300
Uladzimir Bely <wiselord1983@gmail.com> wrote:

> I could either resend the patch with a proper username (e.g.,
> "Uladzimir Bely <wiselord1983@gmail.com>"), or you are free to edit the
> patch on your own.

Thanks, I have amended your patch when applying. It's now pushed to
master. Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
