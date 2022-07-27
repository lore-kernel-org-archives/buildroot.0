Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9C8C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 14:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 789AA405CF;
	Wed, 27 Jul 2022 14:39:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 789AA405CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6bStpPFXEQtG; Wed, 27 Jul 2022 14:39:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABD644013E;
	Wed, 27 Jul 2022 14:39:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABD644013E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E28B1BF4E4
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 295574013E
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:39:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 295574013E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HNDAiCU-kF6n for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 14:39:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12AA14013D
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 12AA14013D
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 14:39:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9F6051BF209;
 Wed, 27 Jul 2022 14:39:15 +0000 (UTC)
Date: Wed, 27 Jul 2022 16:39:14 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220727163914.3326711b@windsurf>
In-Reply-To: <20220205180817.2103343-3-bernd.kuhls@t-online.de>
References: <20220205180817.2103343-1-bernd.kuhls@t-online.de>
 <20220205180817.2103343-3-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658932756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZdBq+SbuGOpYVF9UKCj2X+fEVcKYf7ZpQvJdxGb4hSc=;
 b=Z3EH+pXCbFCPi1lEzYFMZpd60CDF2WFTwTJ/4uHZwlbk1F4oKGkKMzmojwYYocmSHzt8uR
 3wZRuqk/mpjKQB5+YGAmNurPhjrBnvdz6F7NkDT0C9WkVrCNdAXoupKH/rDXUzpXa9Rins
 DhQ1VGDWQTd4+o3zkhkkAQczCk9nqkSwNmg/VU2MLxrZI5UNHf1ftQ4Tn8FCEA7U3YnU+O
 nrhonQpcTY74K4qsTfYQkK+W6nozXXsXJrsSTONqZQLTNUd6uKp1Y8U/HuCGTcatlxji4i
 0Yvln+C2hBnyTvUH8xQlgfdhpOUat2s2xjsuN8W1VM5sDSNHPfZEkxcObz5D9g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Z3EH+pXC
Subject: Re: [Buildroot] [PATCH 3/3] package/libutp: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  5 Feb 2022 19:08:17 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Needed for upcoming version bump of transmission.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> Build test using this defconfig

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
