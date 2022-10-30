Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED80FC38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 16:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94B7B4032D;
	Sun, 30 Oct 2022 16:29:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94B7B4032D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EVoXZ-Xh7JUx; Sun, 30 Oct 2022 16:29:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 674074031F;
	Sun, 30 Oct 2022 16:29:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 674074031F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 03A731BF479
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2E8A80B37
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:28:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2E8A80B37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GE7KvLz0z45j for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 16:28:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCE4080B2D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCE4080B2D
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 16:28:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6ffe:83e9:a65c:45ae])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 164C213F87C;
 Sun, 30 Oct 2022 17:28:54 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 30 Oct 2022 17:28:53 +0100
Date: Sun, 30 Oct 2022 17:28:53 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221030162853.GQ1058960@scaer>
References: <20221029085622.104382-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221029085622.104382-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667147336;
 bh=8LqiPUd9MJx4f5kvmgrWHNPyn2RCVqEgpfifTva9Zqk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NCiteJ5i1d7aYk+2ixY6u3+m0l7hblze+Om98/VjsnvMXKJydzVKxUUXvzh3laQMs
 FP6GIExaNYf2Hk8d+Xy9S7/OX/DOJWBimpyV/r+y8tzLkKNAQkdqyVAOZP9iEV10Mq
 QnL/KzWEenV9m97kcxb1WWdM91GfO0TSuHmUzfo7tJ96vGf/1x3a0ARs7dx+HXvOLC
 0Q85wRkWV7eO8kFjzytMtxdb7GqweO15PAtmo9/rKQlNtVe0Z805WCwS7TEfMJ5SaF
 6Wg6Hj4AGVobI5Ms6bxDBzrMS9/E2EGAf15lMApsx9Yg1U9LUfsfE9PyWspo2Ico+W
 OhiXXlVi1bDXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NCiteJ5i
Subject: Re: [Buildroot] [PATCH 1/1] package/ndisc6: bump to version 1.0.6
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

On 2022-10-29 10:56 +0200, Fabrice Fontaine spake thusly:
> ndisc6: print NAT64 prefix if present.
> rdnssd: fix timeout calculation.
> 
> https://git.remlab.net/gitweb/?p=ndisc6.git;a=blob;f=NEWS;h=d9e87a5307ae7f50355ba2eaac1171c6c4ff9c47
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ndisc6/ndisc6.hash | 2 +-
>  package/ndisc6/ndisc6.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ndisc6/ndisc6.hash b/package/ndisc6/ndisc6.hash
> index d76e831208..e258382c53 100644
> --- a/package/ndisc6/ndisc6.hash
> +++ b/package/ndisc6/ndisc6.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -sha256  36932f9fc47e2844abcda7550fa1343b3af4b4208dfb61e0c9d9224aad5df351  ndisc6-1.0.5.tar.bz2
> +sha256  a713210e9be1f15cfa0809f4c2728b00cd5f25881d7585126986982055453cfb  ndisc6-1.0.6.tar.bz2
>  # Locally computed
>  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/ndisc6/ndisc6.mk b/package/ndisc6/ndisc6.mk
> index ff6439e310..23734ca7d7 100644
> --- a/package/ndisc6/ndisc6.mk
> +++ b/package/ndisc6/ndisc6.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -NDISC6_VERSION = 1.0.5
> +NDISC6_VERSION = 1.0.6
>  NDISC6_SOURCE = ndisc6-$(NDISC6_VERSION).tar.bz2
>  NDISC6_SITE = http://www.remlab.net/files/ndisc6
>  NDISC6_CONF_ENV = CC="$(TARGET_CC) -std=c11" LIBS=$(TARGET_NLS_LIBS)
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
