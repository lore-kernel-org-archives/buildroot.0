Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C140BC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 14:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7144982339;
	Sat,  4 Nov 2023 14:07:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7144982339
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2n82BMD0OELv; Sat,  4 Nov 2023 14:07:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB3868232F;
	Sat,  4 Nov 2023 14:07:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB3868232F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9BD2C1BF2AB
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 14:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63F1441E09
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 14:07:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63F1441E09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xz9YU76AEN3f for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 14:07:29 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 27B8141DFA
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 14:07:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27B8141DFA
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC4E0C0006;
 Sat,  4 Nov 2023 14:07:25 +0000 (UTC)
Date: Sat, 4 Nov 2023 15:07:24 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20231104150724.32909d8e@windsurf>
In-Reply-To: <20231013210841.153788-1-giulio.benetti@benettiengineering.com>
References: <20231013210841.153788-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699106846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7rmvmJYrPT0GtWO+zw/OjNKlqU5my5ZF3ZH70oZ6Lpk=;
 b=VR54TbY+q32UTfQnBugaQOE3FsKgQ6MT13HmOM/VamMsmWQtBld5wpHeGNk/iLs96JyGCP
 e6/1ejDpRoMgu7BjahFZw17iVt7pb0qw3vahiTw9faAzTbKDSYN2LLA4ofI0hIYZcJXzXY
 Apl7DSZXLzDkyibsmQ5nz4JDVmvGRlmkYI6M3UeFEkRkf4mvTgUi6Uu5J8b4Y8oQXQGOzm
 5SpymnZAr9+8GCRFomLh/388WpetOzuUtFHM54C8DuMEwd23T9i7xwqERX/DEuC2PeVWdL
 1jUIlTuMveYcxEgwbiPByTwUiAiqbYyVG6kpV5nxPf7o8BTyo3bQOcjLDI14uw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VR54TbY+
Subject: Re: [Buildroot] [PATCH 1/2] board/bananapi/bananapi-m2-berry:
 switch to use extlinux.conf
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 13 Oct 2023 23:08:40 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> While switching bump Linux version to 6.1.57 and U-Boot version to
> 2023.10.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  board/bananapi/bananapi-m2-berry/boot.cmd      |  7 -------
>  board/bananapi/bananapi-m2-berry/extlinux.conf |  4 ++++
>  board/bananapi/bananapi-m2-berry/genimage.cfg  | 18 ------------------
>  board/bananapi/bananapi-m2-berry/post-build.sh |  5 +++++
>  configs/bananapi_m2_berry_defconfig            |  9 ++++-----
>  5 files changed, 13 insertions(+), 30 deletions(-)
>  delete mode 100644 board/bananapi/bananapi-m2-berry/boot.cmd
>  create mode 100644 board/bananapi/bananapi-m2-berry/extlinux.conf
>  create mode 100755 board/bananapi/bananapi-m2-berry/post-build.sh

Series applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
