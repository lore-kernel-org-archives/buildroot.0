Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5BFC433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 21:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8F5081A3B;
	Fri,  7 Jan 2022 21:07:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aFKyslqs2U3m; Fri,  7 Jan 2022 21:07:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D7C7819F5;
	Fri,  7 Jan 2022 21:07:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B71751BF35A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A68E9410E8
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:07:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cp5BsKd6KCT8 for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 21:07:15 +0000 (UTC)
X-Greylist: delayed 03:11:11 by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB4764035E
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 21:07:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 9B441C000A;
 Fri,  7 Jan 2022 21:07:12 +0000 (UTC)
Date: Fri, 7 Jan 2022 22:07:11 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Florian Larysch <fl@n621.de>
Message-ID: <20220107220711.2352f527@windsurf>
In-Reply-To: <20201204174507.8483-1-fl@n621.de>
References: <20201204174507.8483-1-fl@n621.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/avahi: allow disabling default
 services
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

Hello Florian,

On Fri,  4 Dec 2020 18:45:08 +0100
Florian Larysch <fl@n621.de> wrote:

> By default, Avahi installs service definitions for SSH and SFTP, but
> those might not be present on all systems. Add an option for disabling
> them.
> 
> As there is no way to tell the Avahi package not to install the service
> files in the first place, we have to manually remove them from the
> target directory.
> 
> Signed-off-by: Florian Larysch <fl@n621.de>
> ---
>  package/avahi/Config.in | 8 ++++++++
>  package/avahi/avahi.mk  | 9 +++++++++
>  2 files changed, 17 insertions(+)

I have finally applied this patch! With some changes:

 * I made the option default to disabled, following the discussion that
   took place

 * Fixed some formatting issues reported by "make check-package"

 * Used a make foreach loop instead of a shell for loop

 * Used $(...) to refer to the make variable instead of ${...}

Thanks a lot, and sorry for the long delay!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
