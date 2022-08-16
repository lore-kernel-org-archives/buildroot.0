Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C076C25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 11:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BA3D400D8;
	Tue, 16 Aug 2022 11:53:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BA3D400D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FFCDtwV-nafH; Tue, 16 Aug 2022 11:53:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 495D340275;
	Tue, 16 Aug 2022 11:53:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 495D340275
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6AF6D1BF386
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 11:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20C7880B9C
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 11:53:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20C7880B9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lYL-hEK6F5IQ for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 11:53:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74E6781B84
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74E6781B84
 for <buildroot@busybox.net>; Tue, 16 Aug 2022 11:53:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0983F1C0003;
 Tue, 16 Aug 2022 11:53:26 +0000 (UTC)
Date: Tue, 16 Aug 2022 13:53:25 +0200
To: <yann.morin@orange.com>
Message-ID: <20220816135325.169146bf@windsurf>
In-Reply-To: <14985_1660644771_62FB6DA3_14985_149_1_20220816101249.GA2027648@tl-lnx-nyma7486>
References: <20220816094829.377-1-guillaume.bressaix@gmail.com>
 <20220816120109.1a348d39@windsurf>
 <14985_1660644771_62FB6DA3_14985_149_1_20220816101249.GA2027648@tl-lnx-nyma7486>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660650807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HPyG8wTXs4vxQjWznb7ApJYx56gqEkiv1yJ1Cyz3dfA=;
 b=WjeYTDgyQpDeVQvPbNE5GrZRZdmu9489xN5YRT5WdsAGsoCbp/5Qe8bQjT6WyxKGjVTHuc
 m5oDM28ZzQdLJwAPwXimjpuwsJvXQLESOh042i8fhUtvAwIe1Sv51mVC2Jjijyb+bYDn7+
 /edOe3jlriV7RKfXxrefzn3W+Fxvd3JvSAs48XjSSVl22xllvZ8r130JYIIoIBDImDl6tl
 XmyezJrhZ0gSOzrS8gdVDnV2YZ6/acVC4x+qWToerFWDPdUsrgeiPmnGw8U7pUdrWCd8ru
 YTs96P3Htrxdn/GNI540hmE1JUUKv6cKzUCJ2E7vvuZBHfykEwSnhYWiNV8SQA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WjeYTDgy
Subject: Re: [Buildroot] [RFC 1/1] package/pkg-meson.mk: handle possibly non
 existing compilers
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
Cc: buildroot@busybox.net, "Guillaume W. Bres" <guillaume.bressaix@gmail.com>,
 Yann Morin <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 16 Aug 2022 12:12:49 +0200
<yann.morin@orange.com> wrote:

> I think my non-work identity would also remember commit bd39d11d2eaa
> (core/infra: fix build on toolchain without C++), and the mess it
> caused, which was fixed by commit 4cd1ab15886a (core: alternate solution
> to disable C++).

Thanks for the historical details on this one!

> So, yes, we tried for CXX, and no, we do not want to do it again. For
> consistency, we should not try for other languages either, I believe.

So, the Meson-specific solution proposed by Guillaume is relevant?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
