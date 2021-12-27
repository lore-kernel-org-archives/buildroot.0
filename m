Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C91EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 20:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C085C40227;
	Mon, 27 Dec 2021 20:03:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CYINWkr2nQZJ; Mon, 27 Dec 2021 20:03:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B454C404D0;
	Mon, 27 Dec 2021 20:03:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 283471BF8B4
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 20:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2507F60A99
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 20:02:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nKixm2GG93uN for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 20:02:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 12C9E60A93
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 20:02:53 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id F069B200003;
 Mon, 27 Dec 2021 20:02:51 +0000 (UTC)
Date: Mon, 27 Dec 2021 21:02:51 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211227210251.2ae8385e@windsurf>
In-Reply-To: <20211227124720.1511041-1-fontaine.fabrice@gmail.com>
References: <20211227124720.1511041-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/procps-ng: bump to version
 3.3.17
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

On Mon, 27 Dec 2021 13:47:20 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Update indentation in hash file (two spaces)
> - Disable w on musl to avoid a build failure:
>   https://gitlab.com/procps-ng/procps/-/issues/193
> 
> https://gitlab.com/procps-ng/procps/-/blob/v3.3.17/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-configure-Add--disable-w.patch       | 93 +++++++++++++++++++
>  ...ssing-nl_langinfo-on-certain-configs.patch | 34 +++++++
>  package/procps-ng/procps-ng.hash              | 12 +--
>  package/procps-ng/procps-ng.mk                | 11 ++-
>  4 files changed, 143 insertions(+), 7 deletions(-)
>  create mode 100644 package/procps-ng/0001-configure-Add--disable-w.patch
>  create mode 100644 package/procps-ng/0002-escape-c-Fix-missing-nl_langinfo-on-certain-configs.patch

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
