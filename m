Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC47CDB465
	for <buildroot@archiver.kernel.org>; Mon, 16 Oct 2023 10:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC3CA41554;
	Mon, 16 Oct 2023 10:13:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC3CA41554
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8AE1rUrVmGgI; Mon, 16 Oct 2023 10:13:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F40A4174A;
	Mon, 16 Oct 2023 10:13:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F40A4174A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D6871BF327
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 10:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 644E14151D
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 10:12:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 644E14151D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j5MsldYsVXSI for <buildroot@lists.busybox.net>;
 Mon, 16 Oct 2023 10:12:37 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3AB04173E
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 10:12:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3AB04173E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74F4A20004;
 Mon, 16 Oct 2023 10:12:34 +0000 (UTC)
Date: Mon, 16 Oct 2023 12:12:33 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20231016121233.003fdb60@booty>
In-Reply-To: <20230924151205.2099293-10-neal.frager@amd.com>
References: <20230924151205.2099293-1-neal.frager@amd.com>
 <20230924151205.2099293-10-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1697451155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vYEFvH0l+5PtZi1Aw4EzmsIhcW2ZluWjkQlaF/tMtJk=;
 b=QwaiPbXdKCaI7tNuful1qdBVDm+J7+bn6iyMkk1tfcTSyiyBjT1EtwJX1gif2z6WVxWecI
 2Ho+q2P5jkMq/12kA2UrSvfb4PA30PsZobZ4ZaD55DRBnC65m8s+ylSjNA2lN+j1U3qf1z
 7dJj9ZxfHfyRr/Ihwj0FP3Ia4dRXbZM8E2dyFzCuU6lrYa7DI0afAX8p9FXRt+z/fcBHe6
 FI3Kk7kuNz/b/i9eKrsWlgkJq1huM483oWqauGHdIOHX6U4w6QXvUaQXTHdVqCkXZIRUyY
 3GvxZtATh1w7qk+ZbwT/5xX0qafIgCoBwxjsL83bVslRaYNTVeN+jGmuUhSHfA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QwaiPbXd
Subject: Re: [Buildroot] [PATCH v4 10/10] package/versal-firmware: remove
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, michal.simek@amd.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 24 Sep 2023 16:12:05 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch removes the package/versal-firmware as this package is replaced
> by the boot/versal-firmware target boot firmware package for versal.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
