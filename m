Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BD8C32789
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 20:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E99860BD9;
	Tue, 23 Aug 2022 20:22:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E99860BD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4IyBULBbbJH3; Tue, 23 Aug 2022 20:22:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F4A660B8E;
	Tue, 23 Aug 2022 20:22:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F4A660B8E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B03CA1BF5A8
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 20:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98F24405D6
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 20:22:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98F24405D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3MLKus3wVL8M for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 20:22:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF29F405BC
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF29F405BC
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 20:22:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 81CDD60006;
 Tue, 23 Aug 2022 20:21:59 +0000 (UTC)
Date: Tue, 23 Aug 2022 22:21:58 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220823222158.7a302f45@windsurf>
In-Reply-To: <20220821152749.239482-1-romain.naour@gmail.com>
References: <20220821152749.239482-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661286119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mXpInv6gY9FW018nJ2zK8nEa7ItvxCqBd4lHgcg+mV4=;
 b=bqoTZjErDDNWDAqS27E9waC52Zr3SaFC5SETGLuOM0xvwTm7Q7zZi2Z3to383zIb65FvYr
 7dwdxW9lbJdDM/rCKF/Mk7nr7f9gFHeqiPNihiEK6g/pHh8K353d+nlrJ42jIwg4PUUvmV
 2CUmxnRy7xuijQs0dHiyfJJYcEJHIGpXZg+n41IyXR707Sneeng73OxLjEM1DdBj2VkR5Y
 CRMGoPLAeRMYKG3P1Li/KEN870g6EQsYxnGAGucUUQXMnoYg058dgo1Cv9sGlK6GA8uV/9
 7gz5qyo6sluGaZo1awMO9FBj5ukc8EefcmjBkMwUHgMCYBXYp8IJJCiU5OBL/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bqoTZjEr
Subject: Re: [Buildroot] [PATCH] package/gcc: disable gcc D front-end with
 gcc 12
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 21 Aug 2022 17:27:49 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> "The D front-end is now itself written in D, in order to build GDC, you
> will need a working GDC compiler (GCC version 9.1 or later)." [1]
> 
> So we have to check if a D compiler is available on the host.
> 
> Fixes:
> http://autobuild.buildroot.org/results/36a/36aa22e458d53ab8687b3a79ffeb65b18e8ac6e7/host-gcc-final-12.1.0/build
> 
> [1] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=5fee5ec362f7a243f459e6378fd49dfc89dc9fb5
> 
> http://lists.busybox.net/pipermail/buildroot/2022-August/648841.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/gcc/Config.in.host | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks. Unless someone steps up to fix the support
for the D language, it means that ultimately we would drop support for
it.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
