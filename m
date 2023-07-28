Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1841EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 20:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 866EF41DF5;
	Fri, 28 Jul 2023 20:28:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 866EF41DF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 50_DFMXnxZmm; Fri, 28 Jul 2023 20:28:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93785404CA;
	Fri, 28 Jul 2023 20:28:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93785404CA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 98C0F1BF38A
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64AB260B06
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64AB260B06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZT9YBSeXWleW for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 20:28:27 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C07860A5D
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 20:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C07860A5D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0797B1BF207;
 Fri, 28 Jul 2023 20:28:24 +0000 (UTC)
Date: Fri, 28 Jul 2023 22:28:24 +0200
To: Viacheslav Bocharov via buildroot <buildroot@buildroot.org>
Message-ID: <20230728222824.29f860b1@windsurf>
In-Reply-To: <20230724153846.156586-1-adeep@lexina.in>
References: <20230724153846.156586-1-adeep@lexina.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690576105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oeavfYeHx68XF+ODHgAYnqYGh6rvRXv1NVcCX61kHg4=;
 b=Hs/OZaI3U6gMBWFStTIOO2VpHkEvR/yZinC2uWYT7+dq0287xuweb3EkI34uDPmtSCmrx6
 MmV7rSUIJOvOWeL5J7Vxk9/I2pfXSRU6F45QeL3UlHaPSYihJYXoz7irDjzjsX0zLaMD4O
 hudKgb8bz/Ay0s7/PHK23UBc9xUMk34e0O0NxIdPpUW8fswTr2ziW0f4jK0g0VVfOgFrrg
 b/vopfUEt9OUB4q/jbfBZrADUsEzH8WCg1j2LS1hXgkhp/E3mP6fVP/kYIosBlrVM3g2Vr
 Ervi7Gk50Tlosj5fRiSzNe9OcYiV9bbZjPd0tHlfHsApdy+xCcVgsVhhjMyx+w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Hs/OZaI3
Subject: Re: [Buildroot] [PATCH] package/rtl8822cs: Bump driver version
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
Cc: Viacheslav Bocharov <adeep@lexina.in>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 24 Jul 2023 18:38:47 +0300
Viacheslav Bocharov via buildroot <buildroot@buildroot.org> wrote:

> Bump driver version. Fix build failures:
>  sparc http://autobuild.buildroot.net/results/1773c307641fc7a04f1095325c7bfd44d58d3180
>  sparc64 http://autobuild.buildroot.net/results/5bcb9d334add7d80f23f0585e67010d27aa8ef1f
> 
> Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
> ---
>  package/rtl8822cs/rtl8822cs.hash | 2 +-
>  package/rtl8822cs/rtl8822cs.mk   | 2 +-
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
