Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2B7C433F5
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 20:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85A2F401B9;
	Sun, 21 Nov 2021 20:49:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zroPAnplX0-3; Sun, 21 Nov 2021 20:49:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 666B4401BB;
	Sun, 21 Nov 2021 20:49:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DEA0A1BF3EB
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 20:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB84980E19
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 20:49:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LOeCgn10y_wN for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 20:49:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E417E80E12
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 20:49:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 761B01C0005;
 Sun, 21 Nov 2021 20:49:49 +0000 (UTC)
Date: Sun, 21 Nov 2021 21:49:48 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20211121214948.547759ca@windsurf>
In-Reply-To: <20211121065746.196992-1-bernd.kuhls@t-online.de>
References: <20211121065746.196992-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH/next 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 21.3.0
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
Cc: Romain Naour <romain.naour@gmail.com>, "Yann E
 . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 21 Nov 2021 07:57:46 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Add new crocus gallium driver:
> https://cgit.freedesktop.org/mesa/mesa/commit/?id=f3630548f1da904ec6c63b43ece7e68afdb8867e
> 
> Added two patches to fix uClibc-related build errors.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d-headers/mesa3d-headers.mk    |  2 +-
>  package/mesa3d/0006-fix-valist.patch        | 37 +++++++++++++++++++
>  package/mesa3d/0007-fix-cpp-detection.patch | 40 +++++++++++++++++++++
>  package/mesa3d/Config.in                    |  7 ++++
>  package/mesa3d/mesa3d.hash                  |  6 ++--
>  package/mesa3d/mesa3d.mk                    |  3 +-
>  6 files changed, 90 insertions(+), 5 deletions(-)
>  create mode 100644 package/mesa3d/0006-fix-valist.patch
>  create mode 100644 package/mesa3d/0007-fix-cpp-detection.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
