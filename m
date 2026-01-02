Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB75FA3755
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1369882057;
	Fri,  2 Jan 2026 22:39:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JCZTVoA0fAHf; Fri,  2 Jan 2026 22:39:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C25B82085
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767393596;
	bh=yRqYYrTPs/X+Z8VqHDvzUfRMz3/RAYs2+JTWN0uyPE4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=e48l0/vkyRPWesaULZR5hPoUMW3hLjyF9K5FiVhGQu7V4ht5t/c26nV+ePG29jLVB
	 FXOLshK4xQe1ARQaG6YlIgjoo8HPCbRBQxSnx74erVi4hQmp1edGlGehIf1GmrLLGG
	 zkIL9994kVAULYECClhnhKSb0T7Fxa5lpmfV6mQBHgjwHgplzenx4bg2UqN+iTmcku
	 yUTYMZSb8zAAKGedpODnDKlGlMj6ZKVt0tJ3kwBbQQn95IoOtX5kpxTrWXbpjEjLnU
	 OgPAb+gzSo8b+PJK1JqhSD+91KzXI4ogQjwHmSe3Hl8YVez4vOG8kr+h3qkmgyiwUv
	 PyhYCU7109eOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C25B82085;
	Fri,  2 Jan 2026 22:39:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BF47351
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2993E82085
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:39:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yyy6FlYMiNsd for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:39:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 16A8982057
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16A8982057
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 16A8982057
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:39:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 659D64E41F05;
 Fri,  2 Jan 2026 22:39:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 39F60606C7;
 Fri,  2 Jan 2026 22:39:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 292F3113B023D; Fri,  2 Jan 2026 23:39:50 +0100 (CET)
Date: Fri, 2 Jan 2026 23:39:50 +0100
To: Quentin Schulz <foss+buildroot@0leil.net>
Cc: buildroot@buildroot.org, Quentin Schulz <quentin.schulz@cherry.de>, Ozan
 Durgut <ozandurgut.2001@hotmail.com>
Message-ID: <20260102233950.22f75fcc@windsurf>
In-Reply-To: <20251124-uboot-env-rename-v1-1-7ac5a21da6e2@cherry.de>
References: <20251124-uboot-env-rename-v1-1-7ac5a21da6e2@cherry.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767393591; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=fm0QxAGoLhrIOns6xAGZ3bA6EcVGoEHE9+2rD0ue8gs=;
 b=lJwFr2f4irFqRIEMc4A+GwpeXlKtO5gtROBaenf4J2/EP+bboy5+w1V7OjbAoL6cQXwnXq
 lV1GONzIa+x8U47oCCo+EVa56AQwa9MHljNPBt/1DFm6oyz0DwCBs/dGyKrt+QGmBE1eqf
 QGiXDBh0f0tX7QqH6fRCmeOm7PhZMVKEFfxCjvCJ3cIAD358zzvFHS5mrNoBWGOgFMNCea
 3HLl8oVA2YBklopWxoSI5sRWTBtQSuutJ4+gYcbjjPjTzvtgGU0xyxq1HrNULb/cNCsWof
 IpvW0iIX23jfOT0dREl92vAYQaJ0sqAXfnR84mpF9aWwEQWpTMwXFR24qzrOuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=lJwFr2f4
Subject: Re: [Buildroot] [PATCH] boot/uboot: fix externally provided env
 file not used on 2025.10
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

On Mon, 24 Nov 2025 13:26:54 +0100
Quentin Schulz <foss+buildroot@0leil.net> wrote:

> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> fb5235239aad ("env: Rename DEFAULT_ENV_FILE to
> ENV_DEFAULT_ENV_TEXT_FILE") renamed the Kconfig symbols and thus we need
> to adapt the U-Boot package in Buildroot to support it.
> 
> Fixes: 128c26f2875d ("boot/uboot: bump to version 2025.10")
> Reported-by: Ozan Durgut <ozandurgut.2001@hotmail.com>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> Only roughly build tested, warp7_defconfig modified:
> - to use Kconfig for U-Boot,
> - to add a dummy environment text file,

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
