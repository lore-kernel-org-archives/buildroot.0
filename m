Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF03DC77B7D
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 12:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DE8840297;
	Sun, 14 May 2023 12:23:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DE8840297
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M0uGlolqEW_j; Sun, 14 May 2023 12:23:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 209F240872;
	Sun, 14 May 2023 12:23:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 209F240872
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9FAD11BF48B
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 12:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85BB660BB9
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 12:23:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85BB660BB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QZttPPImhSt1 for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 12:23:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3009760BDB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3009760BDB
 for <buildroot@buildroot.org>; Sun, 14 May 2023 12:23:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:e91d:2912:5826:9d75])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4481CB0052C;
 Sun, 14 May 2023 14:23:14 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 May 2023 14:23:14 +0200
Date: Sun, 14 May 2023 14:23:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230514122313.GT2582048@scaer>
References: <20230514102037.261428-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230514102037.261428-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684066996;
 bh=JZPOH0hn0kiayxzqQcqyYxsNeLq5J51Au0CgMfVT9CE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ar9NuT4545sM14D7DsYbbNTFbqOxlSbG+3HbF+xO3v0bxKHaSmy1llUHbR4uzuQCv
 HbkCp2ki7jOj4bh26oFoyt9pY1SOwbA4/bb8pf608Omcd3rP0lhkL8shxIi7WWrXne
 cW89qMS6aj4YE1f4fGKJxMz7wcYBog3VvWxbqNYxgE5KUz2zMUUmiHs3iXrVDW94wi
 /76+T+l69RV5wCtLRVIAwFXqGVdNYVzLlpX4tyT2fsKU1lXAUZvnFksT6e5b/NyH4e
 2+EUUmA/8MjgIyORFKC9F+JgqfgXdoJS239UFM1JSFEqqT5z051dke98dXF8wr5OdA
 gIybzLbqyhBqw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ar9NuT45
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: fix host build failure
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

Giulio, All,

On 2023-05-14 12:20 +0200, Giulio Benetti spake thusly:
> Package nfs-utils requires libevent and sqlite so let's add these two
> packages as dependencies for host package too.
> 
> Fixes:
> http://autobuild.buildroot.org/results/5e1ac97e4023f902dffa066c895aa6f6005d541c/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/nfs-utils/nfs-utils.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
> index 2f2e200bb5..3c85be0558 100644
> --- a/package/nfs-utils/nfs-utils.mk
> +++ b/package/nfs-utils/nfs-utils.mk
> @@ -22,7 +22,7 @@ NFS_UTILS_CONF_OPTS = \
>  	--with-statedir=/run/nfs \
>  	--with-rpcgen=$(HOST_DIR)/bin/rpcgen
>  
> -HOST_NFS_UTILS_DEPENDENCIES = host-pkgconf host-libtirpc
> +HOST_NFS_UTILS_DEPENDENCIES = host-pkgconf host-libtirpc host-libevent host-sqlite
>  
>  HOST_NFS_UTILS_CONF_OPTS = \
>  	--enable-tirpc \
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
