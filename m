Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68796C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 20:19:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E9C46128A
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 20:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E9C46128A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7C278277E;
	Sun,  3 Oct 2021 20:19:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6HlHQVv7Mu3J; Sun,  3 Oct 2021 20:19:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6A908264C;
	Sun,  3 Oct 2021 20:19:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5417F1BF44A
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 20:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 433A4605CB
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 20:19:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IsRk9ZF7xwch for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 20:19:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A453B605C2
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 20:19:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1d3d:918b:43fc:aadd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6E1F513F88F;
 Sun,  3 Oct 2021 22:19:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633292358;
 bh=alNCuXnd8WMxMfNMZFTB/uRD6/71rtD5ZsJpNjVfD/g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G+94PxoOuRV2IeK0bmQjNaENdGvLm/6sw852hVswnx37rb+iIda+rENs+7MVxsDiW
 juJH/bOeXEmrqp36bJ/qfW49fHfVpPCe/7g++6ZxTlUNc7XXeSRz5hNGiZObycLRhx
 aRIMSBXVEzAS8XUtXZFhAM000KFm3jjXpI70jXxONtPe95Fa++/SpA45GSzsRLTG9x
 EMLaIjn2lRhF9L7cFo0NRbsDQnWnsru1AESkIVDQPAhuoZYFZDQ3Vwe6JQoYNMDlrk
 1NvVqB438PE93lA1Xa6HRlePygxCtkutUBPquGgyTG6AXKYx5G7kSPQ3HPSkYJ4yXN
 a9uDd3pJm5CkQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Oct 2021 22:19:14 +0200
Date: Sun, 3 Oct 2021 22:19:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: sam.voss@gmail.com
Message-ID: <20211003201914.GY1504958@scaer>
References: <20210930035250.23687-1-sam.voss@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210930035250.23687-1-sam.voss@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/ripgrep: ignore CVE-2021-3013 as
 Windows only
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sam, All

On 2021-09-29 22:52 -0500, sam.voss@gmail.com spake thusly:
> From: Sam Voss <sam.voss@gmail.com>
> 
> CVE-2021-3013 does not impact any buildroot versions of ripgrep as it is
> a Windows-only exploit targeting ripgrep versions earlier than 13. It
> can be safely ignored on our LTS branches.
> 
> Signed-off-by: Sam Voss <sam.voss@gmail.com>

Applied to master, thanks.

I've just added an URL to the NVD for reference.

Regards,
Yann E. MORIN.

> ---
> 
> Note: Please apply this patch to:
> 
>   * 2021.02.x
>   * 2021.05.x
>   * 2021.08.x
> 
> Master currently has version 13, which does not report this CVE.
> ---
>  package/ripgrep/ripgrep.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
> index 450bb020e3..8d0185595d 100644
> --- a/package/ripgrep/ripgrep.mk
> +++ b/package/ripgrep/ripgrep.mk
> @@ -10,6 +10,9 @@ RIPGREP_LICENSE = MIT
>  RIPGREP_LICENSE_FILES = LICENSE-MIT
>  RIPGREP_CPE_ID_VENDOR = ripgrep_project
>  
> +# CVE only impacts ripgrep on Windows
> +RIPGREP_IGNORE_CVES += CVE-2021-3013
> +
>  RIPGREP_DEPENDENCIES = host-rustc
>  RIPGREP_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo \
>  	__CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS="nightly" \
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
