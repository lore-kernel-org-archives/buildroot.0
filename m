Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64649C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 21:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 017DF4161B;
	Wed,  6 Jul 2022 21:30:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 017DF4161B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ePB1XdQwK3Zt; Wed,  6 Jul 2022 21:30:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B01654031F;
	Wed,  6 Jul 2022 21:30:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B01654031F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 271271BF401
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2FC04031F
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:29:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2FC04031F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bVj-8EFPZwTQ for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 21:29:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABF3D4028D
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ABF3D4028D
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 21:29:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CDB77E0003;
 Wed,  6 Jul 2022 21:29:21 +0000 (UTC)
Date: Wed, 6 Jul 2022 23:29:20 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220706232920.61acc15a@windsurf>
In-Reply-To: <20220628212108.2862859-1-fontaine.fabrice@gmail.com>
References: <20220628212108.2862859-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1657142962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LtCxl5smDMyNQ3d6ebhwIuLC94agi/f8eZ3U1aJxscQ=;
 b=MbFiE+KDJQwGeikpMmPwOcoQFoJD7iWSbNjTZRwNjwc6qC2cJiCHs9mijT1WUDEYMIFTpu
 RgxBa9WQHeikMapB5ETMiZEvAIfaxYeqX0jSnAt3bV7fUpz8NQzHpVdkbMym8R9Awk9bVa
 ErlnGGAC5Mod3GZ0qqJ+es5FxZj7pLrI2JikMIkxaV1fX4wl/3iCaIU5URiTmmEOat9In2
 jOFodTyqX/w1cDe3MxkziPC6VwbmF3ULu8KI7v91sEIzVforw32u8pLyKwGsnlYITytRKE
 0FfR7zxYq2XAyI6erbovek2rSC8onCgXtE2+YYcUKub5mY9hMGMkuPSewETcxg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MbFiE+KD
Subject: Re: [Buildroot] [PATCH 1/1] package/pigz: bump to version 2.7
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 28 Jun 2022 23:21:08 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Use official tarball
> - Update hash of README (version and date updated:
>   https://github.com/madler/pigz/commit/cb8a432c91a1dbaee896cd1ad90be62e5d82d452)
> 
> https://zlib.net/pipermail/pigz-announce_zlib.net/2022-January/000017.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/pigz/pigz.hash | 6 ++++--
>  package/pigz/pigz.mk   | 4 ++--
>  2 files changed, 6 insertions(+), 4 deletions(-)

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
