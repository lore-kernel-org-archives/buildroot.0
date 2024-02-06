Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61041C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 172C141E91;
	Tue,  6 Feb 2024 10:37:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 172C141E91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d6c-yKLUIKve; Tue,  6 Feb 2024 10:37:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 673B441E86;
	Tue,  6 Feb 2024 10:37:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 673B441E86
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 61C731BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 350B241E95
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:34:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 350B241E95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Api4Bbr3_Bw6 for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:34:43 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2BE85415CA
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BE85415CA
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73A43C0017;
 Tue,  6 Feb 2024 10:34:41 +0000 (UTC)
Date: Tue, 6 Feb 2024 11:34:40 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206113440.3bb84626@windsurf>
In-Reply-To: <20240109071343.4025060-1-james.hilliard1@gmail.com>
References: <20240109071343.4025060-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707215681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AgR6oGNvOVYnJQKTv3je5PGnk2clzadRsSgGLoCs/e0=;
 b=Mx9rKOZ68rC1JTDlGXiRaSyE/CQ3rwbEIuIiDGWXuNcyWiZl45frVJ2zjXojo9HWkXiHlY
 ZJmrcyY79RKDgDdmA7w40Xmqc2CpUEtmzgO22DnBceDJDBvHFy+/IDCn3JAE+v0IaDpPT5
 C6X4WFG0qnR/8WXLCv8V9BOeP9pu7E95fdZorvwMyVjisov52OKlUS54d8Fw/VjHMvojQR
 73DOrVlhoHrjs9zDS0ixQKsl2tUNOLHEfjL2h95i66+1M/y1JiJ/fG2+WJWJbM7w/fmfjC
 0GHND7UEM6VdB4PfvLH8PE/JRZ9PQVrPjRP7SQP3QcHqGfMZufTEPaahbzwX5g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Mx9rKOZ6
Subject: Re: [Buildroot] [PATCH 1/1] package/python-dtschema: bump to
 version 2023.11
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Jan 2024 00:13:43 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-dtschema/python-dtschema.hash | 4 ++--
>  package/python-dtschema/python-dtschema.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
