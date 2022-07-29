Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71331C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 12:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0696D40BA3;
	Fri, 29 Jul 2022 12:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0696D40BA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ws8KvFfQv_gC; Fri, 29 Jul 2022 12:12:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 154A540412;
	Fri, 29 Jul 2022 12:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 154A540412
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A478C1BF3F9
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 12:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A89683F63
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 12:12:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A89683F63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QtRUmZUS6GmY for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 12:12:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8B1B83F55
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E8B1B83F55
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 12:12:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6EAE71C0003;
 Fri, 29 Jul 2022 12:12:07 +0000 (UTC)
Date: Fri, 29 Jul 2022 14:12:05 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220729141205.2bde03b3@windsurf>
In-Reply-To: <20220729121055.168510-1-giulio.benetti@benettiengineering.com>
References: <20220729121055.168510-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659096729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZRYsHlVeIfiW0en+zTcriviVIfW2i3QSm0l6YZy76V0=;
 b=hm+bk6zewQwHYigS98tY7GJ4OzdERrUIEPdcWxI2dFbtW8ge5yviRuZ9ee455Jr8aSn92q
 lZVuGYZqxeEFMQqR1Auxkvjn+J7Tp940BU0+mtRHq9Yc7LQT/h4lkGbYN+Y7u0TDVKP0kC
 yEZafOecJMptB+OTlq3QkMzsImSacqH2szHz9x+zpkEGv78m/01C+VasRDlEvJ4V1iTIV9
 ZVLmK43WEf5f+P/XPwQ48UINOO5iKxcaElPjZyIhNE8MAUddLEXFrVI4M+pI8R90dzWDkk
 9j9pl4AH8EqLlDPg5Tr9+jvcwqqGLKO0jGkBji4SIqNwZJx/hZ5yWL6TQdx1dg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hm+bk6ze
Subject: Re: [Buildroot] [PATCH 1/2] toolchain/Config.in: update gcc version
 for gcc bug 68485
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 29 Jul 2022 14:10:54 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

>  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485. This bug still
> -# exists in gcc 9.x
> +# exists in gcc 11.x

What about the recently introduced gcc 12.x ? :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
