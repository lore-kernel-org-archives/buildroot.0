Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE3CC61D85
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 10:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D5548128B;
	Thu, 23 Nov 2023 10:15:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D5548128B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DALp9ghCQcSf; Thu, 23 Nov 2023 10:15:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1E2780C21;
	Thu, 23 Nov 2023 10:15:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1E2780C21
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4EA981BF48D
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 10:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24CDD41DC5
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 10:15:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24CDD41DC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KbG4mABBHBrs for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 10:15:32 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2EA841BD1
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 10:15:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2EA841BD1
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE400C0015;
 Thu, 23 Nov 2023 10:15:28 +0000 (UTC)
Date: Thu, 23 Nov 2023 11:15:28 +0100
To: Byron Gallagher <trippgallagher98@gmail.com>
Message-ID: <20231123111528.3f88828e@windsurf>
In-Reply-To: <20231121174722.4164-1-trippgallagher98@gmail.com>
References: <20231121174722.4164-1-trippgallagher98@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1700734529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=axPyXl0smzvDab5CAthyTZOULbxAxrLanNjjAmqKgVY=;
 b=UoHV74D0JNWTlf3UugQs5Dzek+SlMHOZ7NEoklnSohJeW3AV+CXi9qgMVARq8BL0p1xXV9
 FGZz3LVqoXwxIfge77H6Iwi95V3iP5JnkeS4N0Mv4bJtm3n6qmUNt83FfDNoaU7nAzs7ms
 khWC4I0FzT01Nrz8zD8LmnP7QNYHiYF6qmtQtMG/xUH3dcSEtrZrpEWJt5XxCS0whIIJnW
 99n0kI4uSBIe0x0IaoUcynE37i5+OzCN7fy73d/kKUa8k+XBgsSpAkA1hGQto+s6x31Xyr
 DRNb2zN+jsLLTY8zc0fjOt8SxREXcUMRs6vVqszBqNUXBgYm0tigDCnEFwKBTg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UoHV74D0
Subject: Re: [Buildroot] [PATCH] package/socat: fix static openssl
 compatibility
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

Hello Byron,

On Tue, 21 Nov 2023 12:47:22 -0500
Byron Gallagher <trippgallagher98@gmail.com> wrote:

> +diff --git a/configure.ac b/configure.ac
> +index 9d60473..ae0e6bd 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -580,12 +580,12 @@ if test -n "$WITH_OPENSSL" -a "$sc_cv_have_openssl_ssl_h" = 'yes'; then
> +       if test -n "$OPENSSL_BASE"; then
> + 	L="$OPENSSL_BASE/lib"; LIBS="$LIBS -L$L -lssl -lcrypto"
> +       else
> +-	LIBS="$LIBS -lssl -lcrypto"
> ++	LIBS="$LIBS -lssl -lcrypto -lz"

The downside of this is that socat is then directly linked to libz even
when it's not needed (dynamic linking situation).

The correct/ideal way of handling this is to use pkg-config, as it
properly says whether we need -lssl -lcrypto (dynamic linking case) or
-lssl -lcrypto -lz (static linking case), without hardcoding this in
socat itself.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
