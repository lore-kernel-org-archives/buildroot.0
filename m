Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE285C433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 10:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 583D981971;
	Wed, 29 Dec 2021 10:20:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NIT_xovoxDNb; Wed, 29 Dec 2021 10:20:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBADC81842;
	Wed, 29 Dec 2021 10:20:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A2F271BF324
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 10:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E54840128
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 10:20:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UXjl0LtgAXbQ for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 10:20:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 61B1340022
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 10:20:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 701D0240004;
 Wed, 29 Dec 2021 10:20:38 +0000 (UTC)
Date: Wed, 29 Dec 2021 11:20:37 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20211229112037.2e9002dc@windsurf>
In-Reply-To: <20211229095600.212449-1-giulio.benetti@benettiengineering.com>
References: <20211229095600.212449-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/glibmm: needs
 BR2_TOOLCHAIN_HAS_SYNC_4
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
Cc: James Knight <james.knight@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio,

On Wed, 29 Dec 2021 10:56:00 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Add BR2_TOOLCHAIN_HAS_SYNC_4 and restyle the with "|| \" form.
> 
> Fixes:
> http://autobuild.buildroot.net/results/6a2/6a2709956fbb16ac3cbf676acb242c88f83fcdae/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/glibmm/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/glibmm/Config.in b/package/glibmm/Config.in
> index 2dfc861817..1b27f8cbb1 100644
> --- a/package/glibmm/Config.in
> +++ b/package/glibmm/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_GLIBMM
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_USE_WCHAR # libglib2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4

Not the correct fix: you're confusing the sync built-ins with the atomic
built-ins. Fabrice sent the correct fix a few minutes before yours :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
