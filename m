Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17641C77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 16:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAE9942047;
	Sat,  6 May 2023 16:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAE9942047
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Znx9qzNYq-F; Sat,  6 May 2023 16:15:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C0124177C;
	Sat,  6 May 2023 16:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C0124177C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D18C1BF36A
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 16:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB0A7401B7
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 16:12:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB0A7401B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tKtEPAz0y54C for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 16:12:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F375040102
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F375040102
 for <buildroot@buildroot.org>; Sat,  6 May 2023 16:12:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:ae89:1f5e:7283:231f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4E2B8B0053D;
 Sat,  6 May 2023 18:12:48 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 May 2023 18:12:48 +0200
Date: Sat, 6 May 2023 18:12:48 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@aperture.us>
Message-ID: <20230506161248.GX252090@scaer>
References: <20230504073711.3469113-1-christian@aperture.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230504073711.3469113-1-christian@aperture.us>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683389571;
 bh=QIgdPCIWKuOrwXm3CrAIjWWqJOvBlK+zr70nqCtG6/c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OGm1XncqF6vsPW6+naoRvQpwMWmY/zD/bD0+pZQXmr4/TpRgaZMOr9NZQ46R5Ll7F
 I6BtkMhjWBVvUpUrWfV4PlfmaIlF1M0MqQ0D8C/7YnaMv0PSURQ5SKCQDtyKDehKN+
 gdUlm36JcrjkRY1YBGTVzdM3GgFUNWZZTBJxATGv+wefXtEdvBOYFQ8ZqlfVBKy+ZY
 3kxN1Dm5EorrxvpAwbuRmdP2m/MlDFuUu3xcmU1gOKXwD1toe3hz9TdEYFA+/4rNzk
 XvjWLPvY+jCTYSqMTC5BraPoD0ajb+skiInkUUKZ9g5hkKDwMdvfU7HiNESc6podfW
 MEBam2aKmFsRg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OGm1Xncq
Subject: Re: [Buildroot] [PATCH v1 1/1] package/nerdctl: bump version to
 1.3.1
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2023-05-04 00:37 -0700, Christian Stewart via buildroot spake thusly:
> Bugfixes and features.
> 
> https://github.com/containerd/nerdctl/releases/tag/v1.3.1
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/nerdctl/nerdctl.hash | 2 +-
>  package/nerdctl/nerdctl.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/nerdctl/nerdctl.hash b/package/nerdctl/nerdctl.hash
> index 8f2c678198..1fb0649fb2 100644
> --- a/package/nerdctl/nerdctl.hash
> +++ b/package/nerdctl/nerdctl.hash
> @@ -1,3 +1,3 @@
>  # Computed locally
> -sha256  08a84b9481b37dbd8cc6f955dbec0c18a1934bcffeb135fd5d2dc23987152b7c  nerdctl-1.2.0.tar.gz
> +sha256  574438dd7c88e6a607c6f82932f8ada174b1133a66ee0fa0f7510e7c3bebacb4  nerdctl-1.3.1.tar.gz
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/nerdctl/nerdctl.mk b/package/nerdctl/nerdctl.mk
> index 7556bcc391..43e862f7f9 100644
> --- a/package/nerdctl/nerdctl.mk
> +++ b/package/nerdctl/nerdctl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -NERDCTL_VERSION = 1.2.0
> +NERDCTL_VERSION = 1.3.1
>  NERDCTL_SITE = $(call github,containerd,nerdctl,v$(NERDCTL_VERSION))
>  
>  NERDCTL_LICENSE = Apache-2.0
> -- 
> 2.40.1
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
