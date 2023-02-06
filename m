Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49850C61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 21:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAD9B4056E;
	Mon,  6 Feb 2023 21:39:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAD9B4056E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RPqrmZ4NbU3n; Mon,  6 Feb 2023 21:39:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F309340569;
	Mon,  6 Feb 2023 21:39:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F309340569
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B99391BF2A4
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 21:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F84641754
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 21:39:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F84641754
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KlAxKlGduPfN for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 21:39:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43AAA415AE
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43AAA415AE
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 21:39:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 111A120008;
 Mon,  6 Feb 2023 21:39:33 +0000 (UTC)
Date: Mon, 6 Feb 2023 22:39:33 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20230206223933.63f0a397@windsurf>
In-Reply-To: <cover.1663699017.git.yann.morin.1998@free.fr>
References: <cover.1663699017.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675719574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F0DlEDoru1g5urZq1JmlS+6U2o41UsWewaSpnxfukBw=;
 b=AndEapt3us6YuZktn7J5t1PhnBW7ZaGoSnFnT26lZfGrnGHllxlWcvA/HvSvd1hbZXfN4z
 8UhZGW6z4+XC27PGQimjx553Dk/t4ndAOxex06z9MoPPXrh31Bpw46RxRiObf1LkTKjv0S
 TAVrHIJxU7UNs8hmGXQ/uuRO7rTXAQ/Js2PMZY56FAN2eQrANMX/BOn4QOMOCC6x50pYFy
 UWPliNj32D2xfmWoLKedWF7QSPEzy3Guy5g1+lSnpwM9lSmHyOdr6dSzpyw2yMntambjnp
 SYOv3KVrEA15mB4jRQwfjuifCMoAx1oBf/JwS6SRNRKATVfaTCHJSQwRlcgflA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AndEapt3
Subject: Re: [Buildroot] [PATCH 0/2] dracut: extend support and tests
 (branch yem/dracut)
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
Cc: Adam Duskett <aduskett@gmail.com>,
 Thierry Bultel <thierry.bultel@linatsea.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 20 Sep 2022 20:37:09 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Yann E. MORIN (2):
>       fs/cpio: allow users to provide their own dracut modules
>       support/tests/cpio: extend runtime tests for extra dract modules

Both finally applied. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
