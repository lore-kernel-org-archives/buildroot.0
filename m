Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4F3CA5FEF
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E5436063E;
	Sun,  4 Oct 2026 16:09:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G8SbO_5-pBOe; Sun,  4 Oct 2026 16:09:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 859FB60652
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791130166;
	b=jwpZTnB257EwO/9KLUz7ZCrZz2u0O0Ci2YFArIn8BbZAdrNOnS/e3QIWg8EPihcqh82R
	 wJV4XkCom9ge0rX1s09dW+soLV+rOpDK9Ds+qJOMUBFp/TrfqYlpUX+6gub1SPrbDCuN2
	 EUYKR7+iX12gfVyVIxCY/3QJLpohYasLexXpTMQxNzoOym/KRSkHIH/OgjT8O29LkwfCe
	 I7V1BTjeA1BGy5/BGdofADrRx0uAv2DS2WL9NoyWFqbH4audtDBzI5EV+6ea2L1CtjMtK
	 Yd54T3wkf4voexNmUQBVt4g+HWx+SqjLvP1lNYh7wmGyWbHU5hhi7ocP5wivlSXbqrw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791130166;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6G7YGU0tyxeS+ARPNgVsaCs7v9fUPKMC2t3r+imc8Pc=;
	b=AJOGnXBQWj1z2xB+QDZtAIGIxtOPIm5BSdKnOuVJWws55DPPIGt44OQGW/G+P/NFWycB
	 ZcSBvfW5VJGI3R8yPtx5vQCRp9fF8+0oJ4TOfXEzp+UYj3bSQon7/EE8FOVY/5+chmXpU
	 D5UdQsVbK4Fl1Y6pfgPZmksJqADkGwtkTabxTOC66f4h9Wx065qBoUed8WPUjl7h2h8v7
	 K0rhX+xK9vPNttK8UToLZla6rHwmjJvgumRM9JviLcvJg4NynLEP5jJQgRKznyvjjQgjT
	 pu6Xu5mbWe2fJ8z3iHyxgjPOt7QaLgL/uWeA5uP7hb/gdvodxF7Z7bJ9QEIIHHDvlBg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791130166;
	bh=6G7YGU0tyxeS+ARPNgVsaCs7v9fUPKMC2t3r+imc8Pc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rGw35T8zZlwy9R49QLxBT+S8fehh2YZN2HQUItfsP3U2pPLJBje0V6x40J9A+zt4q
	 idRUHJOwILFv4DU6CEJK+IrlIrLWj9d8zTZusR6qqBLkepxqjLY6MaFr87t0AEDCNc
	 YqvPKmCsBKWqXEJDInJHgk9bk/Zm8Yx5LZWjufKBa9n80/yvZWZ80h+WSod6S9TTkv
	 jqxaN8FnyJJhp44rwDLwhLy4mPlOU+RQ/qMy3RopcGGdlaUgajopa8Rl+3kDaizXxd
	 /rmnXRrd7s4kl34tM7oSfBOQE57aHYVqzcWfceDdPpbLFy85btveHSmZ9moDdWSFb1
	 mxg51WArGCLvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 859FB60652;
	Sun,  4 Oct 2026 16:09:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E3ED2435
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C987B60652
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:09:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TgxkNL6vKSau for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:09:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EF8606063E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791130164;
 b=B3+5KYGRRB0u9GKrczebjJ6/wT2cRVxg/VUpSuPMzSpLBTGwKp75sZqPGMKudjmzQExD
 /CkGuJ/GX03FVTrzeWPvxp/iH0ribixgenX9eEg5KbsuzrgVa+s2SMgCq/9dRnKBBbTnG
 r26K8jBzghj5rjn7eeyuGFf1ukOYrejhkc1+dc57qhu1SqWhW5baEqmrul4Ivay8/PP72
 r2YhWy7dELXNkwq+ziykSh8vl0yevYDJ0fUZ1q9dJ4OBYvHkrnf03C756rPbp/2emFrDx
 mViir5qoNhRUwZj/FgWqAL307cBQaLdSzG4yoYB9PYDUZXVirtuxeAEwJ2mAcZJkzQg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791130164;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=ApYZG+hEcRMgVfmf+OgeiD0fnUdSQU1DcWgPXP+I6ho=;
 b=I39oFxXK1IVCk0AOaSjaqlWQJ0TEIbh+jGuR1Z/ZyJEDaGk4Iq6Hms/N/z9FlPZCERhf
 G4CgLNQzSjT04nwzAQgyd9Bn/rf+aI6XKC8zBapbX1L+R8aVxX1X1xWXWCmWaHfPn7Gm+
 WBI+0SPgqDerFnWH6EtSRY1yrWRpSSbWz7IptW1Q5plqR268+b9ZEUjQ/L10A+I82DG2H
 s9H5xH0ZRFn6FIEEEt3r0WhbWpZSRXyhNSb/8A5g7x3PblWrEi1iSG3s06aEt7ujDELdu
 RnNAO0xCCBPx+UZpy/2AhPI6SE1xc5huooLHU2uGrP104DC42thZPNqai6YKSWJii0g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=bQSvpEzk; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF8606063E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:09:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 341941A1133
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:09:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 07198604FE;
 Sun,  4 Oct 2026 16:09:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6EA3710328192; 
 Sun,  4 Oct 2026 18:09:20 +0200 (CEST)
Date: Sun, 4 Oct 2026 18:09:19 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, 
	Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Message-ID: <asJ6KnmtWIH8lu7s@windsurf>
References: <20261003210833.735937-21-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003210833.735937-21-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-urwid: bump to version
 4.2.4
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

On Sat, Oct 03, 2026 at 03:08:11PM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
