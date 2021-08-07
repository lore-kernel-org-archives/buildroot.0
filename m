Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE54C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 08:47:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7990A610A1
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 08:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7990A610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36A9C4048E;
	Sat,  7 Aug 2021 08:47:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y8EjXZHg6Xfe; Sat,  7 Aug 2021 08:47:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DDB140481;
	Sat,  7 Aug 2021 08:47:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3FB511BF2FA
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 08:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FC6E40481
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 08:47:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AE8pWAGqReyL for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 08:47:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40FAC4041D
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 08:47:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f16c:16be:6f47:5c9a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 13FF013F88F;
 Sat,  7 Aug 2021 10:47:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1628326041;
 bh=6feGgZu66VznyCqrIlyde1XlkKbiYUbMk/v8KqxguCs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NCPQkvz9Z+vanBoUMEskP4iOJZT5PB0csm+R8WEbAzovEs2L+UX/BZYmdR4+ldv2f
 Y3T37dtU7HtuJ6BPVzIZ10amEnl2CErT1BhxffyLK3wvHZClcl4hwsC8K1sUFWW4Sa
 +imYRxj2Gq/UDLmD1aEd+FMB2Odmug/4O0gH0OlHEeV4PVKHtK/NlpP5A/zct8fwzG
 TxiFqLwE2S/Hj7RBJRs34xax5YqFyh6fGF72fPAQ+gkxUzMMSHQdBtLHvVvz3v8gA2
 +io/EasxT24ejTR1bD+FwQXBlpxpf1EYeeOBkrlbQpKD3GZtxcUYG0fitUtQ6HnQOi
 4Lekt73yXVrdQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 07 Aug 2021 10:47:12 +0200
Date: Sat, 7 Aug 2021 10:47:12 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210807084712.GT27036@scaer>
References: <20210806212506.116451-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210806212506.116451-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/xen: fix build with gcc 11
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>,
 Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-08-06 23:25 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure with gcc 11:
> 
> linux.c:165:50: error: argument 7 of type 'const xen_pfn_t[]' {aka 'const long long unsigned int[]'} declared as an ordinary array [-Werror=vla-parameter]
>   165 |                                  const xen_pfn_t arr[/*num*/], int err[/*num*/])
>       |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~
> In file included from linux.c:29:
> private.h:35:50: note: previously declared as a variable length array 'const xen_pfn_t[num]' {aka 'const long long unsigned int[num]'}
>    35 |                                  const xen_pfn_t arr[num], int err[num]);
>       |                                  ~~~~~~~~~~~~~~~~^~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f70d060cf50254694113f19f50a8ef96ef33dd1a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...osdep_xenforeignmemory_map-prototype.patch | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/xen/0002-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-prototype.patch
> 
> diff --git a/package/xen/0002-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-prototype.patch b/package/xen/0002-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-prototype.patch
> new file mode 100644
> index 0000000000..170d1c22c2
> --- /dev/null
> +++ b/package/xen/0002-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-prototype.patch
> @@ -0,0 +1,33 @@
> +From 5d3e4ebb5c71477d74a0c503438545a0126d3863 Mon Sep 17 00:00:00 2001
> +From: Anthony PERARD <anthony.perard@citrix.com>
> +Date: Tue, 1 Jun 2021 16:41:47 +0100
> +Subject: [PATCH] libs/foreignmemory: Fix osdep_xenforeignmemory_map prototype
> +
> +Commit cf8c4d3d13b8 made some preparation to have one day
> +variable-length-array argument, but didn't declare the array in the
> +function prototype the same way as in the function definition. And now
> +GCC 11 complains about it.
> +
> +Fixes: cf8c4d3d13b8 ("tools/libs/foreignmemory: pull array length argument to map forward")
> +Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> +Reviewed-by: Jan Beulich <jbeulich@suse.com>
> +[Retrieved from:
> +https://github.com/xen-project/xen/commit/5d3e4ebb5c71477d74a0c503438545a0126d3863]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + tools/libs/foreignmemory/private.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tools/libs/foreignmemory/private.h b/tools/libs/foreignmemory/private.h
> +index 1ee3626dd278..5bb0cefb0987 100644
> +--- a/tools/libs/foreignmemory/private.h
> ++++ b/tools/libs/foreignmemory/private.h
> +@@ -32,7 +32,7 @@ int osdep_xenforeignmemory_close(xenforeignmemory_handle *fmem);
> + void *osdep_xenforeignmemory_map(xenforeignmemory_handle *fmem,
> +                                  uint32_t dom, void *addr,
> +                                  int prot, int flags, size_t num,
> +-                                 const xen_pfn_t arr[num], int err[num]);
> ++                                 const xen_pfn_t arr[/*num*/], int err[/*num*/]);
> + int osdep_xenforeignmemory_unmap(xenforeignmemory_handle *fmem,
> +                                  void *addr, size_t num);
> + 
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
