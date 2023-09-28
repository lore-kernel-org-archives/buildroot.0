Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDE5E743C3
	for <buildroot@archiver.kernel.org>; Thu, 28 Sep 2023 21:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7BF9615C3;
	Thu, 28 Sep 2023 21:00:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7BF9615C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wuSpMcCHH0Kq; Thu, 28 Sep 2023 21:00:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF886615AB;
	Thu, 28 Sep 2023 21:00:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF886615AB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8CE571BF287
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 21:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6813A813FF
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 21:00:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6813A813FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yErEkXyBchxe for <buildroot@lists.busybox.net>;
 Thu, 28 Sep 2023 21:00:24 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BC40813E4
 for <buildroot@buildroot.org>; Thu, 28 Sep 2023 21:00:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BC40813E4
Received: from ymorin.is-a-geek.org (unknown [92.184.106.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 2148019F5A5;
 Thu, 28 Sep 2023 23:00:19 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 28 Sep 2023 23:00:17 +0200
Date: Thu, 28 Sep 2023 23:00:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230928210017.GD14593@scaer>
References: <20230928170955.347663-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230928170955.347663-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695934821;
 bh=WHrjFvqKXGQ9dbCqWu/b+lukD9RzuNM+XVAz9dUq5bU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RmI5wsJ1FL9kO/1yRT1gbDuwhj1rxCNYLxUSTC+31FC7OaKgCF0LpqNss865j9TZ6
 tXmtrqHGa224pW/0sCVO/I/DB3QvMT8SrHOWobq0Hca8gTLf/vptrnm/zvuq6Tb3Cl
 hQIafAKekP5dNMiaa1fMdiNFmDliqJt3olf6Y2kPMAIH5rvMasBYYWXMSMHi4tdtkK
 E3MEEzVOnQJnzS9YzT8al0DUVL+y8zDSm3qbEixG2zPbvRFyy44P3u6eGu5j/rpQ4k
 K0++RMjFLbbdIgN7/Rv5DhJakhh6ZeSAToEA2q1xaBlNgwhBNGCKO31E0WI2g041W6
 bi8fqdl/K/3nw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RmI5wsJ1
Subject: Re: [Buildroot] [PATCH 1/1] package/librsvg: security bump to
 version 2.50.9
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

On 2023-09-28 19:09 +0200, Fabrice Fontaine spake thusly:
> Fix CVE-2023-38633: A directory traversal problem in the URL decoder of
> librsvg before 2.56.3 could be used by local or remote attackers to
> disclose files (on the local filesystem outside of the expected area),
> as demonstrated by href=".?../../../../../../../../../../etc/passwd" in
> an xi:include element.
> 
> https://gitlab.gnome.org/GNOME/librsvg/-/blob/2.50.9/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/librsvg/librsvg.hash | 4 ++--
>  package/librsvg/librsvg.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/librsvg/librsvg.hash b/package/librsvg/librsvg.hash
> index c8da3354f5..4eab8cdfba 100644
> --- a/package/librsvg/librsvg.hash
> +++ b/package/librsvg/librsvg.hash
> @@ -1,5 +1,5 @@
> -# From https://download.gnome.org/sources/librsvg/2.50/librsvg-2.50.7.sha256sum
> -sha256  fffb61b08cd5282aaae147a02b305166a7426fad22a8b9427708f0f2fc426ebc  librsvg-2.50.7.tar.xz
> +# From https://download.gnome.org/sources/librsvg/2.50/librsvg-2.50.9.sha256sum
> +sha256  518905fffa879b6c7f3db1aae961cf31333e0eadc7b4cdd4f531707868c54b53  librsvg-2.50.9.tar.xz
>  
>  # Locally computed
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
> index df6559a858..81a6667817 100644
> --- a/package/librsvg/librsvg.mk
> +++ b/package/librsvg/librsvg.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIBRSVG_VERSION_MAJOR = 2.50
> -LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).7
> +LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).9
>  LIBRSVG_SITE = https://download.gnome.org/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)
>  LIBRSVG_SOURCE = librsvg-$(LIBRSVG_VERSION).tar.xz
>  LIBRSVG_INSTALL_STAGING = YES
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
