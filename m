Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8CEC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 22:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 606D660A7A;
	Sat,  4 Dec 2021 22:11:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jmr4ocvEBOFd; Sat,  4 Dec 2021 22:11:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFE4C606CA;
	Sat,  4 Dec 2021 22:11:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 53DAA1BF3F7
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43B91408D0
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:10:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rtEOar930KhJ for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 22:10:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5934B408C6
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 22:10:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 9A494200007;
 Sat,  4 Dec 2021 22:10:02 +0000 (UTC)
Date: Sat, 4 Dec 2021 23:10:01 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211204231001.78ee97bf@windsurf>
In-Reply-To: <20211123200856.3796314-1-fontaine.fabrice@gmail.com>
References: <20211123200856.3796314-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH/next 1/1] package/libnetfilter_log: bump to
 version 1.0.2
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
Cc: Joris Lijssens <joris.lijssens@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 23 Nov 2021 21:08:56 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patches (already in version) and so autoreconf
> - libmnl is needed since
>   https://git.netfilter.org/libnetfilter_log/commit/?id=d3333c14bf32ceba24aca41c9b272f204b475183
> - Update indentation in hash file (two spaces)
> 
> https://netfilter.org/pub/libnetfilter_log/changes-libnetfilter_log-1.0.2.txt
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libnetfilter_log/0001-uclinux.patch   |  26 -
>  ...e-needed-for-integer-type-definition.patch |  27 -
>  ...0003-src-Use-stdint-types-everywhere.patch | 489 ------------------
>  ...ude-Sync-with-current-kernel-headers.patch | 112 ----
>  package/libnetfilter_log/Config.in            |   1 +
>  .../libnetfilter_log/libnetfilter_log.hash    |   7 +-
>  package/libnetfilter_log/libnetfilter_log.mk  |   5 +-
>  7 files changed, 6 insertions(+), 661 deletions(-)
>  delete mode 100644 package/libnetfilter_log/0001-uclinux.patch
>  delete mode 100644 package/libnetfilter_log/0002-Add-include-needed-for-integer-type-definition.patch
>  delete mode 100644 package/libnetfilter_log/0003-src-Use-stdint-types-everywhere.patch
>  delete mode 100644 package/libnetfilter_log/0004-include-Sync-with-current-kernel-headers.patch

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
