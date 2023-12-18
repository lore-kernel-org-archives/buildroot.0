Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49775C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 08:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBBA1403C9;
	Mon, 18 Dec 2023 08:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBBA1403C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QAmYxyj7ZdLy; Mon, 18 Dec 2023 08:23:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDE95405B2;
	Mon, 18 Dec 2023 08:23:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDE95405B2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7BD8A1BF86B
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52DD7405B2
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:23:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52DD7405B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Agfa_zl7TAu for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 08:23:32 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A7922403C9
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 08:23:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7922403C9
Received: by mail.gandi.net (Postfix) with ESMTPSA id C49C7C0007;
 Mon, 18 Dec 2023 08:23:29 +0000 (UTC)
Date: Mon, 18 Dec 2023 09:23:28 +0100
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20231218092328.52a6bd57@windsurf>
In-Reply-To: <20231205225050.142513-1-petr.vorel@gmail.com>
References: <20231205225050.142513-1-petr.vorel@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1702887810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UzJD2avZeDpdFcueOANYt+3tHvFSemJgMKuzIe6jL9U=;
 b=hNrHCDOYYz/el1rfG6tD6RxsnH8bZzeKL46yxdeVoLiL0d75Ml16GadGiCeKb60M/wjeSu
 SszLQjdyXTxp/I89pE8btI64L/19tggtUcl0/G4gWbHilFcH1kWx7Tv557mrI5y3p5h6eg
 dwazDuJ/x+OTLAnXDVE9EYw10bt8XTGRj0d3H5ib/bcU4oK3pfRH4hTh7Gp1rCF5enfWQ5
 uSSDV6krAS+QM2SsJ9xR/O7Amx6tSfqhBhOGuD9TEcq7u6pctb7/Pj2jdELXBO95hZmI4I
 TnuaeosmsunhYHKPKPabMZCARJJvT+4BA3Aaxr7+TAvVnPyA0dUaFkimRkPBDw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hNrHCDOY
Subject: Re: [Buildroot] [PATCH v3 1/1] package/nfs-utils: bump version to
 2.6.4
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Petr,

Thanks a lot for this bump. It looks almost good, there only some very
small nits, see below.

On Tue,  5 Dec 2023 23:50:50 +0100
Petr Vorel <petr.vorel@gmail.com> wrote:

> Remove patches backported from this release.
> Backport 2 patches from upstream ML needed for uClibc-ng on mips.
> 
> Require kernel 3.17 due getrandom() dependency.
> Add host-util-linux to HOST_NFS_UTILS_DEPENDENCIES
> (new uuid.h dependency).
> 
> Fixes: http://autobuild.buildroot.net/results/c5fde6099a8b228a8bdc3154d1e47dfa192e94ed/

We normally format it like this:

Fixes:

  http://autobuild.buildroot.net/results/c5fde6099a8b228a8bdc3154d1e47dfa192e94ed/

> diff --git a/package/nfs-utils/0001-reexport-fsidd-reexport-.c-Re-add-missing-includes.patch b/package/nfs-utils/0001-reexport-fsidd-reexport-.c-Re-add-missing-includes.patch
> new file mode 100644
> index 0000000000..f5b9becf34
> --- /dev/null
> +++ b/package/nfs-utils/0001-reexport-fsidd-reexport-.c-Re-add-missing-includes.patch
> @@ -0,0 +1,45 @@
> +From 4710e469cd0f512ac5e2c3c4335d8e21b97f21b0 Mon Sep 17 00:00:00 2001
> +From: Petr Vorel <pvorel@suse.cz>
> +Date: Tue, 5 Dec 2023 20:40:36 +0100
> +Subject: [PATCH] reexport/{fsidd,reexport}.c: Re-add missing includes
> +Upstream: https://lore.kernel.org/linux-nfs/20231205223543.31443-1-pvorel@suse.cz/

The Upstream: tag should normally go:

> +
> +Older uClibc-ng requires <unistd.h> for close(2), unlink(2) and write(2),
> +<sys/un.h> for struct sockaddr_un.
> +
> +Fixes: 1a4edb2a ("reexport/fsidd.c: Remove unused headers")
> +Fixes: bdc79f02 ("support/reexport.c: Remove unused headers")
> +Signed-off-by: Petr Vorel <pvorel@suse.cz>

somehere here.

> diff --git a/package/nfs-utils/0002-support-backend_sqlite.c-Add-missing-sys-syscall.h.patch b/package/nfs-utils/0002-support-backend_sqlite.c-Add-missing-sys-syscall.h.patch
> new file mode 100644
> index 0000000000..ee77d69868
> --- /dev/null
> +++ b/package/nfs-utils/0002-support-backend_sqlite.c-Add-missing-sys-syscall.h.patch
> @@ -0,0 +1,32 @@
> +From aee92881ba80cf2ae7381d19f09e7fbeda57974c Mon Sep 17 00:00:00 2001
> +From: Petr Vorel <petr.vorel@gmail.com>
> +Date: Tue, 5 Dec 2023 23:20:33 +0100
> +Subject: [PATCH] support/backend_sqlite.c: Add missing <sys/syscall.h>
> +Upstream: https://lore.kernel.org/linux-nfs/20231205223543.31443-2-pvorel@suse.cz/

Likewise.

> diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
> index b4568dc6f3..dccb3acaf3 100644
> --- a/package/nfs-utils/Config.in
> +++ b/package/nfs-utils/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_NFS_UTILS
>  	bool "nfs-utils"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libtirpc, rpcbind
>  	depends on BR2_USE_MMU # fork()
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # getrandom()

This new dependency requires the Config.in comment to be updated.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
