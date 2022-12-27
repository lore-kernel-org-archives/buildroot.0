Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12F0C4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 20:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 330F840165;
	Tue, 27 Dec 2022 20:42:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 330F840165
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DBNwxv_QjaDs; Tue, 27 Dec 2022 20:42:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 576C74018F;
	Tue, 27 Dec 2022 20:42:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 576C74018F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5B1571BF37A
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4362860C23
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:42:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4362860C23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tAWnV-8QAdiu for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 20:42:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F03D60B35
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F03D60B35
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 20:42:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5F024240002;
 Tue, 27 Dec 2022 20:42:26 +0000 (UTC)
Date: Tue, 27 Dec 2022 21:42:25 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20221227214225.11528c12@windsurf>
In-Reply-To: <3e3ef4e45b435317b2a6e60da1007ef6b4cf774d.1671873478.git.yann.morin.1998@free.fr>
References: <cover.1671873478.git.yann.morin.1998@free.fr>
 <3e3ef4e45b435317b2a6e60da1007ef6b4cf774d.1671873478.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672173746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xB2UWQ/qvl4/WpD221wf5qe6nfUE6LCkX+yi0KOdtcc=;
 b=Im7qmJgeJbDv7ruvJiLujloOGn945iVGuyweh2XDWEn2rkVOkuXCYXMIhQ1ew/Jx5NWBwg
 s5IO4+IgOR0Y8ZB6LNrYolZ3LLarJXboRiOIpJdx2XE+MyejP0j3MJaa+9X9uCyfz0Eol4
 mQ8zXUWOqG7FCx51YVCFJwCyvS4reGTKDugdFmj9cAiJ+Z/QTKuN0uSOzb6j1fyfaUpRyZ
 qIHci0TKDYIhc0qRRww6+Ot2ZIC51IOpxW3SAKE92TY+eqOZ26eUIqrbGDg5Xdr242SEVF
 3E/ioRSMd0c8IdYJUKNTPJYjEpsdKsPNsqhRdpKPXvFOWqf0Ja2mYVFKDgHBtA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Im7qmJge
Subject: Re: [Buildroot] [PATCH 1/3] support/tests: print failed command and
 output on assertRunOK error
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

On Sat, 24 Dec 2022 10:18:11 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Currently, when asserting that a command succeeded, we just capture the
> return code of the command. If that is not zero, the assertion fails,
> but the error message is not very splicit:
>     AssertionError: 1 != 0
> 
> Replace the error message with an explicit message that dumps the failed
> command, the error code, and the resulting output.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/testing/infra/basetest.py | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)

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
