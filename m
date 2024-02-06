Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0FBC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 16:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A59E61233;
	Tue,  6 Feb 2024 16:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A59E61233
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wA6qPJzfbSRy; Tue,  6 Feb 2024 16:25:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E925D6113F;
	Tue,  6 Feb 2024 16:25:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E925D6113F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B7E891BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 569BF41E42
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:25:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 569BF41E42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vdD3TmujagcJ for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 16:25:45 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E07CE408FC
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 16:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E07CE408FC
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0969120007;
 Tue,  6 Feb 2024 16:25:41 +0000 (UTC)
Date: Tue, 6 Feb 2024 17:25:40 +0100
To: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <20240206172540.2d1ed291@windsurf>
In-Reply-To: <PH1P110MB160351713AB054CEFD33B1439F46A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20240206161152.0e178414@windsurf>
 <20240206155413.1349720-1-giulio.benetti@benettiengineering.com>
 <PH1P110MB160351713AB054CEFD33B1439F46A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707236742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oADcK4GqKZee1lbe+EMd3egY9baJ7wi/+JZS4KRgzOE=;
 b=nE49CGMt8DlHozlN53kxy0J2Ow2qsVngeN1tPmBUkIUD52Tt/t1ZgODbk66Y33Fx6cTgg4
 ugZbgVJeYP+O/7Sg/5OXSk6UUwisUTuOrqqSnqz5fJvcqotR/AAkpSv14tWOWUaOKV//nI
 4pB+wQCwRvHdlqfFqp1sg3x0unMvpcj3m1T3swF+RZ/BoSMvCRxX2iKK2822Cx/VnOzMGe
 MLfEdKnenxcTg/DXngiQ3OE/MOHCOt4tvzvKf+oFGx/R7+SCuQetgtvgCIUZucvMawzc07
 bpYcx2C6eT+xVT6b8r6i8nk/YMPokRszh+oAyPjSTLdzUWp/5gD9klNeJ9DZKg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nE49CGMt
Subject: Re: [Buildroot] [External] - [PATCH] package/attr: fix build
 failure on Microblaze architecture
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Vincent,

On Tue, 6 Feb 2024 16:05:31 +0000
Vincent Fazio <vfazio@xes-inc.com> wrote:

> Would it make sense to patch GCC for Microblaze to address these at
> the compiler level instead of constantly patching the packages?
> 
> I tested https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101766#c6 back
> when we were solving this problem for xz and had no issues
> https://gcc.gnu.org/pipermail/gcc/2023-March/240834.html

It would definitely make sense of course. Have you been able to get the
necessary changes accepted in upstream GCC ?

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
