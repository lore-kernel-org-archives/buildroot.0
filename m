Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EC1EED628
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 17:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 870DA80EB8;
	Fri,  2 Jan 2026 17:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VXhuORfjxuST; Fri,  2 Jan 2026 17:18:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DEAF80E91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767374280;
	bh=jSrgs0cNgwJSSVfGwQHZUphtg5JhvP6mNa1kmURqsTs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=slKjHf5VwaFar5wCFyNfQUQycpZXge5EFIxjk1ldvbEUYYwqnSOyU0qGgK+pbfFzH
	 DO929LSee2qinzYl2cF+UQDyterSrg9HvufW50Xhix/zT/2rDCEdfp6lgCkKWzvaYn
	 syBqFwwUSOL+r626W0CBntw9DxyOp8fuoTeIqZzEtILP9HbD6smL6iPuxm9nRTKftB
	 g0sddFAlZ8hYu5wsh9+16R6i12Q69IijdFOHme/ueY+DnVr06NJ+mbwTjXjUaDqkPe
	 dsZtZJXMTGOsQBms0vU7MwfnHIXLM9lRLhhSya1FPIgb4TUdgzNhVSvw9D8sufPoJh
	 BO73GT9BON3Kw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DEAF80E91;
	Fri,  2 Jan 2026 17:18:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 98553351
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F08A60AB6
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:17:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AdCNqVbCIGs6 for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 17:17:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7709C60A7F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7709C60A7F
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7709C60A7F
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:17:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id DD73BC1C3B7;
 Fri,  2 Jan 2026 17:17:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A435A606C7;
 Fri,  2 Jan 2026 17:17:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7F3D6113B0718; Fri,  2 Jan 2026 18:17:55 +0100 (CET)
Date: Fri, 2 Jan 2026 18:17:54 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
Message-ID: <20260102181754.64c31049@windsurf>
In-Reply-To: <20260102163816.1469350-1-bernd@kuhls.net>
References: <20260102163816.1469350-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767374275; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=GevhJpuVRMIVeIpy8D71H8SfhQ6PXl5TfCK790M+4TE=;
 b=QSn1ZSxBSQwFy3CPv8yLflcvBmNSkWrZV2m4d1zVgU/wrBM7Hw2hwO+Wh8WyzhmTsu7nLm
 XFDyNgTGAiN4crRp2ufrvt4RpZ1+2Mjk5Ccq7UeTOGdVTO+PO0oZEN/Oc3u2cGjEWaF7lW
 50uOO0qrkxZ5J+s7bifC7BlPoGiASoCwANNV1vVcBb76di7NY6C909v8ZLl3W4/9nRL23l
 +nMJXHB63b+4dYjPL6FQPhTr2Z2tk696Ag593aoycyCCxoKXi3MBUyilgKemR47+v1aQ6m
 2lWX3UsoLpazmG4zhJyenxnOjhAabQbLh8AjdpMyPnli8SPxQR0vYe00Fp/t5g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=QSn1ZSxB
Subject: Re: [Buildroot] [PATCH 1/1] package/lensfun: fix build with cmake 4
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

On Fri,  2 Jan 2026 17:38:16 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> https://autobuild.buildroot.net/results/dce/dced550d78ca4365c6b334d442a4995d6b8dec46/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/lensfun/0001-cmake4.patch | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/lensfun/0001-cmake4.patch

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
