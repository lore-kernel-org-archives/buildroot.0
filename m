Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A41B6C00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 07:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1917260B62;
	Tue,  2 Aug 2022 07:53:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1917260B62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e3ouEPXf1ieL; Tue,  2 Aug 2022 07:53:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B18160B5A;
	Tue,  2 Aug 2022 07:53:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B18160B5A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8AC3F1BF263
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 07:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5918560B5A
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 07:53:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5918560B5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Et_YWyoaNJ2T for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 07:53:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB91C6059D
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB91C6059D
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 07:53:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7306D1C0006;
 Tue,  2 Aug 2022 07:53:43 +0000 (UTC)
Date: Tue, 2 Aug 2022 09:53:42 +0200
To: Guillaume Bres <guillaume.bressaix@gmail.com>
Message-ID: <20220802095342.65d6ba7c@windsurf>
In-Reply-To: <CAJe0E3dc1YGh_-369RjWkyHdN-WkcQW1d8PqDvr5i9h-pPqoqw@mail.gmail.com>
References: <20220727192948.18653-1-guillaume.bressaix@gmail.com>
 <20220727192948.18653-4-guillaume.bressaix@gmail.com>
 <20220801194254.118219ec@windsurf>
 <CAJe0E3e4wE+v16v9JQE-NDaXH+_9icVtHfPbTBW=ng5rr2EEYg@mail.gmail.com>
 <20220801205907.545f6693@windsurf>
 <CAJe0E3dc1YGh_-369RjWkyHdN-WkcQW1d8PqDvr5i9h-pPqoqw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659426824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fkQApR7JdAo7Yd8q0jIFoJ13r//1Ftt96vi3c86uBpg=;
 b=k2r2t5+WPAgkhYRM9mGOxVuO/VPiEq3IuceDJZfzeZ/cMNVF8x5KmvGmFIrXo+USLBrJZZ
 CEnUYYW/CGddEAZSfV5VQ06RBfyCPCEMNX/JKpfyPEU/HLQvud3G4T25cKF72UP86VPZ2d
 1NlVl6PODrFiFr8lGNJCoXHsizKw/PVyyR4QYqB54ZumTkCIQzbI/0L2HM7lCRxWUILA8a
 anjgfukWl7/AHel3kXmpC0aClFwI55kJhSiKtio52gjLKPpiD7rX78jdxoMSOUTEJ6V9qY
 +F5ribLZu4oh/pWOz45kGmvjJGo1CJDB7qz0hruhK/BDVtPxpDtX/32Vqh8/ew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=k2r2t5+W
Subject: Re: [Buildroot] [PATCH v5 4/4] package/python-scipy: new package
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
Cc: jmfriedt <jmfriedt@femto-st.fr>, "gwenhael.goavec" <gwen@trabucayre.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Guillaume,

On Tue, 2 Aug 2022 07:33:05 +0200
Guillaume Bres <guillaume.bressaix@gmail.com> wrote:

> I was trying to get the runtime test (the emulator) to execute the scipy
> fulltest ("python -c import scipy; scipy.test()"), as I was thinking it
> would be the best thing to do.
> But it's not a straightforward scenario and it's super heavy, you need the
> repo sources and the pytest suite.
> 
> Running small but several portions of the lib is probably the best thing to
> do.

Indeed, full test suites are often too heavy/too complex to run in the
context of our runtime tests, so we tend to create smaller test cases
instead.

Of course, my very small test case could certainly be improved with
additional tests, if necessary.

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
