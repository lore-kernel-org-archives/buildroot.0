Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE71EB64DA
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 16:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D82160FC8;
	Mon, 10 Jul 2023 16:13:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D82160FC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RYUFlSOxUoeO; Mon, 10 Jul 2023 16:13:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CD3760F4D;
	Mon, 10 Jul 2023 16:13:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CD3760F4D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F3BFD1BF414
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 16:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFD4060F39
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 16:13:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFD4060F39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id foavX5_wKa-6 for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 16:13:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B030760B01
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B030760B01
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 16:13:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 69F0A1C0005;
 Mon, 10 Jul 2023 16:13:46 +0000 (UTC)
Date: Mon, 10 Jul 2023 18:13:44 +0200
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20230710181342.2f439cf7@windsurf>
In-Reply-To: <20230710122306.511354-1-heiko.thiery@gmail.com>
References: <20230710122306.511354-1-heiko.thiery@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689005626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4zQoxL8LBh8NXPId89MGV8YgWY7il8JIejLY0c9y7S4=;
 b=Rzo/rXR3TNAZ9pFiJ0sHkkxGuWWgky0sezg+h1Pc0o1xR0AtJgbuRp5Pq9odqxDhPCHow2
 ivZQP6WBmzbXfV/vrU1Qp57vSSpiH56ilFFnjlSJ6Dee1+dHqWryt46JNiKmSMBQ/WFee5
 WLm6uSeG+qHl+4IBLz1qn8tiWH0B02LbYtmo/0h8gBUC5Jv7y4yw84k11ZUG/J9WiYBK2C
 kTKV+nWt2pregO11cOL7wtRR+qFKkcQPza6g8HEU6jMq780W4K4XlUq2b8Xb+qlwD/1SxJ
 g2kburWb6a8HNZbxBHtcFzof+BCebc4AZ1EAo3K32qprC4vtiEouW5Q4Xa2nSQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Rzo/rXR3
Subject: Re: [Buildroot] [PATCH] package/rauc: bump to version 1.10
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
Cc: Andrey Yurovsky <yurovsky@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 10 Jul 2023 14:23:07 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> This release version inludes several enhancements and bugfixes.
> 
> https://github.com/rauc/rauc/releases/tag/v1.10
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  package/rauc/rauc.hash | 2 +-
>  package/rauc/rauc.mk   | 2 +-
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
