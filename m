Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7DCC352A1
	for <buildroot@archiver.kernel.org>; Sat,  3 Dec 2022 14:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F4E68191E;
	Sat,  3 Dec 2022 14:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F4E68191E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lBnqofUq0vho; Sat,  3 Dec 2022 14:52:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8805A818DC;
	Sat,  3 Dec 2022 14:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8805A818DC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ACF041BF36A
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 14:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A0D44154D
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 14:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A0D44154D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3IDWsLl6Ru9N for <buildroot@lists.busybox.net>;
 Sat,  3 Dec 2022 14:52:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1501A41517
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1501A41517
 for <buildroot@buildroot.org>; Sat,  3 Dec 2022 14:52:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D102D1C0007;
 Sat,  3 Dec 2022 14:52:49 +0000 (UTC)
Date: Sat, 3 Dec 2022 15:52:47 +0100
To: Bagas Sanjaya <bagasdotme@gmail.com>
Message-ID: <20221203155247.428cb5a1@windsurf>
In-Reply-To: <38529777-79a9-dfb5-ec42-b7c37e617281@gmail.com>
References: <38529777-79a9-dfb5-ec42-b7c37e617281@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670079170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uY1qMcfxfxn4S2j2Mm0n6T0/FyLYxCAwyAncZmeRg2w=;
 b=RnkOtQGJ9d5i1o2XqdSeUUkZCynQVqx8p6L9MMJdsHLM9YFjSSXzoYRmcjKSR8AfKzgIK/
 IC1dqoFvQ1SoI+ESsQwuKa4NCiFxVyX/O8PGzWDvE+G5XnqgqtrzDjS5OkXNjctROg1293
 YwtRpJGp+8IkwY3KUGJpbk02dCaOvGW8ykBf8buiVGpC5Tz6Rio6cgd5BIxQFp7jO28xNx
 U4U0wQBFJ9RMvmrLo96pg68lCCcz9hvJhe7gwzSEotKS9onSEcNumEaZu5Z01DU1z9gMMP
 w9MaNDS8zoDchGzwLl9KDw0y/vCV2EDpxIBnm/wl2d5pu9c83fyEhJGkuU4XpA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RnkOtQGJ
Subject: Re: [Buildroot] <PACKAGE>_SOURCE with <PACKAGE>_SITE_METHOD = git
 can result to tar.gz with mismatched file extension
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailman <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

+Yann Morin in Cc.

On Fri, 2 Dec 2022 21:02:06 +0700
Bagas Sanjaya <bagasdotme@gmail.com> wrote:

> Hello,
> 
> I noticed odd behavior when <PACKAGE>_SOURCE is set whereas <PACKAGE>
> is downloaded via git (<PACKAGE>_SITE_METHOD = git).
> 
> For example, I'm trying to bump Git package to commit
> c000d916380bb59db69c78546928eadd076b9c7d (v2.39.0-rc0). On the makefile
> (package/git/git.mk), I bumped by:
> 
> ---- >8 ----  
> diff --git a/package/git/git.mk b/package/git/git.mk
> index dc587170e8..1990bf8e67 100644
> --- a/package/git/git.mk
> +++ b/package/git/git.mk
> @@ -4,9 +4,10 @@
>  #
>  ################################################################################
>  
> -GIT_VERSION = 2.31.4
> +GIT_VERSION = c000d916380bb59db69c78546928eadd076b9c7d
>  GIT_SOURCE = git-$(GIT_VERSION).tar.xz
> -GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
> +GIT_SITE = file:///home/bagas/repo/git-scm
> +GIT_SITE_METHOD = git
>  GIT_LICENSE = GPL-2.0, LGPL-2.1+
>  GIT_LICENSE_FILES = COPYING LGPL-2.1
>  GIT_CPE_ID_VENDOR = git-scm
> 
> (note: I fetch from my local Git project repository, hence file:// URI).
> 
> When I fetch the sources (make source), the generated tarball is actually
> .tar.gz with $(GIT_VERSION) as the filename. This causes extracting the
> tarball to fail. In this case, the tarball is decompressed first with
> xzcat, and it complains due to unrecognized compressed format (gzip
> instead of xz).

I think you're right. We assume that _SOURCE is not defined when a
_SITE_METHOD using a VCS (git, cvs, svn, hg) is used.

I guess we have two options here:

 (1) Detect this situation, and error out, to prevent this situation
 from happening

 (2) Actually support overriding _SOURCE, but in this case, we should
 comply with the specified compression algorithm

Yann, thoughts? (1) seems easier to me, I don't know if the benefits of
(2) are really relevant.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
