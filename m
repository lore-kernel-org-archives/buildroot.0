Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA3CC001B3
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 18:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D045D60AB9;
	Mon,  3 Jul 2023 18:47:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D045D60AB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aXQvvs7KGjKf; Mon,  3 Jul 2023 18:47:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29C5560EE9;
	Mon,  3 Jul 2023 18:47:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29C5560EE9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B58861BF39A
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 18:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99F6C40420
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 18:46:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99F6C40420
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8O9_fDYLd_01 for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 18:46:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FA07405DF
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8FA07405DF
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 18:46:35 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 772DD6000A;
 Mon,  3 Jul 2023 18:46:33 +0000 (UTC)
Date: Mon, 3 Jul 2023 20:46:10 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230703204610.58cb5897@windsurf>
In-Reply-To: <20230703160622.34931-1-bernd@kuhls.net>
References: <20230703160622.34931-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688409993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wncUli8BPWR6AuHqU/sViCg6xe65tLez53Za0kmLIXw=;
 b=SLVsO+495efqipDm1UwqgUQatcVK+7qXYsgU4x6Pgb7lTmm6w72Hh9Ov7XYsKgmNNeaHMo
 i29HBFu6MH69/5iVI8QaQpZOPeu4Oijzg+W1+V6TYE28kNpoL+Vka9fa9+tVeLj4SPkCGv
 I34eF6Zirn1yYNkGAIDPVF4u7mLNRF/Pq2tAxW8rXBXd156zxsI9x1kxPI9eEvt0wWH1TN
 KQPFicSsIeS/Un6E3ae+iCh3yjj6w8O8kTQIEHMik4V3cl2Af6JKXrpvdaXR0lsPY1h2Eb
 FL7wHpH1+5LYta8o+3C4RucaIJz7NMUwUwvpkU836qcwaO63D96wW7CUiuh1Yg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SLVsO+49
Subject: Re: [Buildroot] [PATCH 1/1] package/libmicrohttpd: bump version to
 0.9.77
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Will Newton <will.newton@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  3 Jul 2023 18:06:22 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> From: Bernd Kuhls <bernd.kuhls@t-online.de>
> 
> Release notes:
> https://lists.gnu.org/archive/html/libmicrohttpd/2023-05/msg00008.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libmicrohttpd/libmicrohttpd.hash | 2 +-
>  package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
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
