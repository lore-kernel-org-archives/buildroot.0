Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC15BC433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 12:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B615827D9;
	Thu, 30 Dec 2021 12:30:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 92aOBl5YKcOp; Thu, 30 Dec 2021 12:30:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D283E827F0;
	Thu, 30 Dec 2021 12:30:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E3F91C1135
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 12:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CE6A60BE8
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 12:28:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D1B1FpIAdd1f for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 12:28:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E14AE60BE9
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 12:28:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 00702240010;
 Thu, 30 Dec 2021 12:28:08 +0000 (UTC)
Date: Thu, 30 Dec 2021 13:27:16 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20211230132716.7acf548c@windsurf>
In-Reply-To: <20211230012836.3350448-2-aduskett@gmail.com>
References: <20211230012836.3350448-1-aduskett@gmail.com>
 <20211230012836.3350448-2-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/3] package/alsa-lib: bump to version 1.2.6
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 29 Dec 2021 17:28:35 -0800
Adam Duskett <aduskett@gmail.com> wrote:

> - Drop upstream patches
> - Add a new patch: 0002-fix-PyTuple_SET_ITEM-usage-no-return-value.patch which
>   fixes python 3.10 compatibility.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  ...Tuple_SET_ITEM-usage-no-return-value.patch | 70 +++++++++++++++++++
>  .../0002-fix-build-with-disable-ucm.patch     | 43 ------------
>  ...3-control-empty-fix-the-static-build.patch | 29 --------
>  package/alsa-lib/alsa-lib.hash                |  2 +-
>  package/alsa-lib/alsa-lib.mk                  |  2 +-
>  5 files changed, 72 insertions(+), 74 deletions(-)
>  create mode 100644 package/alsa-lib/0002-fix-PyTuple_SET_ITEM-usage-no-return-value.patch
>  delete mode 100644 package/alsa-lib/0002-fix-build-with-disable-ucm.patch
>  delete mode 100644 package/alsa-lib/0003-control-empty-fix-the-static-build.patch

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
