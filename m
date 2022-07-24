Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48F2C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 14:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F25E40C42;
	Sun, 24 Jul 2022 14:58:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F25E40C42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pFNF6mkPfLZW; Sun, 24 Jul 2022 14:58:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2333040C3D;
	Sun, 24 Jul 2022 14:58:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2333040C3D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8635C1BF3D8
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 14:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E2D340C3D
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 14:58:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E2D340C3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eDSJo6KxAr2q for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 14:58:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A05E400B9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A05E400B9
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 14:58:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8acf:5600:88cd:5a50:8d8a:801])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id DDFCD13FA41;
 Sun, 24 Jul 2022 16:58:46 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Jul 2022 16:58:46 +0200
Date: Sun, 24 Jul 2022 16:58:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: David GOUARIN <dgouarin@gmail.com>
Message-ID: <20220724145846.GW2641@scaer>
References: <20220724142615.22630-1-dgouarin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220724142615.22630-1-dgouarin@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658674731;
 bh=rjGZzOq/3Loo63OFcl7ZuAhlKwhCdu4frUIUfwNtTgE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UBBMtLtJCSIQ3B5iE/YxMB3+lkLx5pnua/Wr+cTxfFm2JpJNdNc9sU0pIQTcHsZ1V
 YofkaIoqR4XS69GFPUFoBWfDQ+ccWi9j90+W8emdHJ4dvWtuJvKhw8hCZNbTj0Hn8T
 axD+zsGbGjei7xVcPhc9LoAMcJqw+ql2+52KPZ0sQjPNa3Pn7qJg7h4jJ1sluoli4A
 +Y6xtbx1drcy17zLyyEn1yEzr+IH3Dw1WwEYQSj8yRh+wXe7rx/UZIa0EWhpltwqzh
 kP7gbVAwp8wdhwQOkK75FfIQj/daPLLEZeXX4Wcbdz6fz6QsrrhqmBuwxuYHKLHT/j
 yKoQ4HTGjd8Pw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UBBMtLtJ
Subject: Re: [Buildroot] [PATCH V3] package/libtallc: bump version to 2.3.4
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
Cc: romain.naour@smile.fr, David GOUARIN <david.gouarin@thalesgroup.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

David, All,

On 2022-07-24 16:26 +0200, David GOUARIN spake thusly:
> Version 2.3.4 of libtalloc needs to define PYTHONHASHSEED, as a check has been added
> to the configure script, and build will fail if it is not defined.
> 
> This is originately a workaround by samba developpers meant to avoid rebuilding talloc
> with each call to make. Defining PYTHONHASHSEED would not be required in the context
> of builroot, if not for the check in the configure script.
> 
> Signed-off-by: David GOUARIN <david.gouarin@thalesgroup.com>
> 
> ---
> Changes v2 -> v3:
>   - fix commented lines and commit message. sorry for the mess.
> 
> Changes v1 -> v2:
>   - edit commit message (suggested by Yann E. MORIN)
> Signed-off-by: David GOUARIN <dgouarin@gmail.com>
> ---
>  package/libtalloc/libtalloc.hash | 2 +-
>  package/libtalloc/libtalloc.mk   | 5 ++++-
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libtalloc/libtalloc.hash b/package/libtalloc/libtalloc.hash
> index cbfd11e63b..0bc8edb695 100644
> --- a/package/libtalloc/libtalloc.hash
> +++ b/package/libtalloc/libtalloc.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  6be95b2368bd0af1c4cd7a88146eb6ceea18e46c3ffc9330bf6262b40d1d8aaa  talloc-2.3.3.tar.gz
> +sha256  179f9ebe265e67e4ab2c26cad2b7de4b6a77c6c212f966903382869f06be6505  talloc-2.3.4.tar.gz
>  sha256  f8340c449dd64a55c6605b02fcad2aec6f473612ac6026739a22995380a8043c  talloc.h
> diff --git a/package/libtalloc/libtalloc.mk b/package/libtalloc/libtalloc.mk
> index 8cba699ea1..6a5e1ef4b6 100644
> --- a/package/libtalloc/libtalloc.mk
> +++ b/package/libtalloc/libtalloc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBTALLOC_VERSION = 2.3.3
> +LIBTALLOC_VERSION = 2.3.4
>  LIBTALLOC_SOURCE = talloc-$(LIBTALLOC_VERSION).tar.gz
>  LIBTALLOC_SITE = https://www.samba.org/ftp/talloc
>  LIBTALLOC_LICENSE = LGPL-3.0+
> @@ -40,6 +40,9 @@ else
>  LIBTALLOC_CONF_OPTS += --disable-python
>  endif
>  
> +LIBTALLOC_CONF_ENV += PYTHONHASHSEED=1
> +LIBTALLOC_MAKE_ENV += PYTHONHASHSEED=1

I've added a little blurb just above that, moved it earlier in the file,
(and thus made them simple assignments), fixed the typo in the commit
log, and applied to master, thanks.

Regards,
Yann E. MORIN.

>  LIBTALLOC_WAF = ./buildtools/bin/waf
>  
>  # like samba4, libtalloc uses the waf build system which requires a
> -- 
> 2.17.1
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
