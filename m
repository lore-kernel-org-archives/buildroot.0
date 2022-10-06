Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDBCC433FE
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 19:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA75641005;
	Thu,  6 Oct 2022 19:42:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA75641005
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EeRv_7K0r1A8; Thu,  6 Oct 2022 19:42:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0241C40FCB;
	Thu,  6 Oct 2022 19:42:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0241C40FCB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2908E1BF3C8
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 19:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E82B3419FA
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 19:41:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E82B3419FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j5bK5JF-RjzM for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 19:41:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56B2F419F9
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56B2F419F9
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 19:41:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1A1E3100006;
 Thu,  6 Oct 2022 19:41:23 +0000 (UTC)
Date: Thu, 6 Oct 2022 21:41:23 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221006214123.6901795e@windsurf>
In-Reply-To: <20221005200621.229757-1-fontaine.fabrice@gmail.com>
References: <20221005200621.229757-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1665085284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Ra7/ikD2P+cd7ENDBW1NV/FsA604ZyDofxuvnBuRa8=;
 b=Usc0rlY71WR6HTgWjoKeLGO3zF4gFkeHRjaJvLzn+/Zoo0NczQaMJCPg5tbO9BUA9Cc9T4
 4QOHNhP4c2Eob1TJcSTU5PJaIzaTF3y8CxqfayYH5PRVnNAGwyOX8ldmflhQZBsdaOefLD
 Em15t2aK+lbij4zxWMY4sDKrRaUamkFQeaMxWbqOHpa2EFMnM6gBJj4hE3VVQFy7yJy4Cs
 BrvTyvUyLUe5XmMd6e1shYKBPrWbt31Nen9UTPskDeL5pkg42aO/FXYNUa4tkENO9kEWG/
 kdY4Xc2IitJA7h9aDxfKuyNrn+BQxYdh0I8TbcJhzy6FtpOsaQbLy/HAb4PB/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Usc0rlY7
Subject: Re: [Buildroot] [PATCH 1/1] package/liburiparser: bump to version
 0.9.7
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  5 Oct 2022 22:06:21 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/uriparser/uriparser/blob/uriparser-0.9.7/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/liburiparser/liburiparser.hash | 2 +-
>  package/liburiparser/liburiparser.mk   | 2 +-
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
