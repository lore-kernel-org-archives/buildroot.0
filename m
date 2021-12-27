Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A55C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 08:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7D8E4019D;
	Mon, 27 Dec 2021 08:58:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UZ0vaUkfaBIc; Mon, 27 Dec 2021 08:58:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D213404C5;
	Mon, 27 Dec 2021 08:58:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D33141BF36A
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 08:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C23798135B
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 08:57:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C_kKt1mpmjIj for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 08:57:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A6C8281355
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 08:57:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id B48CF24000A;
 Mon, 27 Dec 2021 08:57:54 +0000 (UTC)
Date: Mon, 27 Dec 2021 09:57:54 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Message-ID: <20211227095754.16d3c31f@windsurf>
In-Reply-To: <20211227072344.16697-1-jcmvbkbc@gmail.com>
References: <20211227072344.16697-1-jcmvbkbc@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/coreutils: drop
 gl_cv_func_fstatat_zero_flag=no from config env
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

On Sun, 26 Dec 2021 23:23:44 -0800
Max Filippov <jcmvbkbc@gmail.com> wrote:

> Configuring coreutils with gl_cv_func_fstatat_zero_flag=no results in
> non-functional lchmod library function which causes 'mkfifo -m' to
> always complete with the message 'cannot set permissions of ...: Invalid
> argument' and an error exit code. gl_cv_func_fstatat_zero_flag=no is not
> needed when building coreutils-9.0 for linux and its setting should be
> correctly determined by the configure script.
> Drop gl_cv_func_fstatat_zero_flag=no from the coreutils configure
> environment.
> 
> For more details see
> https://lists.buildroot.org/pipermail/buildroot/2021-December/631388.html
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  package/coreutils/coreutils.mk | 1 -
>  1 file changed, 1 deletion(-)

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
