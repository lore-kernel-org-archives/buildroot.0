Return-Path: <SRS0=Itk9=PT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB33CC433F5
	for <buildroot@archiver.kernel.org>; Sun, 31 Oct 2021 17:42:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FB4460FC1
	for <buildroot@archiver.kernel.org>; Sun, 31 Oct 2021 17:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5FB4460FC1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31B8560727;
	Sun, 31 Oct 2021 17:42:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gQZwWX6boyET; Sun, 31 Oct 2021 17:42:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9FC26067D;
	Sun, 31 Oct 2021 17:42:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 367B11BF39F
 for <buildroot@lists.busybox.net>; Sun, 31 Oct 2021 17:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25BCB6067D
 for <buildroot@lists.busybox.net>; Sun, 31 Oct 2021 17:42:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iQnv6qciNNJ7 for <buildroot@lists.busybox.net>;
 Sun, 31 Oct 2021 17:42:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1EE1D6058F
 for <buildroot@buildroot.org>; Sun, 31 Oct 2021 17:42:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 676331C0002;
 Sun, 31 Oct 2021 17:42:01 +0000 (UTC)
Date: Sun, 31 Oct 2021 18:42:00 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20211031184200.12836d56@windsurf>
In-Reply-To: <20211030234650.939616-1-giulio.benetti@benettiengineering.com>
References: <20211030234650.939616-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 0/6] configs/olimex_*: fix uboot build
 failure on gitlab jobs
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>, Leon Anavi <leon.anavi@konsulko.com>,
 Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sun, 31 Oct 2021 01:46:44 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Giulio Benetti (6):
>   configs/olimex_a10_olinuxino: uboot 2021.10 needs openssl and python3
>   configs/olimex_a13_olinuxino: uboot 2021.10 needs openssl, pylibfdt
>     and python3
>   configs/olimex_a20_olinuxino_lime2: uboot 2021.10 needs openssl
>   configs/olimex_a20_olinuxino_lime: uboot 2021.10 needs openssl
>   configs/olimex_a20_olinuxino_micro: uboot 2021.10 needs openssl,
>     pylibfdt and python3
>   configs/olimex_a33_olinuxino: uboot 2021.10 needs openssl and python3

I've applied the entire series, but I changed something: the options in
a defconfig are not sorted alphabetically, but they are sorted in their
"natural" order in a defconfig (when generated with "make
savedefconfig").

Of course, those hand-edited defconfigs, with extra comments, makes
using "make savedefconfig" bit less convenient, but still I think we
should follow the ordering of option that "make savedefconfig"
provides, which is based on the ordering of options in Config.in files.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
