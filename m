Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0E2C07E9D
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 21:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77CBE4105A;
	Fri, 23 Sep 2022 21:42:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77CBE4105A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id icakCCqoYr1S; Fri, 23 Sep 2022 21:42:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B69940220;
	Fri, 23 Sep 2022 21:42:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B69940220
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 089851BF82C
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D436B8426E
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:42:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D436B8426E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NFCdA1OPxKOi for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 21:42:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C502E8426D
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C502E8426D
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 21:42:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 233101BF208;
 Fri, 23 Sep 2022 21:42:48 +0000 (UTC)
Date: Fri, 23 Sep 2022 23:42:47 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Frank Hunleth via buildroot <buildroot@buildroot.org>
Message-ID: <20220923234247.3297fc48@windsurf>
In-Reply-To: <20220921204916.3420825-1-fhunleth@troodon-software.com>
References: <20220921204916.3420825-1-fhunleth@troodon-software.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663969368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rr0Z4/gYz+FcvqywhK/g9lirhpE6J9S5kfMNNuXlPfQ=;
 b=KOWHxC1D0PK4ZHuS3SRHsimKYo/52g9RqZ3QnVbb1Q07yHWB+08GqaR7IOCQd+HEw3r6Eg
 Kh91ioIdHJJOx5IoxoLcPoM/xMmjgxDp0de9Rz/S2FBw8Gq1N8RGN7jRGSeQEROWerLsHg
 dxUqBZXLAQhtEY/n6aAUMhmvTRO6EueBZDkZq0I5b9J6k0fE1y16nknChv/0L/zuuVoeIo
 cXGVaXdKIs3b9CLdkavl+JBghnWLeNxwDZL/Quw0Kmmzo9tbz1nONP4PXSb4VuXIY/yynJ
 SdKn/OUlmDY49MkGORZGNdBjTHRZC7GgdL2gfPYQ8H//sgF1fCIxNL2hsfdwsw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KOWHxC1D
Subject: Re: [Buildroot] [PATCH] package/erlang: support aarch64 host-erlang
 builds
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Frank,

On Wed, 21 Sep 2022 20:49:59 +0000
Frank Hunleth via buildroot <buildroot@buildroot.org> wrote:

> This fixes the following warning when building erlang on aarch64
> machines:
> 
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_ERLANG
>   Depends on [n]: BR2_USE_MMU [=y] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_PACKAGE_ERLANG_ARCH_SUPPORTS [=n]
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  package/erlang/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/erlang/Config.in b/package/erlang/Config.in
> index 15931b5896..5198f35efc 100644
> --- a/package/erlang/Config.in
> +++ b/package/erlang/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_HOST_ERLANG_ARCH_SUPPORTS
>  	bool
>  	default y if BR2_HOSTARCH = "x86_64"
>  	default y if BR2_HOSTARCH = "x86"
> +	default y if BR2_HOSTARCH = "aarch64"

While I appreciate that adding support for aarch64 as a host
architecture for Erlang is a good idea, this cannot be the proper fix
for the circular dependency you're seeing, as it means the same issue
will happen on another host architecture.

Do you have the example configuration that exhibits the problem? I
don't see any place that selects BR2_PACKAGE_ERLANG in the tree.
Perhaps you're seeing this with a custom package of yours that has
"select BR2_PACKAGE_ERLANG", but forgot "depends on
BR2_PACKAGE_ERLANG_ARCH_SUPPORTS" ?

Don't get me wrong: the patch is correct, but its commit log and the
reasoning looks suspicious.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
