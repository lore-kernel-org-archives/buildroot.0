Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B01C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 20:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0623401F4;
	Sat,  4 Dec 2021 20:24:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uYDs1WfWv_om; Sat,  4 Dec 2021 20:24:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 250ED401DD;
	Sat,  4 Dec 2021 20:24:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4DC2C1BF861
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 20:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C522401F6
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 20:24:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c04FvL7OLfai for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 20:24:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F9BB40156
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 20:24:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 5D5D2200002;
 Sat,  4 Dec 2021 20:24:20 +0000 (UTC)
Date: Sat, 4 Dec 2021 21:24:19 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Message-ID: <20211204212419.3a381d4f@windsurf>
In-Reply-To: <20211129165001.363636-1-gwenj@trabucayre.com>
References: <20211129165001.363636-1-gwenj@trabucayre.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH/next 1/2] package/gnuradio: force python3-six
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 29 Nov 2021 17:50:00 +0100
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> host-python-six needs host-python (aka python2) but since
> commit e9df5b0fc3f6e8bb36deedefb392bbc968116ee7 python-mako is
> python3 only. python-six is build using python2 and python-mako with
> python3 and gnuradio build fails with:
> 
> -- Python checking for python >= 2.7
> -- Python checking for python >= 2.7 - found
> --
> -- Python checking for mako >= 0.4.2
> -- Python checking for mako >= 0.4.2 - not found
> 
> This patch force the use of host-python3-six to be coherent
> 
> Fixes:
> - http://autobuild.buildroot.net/results/2685fb00883e6936e24ca1f17b693e6e1c13c9fa
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  package/gnuradio/gnuradio.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
