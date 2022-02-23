Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535B6C433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 14:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE5CA825BF;
	Wed, 23 Feb 2022 14:27:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ccdNiomlQdaB; Wed, 23 Feb 2022 14:27:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0ABB8825B1;
	Wed, 23 Feb 2022 14:27:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A1211BF3DD
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 14:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17D9B825B1
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 14:27:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KuXabx4SOAbr for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 14:27:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A283813DF
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 14:27:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f0be:eb0a:9f13:7f4d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E47ECB0055E;
 Wed, 23 Feb 2022 15:27:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1645626454;
 bh=BbutiRGK4HzJpjJtsKZ1EcvbzzOb1vd3oWkwre/Vnws=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c/54gf/zOZcvXlyoY4LLs2ELuA6PctSGH+iGGeqMKtLWfx5JGcnMOK93bAAV0N4Y9
 KsowE55WaFQXIDRPtDjBOHaH9DW+sSICYFZM/d0Lb2/0VNS6G6JUwfeh98iEkatHnK
 +QnyQVabhO/jQ6LoZNjuYwYhSKI2o7konN1ArYWly5PbZc9MraKrceHg55wi4zkMWu
 6VJev6CYiRGBrJIoj6nmIL8JlpQA2snsWsbpnFiVRcRRq1kc3p6tf2SByVPzOJTDll
 1AMw6WDnMldrlqH0y7GgVRA9Qwp4PhsmnfUKxhgNBZndkS8WLn3bHQft8+rtyvdsaq
 5mYL0F4PaRpIg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 23 Feb 2022 15:27:31 +0100
Date: Wed, 23 Feb 2022 15:27:31 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: John Keeping <john@metanate.com>
Message-ID: <20220223142731.GA189337@scaer>
References: <20220223115506.1191031-1-john@metanate.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220223115506.1191031-1-john@metanate.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [RFC PATCH] package/libiberty: use the same version
 as binutils
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

John, All,

On 2022-02-23 11:55 +0000, John Keeping spake thusly:
> libiberty is built from the binutils source but this package has
> languished on version 2.32 while the binutils package now uses 2.36.1 by
> default.
> 
> Even between the 2.32 version and GDB 10.2 which is the default (and
> where host-libiberty is used instead of a version bundled in the GDB
> source) there are memory leak fixes and several improvements to
> demangling.
> 
> Update the libiberty package to simply use the same version as binutils
> so that there is no need to remember to update this package in the
> future.  Replace the .hash file with a symlink so that the binutils
> hashes are used automatically.
> 
> Signed-off-by: John Keeping <john@metanate.com>
> ---
> I'm not sure if this is this is the best way to improve the situation
> here - it's the smallest change to get something a bit more modern (in
> most circumstances), but I wonder if libiberty should use the GDB source
> instead as that's the one package we know both bundles libiberty source
> and will use host-libiberty in preference.
> 
>  package/libiberty/libiberty.hash | 6 +-----
>  package/libiberty/libiberty.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 7 deletions(-)
>  mode change 100644 => 120000 package/libiberty/libiberty.hash
> 
> diff --git a/package/libiberty/libiberty.hash b/package/libiberty/libiberty.hash
> deleted file mode 100644
> index 0dafcea520..0000000000
> --- a/package/libiberty/libiberty.hash
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -# From ftp://gcc.gnu.org/pub/binutils/releases/sha512.sum
> -sha512  d326408f12a03d9a61a9de56584c2af12f81c2e50d2d7e835d51565df8314df01575724afa1e43bd0db45cfc9916b41519b67dfce03232aa4978704492a6994a  binutils-2.32.tar.xz
> -
> -# Locally computed, same as binutils.hash
> -sha256  56bdea73b6145ef6ac5259b3da390b981d840c24cb03b8e1cbc678de7ecfa18d  COPYING.LIB
> diff --git a/package/libiberty/libiberty.hash b/package/libiberty/libiberty.hash
> new file mode 120000
> index 0000000000..e0655d3af3
> --- /dev/null
> +++ b/package/libiberty/libiberty.hash
> @@ -0,0 +1 @@
> +../binutils/binutils.hash
> \ No newline at end of file
> diff --git a/package/libiberty/libiberty.mk b/package/libiberty/libiberty.mk
> index 6235a8b956..d0847bf298 100644
> --- a/package/libiberty/libiberty.mk
> +++ b/package/libiberty/libiberty.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -LIBIBERTY_VERSION = 2.32
> -LIBIBERTY_SOURCE = binutils-$(LIBIBERTY_VERSION).tar.xz
> +LIBIBERTY_VERSION = $(BINUTILS_VERSION)
> +LIBIBERTY_SOURCE = $(BINUTILS_SOURCE)

Although this works, this is by pure chance: binutils is included before
libiberty, so BINUTILS_VERSION is defined. But we try and avoid such a
situation, unless we explicitly guarantee the include ordering (eg. gcc,
fftw, util-linux, or previously, qt5).

Instead, in such a case, we prefer that the version strin is duplicated,
and a comment added above to note that both shoujld be updated in sync.
See for example bluez5_utils and bluez5_utils-headers, mesa3d and
mesa3d-headers.

Regards,
Yann E. MORIN.

>  LIBIBERTY_SITE = $(BR2_GNU_MIRROR)/binutils
>  HOST_LIBIBERTY_DL_SUBDIR = binutils
>  
> -- 
> 2.35.1
> 

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
