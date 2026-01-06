Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E868CEFD11
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 21:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F38A81E14;
	Tue,  6 Jan 2026 21:09:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2KRWlhjhWzWn; Tue,  6 Jan 2026 21:09:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83C2081B98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767733797;
	bh=EVfxFfVDKDXVAyah/8slU5V95BACqBCWSrJOD0SCpg0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sC1JiX3cEfQ+fabuM5S2ewZc8SMrCbywyEDY7j/3NNosnCamOrEvRIZ0sFbwb0vxe
	 TEZMlJYXotP1PNbwAhoe72+KD20oGfbXFipqbyUSlnSMxPMhism/KiesCPpue5BMnL
	 CCEXX/CNdqN4QTZXaaPZ0himTfUuLKaZJPXMXUbkXKjUnZRHcMiR7HXLshcsH2egmr
	 i6tA3yYQKnPhxIJh/KkM6xHp7XaYFVqNM+vlEYa4tZFv+qaLwIOLsq7+3vKDk9VX8a
	 QrC4Co7Y7Qc5dZZJyVJf2URPLhpBNUTpddvvf+UplX+8p4N485Gi9/GZ1xLqlEdNb4
	 sj/SBayQXmpuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83C2081B98;
	Tue,  6 Jan 2026 21:09:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 32DFC70B
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 21:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2418D81B98
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 21:09:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dT3MhlcwZpTh for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 21:09:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4235B81277
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4235B81277
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4235B81277
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 21:09:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id B3D84C1E4BD;
 Tue,  6 Jan 2026 21:09:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C4CAB60739;
 Tue,  6 Jan 2026 21:09:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 92D3B103C85F6; Tue,  6 Jan 2026 22:09:51 +0100 (CET)
Date: Tue, 6 Jan 2026 22:09:50 +0100
To: Jesse Taube <mr.bossman075@gmail.com>
Cc: buildroot@buildroot.org, Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <20260106220950.309a96ad@windsurf>
In-Reply-To: <20250805000352.4062434-1-Mr.Bossman075@gmail.com>
References: <20250805000352.4062434-1-Mr.Bossman075@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767733792; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=HYbdgkPUTB/gtV53qMsrLe5lFbfLqImUJrAXfmGh2w4=;
 b=jnpLSu8EwCiz0AOdZHbq/GXV2UBvlJe9ugDFxBRxWarSSCbCTUMMwGX6zUwZeX2009Md2E
 ipvbIYn0bsi8Wa4+KsnZbngbB6CMXYTp8oI7Em0/gYFIBEKfYXQx8w92m9XCQP4F7BIeiq
 Ii2rnkC/lLvkBdQHvThl/2nqJTOv3T0VA2w4dcJAmwaqpc9XKX7NzwAREPW7ggcMy7atmp
 S/RQqnzWmMB73Mys+wE4KFzSgAkq1jYmo1cBZ+8PLewyyo0lRR5h/Q7jevpTkj4urgEs1V
 UZPNv+qsLOSwLVbBchztgYBnhJEVI2WBI4AcsBhqhJNYktW7YBsqMRb8FApg0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=jnpLSu8E
Subject: Re: [Buildroot] [PATCH 1/2] package/picotool,
 pico-sdk: Bump version to 2.1.1
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

Hello Jesse,

Sorry for the delay in getting back to you.

On Mon,  4 Aug 2025 20:03:51 -0400
Jesse Taube <mr.bossman075@gmail.com> wrote:

> pico-sdk and picotool 2.x.x adds support for the rp2350 bump package to
> latest version.
> 
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

This commit breaks the download:

ERROR: while checking hashes from package/pico-sdk/pico-sdk.hash
ERROR: pico-sdk-2.1.1.tar.gz has wrong sha256 hash:
ERROR: expected: 979af5c5aa5a07990544bc65e24a2121c096abd72ad0e6a03e7c524302e0f26e
ERROR: got     : 179c5531e75ac7f82d0679e70b6e8881f871738dc0ef17baf3b4ff4679291c41
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Also, I'll reply to PATCH 2/2, because I'm not sure it should be a
separate patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
