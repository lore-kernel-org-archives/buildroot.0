Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4ADC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 20:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D8F982F50;
	Sat,  4 Dec 2021 20:05:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iai5F7RNE4Ee; Sat,  4 Dec 2021 20:05:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D549582F13;
	Sat,  4 Dec 2021 20:05:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 485801BF334
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 20:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38BCF60A80
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 20:05:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8dXOIRURNwbk for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 20:05:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 16E9C60A7C
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 20:05:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id B8C701C0004;
 Sat,  4 Dec 2021 20:05:00 +0000 (UTC)
Date: Sat, 4 Dec 2021 21:04:59 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20211204210459.461e4f39@windsurf>
In-Reply-To: <20211202013902.1593562-2-troglobit@gmail.com>
References: <20211202013902.1593562-1-troglobit@gmail.com>
 <20211202013902.1593562-2-troglobit@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH next 1/2] package/watchdogd: bump to version
 3.5
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
Cc: Alejandro =?UTF-8?B?R29uesOhbGV6?= <alejandro.gonzalez.correo@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  2 Dec 2021 02:39:01 +0100
Joachim Wiberg <troglobit@gmail.com> wrote:

> This addresses the autobuilder failure for master as per 2021-11-27.
> The root cause was a name clash in a dependency, the libite library,
> clashing with the DirectFB LiTE library header files.  Hence, this
> update alone does not fix [1], libite also needs to be updated.  To
> provide a smooth transition though, watchdogd should be updated first.
> 
> [1]: http://autobuild.buildroot.net/results/185c753af2aa159b494b13f78b0826dddbe4aed6
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>  package/watchdogd/watchdogd.hash | 2 +-
>  package/watchdogd/watchdogd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Thanks, I've applied both to next, as indicated in the patch title.
However, in the commit log, you seem to indicate that it's fixing a
build issue in master. Could you confirm?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
