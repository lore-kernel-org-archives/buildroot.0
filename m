Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C99C38A02
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 06:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B221401B2;
	Fri, 28 Oct 2022 06:45:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B221401B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1kunpaSL2TNO; Fri, 28 Oct 2022 06:45:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9E7F40133;
	Fri, 28 Oct 2022 06:45:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9E7F40133
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD1871BF860
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84C3060A91
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:45:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84C3060A91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FMuZ_Fp5E-eh for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 06:45:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EAEA60A8D
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5EAEA60A8D
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 06:45:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 894DC1C000A;
 Fri, 28 Oct 2022 06:44:58 +0000 (UTC)
Date: Fri, 28 Oct 2022 08:44:57 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221028084457.7e0cd250@windsurf>
In-Reply-To: <20221016212744.315519-1-fontaine.fabrice@gmail.com>
References: <20221016212744.315519-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666939498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mlt+qlY7R8OwO9IPxkjmUOHZO7iSfzwMRAIAL3TftjY=;
 b=ZHz1Ss6MHbqzwDwyukidG4pE51rJtxxuJGWRFsVGkiruQBvBQgVuskDooqPrZQaSjNnMiO
 AlbSIAxCTgqFPadNBdk+0/idd+c53Ck1svC099QF/ecnJ14ln5Zx+mdYe6YV5YSJgLy7IT
 QPbyel0EAnwZTrqUv2EmwTMVgFqX077pc6VxwFMRJlCGIaClwOW+qIX0N9rRtgXSAIBwJx
 iQOurPahWCujjcJ88Af6uKP+8qikv+AKJGTkOgDzagq2XUlYTuJzQORlZ3LsFwG+S1T5j1
 RiTwx1mJa50XUEiHPoJ8jzwPewfOBbqUdvIAaOpob66nl5nnzoFc7hLITUF1Dw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZHz1Ss6M
Subject: Re: [Buildroot] [PATCH 1/1] package/libgee: bump to version 0.20.6
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 16 Oct 2022 23:27:44 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://gitlab.gnome.org/GNOME/libgee/-/blob/0.20.6/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libgee/libgee.hash | 4 ++--
>  package/libgee/libgee.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
