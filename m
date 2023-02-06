Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720C4C61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 09:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BFFC4036F;
	Mon,  6 Feb 2023 09:46:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BFFC4036F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p-29fGQWvaFS; Mon,  6 Feb 2023 09:46:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E1EB40328;
	Mon,  6 Feb 2023 09:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E1EB40328
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C9FD91BF470
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 09:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8630781769
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 09:46:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8630781769
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9vPUxMXW0xbh for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 09:46:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AED381757
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2AED381757
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 09:46:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BFC4A60005;
 Mon,  6 Feb 2023 09:46:35 +0000 (UTC)
Date: Mon, 6 Feb 2023 10:46:35 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230206104635.3032742a@windsurf>
In-Reply-To: <20230205212521.903480-1-giulio.benetti@benettiengineering.com>
References: <20230205131559.6f79944f@windsurf>
 <20230205212521.903480-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675676797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oGO5m7cuicEfUJ4JHxNg8NKfDq3cwqq1EG0TfcVK8dg=;
 b=LCsUJpM1BwUcX4chWHA1VEiW2FFejLzClHn2dzZQGbQAeBz+DZz/Bx/2cE4IimHG4mWOiN
 zDnhLdnolrOlbaPRQNnbRM+pJJpOTmb7NL2cLqcvP57JXnfzPN9mOFh5LIXzKT6ZBVwBnO
 XaRjuKHtQlTMFVE+u9O4pjTi5p7mxBmXpWJcmzQWJGwCTfA3NnufaPdBuK+n64AtmoubNs
 TK3UymZgFEVqv9CKoDCtai/Zn4M5tqwfQ0qCkxTK3JcSowz2KgOPq9QqcRKGXqqhEoxiFD
 DUR3iPIMPjK+XXjdiXNauBbPPUpvAKuwTjHI4Umz0gXsm6WfNIaJ5G/7qZXAoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LCsUJpM1
Subject: Re: [Buildroot] [PATCH v2] toolchain/Config.in: extend gcc bug
 43744 to every sh architecture
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  5 Feb 2023 22:25:21 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Gcc bug 43744 affects seems to affect all SH family because it already
> affects:
> 1) sh4, here you can find a buildroot defconfig that fails to build:
> http://autobuild.buildroot.net/results/1db/1db6c59c98e3c09fa13277076ee2fbe7967f1f6b/defconfig
> 2) sh4a, here you can find a buildroot defconfig that fails to build:
> http://autobuild.buildroot.net/results/cf272cdc5be2faf4070de3d235ec7a0f7190867a/defconfig
> Note also that gcc bugzilla entry reports the bug for SH and not for
> sub-architectures:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=43744
> 
> So let's extend the bug to BR2_sh to match the entire SH architecture.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * add a commit log with details about gcc bug 43744 as pointed by Thomas Petazzoni
> ---
>  toolchain/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
