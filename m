Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F3EC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 10:38:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1E0A61104
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 10:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A1E0A61104
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AE2360766;
	Sat,  7 Aug 2021 10:38:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7j7W7cNCKDxX; Sat,  7 Aug 2021 10:38:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1DFA60729;
	Sat,  7 Aug 2021 10:38:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3AF501BF2F6
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 10:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D92BA83A1C
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 10:38:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Dr5ycgsXIeC for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 10:38:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D7F483A4F
 for <buildroot@busybox.net>; Sat,  7 Aug 2021 10:38:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 490E6FF804;
 Sat,  7 Aug 2021 10:38:26 +0000 (UTC)
Date: Sat, 7 Aug 2021 12:38:24 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <20210807123824.7f186634@windsurf>
In-Reply-To: <6c91caa7-cd14-38e0-2c0c-f84a534b62a8@grenoble.cnrs.fr>
References: <6c91caa7-cd14-38e0-2c0c-f84a534b62a8@grenoble.cnrs.fr>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] configs/acmesystems_acqua_a5_*: bump
 at91bootstrap3 version
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot mailing list <buildroot@busybox.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Fri, 6 Aug 2021 15:14:14 +0200
Edgar Bonet <bonet@grenoble.cnrs.fr> wrote:

> AT91Bootstrap 3.10.2 has a bug in its Makefile:[1] it gives the
> -nostartfiles flag to the ld command, although this is a gcc flag, not
> an ld flag. The bug happens to be harmless when using binutils 2.35.
> However, the ld shipped with binutils 2.36 is more strict in its option
> parsing, and fails with the following error:
> 
>     .../output/host/bin/arm-buildroot-linux-uclibcgnueabihf-ld:
>     Error: unable to disambiguate: -nostartfiles
>     (did you mean --nostartfiles ?)
> 
> The bug was fixed upstream in commit 3207586a.[2] However, since there
> has been no tagged 3.x release since then, we just upgrade to the
> current head of the branch at91bootstrap-3.x.
> 
> [1] https://github.com/linux4sam/at91bootstrap/issues/127
> [2] https://github.com/linux4sam/at91bootstrap/commit/3207586a79aba527bbf20560930089b800f191ac
> 
> Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
> ---
>  configs/acmesystems_acqua_a5_256mb_defconfig | 2 +-
>  configs/acmesystems_acqua_a5_512mb_defconfig | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

I have added references to the Gitlab CI failures in the commit log,
and applied. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
