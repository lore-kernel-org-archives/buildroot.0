Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA977C433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Jun 2022 09:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 681D940137;
	Fri,  3 Jun 2022 09:44:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TELG02tjsjWg; Fri,  3 Jun 2022 09:44:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71CBD40025;
	Fri,  3 Jun 2022 09:44:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 88FCA1BF346
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 09:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77D4260AD4
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 09:44:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XthEgQOSiyOL for <buildroot@lists.busybox.net>;
 Fri,  3 Jun 2022 09:44:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 55F0860AD2
 for <buildroot@buildroot.org>; Fri,  3 Jun 2022 09:44:17 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1FF3440007;
 Fri,  3 Jun 2022 09:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654249453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RzOlZ+30xW/WUTRQhp9fPFKtMj2ed12nzEvNoASuCXU=;
 b=cYN+cH67h+wJIyFR3rc5IfG5I0GI0TH0jXHLYTiDxTCV5CWMznMUm7MDa4RW37HC+U/RjB
 kcfF9Ayx4cZTCq1F6sSzknK46MdeojtIGCc87DBS7QWdZhY+VCp1BWb48ZhWcwYPJCa2rQ
 L6XqXlKaN37OiRMeKr5sgZz6b8AxN0SUzuBJjlySVug3A2+q+TGl/y0oN4pwPX/Gd1KOO4
 VYUj6rILop0AJN0TAAuqCuPSKLmMkFodD3Zakle1wPzQPXV7YlBQn22HQXzXx+noqo9feL
 qnY50XYvo8/wCD2/cfLNYM+I62Hm5XgfrgOUUnppC5xhyM2Z2E+a9fnzba0BJg==
Date: Fri, 3 Jun 2022 11:44:11 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20220603114411.05ae67c0@kmaincent-XPS-13-7390>
In-Reply-To: <87pmjq14r9.fsf@dell.be.48ers.dk>
References: <20220531084428.100082-1-kory.maincent@bootlin.com>
 <87pmjq14r9.fsf@dell.be.48ers.dk>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] boot/arm-trusted-firmware: add -fno-PIE to
 CFLAGS
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
From: =?utf-8?q?K=C3=B6ry_Maincent_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
Cc: thomas.petazzoni@bootlin.com, geomatsi@gmail.com,
 Kory Maincent via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 03 Jun 2022 11:21:46 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

>  >  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 1 +
>  >  1 file changed, 1 insertion(+)  
> 
>  > diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
>  > b/boot/arm-trusted-firmware/arm-trusted-firmware.mk index
>  > 03fa83b7b5..b0dec13a4c 100644 ---
>  > a/boot/arm-trusted-firmware/arm-trusted-firmware.mk +++
>  > b/boot/arm-trusted-firmware/arm-trusted-firmware.mk @@ -50,6 +50,7 @@
>  > endif  
>  
>  >  ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
>  >  	CROSS_COMPILE="$(TARGET_CROSS)" \
>  > +	CFLAGS="-fno-PIE" \  
> 
> ATF already has logic to detect if a toolchain is configured with
> default PIE (looking at gcc -v output), so I think we should only do
> this if we add the "hidden" -fPIE in the toolchain wrapper.

FYI it is the opposite, if TF-A detects the default PIE in gcc it disable it
(ifneq) because it seems to bring issue.
Take a look at the commit f7ec31db2db3c69a7bd970f4e7fd829e7cc0c53a.

> 
> I've changed this to be conditional of BR2_PIC_PIE and applied, thanks!

Ok, thanks.

Regards,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
