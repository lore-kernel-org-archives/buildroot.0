Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3EBC4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 19:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CF4F403AF;
	Fri,  3 Nov 2023 19:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CF4F403AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ry32eQfeNEPj; Fri,  3 Nov 2023 19:29:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76A7340377;
	Fri,  3 Nov 2023 19:29:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76A7340377
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 93E101BF33D
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 19:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D7DA82212
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 19:28:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D7DA82212
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w5Qo0JNzKTte for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 19:28:53 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B11E821C8
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 19:28:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B11E821C8
Received: by mail.gandi.net (Postfix) with ESMTPSA id 376EC40002;
 Fri,  3 Nov 2023 19:28:49 +0000 (UTC)
Date: Fri, 3 Nov 2023 20:28:49 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231103202849.14971401@windsurf>
In-Reply-To: <20231102185411.51382-2-adam.duskett@amarulasolutions.com>
References: <20231102185411.51382-1-adam.duskett@amarulasolutions.com>
 <20231102185411.51382-2-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699039730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=khPntP4o2pKObQdeUv4oUHY5KktFGigesuRkEsqfK74=;
 b=eTPl/ekmrDm/vH9ybfNWtuKkGy4f1S1BvACNO2nNYnyPP/TjkCsccgbMznPbYQI7lVM4Du
 Y6vx3OvKQ8CWpvP64knVQC+YQRvGsvckJbV5FPYDeX3pZu2hUynN47pDgY+qRHV+YQ4OU0
 bHDEoXvcxJhzTWpR64TXh0Uqb9VkyYA/B/DdW+AxpoagZVzfMrRm0D/PZNXzQbikFlg60X
 MewyJz+iSzeOu7OUhREaKvXNQ8RQzHJK2ZXNBoGdQbNeMxUVjCJTyjg05b3iDv+DI9KbxO
 A5iz6LZCihmjsfIDHV1h7dV41BN81b5yBVPXWiwZn2t3zeBoR+G4xS8JulE1vA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eTPl/ekm
Subject: Re: [Buildroot] [PATCH 2/5] package/flutter-engine: bump version to
 3.13.9
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

On Thu,  2 Nov 2023 12:54:08 -0600
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/flutter-engine/flutter-engine.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
