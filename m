Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA59ECAAD3
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 18:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EC8F4252B;
	Sun, 11 Sep 2022 18:26:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EC8F4252B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lbDXh1WBi8HJ; Sun, 11 Sep 2022 18:26:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4795742526;
	Sun, 11 Sep 2022 18:26:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4795742526
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 937411BF3EB
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 18:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E77F41888
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 18:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E77F41888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KujVxgHQ0lZ2 for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 18:26:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72BEF400C6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 72BEF400C6
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 18:26:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:41d6:744a:8631:c709])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9F56913F84C;
 Sun, 11 Sep 2022 20:25:56 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Sep 2022 20:25:56 +0200
Date: Sun, 11 Sep 2022 20:25:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220911182556.GD898622@scaer>
References: <20220911104058.8928-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220911104058.8928-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662920758;
 bh=+O+x+KkFZmPVZFwnorlwEgPHM/HrXsIvz7hWksE3Dn4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CEK+E7EbZNsuYKbZBWGGnCrkilpj4xkyibo700U5EuC4RN/04BF0oC9OzbG8U7wXs
 pJrADzTuj/WBAo63ItRcVs7ydRUyJ2fR8kzbB1fV86awDLq4Ujr3fPHTprevSj1KPl
 cLxyCRw3LTSosVUGf023ftt8U+k9K1Q1QT/HaLGb/f6y3KQ/PxHeZxwY1QxTPWqYsR
 avH9+HRJcD13lxSvkZtdBowoGM/5JvxTAEqp33zBMyTEmhLTgElMrJ5K/LO9bSiBL0
 iWbsKOKTpqRzQsA1byKVv7qpQYEy9YXekk5bbTGECsaCKTtt4w+EWUVNLusw7xFkIS
 B9mR9wL8GDSOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CEK+E7Eb
Subject: Re: [Buildroot] [PATCH 1/1] package/qlibc: bump to version 2.4.6
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

On 2022-09-11 12:40 +0200, Fabrice Fontaine spake thusly:
> This is a maintenance release that includes improvements and bug fixes.
> 
> https://github.com/wolkykim/qlibc/releases/tag/v2.4.6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/qlibc/qlibc.hash | 2 +-
>  package/qlibc/qlibc.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/qlibc/qlibc.hash b/package/qlibc/qlibc.hash
> index 6abb16b274..5cd6e1860f 100644
> --- a/package/qlibc/qlibc.hash
> +++ b/package/qlibc/qlibc.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  e195c97453c260acea4421146ba992d9a4d89732eac345b3765c43cc3326d2ad  qlibc-2.4.5.tar.gz
> +sha256  bd98c19f96c0d374adb69c99627c80cf967b5e860c8a4f28c13fa1b0d652a06e  qlibc-2.4.6.tar.gz
>  sha256  7c9d03656af4c0acf0a35e29459086498dd64080eac6d2945bc1c064aaf18132  LICENSE
> diff --git a/package/qlibc/qlibc.mk b/package/qlibc/qlibc.mk
> index 6cce8201bd..3996bb3706 100644
> --- a/package/qlibc/qlibc.mk
> +++ b/package/qlibc/qlibc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -QLIBC_VERSION = 2.4.5
> +QLIBC_VERSION = 2.4.6
>  QLIBC_SITE = $(call github,wolkykim,qlibc,v$(QLIBC_VERSION))
>  QLIBC_LICENSE = BSD-2-Clause
>  QLIBC_LICENSE_FILES = LICENSE
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
