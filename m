Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1A8C4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 21:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BAF160BF1;
	Sun, 13 Nov 2022 21:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BAF160BF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IcMtBRaIBHFV; Sun, 13 Nov 2022 21:51:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54AD860BF5;
	Sun, 13 Nov 2022 21:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54AD860BF5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D19541BF3AF
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B922281414
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B922281414
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zQ4LtywZqN_e for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 21:51:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8769781406
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8769781406
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 21:51:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 78C6A20008;
 Sun, 13 Nov 2022 21:51:02 +0000 (UTC)
Date: Sun, 13 Nov 2022 22:51:01 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221113225101.76a0f895@windsurf>
In-Reply-To: <20221108220159.3567657-1-james.hilliard1@gmail.com>
References: <20221108220159.3567657-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668376262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SYE+ityNW12iuOndNImAsNdXa9d/vHDMD9HCFMqbT/g=;
 b=Kb2OvpxSFR4sspdpWdN+EtvksGFvkUrlLb7h+0wKiUpR3hHYh84gAZcH/AuoCYEyQ2pH3t
 b3pR/cwy9j2tfkyCdi3gBl5X1A1NPybRCHlbOMpiCexa2H+EDUPJ9EHJ4WIbUBrK2gqj4T
 DlmAh4STMeKYcMRPhkdFxTUbOftcDj7h5JeTOqLKe2MI0biVDOw2kfUUyc/pG8yj9ej48k
 ZDc1m8+uGx47F0rrA3iY1+gMa49Se2t88TTcoyIeQDJjlka21LddP7QNQdzRAd81bQMOx9
 7Eeh78LwDbyRHlwKDzQRiWyOVjGxonnekS9tyy4lCcvsjN5xZY+djxEwR4R30Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Kb2OvpxS
Subject: Re: [Buildroot] [PATCH 1/1] package/python-frozenlist: bump to
 version 1.3.3
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  8 Nov 2022 15:01:59 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-frozenlist/python-frozenlist.hash | 4 ++--
>  package/python-frozenlist/python-frozenlist.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
