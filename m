Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E194FC433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 22:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5773D8190B;
	Tue,  1 Nov 2022 22:22:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5773D8190B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qxWqk3Wt3EjE; Tue,  1 Nov 2022 22:22:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63A0D81B52;
	Tue,  1 Nov 2022 22:22:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63A0D81B52
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 99C171BF3E8
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74C428190B
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:22:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74C428190B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oWTmuTvTrWOn for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 22:22:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E0F28142B
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E0F28142B
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 22:22:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9879E240004;
 Tue,  1 Nov 2022 22:22:20 +0000 (UTC)
Date: Tue, 1 Nov 2022 23:22:19 +0100
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20221101232219.68320283@windsurf>
In-Reply-To: <20221101221537.15506-1-christian@paral.in>
References: <20221101221537.15506-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667341341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UC+hU7kqfp2AIjr3U3nwScce/4RDV3yMARMLQLN/YL4=;
 b=eKh8SHb3PalwKm6qtYgEHlaqPY0xw47s10XotUNLx8NazVwV/FqapZ1bHzo921AZqmnOAe
 +vxdn0NJmxvcKehol0kLlKJfTi9smODpuuLl1x/BpyaqO3FVZ9o4KyfuPWl3GpVtFELtY8
 G4W1DXGSm1mwlHE2C1y/8gzvDlsXR7inMp7XPWVXt3dvhE/ni6JRNEL7ZhPyljoFFYGGQf
 zoqNprskmfH48y8CzECCmRZENJFcJ3jWb6hvlK+UrwIVpVbCNGup3+7yt2g6rAC7Ima+Y4
 CVP39m0GOPQ8eKG5yfO0CJCkLRed3I+PUwYrLTQVMN8Kk/A/Bfi2EejSoz27pw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eKh8SHb3
Subject: Re: [Buildroot] [PATCH 1/1] package/go: security bump to go 1.19.3
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

On Tue,  1 Nov 2022 15:15:37 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> go1.19.3 (released 2022-11-01) includes security fixes to the os/exec and
> syscall packages, as well as bug fixes to the compiler and the runtime.
> 
> Fixes: CVE-2022-41716
> 
> NOTE: this CVE is specific to Windows and is not directly relevant to Buildroot.
> 
> https://go.dev/doc/devel/release#go1.19
> https://github.com/golang/go/issues?q=milestone%3AGo1.19.3+label%3ACherryPickApproved
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/go/go.hash | 2 +-
>  package/go/go.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/go/go.hash b/package/go/go.hash
> index f944bd5304..c2a7321634 100644
> --- a/package/go/go.hash
> +++ b/package/go/go.hash
> @@ -1,3 +1,3 @@
>  # From https://go.dev/dl
> -sha256  2ce930d70a931de660fdaf271d70192793b1b240272645bf0275779f6704df6b  go1.19.2.src.tar.gz
> +sha256	18ac263e39210bcf68d85f4370e97fb1734166995a1f63fb38b4f6e07d90d212	go1.19.3.src.tar.gz

This change in the hash file breaks the coding style: you should use 2
spaces as a separator between fields.

Applied with this fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
