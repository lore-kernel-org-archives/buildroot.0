Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44A9C636D6
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 10:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B693405E8;
	Tue,  7 Feb 2023 10:40:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B693405E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BFemHgCdAK6t; Tue,  7 Feb 2023 10:40:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 914424056D;
	Tue,  7 Feb 2023 10:40:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 914424056D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5FDBD1BF27A
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 10:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C80C60E55
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 10:40:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C80C60E55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gMigevwEqWKy for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 10:40:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB88660B00
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB88660B00
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 10:40:15 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 44B7BE0010;
 Tue,  7 Feb 2023 10:40:11 +0000 (UTC)
Date: Tue, 7 Feb 2023 11:40:11 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230207114011.7fd5008f@windsurf>
In-Reply-To: <20230207094913.603489-1-dario.binacchi@amarulasolutions.com>
References: <20230207094913.603489-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675766413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zJF1wTFOcv/2DsdzDNGVNdY2QY5+/Zzg0hwAXWkaaMY=;
 b=eb9tMZygrujNuiBxQ3eD39HplI1PvTofzm79Xl6n1eSsIu7wJ0dlRBeXcQ3maPFLOfA1L1
 ajvHuE6b0zV1SABMxfeLJdV5vkKc+JNfFE+Hrfra5777fJ7lenoKywJhODiZ7Qgrn5SrAc
 r9WJopoyYztg1SKMwBP6vhhfb7lCr3U5gbNEQxa1Bh9jfm2OxJ+J0fosDYcjDu/uZt2yKC
 sygHahQWUANi5faUAfQyvpyrZYLBy0hO10MZxzjFQWYnOqtZCARnYfsuUdD/wYMgW/4X51
 pmPbzdvMpmLNnNo73XArpnKfXhSH2PrBxKiHw+w5RVXIv+WKJt0JcwVIqhsv9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eb9tMZyg
Subject: Re: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.5.21
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
Cc: linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  7 Feb 2023 10:49:13 +0100
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> - Fixed android super.img loop download 52byte after some block
> - Use login header as in curl
> - Skip sleep in usb_add
> - Add empty line after input password
> - linux prompt ask user name and password for http(s) download
> - fix linux build failure
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  package/uuu/uuu.hash | 2 +-
>  package/uuu/uuu.mk   | 2 +-
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
