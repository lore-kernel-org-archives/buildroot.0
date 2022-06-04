Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88714C43334
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 17:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37AF440C39;
	Sat,  4 Jun 2022 17:05:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c3McZ0_zxcKS; Sat,  4 Jun 2022 17:05:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 457AB40A99;
	Sat,  4 Jun 2022 17:05:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F2E7A1BF364
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 17:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA3E04099E
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 17:05:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ng7k94m1HP11 for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 17:05:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D2964419C7
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 17:05:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e086:bc2a:8b9d:c22])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id EBAA45FF96;
 Sat,  4 Jun 2022 19:05:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1654362334;
 bh=1i3IHlZlJtUFIVOXgz9Y5+wbmLUtrrSFBzsDzQyYFRM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d6Shd8D7PMhdvwxXQgQsYnVNU3/5iacRhXHQkJKdNmJD5QmRh6ZoPOBHgrE7vNFSK
 vxsm8TZwDkUb1OsLG1rheHiHJXF+JIbh1ychrT4shRf3W/qnxpYluZue1enatG2jKA
 VVqqMNRPYt+caOTj+ybXOaFTmAUw0E4hqOoidMsc2dlJ8GlZLG+O+j/qyaPEbXjfjC
 UJOoTgBW/NhF1Vn/Tjdkp/5plbm9nsJko6UrN05PcBfT4tiNe+xnk4DpN3Rt4+ZUFZ
 v6eQ+zezR80AxeRm/GTwfFWCbK7pNmmWYBDHdhQlrCQ43bLJJxFk9MRV1vSOcLktOD
 yl1I4G+fKVF2Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Jun 2022 19:05:30 +0200
Date: Sat, 4 Jun 2022 19:05:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220604170530.GP427639@scaer>
References: <20220519164038.918088-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220519164038.918088-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/zchunk: fix build with
 argp-standalone and NLS
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-05-19 18:40 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure with argp-standalone and NLS raised
> since commit 5430c8fedd0392e79e0c011825b056fea129980a:
> 
> /home/buildroot/autobuild/instance-3/output-1/host/bin/i686-linux-gcc  -o test/zck_cmp_uncomp test/zck_cmp_uncomp.p/zck_cmp_uncomp.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 '-Wl,-rpath,$ORIGIN/../src/lib' -Wl,-rpath-link,/home/buildroot/autobuild/instance-3/output-1/build/zchunk-1.2.2/build/src/lib -Wl,--start-group src/lib/libzck.so.1.2.2 -largp -Wl,--end-group
> /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-3/output-1/host/i686-buildroot-linux-uclibc/sysroot/usr/lib/libargp.a(argp-help.o): in function `arg':
> /home/buildroot/autobuild/instance-3/output-1/build/argp-standalone-1.4.1/argp-help.c:936: undefined reference to `libintl_dgettext'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1242d0b15ceb816e946bfc1b31dd39e68227359f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/zchunk/zchunk.mk | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/package/zchunk/zchunk.mk b/package/zchunk/zchunk.mk
> index 5582c21e77..fc91f90431 100644
> --- a/package/zchunk/zchunk.mk
> +++ b/package/zchunk/zchunk.mk
> @@ -9,8 +9,11 @@ ZCHUNK_SITE = $(call github,zchunk,zchunk,$(ZCHUNK_VERSION))
>  ZCHUNK_LICENSE = BSD-2-Clause
>  ZCHUNK_LICENSE_FILES = LICENSE
>  ZCHUNK_INSTALL_STAGING = YES
> -ZCHUNK_DEPENDENCIES = \
> -	$(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone)
> +
> +ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
> +ZCHUNK_DEPENDENCIES += argp-standalone $(TARGET_NLS_DEPENDENCIES)
> +ZCHUNK_LDFLAGS += $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
> +endif
>  
>  ifeq ($(BR2_PACKAGE_LIBCURL),y)
>  ZCHUNK_DEPENDENCIES += libcurl
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
