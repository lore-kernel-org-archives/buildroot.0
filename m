Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199E0EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 21:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0DEE61024;
	Sun, 30 Jul 2023 21:28:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0DEE61024
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 80XQXRuePoMa; Sun, 30 Jul 2023 21:28:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0B2461020;
	Sun, 30 Jul 2023 21:28:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0B2461020
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B2C3F1BF401
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C90E8135C
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:28:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C90E8135C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 13NUvsxSdmrJ for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 21:28:35 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E4118135B
 for <buildroot@busybox.net>; Sun, 30 Jul 2023 21:28:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E4118135B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7FB86240005;
 Sun, 30 Jul 2023 21:28:33 +0000 (UTC)
Date: Sun, 30 Jul 2023 23:28:32 +0200
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Message-ID: <20230730232832.1fa85125@windsurf>
In-Reply-To: <20230521082509.27215-1-guillaume.bressaix@gmail.com>
References: <20230521082509.27215-1-guillaume.bressaix@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690752514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z0ar1WRPnUfeUH8l+blFNAtAitcxOEdNcVqdhyfmVWw=;
 b=W9k5pQjnfjNGDSVp2nn3gxe5jWATxOaJtwpKNM6/5Y8Cmq0rOa7jfMo3fuqf5153oaVv56
 bRC7KbeyDQSknDVmGCqA5qP4hMJsIVSLU9WdcUCmOB/Ng9mRkvIfFISsihlmEWTH/GW2Om
 v37/gDNxALESHjvfQL1EI8GbXmwHgzybXlAWb+aXi5TapgW2jkomnABUXC+Isgnt04Eome
 dkk3oDx6h6WAMObZvXU71XluTN4G0xWZUNXOQ4sWPX1UwZ4eIg616jeLgmpjlW2VGCjQba
 1yVeZ/8jgQDrdxCsgY5t1uUY9HKnbGE55JNMgS4yK56TBIigAWU6Hz31NxSf8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=W9k5pQjn
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pybind: bump to version
 2.10.4
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Guillaume,

On Sun, 21 May 2023 10:25:09 +0200
"Guillaume W. Bres" <guillaume.bressaix@gmail.com> wrote:

> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> ---
>  package/python-pybind/python-pybind.hash | 2 +-
>  package/python-pybind/python-pybind.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Thanks for the patch, but it was bumped to 2.11.1 in the mean time.
Sorry for taking so long to reply to your patch. We have a huge
backlog, and we're trying to reduce it now by more actively applying
patches.

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
