Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D47C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 10:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6694081B9D;
	Sun, 26 Dec 2021 10:47:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N9Z4UZSKHMQf; Sun, 26 Dec 2021 10:47:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDBB48141C;
	Sun, 26 Dec 2021 10:47:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 03D7D1BF476
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 10:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00B0D402DD
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 10:47:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hIHhCvppexjb for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 10:47:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1B2540216
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 10:47:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id B1BBC100004;
 Sun, 26 Dec 2021 10:47:00 +0000 (UTC)
Date: Sun, 26 Dec 2021 11:46:59 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211226114659.57a1a649@windsurf>
In-Reply-To: <20211225183338.188793-1-fontaine.fabrice@gmail.com>
References: <20211225183338.188793-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/lttng-libust: fix legal-info
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

On Sat, 25 Dec 2021 19:33:38 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> COPYING has been removed since version 2.13.0 and
> https://github.com/lttng/lttng-ust/commit/c0c0989ab70574e09b2f7e8b48c2da6af664a849
> resulting in the following build failure since bump to version 2.13.1 in
> commit 733bf73e3ff86dd80e68e22c0ccc2f43e4a3d475:
> 
> ERROR: COPYING has wrong sha256 hash:
> ERROR: expected: 74125a84c2166300776980166e29de40d5f98d1a75e487f0bbc0c03b4cd2342e
> ERROR: got     :
> 
> So use the new license files, add BSD-3-Clause (which was added in
> version 2.13.0 and
> https://github.com/lttng/lttng-ust/commit/d8621b3ea82b7fc1937b0eefb2b1316b2ce361a5)
> and don't add BSD-2-Clause and GPL-3.0+ as tests are disabled
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/470d6401f2a97f4ac91b2d8cfb1af90b638320a9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/lttng-libust/lttng-libust.hash | 8 ++++++--
>  package/lttng-libust/lttng-libust.mk   | 4 ++--
>  2 files changed, 8 insertions(+), 4 deletions(-)

Applied to master, thanks. I should have been more careful when merging
the version bump, I guess. Thanks for fixing!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
