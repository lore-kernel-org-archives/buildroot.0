Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DE1C4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 20:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5119B404EC;
	Wed, 28 Dec 2022 20:02:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5119B404EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W2fTD3ic2ruk; Wed, 28 Dec 2022 20:02:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E0C140577;
	Wed, 28 Dec 2022 20:02:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E0C140577
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 991F31BF59F
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 20:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8048040202
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 20:01:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8048040202
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ngnPfH5k5XG2 for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 20:01:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B325401E9
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2B325401E9
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 20:01:53 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 145A960003;
 Wed, 28 Dec 2022 20:01:51 +0000 (UTC)
Date: Wed, 28 Dec 2022 21:01:51 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221228210151.27b53edc@windsurf>
In-Reply-To: <20221227220017.343024-1-fontaine.fabrice@gmail.com>
References: <20221227220017.343024-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672257712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MLykmfhlvb6Y4LKqQZb/Qvp9DHQhp2ByOP85NWlPGFM=;
 b=R5wanOpqgSOf6z0Qlu5Oi9ob24dkYYsOAzW38Bam84QMB16UNlOoWZF8B6Vl6ZC2ewsL4d
 2frQDK68Hk0px9x2kvok4q740ImA8cg+1KLAkYk1nwq0HtOFcuJaVrNdaEe/ZMvgySy7pP
 HDQpuYSRJABc3+/K8cmyc47fb59TN4hNAXkDMUvDDRWmXY1R2KUsdEEFQur+AMK+/L1YeU
 ezqXx6Hm/nACET3sj5jyGY225A33xSi3cH+7l/mvybJecdnbHdJReD7MagrnRCJWt+ImYM
 M/wnKJnRHBZYsIvPgEoUK1/ytxedD85H/X1LRDiQ5z1tr1G/823lJu1AY1esSA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R5wanOpq
Subject: Re: [Buildroot] [PATCH 1/1] package/dieharder: bump to version
 3.31.1.4
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
Cc: Julien Viard de Galbert <julien@vdg.name>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 27 Dec 2022 23:00:17 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Switch to the maintenance "upstream" repo which regroup updates made
>   for the Debian package
> - Drop all patches (already in version)
> - Drop DIEHARDER_M4_CLEAN which is not needed since
>   https://github.com/eddelbuettel/dieharder/commit/c875e5d8196c4a79547281ff5f9fb04af734db97
> - -fcommon is not needed since
>   https://github.com/eddelbuettel/dieharder/commit/8feba3cc2bf92627f32ac637827ac760d3a17e63
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...dedir-as-include-search-path-for-bui.patch |  62 --
>  .../0002-Fix-missing-type-intptr_t.patch      |  27 -
>  ...RCE-for-uint-and-M_PI-with-musl-libc.patch |  28 -
>  .../0004-Add-static-to-inline-functions.patch |  65 --
>  .../0005-Remove-defunct-rgb_operm.patch       | 732 ------------------
>  package/dieharder/dieharder.hash              |   2 +-
>  package/dieharder/dieharder.mk                |  25 +-
>  7 files changed, 4 insertions(+), 937 deletions(-)
>  delete mode 100644 package/dieharder/0001-Do-not-use-includedir-as-include-search-path-for-bui.patch
>  delete mode 100644 package/dieharder/0002-Fix-missing-type-intptr_t.patch
>  delete mode 100644 package/dieharder/0003-Add-_GNU_SOURCE-for-uint-and-M_PI-with-musl-libc.patch
>  delete mode 100644 package/dieharder/0004-Add-static-to-inline-functions.patch
>  delete mode 100644 package/dieharder/0005-Remove-defunct-rgb_operm.patch

That's a seriously good cleanup! Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
