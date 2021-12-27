Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A6EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 21:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35BA6817A5;
	Mon, 27 Dec 2021 21:23:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qL-xAyCR-Qt6; Mon, 27 Dec 2021 21:23:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A75A6812DD;
	Mon, 27 Dec 2021 21:23:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 15C901BF35D
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 21:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00B774035A
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 21:23:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I1cBlZqPwgP9 for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 21:23:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CCA9F4033C
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 21:23:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 71697100003;
 Mon, 27 Dec 2021 21:23:01 +0000 (UTC)
Date: Mon, 27 Dec 2021 22:23:00 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211227222300.39c18ae6@windsurf>
In-Reply-To: <20211227145613.1969182-1-fontaine.fabrice@gmail.com>
References: <20211227145613.1969182-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/poppler: bump to version 21.12.0
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 27 Dec 2021 15:56:13 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch (not needed since
>   https://gitlab.freedesktop.org/poppler/poppler/-/commit/47de887d7658cfd68df44b3acf710971054f957b)
> - Disable gperf (added with
>   https://gitlab.freedesktop.org/poppler/poppler/-/commit/22a334bbf55c900b3efff12a3a676bd14b18decd)
> - Disable manual tests (added with
>   https://gitlab.freedesktop.org/poppler/poppler/-/commit/db1bf17777068a34e7586236efefb74a42460932)
> - Disable Qt6 (added with
>   https://gitlab.freedesktop.org/poppler/poppler/-/commit/e225b4b804881de02a5d1beb3f3f908a8f8ddc3d)
> - Use ENABLE_BOOST (added with
>   https://gitlab.freedesktop.org/poppler/poppler/-/commit/26f8a7d1bc9c6cd511989d74fdb54f233b25d663)
> - C++17 is mandatory since
>   https://gitlab.freedesktop.org/poppler/poppler/-/commit/3f8b9e92aade630b90943fd3936bdaa089e0603d
> - Update indentation in hash file (two spaces)
> 
> https://gitlab.freedesktop.org/poppler/poppler/-/blob/poppler-21.12.0/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...pler-private.h-fix-build-with-gcc-11.patch | 48 -------------------
>  package/poppler/Config.in                     |  4 +-
>  package/poppler/poppler.hash                  |  4 +-
>  package/poppler/poppler.mk                    | 11 ++++-
>  4 files changed, 13 insertions(+), 54 deletions(-)
>  delete mode 100644 package/poppler/0001-glib-poppler-private.h-fix-build-with-gcc-11.patch

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
