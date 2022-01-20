Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5038C433F5
	for <buildroot@archiver.kernel.org>; Thu, 20 Jan 2022 20:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EB3A40574;
	Thu, 20 Jan 2022 20:44:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OTL4Vj-qnxMk; Thu, 20 Jan 2022 20:44:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EC92404FB;
	Thu, 20 Jan 2022 20:44:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 343411BF29D
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 20:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30B2B60C2D
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 20:44:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WIw7kWuLuGk8 for <buildroot@lists.busybox.net>;
 Thu, 20 Jan 2022 20:44:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B93B160B5D
 for <buildroot@buildroot.org>; Thu, 20 Jan 2022 20:44:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9c35:7598:9514:be6a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id BD97BB0053A;
 Thu, 20 Jan 2022 21:44:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642711446;
 bh=xopwjj5427HfmTNV2L/niYemE51ijpG5nXnO9ZcQVxw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RgMa9/sCaviZPv6+dKaaZ9puzWtly1BLn/5EBSa/qJ+lh583iFU1eMgVfYZeKhpt5
 2gHvcsHy9AAhvHXjaaZoi0KW0TCbba7OSd9TmwvW7Z9TmYKZRw1mBVvihXn4wollj1
 EsvIhaEkzysXrBl5qHzfuzmGQF163NeZ9vbSNLWnNQvvjHr+iQ6YtclekTY6dJ4H6J
 lltid5YwtzrDCzZe8t/E2Q5ksqCiG5gluywPnNqYK0qQhhhUtNgPYBJJfNKtTgCa2O
 iVw/vI159iv6H6rdB87iQGBh21VlnxE3FwzGn6AwMp9tOyQw/i64q0N2+8dTYbx2o5
 8g8pz+OG/hEKA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 20 Jan 2022 21:44:02 +0100
Date: Thu, 20 Jan 2022 21:44:02 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20220120204402.GB3252931@scaer>
References: <20220120192738.11310-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220120192738.11310-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v1] package/hdparm: bump version to 9.63
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2022-01-20 20:27 +0100, Peter Seiderer spake thusly:
> For details see [1].
> 
> [1] https://sourceforge.net/p/hdparm/news/2022/01/hdparm-963-is-released-
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/hdparm/hdparm.hash | 2 +-
>  package/hdparm/hdparm.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/hdparm/hdparm.hash b/package/hdparm/hdparm.hash
> index b37826caf2..c039481f77 100644
> --- a/package/hdparm/hdparm.hash
> +++ b/package/hdparm/hdparm.hash
> @@ -1,5 +1,5 @@
>  # From https://sourceforge.net/projects/hdparm/files/hdparm/
> -sha1  100b9a5551b71d87b446b415d56c5d45ac41d131  hdparm-9.62.tar.gz
> +sha1  c8e24233b4d29506907ad2bf0725f793106c3a78  hdparm-9.63.tar.gz
>  # Locally computed
>  sha256  2c0f9d75cdbeda928a25a128cd3d0b7120445ec0910c0b29d4c1038ed1be777f  hdparm-9.62.tar.gz
>  sha256  eae572b06d2733f5c65fbe81680ce2b8a109afee2bdd1a161343c772af0e82e1  LICENSE.TXT
> diff --git a/package/hdparm/hdparm.mk b/package/hdparm/hdparm.mk
> index 6a71c14fa7..2c3b372deb 100644
> --- a/package/hdparm/hdparm.mk
> +++ b/package/hdparm/hdparm.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -HDPARM_VERSION = 9.62
> +HDPARM_VERSION = 9.63
>  HDPARM_SITE = https://downloads.sourceforge.net/project/hdparm/hdparm
>  HDPARM_LICENSE = BSD-Style
>  HDPARM_LICENSE_FILES = LICENSE.TXT
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
