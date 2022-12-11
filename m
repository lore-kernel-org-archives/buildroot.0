Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B218EC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 08:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EFD2404C9;
	Sun, 11 Dec 2022 08:22:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EFD2404C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pkpYjV7yR0WQ; Sun, 11 Dec 2022 08:22:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F6F54050C;
	Sun, 11 Dec 2022 08:22:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F6F54050C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B00361BF3EA
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89D804093E
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:22:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89D804093E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j9u0SLLjOSl5 for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 08:22:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E9744093A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E9744093A
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 08:22:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9fcf:911b:99f4:8b0a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 5307B5FFA1;
 Sun, 11 Dec 2022 09:21:57 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Dec 2022 09:21:57 +0100
Date: Sun, 11 Dec 2022 09:21:57 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221211082157.GK1044805@scaer>
References: <20221210221906.123306-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221210221906.123306-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670746920;
 bh=1AkuR+jkKWHL+kTjRRfv9pEFlMMlmQtymiJZOsQ6tNw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cy3HirnS7pk4Vf4iL1o7hiUmBf7ZZbg5Qn5tzc+lDAXlGOED7B0pTTKe2mc4WS3l+
 Swipsv/LW7deAp46d4uMMhWwaGgl9C/y2JK5dpF2lkkfQiVMAEyhbWO+7T750fAIqd
 LRoJtQyV3TyFZANsN3ZTNnJNuGiBUcQqLT2jq/U6b9YOGnCMGDEX5jfKFp6PL/9i/k
 /YyXNjQbKMAJoNoziX4Lz+SXPVcDTiJHYNmP4qA7IBS8ukuXO96oRf4lr6Rptcy3hW
 V4lYjBCXkSEUkHZb92x1OP7TykPFJRVglxcwz5ug78nQnnDnK/glwhM/FHaIaRVeci
 ijqaSIan8vz9Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Cy3HirnS
Subject: Re: [Buildroot] [PATCH 1/1] package/davfs2: bump to version 1.7.0
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

Fabrice, All,

On 2022-12-10 23:19 +0100, Fabrice Fontaine spake thusly:
> https://savannah.nongnu.org/forum/forum.php?forum_id=10244
> https://git.savannah.nongnu.org/cgit/davfs2.git/tree/ChangeLog?h=rel-1-7-0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/davfs2/davfs2.hash | 2 +-
>  package/davfs2/davfs2.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/davfs2/davfs2.hash b/package/davfs2/davfs2.hash
> index a555779dbc..1cbacc388f 100644
> --- a/package/davfs2/davfs2.hash
> +++ b/package/davfs2/davfs2.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
> -sha256  ce3eb948ece582a51c934ccb0cc70e659839172717caff173f69a5e2af90c5c0  davfs2-1.6.1.tar.gz
> +sha256  251db75a27380cca1330b1b971700c5e5dcc0c90e5a47622285f0140edfe3a2f  davfs2-1.7.0.tar.gz
>  # License file, locally calculated
>  sha256  0ae0485a5bd37a63e63603596417e4eb0e653334fa6c7f932ca3a0e85d4af227  COPYING
> diff --git a/package/davfs2/davfs2.mk b/package/davfs2/davfs2.mk
> index 42192faa59..a67c506250 100644
> --- a/package/davfs2/davfs2.mk
> +++ b/package/davfs2/davfs2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DAVFS2_VERSION = 1.6.1
> +DAVFS2_VERSION = 1.7.0
>  DAVFS2_SITE = http://download.savannah.nongnu.org/releases/davfs2
>  DAVFS2_LICENSE = GPL-3.0+
>  DAVFS2_LICENSE_FILES = COPYING
> -- 
> 2.35.1
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
