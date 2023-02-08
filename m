Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E29C636D6
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 11:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A377441757;
	Wed,  8 Feb 2023 11:24:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A377441757
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kSJcHeIid520; Wed,  8 Feb 2023 11:24:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D7344171B;
	Wed,  8 Feb 2023 11:24:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D7344171B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 417B81BF3A4
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 11:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A7E48176D
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 11:24:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A7E48176D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rzTr072OK4Le for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 11:24:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D306181756
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D306181756
 for <buildroot@busybox.net>; Wed,  8 Feb 2023 11:24:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AC5ABFF804;
 Wed,  8 Feb 2023 11:24:11 +0000 (UTC)
Date: Wed, 8 Feb 2023 12:24:10 +0100
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230208122410.51ea30e5@windsurf>
In-Reply-To: <20221126180016.280061-1-francois.perrad@gadz.org>
References: <20221126180016.280061-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675855452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aeK4wiD4MvgNnoiwKXOmuIzBJ+1W9/JqAIySf4o2JCo=;
 b=ctw2Nuz3sCaYTutt7lTKDkdT21p3bcqy3l2KhAWQ7rsFeHMSMgqQukQZYL9vdDXgBvQeVt
 RY/F1VqF7OgU+2cVCCGmeYC2wdBWIb13f0ItqLyK7EGF90EJzuRiMTidsOjatVDQBFBLmZ
 s9LAk9wZuIaC+9VTCv20jsiAKT0K8zwXGLvLkLYCVcwjz3+I7tC+6hm7lRyzcdj9p7TbUC
 29tHZMWtD/Lk3pYh3QVECcRQsvYabdu+3gVtC3uPspxTZIoc8irYKbtMfj2mBcFOFCGL7p
 k4xB2kMv+jR3hM/7Cjp0IrYMG2q3xGGcNcIN9pzdp+gadGQ7AGB+Q3aOak+/Jg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ctw2Nuz3
Subject: Re: [Buildroot] [PATCH 1/2] configs/olimex_stmp157: bump Linux and
 U-Boot
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 26 Nov 2022 19:00:15 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  configs/olimex_stmp157_olinuxino_lime_defconfig | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Both patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
