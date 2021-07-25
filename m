Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E46C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:15:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E13F560F13
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E13F560F13
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB5D581DBF;
	Sun, 25 Jul 2021 21:15:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ONa4X_ZyLFYa; Sun, 25 Jul 2021 21:15:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 224B1832FF;
	Sun, 25 Jul 2021 21:15:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 07DF11BF312
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E822360731
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:15:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gdahp_-rOGXE for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 21:15:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C96BD606F0
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 21:15:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 443D9FF804;
 Sun, 25 Jul 2021 21:15:26 +0000 (UTC)
Date: Sun, 25 Jul 2021 23:15:24 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20210725231524.512d0549@windsurf>
In-Reply-To: <20210725204624.1620567-1-james.hilliard1@gmail.com>
References: <20210725204624.1620567-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libtirpc: add missing
 !BR2_STATIC_LIBS dependency
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Sun, 25 Jul 2021 14:46:24 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/libtirpc/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
> index 1899edefbf..6a900c68c3 100644
> --- a/package/libtirpc/Config.in
> +++ b/package/libtirpc/Config.in
> @@ -10,6 +10,7 @@ config BR2_PACKAGE_LIBTIRPC
>  config BR2_PACKAGE_LIBTIRPC_GSS
>  	bool "gss"
>  	depends on BR2_USE_MMU # libkrb5
> +	depends on !BR2_STATIC_LIBS # libkrb5
>  	depends on BR2_PACKAGE_LIBTIRPC
>  	select BR2_PACKAGE_LIBKRB5
>  	help

Thanks, but a bit more than that is needed:

 (1) A Config.in "comment" in package/libtirpc/Config.in

 (2) The propagation of this "depends on" in places where
     BR2_PACKAGE_LIBTIRPC_GSS is selected, i.e in
     BR2_PACKAGE_NFS_UTILS_GSS. A Config.in comment will be needed as
     well.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
