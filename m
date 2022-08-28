Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC366C0502C
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 10:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6250C60B4F;
	Sun, 28 Aug 2022 10:09:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6250C60B4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QLC1I0_xs2XO; Sun, 28 Aug 2022 10:09:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BC456079E;
	Sun, 28 Aug 2022 10:09:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BC456079E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 311A51BF5AA
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 10:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A0084094E
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 10:09:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A0084094E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dmrmfB0QWGC2 for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 10:09:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96823408C0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96823408C0
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 10:09:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e2dc:5f1b:7f23:232])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id BC62E780518;
 Sun, 28 Aug 2022 12:09:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 28 Aug 2022 12:09:47 +0200
Date: Sun, 28 Aug 2022 12:09:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220828100947.GL37358@scaer>
References: <20220828063724.4028-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220828063724.4028-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661681389;
 bh=b6hhnVscCnsE7gNRWYak8oRyIEuVJ8pFyeai1FIxZ2g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rUN+Gn7t7uimiT4agdTPFgPahhBJTNYxOLoOaNIa8tT4C7gQwb5ZWyoHD7dzoFmXd
 5owThoh5oPG++wJTXBDqOdRyC95GgN65AlDkaVC5skbKn/EZpdz7fUotQt3+0holj0
 Fx2NP+aXr5J0rSKATEmF81mas/ShgKWsA2pUOMTv5fluS9uA7AKkkNSy1fxj8AJs9S
 sZ7GuDxLeUD+7jBzevqK49azKJRAyHdQrkmIUBuqjy6W10dtliqVOn0jun+p3syYrG
 9EjC7YD6EldYX4oQ7vFaFYfwbgi8b4d9OuSDp4z+MUTVQOWLPuzrnUU5EOce7pudv0
 yDPnJvvdUN+Pw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rUN+Gn7t
Subject: Re: [Buildroot] [PATCH 1/1] package/mutt: bump to version 2.2.7
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

On 2022-08-28 08:37 +0200, Fabrice Fontaine spake thusly:
> This is a bug-fix release, fixing a $edit_headers bug on MacOS, along

We don't really care about bugs on MacOS, do we?

> with a few other small bugs. It also tightens the $query_command parser
> to accept a single tab between fields, and changes $pager to accept a %s
> expando.
> 
> https://gitlab.com/muttmua/mutt/-/blob/mutt-2-2-7-rel/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I was not sure whether this was material for master or next, but it
really looks like just a bg-fix-only release, so...

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mutt/mutt.hash | 2 +-
>  package/mutt/mutt.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
> index 0bec59def4..27e439183a 100644
> --- a/package/mutt/mutt.hash
> +++ b/package/mutt/mutt.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  ffa2d93517cfc606fe01daffc5f12e42062a1c134d3b9af78484ebc5430888d3  mutt-2.2.6.tar.gz
> +sha256  eb13858f58bb369f477bf652d90e9b6aaddd0d610acbea3455049e5efad36df1  mutt-2.2.7.tar.gz
>  sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
> diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
> index 5b1119c79b..7a4bc1b10c 100644
> --- a/package/mutt/mutt.mk
> +++ b/package/mutt/mutt.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MUTT_VERSION = 2.2.6
> +MUTT_VERSION = 2.2.7
>  MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
>  MUTT_LICENSE = GPL-2.0+
>  MUTT_LICENSE_FILES = GPL
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
