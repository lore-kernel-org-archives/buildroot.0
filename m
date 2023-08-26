Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E573C83F15
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 18:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2873041B3E;
	Sat, 26 Aug 2023 18:16:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2873041B3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mlj6UbNbiK_p; Sat, 26 Aug 2023 18:16:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3096741993;
	Sat, 26 Aug 2023 18:16:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3096741993
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A2FD71BF37C
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FE0E40232
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:16:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FE0E40232
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sVg4gPzHJmce for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 18:16:05 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 737BF40106
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 18:16:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 737BF40106
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5F031FF803;
 Sat, 26 Aug 2023 18:16:03 +0000 (UTC)
Date: Sat, 26 Aug 2023 20:16:02 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230826201602.125e7ce1@windsurf>
In-Reply-To: <20230825210538.10419-1-bernd@kuhls.net>
References: <20230825210538.10419-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693073763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UtceAPLpYLNs7vY12mDnsPxdlCHVc3kazITuydtZZ7M=;
 b=pHrvShrvhxMq8b0sYq8pMCMrg8Dh4MIaJytIioLaATo9sjzwq/P/TVfet57dWZhyYQaHl1
 sHKhFezm+IM0UwB8LQNbTOSWYQf/lZ34yFkBdn5AegYedskHNNjEystphYxjP8hPiwH8AO
 8K9fVHjiEtOrfzGhuwCwhiZMv0/YEQhccW2BDajl8X7Au+SQKkJn1rLIX5fIZ5pJVZp0Tm
 V7FIrdeoBTAo6SK+joDXcp3Fmsv7G0uMVN8RNHb9hXePIYIHlKrnmUi24z26Kn7kJ70Tev
 AaQcpQVBDOlzvQ+SgYtMCyGkQbehoaesLGXDBQ6wceTqMpxkClOw7UX8bIuSbQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pHrvShrv
Subject: Re: [Buildroot] [PATCH/next 1/1] package/kodi-pvr-nextpvr: bump
 version to 20.4.3-Nexus
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

On Fri, 25 Aug 2023 23:05:38 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash | 2 +-
>  package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
