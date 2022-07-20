Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63680C433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 21:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EE9883F9C;
	Wed, 20 Jul 2022 21:10:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EE9883F9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UB7BCeb0XrwM; Wed, 20 Jul 2022 21:10:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F30B83F54;
	Wed, 20 Jul 2022 21:10:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F30B83F54
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B62381BF3A1
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FB0A40AAC
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:10:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FB0A40AAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XsvsCXnaI6Au for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 21:10:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53E7E4015A
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 53E7E4015A
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 21:10:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E308320002;
 Wed, 20 Jul 2022 21:10:47 +0000 (UTC)
Date: Wed, 20 Jul 2022 23:10:46 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20220720231046.3e5a0a78@windsurf>
In-Reply-To: <20220627103026.3300987-1-aperez@igalia.com>
References: <20220627103026.3300987-1-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658351448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x4AFc9uTU2iwgcR5VWxJPBohAEbqQ3pDTYJU7MGVT3Y=;
 b=VEM2kY4SsAdoB4OWH3JYzKcFM5e7eLtE49baaYmMZ20+UQGvc3S2fFEq5NOy8Q6vytY7w4
 es7XIm1m4MylsEjjvCo93NQICu8n3uc9CHsbpLUHxB69U7L4TMyRq88jVGTGoj9y5+VZXn
 Y7rJY6UrqDlgG6ZhCJXHSUWc8FGWnk6XtjN533S0CL7yRiSDbzQ83NiYOsQ+2Pgzg3LMkP
 QxHwE9nSePtARNfA3V9ExS8RDEKQzTubqduaYc3EKki5uBCIac1hbDjpkc7BIWUEWNuO14
 g9va4x3F4GzCtNUPERjAfw7/6hZDTfl/Ej/lU7bMNwwDcI1GJXSLdkT9LDlZmQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VEM2kY4S
Subject: Re: [Buildroot] [PATCH 1/1] package/freerdp: fix build with libressl
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 27 Jun 2022 13:30:26 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> Import a patch for fixing the build with libressl 2.7.0 or newer,
> which has also been submitted upstream.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  ...uilding-with-LibreSSL-2.7.0-or-newer.patch | 126 ++++++++++++++++++
>  1 file changed, 126 insertions(+)
>  create mode 100644 package/freerdp/0004-Fix-building-with-LibreSSL-2.7.0-or-newer.patch

Since your patch was merged in upstream freerdp, I have adjusted the
reference to the upstream commit inside the patch, and I've also added
a reference to an autobuilder failure that your commit is fixing.

Applied with those changes, many thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
