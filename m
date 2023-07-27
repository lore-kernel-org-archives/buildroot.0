Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96819EB64DD
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 21:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D57084054;
	Thu, 27 Jul 2023 21:19:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D57084054
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gBxBKPZK-3Mm; Thu, 27 Jul 2023 21:19:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6ABA3831F8;
	Thu, 27 Jul 2023 21:19:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6ABA3831F8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC5C11BF414
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A614B831F8
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:19:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A614B831F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jmBDj5HYr7Mb for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 21:19:51 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ADF9E81E34
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 21:19:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADF9E81E34
Received: by mail.gandi.net (Postfix) with ESMTPSA id C985120002;
 Thu, 27 Jul 2023 21:19:48 +0000 (UTC)
Date: Thu, 27 Jul 2023 23:19:47 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230727231947.15ddafa4@windsurf>
In-Reply-To: <20230727172045.1990932-1-james.hilliard1@gmail.com>
References: <20230727172045.1990932-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690492789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ar6f3rQ7Su2Q/kSCt+DY2h84nVcXVWZ2MwBm4DZGnB0=;
 b=PDRhZftXMjgFKNGIuc4moBpuxRmJymDybuN+n8V+esdo3j3Hu5XDv76P83C7Ouy401IoRY
 9i/GfGiwtQDRScpKdsIvhw2JABRua76YRTUEwl6Ha6stziSm6id2peTYqAuXm+lS11Amtu
 uczIoseZfp2XwI9seAgxvIC8tGOhfG6oIrSWpmUE0+ToZ27mXnRUBEtontxvew2Co6UKqG
 unLc8p72mx+Cit8CZMllXnKLx6GKi3G+zNCOqpLA3w/w4uWuaTu5EBP6eEzifjmdS6/pqN
 0fUi/rToq5pwBYb6lL41FvS5o5S1SBQstoEhU3PSztIrjzSIC9+HkOYux2gJng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PDRhZftX
Subject: Re: [Buildroot] [PATCH 1/1] package/seatd: bump to version 0.8.0
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

On Thu, 27 Jul 2023 11:20:45 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/seatd/seatd.hash | 2 +-
>  package/seatd/seatd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
