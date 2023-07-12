Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD01EB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 19:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE68041F0F;
	Wed, 12 Jul 2023 19:50:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE68041F0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c9trYJ1VE75S; Wed, 12 Jul 2023 19:50:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C065541C3B;
	Wed, 12 Jul 2023 19:50:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C065541C3B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D36E41BF3BD
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABCB64007B
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:50:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABCB64007B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MjlWhAo5XUzq for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 19:49:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CC3B41C3F
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7CC3B41C3F
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 19:49:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0F87E2000A;
 Wed, 12 Jul 2023 19:49:55 +0000 (UTC)
Date: Wed, 12 Jul 2023 21:49:54 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230712214954.1c32df4d@windsurf>
In-Reply-To: <20230712064557.1371058-1-james.hilliard1@gmail.com>
References: <20230712064557.1371058-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689191396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uQcV5iLBvBxNXBthdzegwwzZ58+8GVx8DmnykLu18TI=;
 b=jCD7gNjSFtZxuHEZJfQi4GWky9YurL82nNIW4VEXnu/Uw4fRIxGPEVPxctAPSwMtJVSLLz
 LfMccqFRQPnpKLUcFXjn7EOOEthnBeMe7YXbyLXWllBfqa83YcHVEeCtfhXxJzbVqVHnfu
 evruVcwyzvaBQmJPS2/ovNzgCx8DWSkzPRdGmUXamA3bxH4YNcEzRPM1bW6AxoM4hftgt0
 Qgg4SI6CwdBKZxmCYw+xOuFDUrB5O7/L8p18QqOvU7mrQJSXM4D4uLgaXtzfOKRXA39Uwj
 mC1H2IU/Yn8cFo/vvjrFrjyCt2w9OUFUrbnhO+amWBUjEE5ppXF+vj6LbwW0lQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jCD7gNjS
Subject: Re: [Buildroot] [PATCH 1/1] package/zxing-cpp: bump to version 2.1.0
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

On Wed, 12 Jul 2023 00:45:57 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/zxing-cpp/zxing-cpp.hash | 2 +-
>  package/zxing-cpp/zxing-cpp.mk   | 2 +-
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
