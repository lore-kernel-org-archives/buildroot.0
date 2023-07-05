Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4DAEB64DD
	for <buildroot@archiver.kernel.org>; Wed,  5 Jul 2023 08:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 172AA4155B;
	Wed,  5 Jul 2023 08:42:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 172AA4155B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id heO-qmO3IdIH; Wed,  5 Jul 2023 08:42:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21B9B4091F;
	Wed,  5 Jul 2023 08:42:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21B9B4091F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EA1D61BF33A
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 08:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C408540526
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 08:42:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C408540526
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1uExDDC5frl7 for <buildroot@lists.busybox.net>;
 Wed,  5 Jul 2023 08:42:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EB77404B0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2EB77404B0
 for <buildroot@buildroot.org>; Wed,  5 Jul 2023 08:42:38 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 70255BDE4C6A;
 Wed,  5 Jul 2023 10:42:35 +0200 (CEST)
MIME-Version: 1.0
Date: Wed, 05 Jul 2023 08:42:35 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
In-Reply-To: <20230705062142.10968-1-kilian.zinnecker@mail.de>
References: <c30c93e29177a1dc15446eff427c7ca8@umbiko.net>
 <20230705062142.10968-1-kilian.zinnecker@mail.de>
Message-ID: <1e1cf80f94a28da80bdc7b0fd2dba6eb@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.8 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1688546555; bh=fKrY6oQh1bAxHbZ8jIr9XUBjIoqgtcZe19J2eNV5tMk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=5CScei/QM33go/S+x03Ce++sU+3BkA6Isax6qsvGgOa0wmuri0abVqgs8YJ2nmz++
 RJ453bqRNuWtNF59PO+iVBez6zZzmOaCEjNhCHOi54WEg1RMRQmq1/IxCPPSSI5aJl
 z4Z0AcouTIEqm5w4cigI9EzvgyzMi3NtpIi1ySYM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=umbiko.net header.i=@umbiko.net
 header.a=rsa-sha256 header.s=mail header.b=5CScei/Q
Subject: Re: [Buildroot] [PATCH v3 1/3] package: add rockchip-rkbin package
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Kilian, all

...
> Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
...

[v3 1-3]
Reviewed-by: Andreas Ziegler <br015@umbiko.net>
Tested-by: Andreas Ziegler <br015@umbiko.net>
	build test only, (l)ubuntu 22.04.02 LTS on qemu-system-x86_64

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
