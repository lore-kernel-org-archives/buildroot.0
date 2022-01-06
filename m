Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB67C433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 21:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCE284298F;
	Thu,  6 Jan 2022 21:06:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UKhoP7WnfU4N; Thu,  6 Jan 2022 21:06:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1225F4298B;
	Thu,  6 Jan 2022 21:06:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 279E51BF38A
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 240E781329
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:06:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qp_ZRhl2NKR7 for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 21:06:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2927B81250
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 21:06:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 0654360002;
 Thu,  6 Jan 2022 21:06:00 +0000 (UTC)
Date: Thu, 6 Jan 2022 22:05:59 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20220106220559.68509598@windsurf>
In-Reply-To: <20211010234655.585526-1-christian@paral.in>
References: <20211010234655.585526-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH-NEXT v3 1/6] support/download/dl-wrapper:
 add concept of download post-processing
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
Cc: Anisse Astier <anisse@astier.eu>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 10 Oct 2021 16:46:50 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> In order to support package managers such as Cargo (Rust) or Go, we
> want to run some custom logic after the main download, but before
> packing the tarball and checking the hash.
> 
> To implement this, this commit introduces a concept of download
> post-processing: if -p <something> is passed to the dl-wrapper, then
> support/download/<something>-post-process will be called.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  support/download/dl-wrapper | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

I have marked this patch series as Superseded, as I have posted:

  https://patchwork.ozlabs.org/project/buildroot/list/?series=279698

which replaces it.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
