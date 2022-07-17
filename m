Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3212AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 13:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D181140A15;
	Sun, 17 Jul 2022 13:28:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D181140A15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ekOzXr0GXuPB; Sun, 17 Jul 2022 13:28:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61AE7409D3;
	Sun, 17 Jul 2022 13:28:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61AE7409D3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E72381BF3D5
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFB2E408C7
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:28:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFB2E408C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WEZca7bB5bXy for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 13:28:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A11640469
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A11640469
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 13:28:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 55A27780508;
 Sun, 17 Jul 2022 15:28:12 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 15:28:12 +0200
Date: Sun, 17 Jul 2022 15:28:12 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220717132812.GO2249625@scaer>
References: <20220712213410.1912088-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220712213410.1912088-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658064496;
 bh=/u9R9rbYQvXErc5JlxPdXJrlnhdTmVkAMnvxdmpN77w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gY4C68GT0+Bd6TMzFr303rxmDRFA6RE3HOaDJjIe/otFKlGYhd0quKU7x99EEFDGG
 UMNJZiUsvtHk81byp5AEQm+d8UCwczf/Om06kGoDghNLJWbpxrPnIr1p19XsN6Kx9e
 6RJ6tcdBvb7hSg06CNxniQrHPE/cIDVOtTSkD9fVv6r2t5ibTKO2TyykZJQGOFey0w
 3qJubRKOfXjN0wuJFMnZBLBIyTUSKLKVf901HXYx9KYAd8+Y/YhCblgOKEiU+TZshC
 8S60p1mqyD/P2D2LZN3XG9SAO37TTLnaDjTsUFixRcdcj7V9pVpLk/Zh9D7QGRFvkm
 nfAAqMz6BSOWQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gY4C68GT
Subject: Re: [Buildroot] [PATCH v2, 1/1] package/libstrophe: disable examples
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
Cc: Denis Bodor <lefinnois@lefinnois.net>, Michael Vetter <jubalh@iodoru.org>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-07-12 23:34 +0200, Fabrice Fontaine spake thusly:
> Disable examples to avoid the following build failure on sparc:
> 
> examples/perf.c: In function 'rdtsc':
> examples/perf.c:110:5: warning: 'x' is used uninitialized in this function [-Wuninitialized]
>   110 |     __asm__ __volatile__("rd %%tick, %0; clruw %0, %1; srlx %0, 32, %0"
>       |     ^~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/5881246c4e9f7560181d2e60185d3bb5cf4f5a5f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>  - Drop patch and autoreconf as patch is already in version 0.12.1
> 
>  package/libstrophe/libstrophe.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libstrophe/libstrophe.mk b/package/libstrophe/libstrophe.mk
> index ce99c9fe48..7a349a19d4 100644
> --- a/package/libstrophe/libstrophe.mk
> +++ b/package/libstrophe/libstrophe.mk
> @@ -11,6 +11,7 @@ LIBSTROPHE_DEPENDENCIES = host-pkgconf
>  LIBSTROPHE_LICENSE = MIT or GPL-3.0
>  LIBSTROPHE_LICENSE_FILES = MIT-LICENSE.txt GPL-LICENSE.txt
>  LIBSTROPHE_INSTALL_STAGING = YES
> +LIBSTROPHE_CONF_OPTS = --disable-examples
>  
>  ifeq ($(BR2_PACKAGE_EXPAT),y)
>  LIBSTROPHE_CONF_OPTS += --without-libxml2
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
