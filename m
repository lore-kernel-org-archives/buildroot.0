Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3526C433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 22:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36AF660AB0;
	Sat,  5 Nov 2022 22:33:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36AF660AB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8oq5ZD_AKDs6; Sat,  5 Nov 2022 22:33:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D59160A71;
	Sat,  5 Nov 2022 22:33:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D59160A71
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 35CDA1BF3FD
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1198160A71
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:33:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1198160A71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DzDdZPwaheZ7 for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 22:33:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA43A60A4F
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA43A60A4F
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 22:33:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 58AD020004;
 Sat,  5 Nov 2022 22:33:35 +0000 (UTC)
Date: Sat, 5 Nov 2022 23:33:34 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221105233334.4bc6a73f@windsurf>
In-Reply-To: <20221103210719.3477688-1-james.hilliard1@gmail.com>
References: <20221103210719.3477688-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667687616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vjAB9OsCFrxoVW9wAqE7u9yBTcdNBLH12iOQoU2bGGE=;
 b=Tf1E6SGSMZXz4oad8ObXyHRR0+LXerJ6SlRxJmzyt7lCPEJZ9jXLZ4VSSBqyF9YjqgadYa
 M1/VLAJ4svGh5zr2e8CqpdX5lhaoCq8fgrzfiMujW7T8eCC7afUUAB8l2rsBOXYVZzUR/F
 zM0WCDpFD6DDWp0qyZ1F1DIbbobG8x5MpyQINSRjx+y+p9DuKK6XgGCOGr6FRgFJ39vxZ5
 p10Ig2tcgS7DfegN6WywpdYyZ0o0C7IRuWOM7qUbsSQZKg1obsz85W91GfMGegbc/FkIQ2
 sSZ/+YgmBEc6xbELAv4o5hrp1U4E8e80KbyEt7vki22dFe3WM1fqf+Uk98rd4A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Tf1E6SGS
Subject: Re: [Buildroot] [PATCH 1/3] package/python-pytz: enable host python
 package
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
Cc: Lionel Flandrin <lionel@svkt.org>, Grzegorz Blach <grzegorz@blach.pl>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  3 Nov 2022 15:07:17 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> This is required by host-python-babel.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pytz/python-pytz.mk | 1 +
>  1 file changed, 1 insertion(+)

Series applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
