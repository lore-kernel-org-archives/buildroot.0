Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15196C00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 19:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 487A74021E;
	Sun, 31 Jul 2022 19:23:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 487A74021E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WwGkI2WhRXaE; Sun, 31 Jul 2022 19:23:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 279F440224;
	Sun, 31 Jul 2022 19:23:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 279F440224
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5EBC61BF3E8
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 19:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 391C461069
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 19:23:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 391C461069
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FswPBkTrkxL2 for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 19:23:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A73CD60E2C
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A73CD60E2C
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 19:23:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D6F2C20002;
 Sun, 31 Jul 2022 19:23:08 +0000 (UTC)
Date: Sun, 31 Jul 2022 21:23:06 +0200
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Message-ID: <20220731212306.5483d946@windsurf>
In-Reply-To: <62e6922ed41f6_bff739ec-35d@xultri.mail>
References: <6430c454-08d4-cb3b-b766-c72ea7abb691@smile.fr>
 <62e6922ed41f6_bff739ec-35d@xultri.mail>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659295389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4WoxWlbI8U69b2A9d18V0twgpGW7mhoHi2PPmmnpFgI=;
 b=gMXz1A9qT5YE+VdmDQGCoQcn5wVYkgJ4BJEjKesMCKKDa8mg78qkQefJtKpQY+i3X9NMeZ
 cQjZKN/zXTNr9lK+xniG+kCuCjPkxPg3SH5bijKTqp5nBBl+izEfLBCJ9ObQtg8Jzt3n05
 VW4zDHBdWjRJ0ptMIpeo478UTRaBRRpl2ftRlNAqlgpDLMbQ9bITPmuZK/5RIyOL/tHb8X
 f3ET+2Pbx+S0N53t12f6CeBhHdNeNDzmw0J8OshiYfn4/9PyfyLCGYS98tNnWrJvbdrERr
 D2vxE2sU3j3HTA6DB5OvEwGiqV1R9raohowwVNIYOpBnhBZFkpg5I9QPvnistw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gMXz1A9q
Subject: Re: [Buildroot] [PATCH 06/16] Makefile: make check-package assume a
 git tree
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
Cc: romain.naour@smile.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Ricardo,

On Sun, 31 Jul 2022 11:31:10 -0300
Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:

> Thank you for your review on the series.
> I will respin. I just changed the series to Changes Requested.

You have probably seen that we have fixed all hash files in one big
commit. The trigger for this was your series, for which the "warning
ignore" file was mostly filled with ignores for hash file formatting
issues.

So it will be one thing less to worry about in your series, as all
hashes are now correct.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
