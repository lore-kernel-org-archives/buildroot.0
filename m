Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58DCC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 14:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B952415DF;
	Sun, 24 Apr 2022 14:24:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wEWTQF46DeUo; Sun, 24 Apr 2022 14:24:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB135415D1;
	Sun, 24 Apr 2022 14:24:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 85AFD1BF577
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 14:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73D74812C9
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 14:24:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0POuhBDvgjPZ for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 14:24:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 236E18128A
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 14:24:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:657d:21bd:cb37:8719])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 3456778031A;
 Sun, 24 Apr 2022 16:24:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1650810274;
 bh=fKUY7cTQR/gJ6TscRnPmkNamVq6Xm3lcvfYDWNlptJ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LWb6r+WUUeJzXsJEIieL0FehXicgfKS4TjEOuu66jZSkbVM0GbyfwBz/fvGzcFnDa
 JaUtBKRw0QPD2LlgGqmTwVk9IDLIWis56s2EBMtQJ7lUgWrieXnzsdPNeUwXlUU8tk
 FmpET516BO2TRMRvvksuZu8vpKnkx09OCmCSu3hLPpMkUqudNmR+KNfvMlKxltT1Uy
 pqjbhr9MGZEYgBT52+lG852QGqcdAN3N7joZfvrW8H358wYJdYyz/Tym36EsZ67/HF
 Hw41O+H+xEOLDM1l53NIb1rVq0VZyOvfFhTXKnwSKDtULZ3ChZVNBFfbnndH8gIHY6
 xhOSmlbYppWVA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Apr 2022 16:24:30 +0200
Date: Sun, 24 Apr 2022 16:24:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Andreas Ziegler <br015@umbiko.net>
Message-ID: <20220424142430.GU2730@scaer>
References: <20220424090931.268434-1-br015@umbiko.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220424090931.268434-1-br015@umbiko.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libnpupnp: update version to
 4.2.2
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Andreas, All,

On 2022-04-24 11:09 +0200, Andreas Ziegler spake thusly:
> Bugfix release for:
> http://autobuild.buildroot.net/results/a87/a8754431aad8808ae2d67e32d4a7973b00eda1c1/
> 
> Technical discussion:
> https://github.com/MusicPlayerDaemon/MPD/pull/1513
> 
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libnpupnp/libnpupnp.hash | 2 +-
>  package/libnpupnp/libnpupnp.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libnpupnp/libnpupnp.hash b/package/libnpupnp/libnpupnp.hash
> index 276bf93c99..79c2bbdc26 100644
> --- a/package/libnpupnp/libnpupnp.hash
> +++ b/package/libnpupnp/libnpupnp.hash
> @@ -1,5 +1,5 @@
>  # Hash from: http://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-4.2.1.tar.gz.sha256
> -sha256  e0e59eb2d3d024e827050428e0e7eb228355912a38c85eb30bfeb2f0926eca4c  libnpupnp-4.2.1.tar.gz
> +sha256  cb3968773d30e2bfc765547df514fdc8927b9a37ecccca2e260ee8b612e756bc  libnpupnp-4.2.2.tar.gz
>  
>  # Hash for license file:
>  sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
> diff --git a/package/libnpupnp/libnpupnp.mk b/package/libnpupnp/libnpupnp.mk
> index 09bfa34b87..d7192ec3f1 100644
> --- a/package/libnpupnp/libnpupnp.mk
> +++ b/package/libnpupnp/libnpupnp.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBNPUPNP_VERSION = 4.2.1
> +LIBNPUPNP_VERSION = 4.2.2
>  LIBNPUPNP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
>  LIBNPUPNP_LICENSE = BSD-3-Clause
>  LIBNPUPNP_LICENSE_FILES = COPYING
> -- 
> 2.34.1
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
