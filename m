Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3A1C433F5
	for <buildroot@archiver.kernel.org>; Fri, 24 Dec 2021 17:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12AEB83E09;
	Fri, 24 Dec 2021 17:14:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YOxVK6IhHTlm; Fri, 24 Dec 2021 17:14:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E6E983E05;
	Fri, 24 Dec 2021 17:14:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1866E1BF2A4
 for <buildroot@lists.busybox.net>; Fri, 24 Dec 2021 17:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05D0440125
 for <buildroot@lists.busybox.net>; Fri, 24 Dec 2021 17:14:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P8p_M_x-lB-K for <buildroot@lists.busybox.net>;
 Fri, 24 Dec 2021 17:14:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C175D400DA
 for <buildroot@buildroot.org>; Fri, 24 Dec 2021 17:14:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 671D9FF805;
 Fri, 24 Dec 2021 17:14:08 +0000 (UTC)
Date: Fri, 24 Dec 2021 18:14:07 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Norbert Lange <nolange79@gmail.com>
Message-ID: <20211224181407.5eb7c923@windsurf>
In-Reply-To: <20211223213034.229582-1-nolange79@gmail.com>
References: <20211223213034.229582-1-nolange79@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/lttng-libust: bump to version
 2.13.1
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
Cc: Philippe Proulx <eeppeliteloop@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 23 Dec 2021 22:30:33 +0100
Norbert Lange <nolange79@gmail.com> wrote:

> Add a patch to disable building tests, building the tests can
> fail unless the package is reconfigured.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
> v1 -> v2
> *   recreated patch using git-formatpatch
>     now it is adding a configure option which we use
> ---
>  .../0001-configure.ac-add-disable-tests.patch | 59 +++++++++++++++++++
>  package/lttng-libust/lttng-libust.hash        |  4 +-
>  package/lttng-libust/lttng-libust.mk          |  4 +-
>  3 files changed, 64 insertions(+), 3 deletions(-)
>  create mode 100644 package/lttng-libust/0001-configure.ac-add-disable-tests.patch

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
