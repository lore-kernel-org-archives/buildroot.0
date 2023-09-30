Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A41FBE77363
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 15:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D0674159D;
	Sat, 30 Sep 2023 15:31:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D0674159D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gvblpf1ndCN0; Sat, 30 Sep 2023 15:31:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85BEC41598;
	Sat, 30 Sep 2023 15:31:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85BEC41598
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D07F1BF5AE
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 15:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6BD9818A2
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 15:31:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6BD9818A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NcRVbPKSA9h3 for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 15:31:51 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7FE9A8187F
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 15:31:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FE9A8187F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E6BEE0004;
 Sat, 30 Sep 2023 15:31:47 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qmbwY-00F1S6-It; Sat, 30 Sep 2023 17:31:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcin Niestroj <m.niestroj@grinn-global.com>
References: <20230918064711.1379428-1-m.niestroj@grinn-global.com>
Date: Sat, 30 Sep 2023 17:31:46 +0200
In-Reply-To: <20230918064711.1379428-1-m.niestroj@grinn-global.com> (Marcin
 Niestroj's message of "Mon, 18 Sep 2023 08:47:11 +0200")
Message-ID: <87a5t3ad99.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] board: add Orangepi Zero3 support
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
Cc: Sergey Kuzminov <kuzminov.sergey81@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Marcin" == Marcin Niestroj <m.niestroj@grinn-global.com> writes:

 > Add initial support for Orangepi Zero3 board:
 > - U-Boot 2021.07 fork by Orangepi
 > - Linux 6.1.31 fork by Orangepi
 > - Default packages from buildroot

 > Enable CONFIG_MFD_AC200 as it is used directly by other module,
 > resulting in build failure when disabled.

 > Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
 > ---
 > v1 -> v2:
 >  * use 'linux_sunxi64' instead of default arch defconfig, which fixes
 >    ethernet networking (suggested by Sergey)
 >  * disabled rootfs.tar generation (suggested by Sergey)
 >  * increased ext2 fs size to 180M to fit more kernel modules
 >  * added DEVELOPERS entries for board files

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
