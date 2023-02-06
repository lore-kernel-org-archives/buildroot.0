Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E078C61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 10:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAAAC60AA3;
	Mon,  6 Feb 2023 10:59:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAAAC60AA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id witIdT_50lUF; Mon,  6 Feb 2023 10:59:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECD7360A89;
	Mon,  6 Feb 2023 10:59:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECD7360A89
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 45D5A1BF2BD
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9223409FE
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:59:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9223409FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AyYlCXbhmuGY for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 10:59:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 566A8409E7
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 566A8409E7
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 10:59:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E695860009;
 Mon,  6 Feb 2023 10:59:23 +0000 (UTC)
Date: Mon, 6 Feb 2023 11:59:22 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230206115922.5aaad8c4@windsurf>
In-Reply-To: <20221212202728.1531746-1-bernd.kuhls@t-online.de>
References: <20221212202728.1531746-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675681165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r7GuoKPL/6VP1x4RKU1VJ6WBoP5LnDi3VAT4psIS1vg=;
 b=oQ/5RlaOP6R47CuqkAlEB0lEQGg7Io8rm12/CBuoUjzYJW458J7qrgQgBIJ8BOcRVH4ldw
 MNLYeCmRhlq3tNnGPBWZA0aHPjUAjEDBU3RKqLDMpE+E9yOyhM96Av5aWs4hKdGacJdQja
 xbSaKxUxNgHPwDnloYv7+G7/43coowTwwRmVSGPNecv9qTYd1iES21Akb63CHWdvHWhvaU
 RnXImXmYTYG+k432H5TGOO+TLNT9NOHp/IVdRzdUieoXzSXvS8n9td2pfSWXy9H3IJgRl7
 CoU9lL3HgX7B+bQbb2pkaNp4IJSHG9azGS+iBfRDB3euIw5A9JQdjoPNGW7Mlg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oQ/5RlaO
Subject: Re: [Buildroot] [PATCH 1/2] package/libunibreak: new package
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

On Mon, 12 Dec 2022 21:27:27 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Introduced as optional dependency with libass 0.17.0.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> Build-tested using this defconfig

Both patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
