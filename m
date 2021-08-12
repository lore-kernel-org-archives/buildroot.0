Return-Path: <SRS0=gEIP=ND=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D1FC4338F
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 21:52:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 922D56104F
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 21:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 922D56104F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6169980DD6;
	Thu, 12 Aug 2021 21:52:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gdtrIwXhe7ol; Thu, 12 Aug 2021 21:52:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA51280E58;
	Thu, 12 Aug 2021 21:52:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0D2381BF354
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 21:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08B364023D
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 21:51:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vkYHuF9rrZEe for <buildroot@lists.busybox.net>;
 Thu, 12 Aug 2021 21:51:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 185B0401D3
 for <buildroot@buildroot.org>; Thu, 12 Aug 2021 21:51:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id DAE6E1C0003;
 Thu, 12 Aug 2021 21:51:32 +0000 (UTC)
Date: Thu, 12 Aug 2021 23:51:31 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210812235131.0824e869@windsurf>
In-Reply-To: <20210809085426.809613-1-fontaine.fabrice@gmail.com>
References: <20210809085426.809613-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/qemu: add libfuse3 optional
 dependency
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Mon,  9 Aug 2021 10:54:26 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libfuse3 is an optional dependency which is enabled by default since
> version 6.0.0 and
> https://gitlab.com/qemu-project/qemu/-/commit/0c9b70d5900a5108e899edfdd6f3790f8cb6bdc2
> 
> So add this dependency and fix the following build failures on musl
> raised since bump to version 6.0.0 in commit
> 6b86c9335fc3ff381878156c6243454d4b688df9:
> 
> ../block/export/fuse.c: In function 'fuse_fallocate':
> ../block/export/fuse.c:563:23: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
>   563 |     } else if (mode & FALLOC_FL_ZERO_RANGE) {
>       |                       ^~~~~~~~~~~~~~~~~~~~
> ../block/export/fuse.c:563:23: note: each undeclared identifier is reported only once for each function it appears in
> ../block/export/fuse.c: In function 'fuse_lseek':
> ../block/export/fuse.c:639:19: error: 'SEEK_HOLE' undeclared (first use in this function)
>   639 |     if (whence != SEEK_HOLE && whence != SEEK_DATA) {
>       |                   ^~~~~~~~~
> ../block/export/fuse.c:639:42: error: 'SEEK_DATA' undeclared (first use in this function); did you mean 'SEEK_SET'?
>   639 |     if (whence != SEEK_HOLE && whence != SEEK_DATA) {
>       |                                          ^~~~~~~~~
>       |                                          SEEK_SET
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/0196609043bd37543e6a0d17ffc2254302ea7ba3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...5-block-export-fuse.c-fix-musl-build.patch | 46 +++++++++++++++++++
>  package/qemu/qemu.mk                          | 13 ++++++
>  2 files changed, 59 insertions(+)
>  create mode 100644 package/qemu/0005-block-export-fuse.c-fix-musl-build.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
