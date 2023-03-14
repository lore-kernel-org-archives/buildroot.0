Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CEAC6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 21:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C5E440B4A;
	Tue, 14 Mar 2023 21:20:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C5E440B4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pxMKfiaQFeEj; Tue, 14 Mar 2023 21:20:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C05B040B42;
	Tue, 14 Mar 2023 21:20:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C05B040B42
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B5B71BF38B
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 21:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 749CA6110B
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 21:20:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 749CA6110B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P4SzAV3mk95j for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 21:20:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2251610EE
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F2251610EE
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 21:20:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C4A0FE0005;
 Tue, 14 Mar 2023 21:20:30 +0000 (UTC)
Date: Tue, 14 Mar 2023 22:20:29 +0100
To: Ivan Castell <icastell@circontrol.com>
Message-ID: <20230314222029.1c818de0@windsurf>
In-Reply-To: <DB4PR05MB103906C9B5FCFAEBE1B0FBF8CA3BE9@DB4PR05MB10390.eurprd05.prod.outlook.com>
References: <DB4PR05MB103906C9B5FCFAEBE1B0FBF8CA3BE9@DB4PR05MB10390.eurprd05.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678828831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=elhoMQuoWFFXcsuLylWOIh7gMG46xXL6tuz6vneCqBI=;
 b=b1A1v3115rczZkpgu/nxRwPoH30AZfw61nc6G9L6xUrbSvNZxy9J1BM/id6fkVX02UqSmG
 hR50erlYBUegRIoeCgowrwWS7nEs60MkZ397G8ygq9zPk7bFyxQt+DqpiS5JximSXddf09
 kEfXSs7FE/AjfUZ6CDs8rYLIRyf1R6UJIy42n9cjryzhjW0Vf262nrxIzR0IEsjZv/iVid
 Puq1rii3PnoboxvrjwPN7u8yFg0IL2Xe+Zcu9g+HwTYwLR9pxH0qnKdflF/7OCuoSlrVkN
 zH+54h2d8fVVJXpfABW9MA1EjbA2erGsdhirD6ctMjTIvlpL/yDSGhz7eT+e5A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b1A1v311
Subject: Re: [Buildroot] Missing support of libsvg with qt6
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Ivan,

On Tue, 14 Mar 2023 13:03:01 +0000
Ivan Castell <icastell@circontrol.com> wrote:

> We are using buildroot-2022.11.1 to build a custom QT6 based project. We have this option enabled in menuconfig:
> 
> BR2_PACKAGE_QT6=y
> 
> But found this issue building our project:
> 
> Project ERROR: Unknown module(s) in QT: svgwidgets
>
> It seems there is no way to enable SVG library support on QT6 (at least we don't found it). However, SVG library is completely ported and functional using Qt5.
> 
> BR2_PACKAGE_QT5SVG=y
> 
> Does buildroot will support SVG library with QT6 in some future release? Is this still a work in progress? We have checked buildroot-2023.02 and even in that recent version, is still not ready.

At this point, nobody has worked on packaging qt6svg. However, taking
example on qt6serialbus or qt6serialport, it should be relatively easy.
Perhaps you could give it a try and submit a patch? This would
certainly be welcome!

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
