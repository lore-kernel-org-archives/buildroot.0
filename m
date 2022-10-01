Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C43C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 16:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90C7E41857;
	Sat,  1 Oct 2022 16:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90C7E41857
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aw2DbqIlVeNI; Sat,  1 Oct 2022 16:52:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5700741825;
	Sat,  1 Oct 2022 16:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5700741825
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DA7DC1BF59C
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 16:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B66A560AC9
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 16:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B66A560AC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DnNXOkrgdFw6 for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 16:52:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FE3560A8C
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9FE3560A8C
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 16:52:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9961:1217:61e8:73cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id B8625780344;
 Sat,  1 Oct 2022 18:52:41 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Oct 2022 18:52:41 +0200
Date: Sat, 1 Oct 2022 18:52:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221001165241.GM30794@scaer>
References: <20220928213631.14450-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220928213631.14450-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664643164;
 bh=XzVzqSM+ACnFOP9/gFW9SXWSjFkOqPsoYfyAPE7OKps=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PezYYfdsJd2Ja6bKtISFUCS6j0CYYvllScJrc1js5tXGjJ7KTMtKXHfbKm5sxGpTr
 UuujG/OA98ycPKlPmnW+aOkiG0VSN4K7oxIkwMCUy+RMM/TWRFwkEVlkd5C911PB97
 g/Hj1N50MUoVn4Rn9t0z3abRMWTrlRC6MtNv4t/RSVi0wOzr5mmJbWqqLpeE80spJa
 Ll7uM1AGmrAp7eyZhktGS5IvyG5+avsuMLGuiwKUlqS/sft/PSyujoKl/rO174psCv
 IpMzaeqDzrjQIyBlaotvMLrKhXLZ+zrmD2O8iCaPVZiFVElC7XY9rtrXulTk5lUWch
 ppGcxKzDjMZSg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PezYYfds
Subject: Re: [Buildroot] [PATCH 1/1] package/wolfssl: security bump to
 version 5.5.1
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-09-28 23:36 +0200, Fabrice Fontaine spake thusly:
> Denial of service attack and buffer overflow against TLS 1.3
> servers using session ticket resumption. When built with
> --enable-session-ticket and making use of TLS 1.3 server code in
> wolfSSL, there is the possibility of a malicious client to craft a
> malformed second ClientHello packet that causes the server to crash.
> This issue is limited to when using both --enable-session-ticket and TLS
> 1.3 on the server side. Users with TLS 1.3 servers, and having
> --enable-session-ticket, should update to the latest version of wolfSSL.

I see that we are not explicitly using either --enable or
--disable-session-ticket, so what is the default, and were we impacted?

Also, we should have an explicit setting for that, rather than leave it
to chance.

> https://github.com/wolfSSL/wolfssl/releases/tag/v5.5.1-stable
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/wolfssl/wolfssl.hash | 2 +-
>  package/wolfssl/wolfssl.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
> index f1401e4cda..3849ffb9fc 100644
> --- a/package/wolfssl/wolfssl.hash
> +++ b/package/wolfssl/wolfssl.hash
> @@ -1,5 +1,5 @@
>  # Locally computed:
> -sha256  c34b74b5f689fac7becb05583b044e84d3b10d39f38709f0095dd5d423ded67f  wolfssl-5.5.0.tar.gz
> +sha256  97339e6956c90e7c881ba5c748dd04f7c30e5dbe0c06da765418c51375a6dee3  wolfssl-5.5.1.tar.gz
>  
>  # Hash for license files:
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
> index ca360312c9..95d4f47952 100644
> --- a/package/wolfssl/wolfssl.mk
> +++ b/package/wolfssl/wolfssl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WOLFSSL_VERSION = 5.5.0
> +WOLFSSL_VERSION = 5.5.1
>  WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION)-stable)
>  WOLFSSL_INSTALL_STAGING = YES
>  
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
