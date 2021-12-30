Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2359CC433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 12:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9257405D8;
	Thu, 30 Dec 2021 12:29:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uWYdzPNUrJu0; Thu, 30 Dec 2021 12:29:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B511A405D2;
	Thu, 30 Dec 2021 12:29:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E57B41BF3EF
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 12:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5080410E9
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 12:28:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zWJFySbe2m4F for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 12:28:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E6314410DC
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 12:28:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 3D24224000C;
 Thu, 30 Dec 2021 12:28:11 +0000 (UTC)
Date: Thu, 30 Dec 2021 13:27:33 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211230132733.13600ba3@windsurf>
In-Reply-To: <20211230090822.1332429-1-fontaine.fabrice@gmail.com>
References: <20211230090822.1332429-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/rt-tests: needs kernel >= 4.5
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

On Thu, 30 Dec 2021 10:08:22 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> rt-tests unconditionally uses CGROUP2_SUPER_MAGIC since
> https://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git/commit/?id=47e857d4bf77440cb59d17c6ed7882a48514f18d
> which is only available since kernel 4.5 and
> https://github.com/torvalds/linux/commit/67e9c74b8a873408c27ac9a8e4c1d1c8d72c93ff
> resulting in the following build failure since bump to version 2.3 in
> commit a952b016263cb9ae5f116dac0b3da4ad93a4c55f:
> 
> src/sched_deadline/cyclicdeadline.c:381:29: error: 'CGROUP2_SUPER_MAGIC' undeclared (first use in this function)
>   ret = mounted(CGROUP_PATH, CGROUP2_SUPER_MAGIC);
>                              ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/74766c215a6cc19cd02faec6181ccd5de49c15cf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/rt-tests/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

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
