Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8C1C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 10:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C37F9606B6;
	Sun,  5 Dec 2021 10:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2rB11IaLLpyh; Sun,  5 Dec 2021 10:09:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51C1060686;
	Sun,  5 Dec 2021 10:09:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F0D861BF283
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 10:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0FFC82A26
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 10:09:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tD5mrdtfTYlJ for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 10:09:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF6AE82A17
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 10:09:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 3D02E1C0003;
 Sun,  5 Dec 2021 10:09:25 +0000 (UTC)
Date: Sun, 5 Dec 2021 11:09:24 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20211205110924.0b1ac025@windsurf>
In-Reply-To: <20211205072901.858343-1-bernd.kuhls@t-online.de>
References: <20211205072901.858343-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH/next 1/1] package/linux-pam: bump version to
 1.5.2
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  5 Dec 2021 08:29:01 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed patches which were applied upstream.
> 
> Release notes:
> https://github.com/linux-pam/linux-pam/releases/tag/v1.5.2
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...0001-configure-test-a-o-is-not-POSIX.patch |  75 ---------
>  ...002-Remove-support-for-legacy-xcrypt.patch | 149 ------------------
>  ...x-build-with-libxcrypt-and-uclibc-ng.patch |  47 ------
>  ...o-search-libcrypt-through-pkg-config.patch |  55 -------
>  package/linux-pam/linux-pam.hash              |   4 +-
>  package/linux-pam/linux-pam.mk                |   4 +-
>  6 files changed, 3 insertions(+), 331 deletions(-)
>  delete mode 100644 package/linux-pam/0001-configure-test-a-o-is-not-POSIX.patch
>  delete mode 100644 package/linux-pam/0002-Remove-support-for-legacy-xcrypt.patch
>  delete mode 100644 package/linux-pam/0003-configure.ac-fix-build-with-libxcrypt-and-uclibc-ng.patch
>  delete mode 100644 package/linux-pam/0004-configure.ac-also-search-libcrypt-through-pkg-config.patch

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
