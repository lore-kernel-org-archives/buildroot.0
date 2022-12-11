Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3620EC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 09:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D41BB8149D;
	Sun, 11 Dec 2022 09:09:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D41BB8149D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XMB9qPsRICSf; Sun, 11 Dec 2022 09:09:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1256781462;
	Sun, 11 Dec 2022 09:09:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1256781462
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A5A81BF3EA
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA06E404D1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:56:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA06E404D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kcX75906_4dt for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 08:56:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC2D0404C9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC2D0404C9
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 08:56:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9fcf:911b:99f4:8b0a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 61E1B5FFA6;
 Sun, 11 Dec 2022 09:56:29 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Dec 2022 09:56:29 +0100
Date: Sun, 11 Dec 2022 09:56:29 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221211085629.GL1044805@scaer>
References: <20221210212402.3721087-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221210212402.3721087-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670748993;
 bh=dC+Ar3YklohtD//Vhtbm4b8u2Sg829/Clc2WIdbHsj0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iwvcZVc5T6PR7Bf2hWcZo42g35fg2dgwivZYpXCHyxl/Hzy+Qn4RAkTf9yqD6HATr
 D1/YjCr7j6sznmMp8p8sNCFOpgTnELNk09YQ36ZLF5/PIoSEAGrXcoXawxOOPM5Di2
 7vrfPH3UjXdqqbcEzS+mnmMKS+UA+kFWBtopEaA/kDrCVtQbvlaui7sCF5278rk5sz
 BEoDgaKmTZFCN5r5XasJHtMDNjOXDx9cdjM1kOqOdmBug3hxYBY6z35gpkrkakTe+N
 xHqzPl01C61zFDIy0HRzr8y8R9IipVfkvfqC8MYEhrMjz6C/sE4tEj1bsfx4MbWFem
 ruqSzVKczmxrQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iwvcZVc5
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: bump to version 3.11.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-12-10 14:24 -0700, James Hilliard spake thusly:
> Drop patch which is now upstream.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[--SNIP--]
> diff --git a/package/python3/python3.hash b/package/python3/python3.hash
> index c4ee79305d..db78544bd0 100644
> --- a/package/python3/python3.hash
> +++ b/package/python3/python3.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  a57dc82d77358617ba65b9841cee1e3b441f386c3789ddc0676eca077f2951c3  Python-3.11.0.tar.xz
> +sha256  85879192f2cffd56cb16c092905949ebf3e5e394b7f764723529637901dfb58f  Python-3.11.1.tar.xz
>  sha256  f03e17cd594c2085f66a454e695c7ebe5b4d3c0eff534f4f194abc2fd164621b  LICENSE

    $ make python3-legal-info
    >>> python3 3.11.1 Collecting legal info
    ERROR: LICENSE has wrong sha256 hash:
    ERROR: expected: f03e17cd594c2085f66a454e695c7ebe5b4d3c0eff534f4f194abc2fd164621b
    ERROR: got     : d4a223f033419313218c9b8444167e91e87a5bebdb43fb8490df441df5220a8b
    ERROR: Incomplete download, or man-in-the-middle (MITM) attack
    make[1]: *** [package/python3/python3.mk:251: python3-legal-info] Error 1
    make: *** [Makefile:23: _all] Error 2

Applied to master, with the licensing hash updated, and the commit log
extended to explain why, thanks.

I also applied a lot of your recent ptython packages bumps, I won't
reply to each of them individually, though..

Thanks!

Regards,
Yann E. MORIN.

> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 123bc8ef88..219d135b3f 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  PYTHON3_VERSION_MAJOR = 3.11
> -PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).0
> +PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).1
>  PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
>  PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
>  PYTHON3_LICENSE = Python-2.0, others
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
