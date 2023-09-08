Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158C7EEB569
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 20:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7FCA4154A;
	Fri,  8 Sep 2023 20:04:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7FCA4154A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n0HPzhCgHcYE; Fri,  8 Sep 2023 20:04:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C362414E5;
	Fri,  8 Sep 2023 20:04:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C362414E5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4EBBC1BF303
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31BC060E70
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:03:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31BC060E70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZYtT54cMQi8k for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 20:03:01 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F184460BBE
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 20:03:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F184460BBE
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4390DE0002;
 Fri,  8 Sep 2023 20:02:57 +0000 (UTC)
Date: Fri, 8 Sep 2023 22:02:56 +0200
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20230908220256.76bfcec4@windsurf>
In-Reply-To: <20230905180610.1610778-1-aduskett@gmail.com>
References: <20230905180610.1610778-1-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694203378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cVER1wI0xgCKjJ64es3l1B2Ps5svHlmBglRqvXJYSko=;
 b=UBtMWSW+O9+3GZQPvI8NrOjUfoFcWLno+ObXk2IO1p1Ogi/I4s8IoNJ0uADI4FbAJUCjnS
 QAKl0phpUoZf+EjuiEcfrPZgil/JLP+5AAmXwEuTFXQ7Q9U3TIHUq1dlaRdOmHbajxYD6J
 sYDGUeCQAkvZbVqib0rvQ1B4YO9XjtSL4oVQ4x7A2se/1Pgq8BDMJzJKfgYb7nrvPdJM+D
 3cBDbHk49rXhQMc1xR8YezbsWzdXbhjNHDLeVTnBUbTY3mC6FWofHwVJq288+yEsceTVmf
 D9LC1ToRjHGGeHWOgUT9uw1BX2KZxvQifM/smkJ6S41tlOHaLeqstErEJYAAZw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UBtMWSW+
Subject: Re: [Buildroot] [PATCH 01/10] package/php: bump version to 8.2.10
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 =?UTF-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  5 Sep 2023 12:06:01 -0600
Adam Duskett <aduskett@gmail.com> wrote:

> From: Adam Duskett <aduskett@gmail.comm>
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.comm>
> ---
>  package/php/0003-configure-disable-the-phar-tool.patch | 2 +-
>  package/php/php.hash                                   | 2 +-
>  package/php/php.mk                                     | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Series applied to master, thanks! Note that you had forgotten to update
the .checkpackageignore file in two of the patches, so I fixed that up.

Also note that your patches were Cc: to Adam Duskett
<aduskett@gmail.comm>. Yes with .comm and not .com. Maybe something to
fix in your configuration?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
