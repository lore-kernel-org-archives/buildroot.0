Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98034EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 17:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0715F418D5;
	Mon, 10 Jul 2023 17:15:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0715F418D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6PQO_SSIiGXb; Mon, 10 Jul 2023 17:14:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6D1A418AB;
	Mon, 10 Jul 2023 17:14:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6D1A418AB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 684541BF3D4
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C25260FDE
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:14:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C25260FDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pvs5_2V1JqzH for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 17:14:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 721A160F82
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 721A160F82
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 17:14:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40CA520002;
 Mon, 10 Jul 2023 17:14:51 +0000 (UTC)
Date: Mon, 10 Jul 2023 19:14:49 +0200
To: Yunhao Tian <t123yh.xyz@gmail.com>
Message-ID: <20230710191449.7fabb833@windsurf>
In-Reply-To: <CAFQXTv28aGSj2hz+LwpcRaMgc7zkwtpF5+2QR6svxTHe8DE3Ow@mail.gmail.com>
References: <20230710135752.1849099-1-t123yh.xyz@gmail.com>
 <20230710182012.20a5eeb4@windsurf>
 <CAFQXTv28aGSj2hz+LwpcRaMgc7zkwtpF5+2QR6svxTHe8DE3Ow@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689009291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uaMEPwBAJhT6IhOL0acebj3PXOsmlCBJ/qVbPH8ij8I=;
 b=mjYiC7v4Od9haofnB/xZ3CX8VrinEtQpK+v9o18MlHTLlMBtjOLg7bMqP5kBiXUySmpbVY
 0DsK/9xU8YtGnpVTvpQPatcVmhaaUgqKFoLQa/Zzejc3ATIYXb+C0K9zS2Fpjp/pb9PkAU
 KwsqwD667iwVBuJtiCmzsOpHrn3eiV022lVc+LIllAwVCpdM4rIrAA7KlJUE86E0PjHHY4
 pTMOhBJDQvSG4wsc3v9vlaPC7A+HyERzWoeisKi3ajbS/KxekABU3Q2bFPU53awZ6ej2GO
 zUjS39aqbiTnRcubiALSOxTLBUWPCEH/fGlmjRNszu1G+WJu3fjFl0Swpj5fIw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mjYiC7v4
Subject: Re: [Buildroot] [PATCH 1/1] package/bluez5_utils: fix AC_CHECK_FILE
 error
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

Hello Yunhao,

On Tue, 11 Jul 2023 00:39:38 +0800
Yunhao Tian <t123yh.xyz@gmail.com> wrote:

> > (1) We don't want to patch both configure and configure.ac, we want to
> >     patch only configure.ac, and use BLUEZ5_UTILS_AUTORECONF = YES  
> Understood, thanks for pointing out!
> >
> > (2) AC_CHECK_FILE supports a cache variable that should allow to
> >     preseed the result of the check. So passing
> >     "ac_cv_file_${srcdir}/ell/ell.h=yes" should work-around the check,
> >     of course assuming the relevant quoting is added to prevent
> >     mis-interpretation of ${srcdir} in this context.  
> I don't think this is worth the effort. Source code package of bluez
> already comes
> with internal ell, so it is not necessary to check it in our use case.

Aaah, but then I misunderstood. I thought the issue occurred when using
an external ELL.

Then in that case, the solution is "easier": we should not use the
internal copy of ELL in bluez-utils sources, but we should use the
external one. In Buildroot, whenever possible we try to use external
libraries, to avoid having multiple copies of the same code in the
target, and also to ensure security issues/bugs only need to be fixed
in one place.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
