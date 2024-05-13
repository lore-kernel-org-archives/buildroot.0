Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C65C25B78
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 22:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 900CE415AD;
	Mon, 13 May 2024 22:11:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T4OpKs_4aO-5; Mon, 13 May 2024 22:11:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10EB54159D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10EB54159D;
	Mon, 13 May 2024 22:11:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A9C91BF395
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 22:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 646B882293
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 22:11:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZWqKbT6voZ3T for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 22:11:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E4DE78228D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4DE78228D
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E4DE78228D
 for <buildroot@busybox.net>; Mon, 13 May 2024 22:11:08 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([82.135.81.197]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9Wuk-1sC9ex0bpc-006fSI; Tue, 14
 May 2024 00:11:07 +0200
Date: Tue, 14 May 2024 00:11:06 +0200
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20240514001106.6e9d8206@gmx.net>
In-Reply-To: <20240513091950.30116-1-ps.report@gmx.net>
References: <20240513091950.30116-1-ps.report@gmx.net>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:22UNPAYli/3Z5gJzy/jfAnSQJTkUbcA99e3MvLaOYFU6OhfFnTg
 5IAprp5890ClNW87FkdRBYE4fgeFEGE5KGKBLi6h52obIHc518QzIvQVZLjhwX+S55DGJ9h
 l543YlVcvdIP2zY06qv8wfGfQC7Jk8GxkS5pf+1GfekSDVC3ZOtdu4qTn4Sr/b86pQzCG3I
 K3TVQB/b8y38VDa5uf1fw==
UI-OutboundReport: notjunk:1;M01:P0:aoXG2sWDCKk=;fZxgL8arpwKzZce0KZoGiPcMJqI
 282FUcUyJkgLC7b5q6TOrxQn/143oVQhi3qSGGhf2mcJ15amGqb74MpVuZtQQAGU2Xwkg1Phk
 RuJSIzm79zsapa5B6IQP/jjKkXejRmnYldpRbt5kLcfNo0XCecKMUk/gKYWkuOKxt6EPI/96e
 SblIJv+z945M90l8CAuZfVZ0eTL9PFSGXg1iG0sXf5COrA880y2IQ/1xzYzhqNd2485iWnN2B
 5H1HISzeX69IMy4EVcNhGv7TL5ViXdlY0Vl7mN2ICqoh5H1fbHfVpQBH1dVud5Eyn6U21hf/n
 xwdqNiUfZ99jpq0SmLuZMR4dFVHOZkB/twI4nVRZFsR28T4IKJQP+oR2u5PI+TxaSjBullly+
 s3uiLvlDWw/4NGtflLpELbzFj4pqxoaim8hrc8HibkK9tVIpBN95L2gf+3NCs64E3itJCEfev
 sAqiCjP1pS/Uc5I5V0She+Ug2xMWCJFAYmnC2ZfOGmxxok2hvX08Tna2Xoc0agDWJv8AJLSii
 dyUX0FQ4FnBUFHNjGirOVh4Dt875sjov3ebf4szPNxXGdcthVjmNH60UKbfeCmolyD3NnMZd/
 aIRcyFni15lm9+wqAvhfyT4DkvIHZzyDJZ+cRQVH8UwOwfZ9BWKtsBtPo0pWiFY4gQ2up/QD4
 VyP2DnebPdwnCmHxElPBYJcjGi3WMNkpkY3+kjIXfsoYvijB+hW310nklwSKILBcocMVSLsNS
 SISLEdtfhqdSUufHnJ5vVN9hYPRXdzc8jtYpGsWfgfF6i3bQG+ecBzsg1iFoKW5P+8eyW2NAP
 JOVp3mGMJYPcQqz4R9bOT5O4bPMzoLaU1nANZGbHnjaZ4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1715638267; x=1716243067; i=ps.report@gmx.net;
 bh=4a+bXp8XVWU+dYHlJf3/ndQkrr5gw7iR587dNcVSp6g=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=dBptXmZLAUTsbpoDshTgBH/6ZflfN3Fw4f1lqggxmk6R0jsUMwJAhUJMKj6IZulO
 3l+rq+efAP6JatHWvk+jy+Hc59KkC+eGW1s9Froez1Ptpq4IxyAfMFvjA8Bep5SX7
 or1dck7HtxbBqdgo9PXck20ZGzw6xZRIOW6nlJkcVIuOMK2Ayz+0jz7EUdisQzR+I
 XBVcUTkkqoqkL1FbS2VrwyU3lxraib7YU5PbriH4/xzBO+pnPVJf4uAnoYv3025X6
 EzXmCSwsYEoQGS0vBiSdj1LDgcNNOxGYMEYtWPuxarjJFWtKlGCtgfTWqGzfTzmMJ
 uyq6dojdeqLVONA4Dw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=dBptXmZL
Subject: Re: [Buildroot] [PATCH v2 1/4] Config.in: do not expand TOPDIR,
 BASE_DIR and CONFIG_DIR
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 13 May 2024 11:19:45 +0200, Peter Seiderer via buildroot <buildroot@buildroot.org> wrote:

> - escape TOPDIR, BASE_DIR and CONFIG_DIR usage to force to not exapnd at
>   configure time (but at make time), needed for upcoming kconfig update
>   (see upstream commit [1])

Same is needed for 'ARCH' usage in toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
and toolchain/toolchain-external/toolchain-external-custom/Config.in.options (and
support/scripts/gen-bootlin-toolchains)..., additional patch will follow with
next patch set iteration...

Regards,
Peter


>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=104daea149c45cc84842ce77a9bd6436d19f3dd8
>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - new patch (moved escape fixes from 'support/kconfig: reference environment
>     variables directly (remove 'option env=')' to this extra/preliminary patch)
> ---
>  Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Config.in b/Config.in
> index b5a94325c4..035900c971 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -197,7 +197,7 @@ config BR2_DEFCONFIG
>
>  config BR2_DL_DIR
>  	string "Download dir"
> -	default "$(TOPDIR)/dl"
> +	default "\$(TOPDIR)/dl"
>  	help
>  	  Directory to store all the source files that we need to fetch.
>  	  If the Linux shell environment has defined the BR2_DL_DIR
> @@ -211,7 +211,7 @@ config BR2_DL_DIR
>
>  config BR2_HOST_DIR
>  	string "Host dir"
> -	default "$(BASE_DIR)/host"
> +	default "\$(BASE_DIR)/host"
>  	help
>  	  Directory to store all the binary files that are built for the
>  	  host. This includes the cross compilation toolchain when
> @@ -669,7 +669,7 @@ endchoice
>
>  config BR2_PACKAGE_OVERRIDE_FILE
>  	string "location of a package override file"
> -	default "$(CONFIG_DIR)/local.mk"
> +	default "\$(CONFIG_DIR)/local.mk"
>  	help
>  	  A package override file is a short makefile that contains
>  	  variable definitions of the form <pkg>_OVERRIDE_SRCDIR, which

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
