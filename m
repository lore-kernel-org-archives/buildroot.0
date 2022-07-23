Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79E0C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 12:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63F1441903;
	Sat, 23 Jul 2022 12:58:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63F1441903
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l6-Lc0L8Ayz1; Sat, 23 Jul 2022 12:58:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD66D41550;
	Sat, 23 Jul 2022 12:58:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD66D41550
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 89DB21BF36E
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6433A60FE0
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:57:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6433A60FE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p0bE_6EHbNdV for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 12:57:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56B1560FDE
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 56B1560FDE
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:57:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 574211BF203;
 Sat, 23 Jul 2022 12:57:30 +0000 (UTC)
Date: Sat, 23 Jul 2022 14:57:29 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220723145729.32b1f92c@windsurf>
In-Reply-To: <20220529131811.481017-7-romain.naour@gmail.com>
References: <20220529131811.481017-1-romain.naour@gmail.com>
 <20220529131811.481017-7-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658581050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qDF60t/Jvzbfv5K8azsdmKvkBYXPsalfKvTznNDx0Ek=;
 b=kOhiL3VU5hp76xyarx6KiWJKXT68p2QKdCTBjTpZ077sjL8ASKFjWcYTjgOQNpXbVi9oG6
 Eo5smBc0z/qC/h3PYlajLQxkfB8rtg5GRJf7V64SYu3IKKhXNvDkaUKeMLkE/xp243oxZc
 8VGQMH5YUCmz6QmX2jySm+k1hZI083prUeKrht9MHFf0vGyZxZzlUOI+KZoQlwCtHqOy6S
 kGx1xh9Jh60RjHLuFQ1eiP47u8qkvsnQ1mMv8BL/nG6overmP5w+nmmhsRN/MsZTWxyw+U
 FaFYWOM1egH4GBf2+WHKk1Nn8xVMY1xPwRdIbql7HYD/TMPtN2UHdoFoqp0wTg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kOhiL3VU
Subject: Re: [Buildroot] [PATCH for-next 07/11] package/gcc: switch to https
 urls for archives hashes
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

On Sun, 29 May 2022 15:18:07 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> FTP urls doesn't work anymore with Firefox [1] and Google Chrome [2],
> switch to https urls.
> 
> [1] https://blog.mozilla.org/addons/2020/04/13/what-to-expect-for-the-upcoming-deprecation-of-ftp-in-firefox/
> [2] https://chromestatus.com/feature/6246151319715840
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/gcc/gcc.hash | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

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
