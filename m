Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE8AC3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 22:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D94B4403D6;
	Fri,  5 Jan 2024 22:51:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D94B4403D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cs2r7bHjWSUh; Fri,  5 Jan 2024 22:51:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E52E34379A;
	Fri,  5 Jan 2024 22:51:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E52E34379A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 38E7C1BF3D5
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 22:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D4C743797
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 22:51:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D4C743797
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P72TPnB8o56l for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 22:51:41 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E0016403D6
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 22:51:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0016403D6
Received: by mail.gandi.net (Postfix) with ESMTPSA id 130341C0002;
 Fri,  5 Jan 2024 22:51:38 +0000 (UTC)
Date: Fri, 5 Jan 2024 23:51:38 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240105235138.49c8b9b9@windsurf>
In-Reply-To: <20240105183828.11548-1-bernd@kuhls.net>
References: <20240105183828.11548-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704495099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0rxYUbJE/EwRx3eEGi8MBNX955K7wa6rO/r+vOBu3Es=;
 b=Q3g4GV9VwASQ3GRKYCqUig+FhR1s0Fo68q5RL9PZPl0AJl8yf6kIMOeYXMjNAGB+wBIHCg
 CTrSUpbUG6oomosrAO1nWkA+bgp6Er/RkLeeGrfRHA2mOfXuU/pQ+37xNJ54o+R1ksTaD0
 ulZnU6DrkyrrlH+RsEMOhpAfyHoyDKapXXdvg5CZGvF9HB3noZ9xtVCOkdOr+EJvGEGrgq
 jDzefUWAv9FXwMY5ESLwvCzUwGhqodr/YxhKEn8X3j/ZFrUdmxJQt83MbBnYYML33GaIGn
 izmbNZjtrDcQP5EkBQJBxuLICk/wGxirBnNAu3fmYA+IMTa53BWde5Jmv6J3cw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Q3g4GV9V
Subject: Re: [Buildroot] [PATCH 1/2] package/kodi-peripheral-joystick: bump
 version to 20.1.14-Nexus
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

On Fri,  5 Jan 2024 19:38:27 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash | 2 +-
>  package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
