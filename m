Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22919C001DE
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 21:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D925410E8;
	Mon,  7 Aug 2023 21:27:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D925410E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A4OouuKDQTlk; Mon,  7 Aug 2023 21:27:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 889534109B;
	Mon,  7 Aug 2023 21:27:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 889534109B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A8F251BF23C
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 21:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F9F840168
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 21:26:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F9F840168
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MslLgGwLV6c2 for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 21:26:51 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C5D340150
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 21:26:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C5D340150
Received: by mail.gandi.net (Postfix) with ESMTPSA id C6793FF803;
 Mon,  7 Aug 2023 21:26:47 +0000 (UTC)
Date: Mon, 7 Aug 2023 23:26:46 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20230807232646.76210d7e@windsurf>
In-Reply-To: <20230807145839.2375839-1-thomas.devoogdt@barco.com>
References: <20230807145839.2375839-1-thomas.devoogdt@barco.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691443608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rWCO4N1WjhWcDUa3crH/vfyRouBntwVxFhIMX7oKMok=;
 b=PKZ3bNJk2lmOGLmRGZ9z6teuVdGKgaqAxxhQP0yKS2d9W15wVMtnL5rslK1P8SbQJyVCTf
 x9KmzH+emVon9JgpBpq4FIEw8oVqlvlV0KNv0eUHmcHMJa4L4I0ednIX+OcI0LIticYfP9
 E5v+gTCQG09Y1bKFAznfsyko5ja08fQu/aSUWku5RX6Ikp1E/qg0LeH9XfbrceYFhs5Kd6
 zb4ULKeACiqAUwKFjkFRmqMZm0uXMq1T869odIwckrawCi+or6JfWmE9RlZ10vtDlv09w/
 Q+Dy4wQHKhOAl9amXrxGSvjkzmh508rDTSylt4Mn72qx8+J+R7UaDmhKsNJQ3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PKZ3bNJk
Subject: Re: [Buildroot] [PATCH v1 1/3 next] package/qt6/qt6serialport: use
 the CMAKE_NINJA flag
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
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, "Yann E
 . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  7 Aug 2023 16:58:37 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> Use the newly introduce backend option (4cf79d9b71ff5cf2aede3f21e09ade7c7ac59606)
> to specify what cmake backend to use, instead of special-coding it's use.
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> ---
>  package/qt6/qt6serialport/qt6serialport.mk | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)

All three applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
