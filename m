Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA02C4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 11:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9A71431CD;
	Sun, 29 Oct 2023 11:15:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9A71431CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AEdUIkh5okmH; Sun, 29 Oct 2023 11:15:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5238443032;
	Sun, 29 Oct 2023 11:15:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5238443032
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 51F0F1BF3AE
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 11:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B85284C1F
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 11:15:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B85284C1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8BLZvm0F0x75 for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 11:15:24 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FFB284C1C
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 11:15:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FFB284C1C
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:de1f:355b:eff2:ec6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 53A6520039C;
 Sun, 29 Oct 2023 12:15:20 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Oct 2023 12:15:20 +0100
Date: Sun, 29 Oct 2023 12:15:20 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231029111520.GW687180@scaer>
References: <20231029085831.234005-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231029085831.234005-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698578122;
 bh=Ij8+RVK7xlU3lJY1aLeAwFwrGN7Ub34ySnq9iNB8a0E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bp5EUBDqxFcvWg9aHay06PXE4zS3hSIYc+2akPxGYp3tCSNV1ahSU2fnqGbYOuzHT
 HmdlYZbzbbab9x3P+3q4nqAm9nz7jkdHSiwumv8zr5+D+cT7h1O1zGkJ7iNBhl1eeN
 yYnv3cBe7w8M8PPlRHj9lZr0N3YO7KUT24CTPbv/ZoB7Xqope3C2mwzQGmmgReDTCL
 pCaSpeNWirK07P5VCOUHQE5Bz4Kp2IaJRh+l/1epx9SEVrANLEwPjYHOyCcNMwYpnm
 ZOibRKMns6vNDM8rcdzhLG4Ov+hK5tZTKzvyrmz9cmj92TNrDgtUyROhrlKJA8er2r
 c5/sdTmhPPbDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bp5EUBDq
Subject: Re: [Buildroot] [PATCH 1/1] package/pango: fix build with gcc >= 13
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

On 2023-10-29 09:58 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure with gcc >= 13:
> 
> In function 'find_best_lang_match_cached',
>     inlined from 'find_best_lang_match_cached' at ../pango/pango-language.c:501:1,
>     inlined from 'pango_language_get_scripts' at ../pango/pango-language.c:661:21:
> ../pango/pango-language.c:518:12: error: array subscript 0 is outside array bounds of 'const void *[0]' {aka 'const void *[]'} [-Werror=array-bounds=]
>   518 |     *cache = result;
>       |     ~~~~~~~^~~~~~~~
> In function 'pango_language_get_scripts':
> cc1: note: source object is likely at address zero
> cc1: some warnings being treated as errors
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e8b5a752a62621099942b29c1642747eef2930cb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../pango/0001-Drop-Werror-array-bounds.patch | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/pango/0001-Drop-Werror-array-bounds.patch
> 
> diff --git a/package/pango/0001-Drop-Werror-array-bounds.patch b/package/pango/0001-Drop-Werror-array-bounds.patch
> new file mode 100644
> index 0000000000..45821e8533
> --- /dev/null
> +++ b/package/pango/0001-Drop-Werror-array-bounds.patch
> @@ -0,0 +1,40 @@
> +From e93dbd66973040f1e0afcba0dc7c712c27d75d59 Mon Sep 17 00:00:00 2001
> +From: Matthias Clasen <mclasen@redhat.com>
> +Date: Mon, 1 May 2023 23:27:52 -0400
> +Subject: [PATCH] Drop -Werror=array-bounds
> +
> +gcc has strange issues with this and produces false
> +positives that recently started breaking the build of
> +pango as a subproject in gtk.
> +
> +See e.g. https://gcc.gnu.org/bugzilla/show_bug.cgi?id=105523
> +
> +Upstream: https://gitlab.gnome.org/GNOME/pango/-/commit/e93dbd66973040f1e0afcba0dc7c712c27d75d59
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + meson.build | 2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 930f41082..2d30c0141 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -89,7 +89,6 @@ elif cc.get_id() == 'gcc' or cc.get_id() == 'clang'
> +     '-Wuninitialized',
> +     '-Wunused',
> +     '-Werror=address',
> +-    '-Werror=array-bounds',
> +     '-Werror=empty-body',
> +     '-Werror=implicit',
> +     '-Werror=implicit-fallthrough',
> +@@ -132,7 +131,6 @@ elif cc.get_id() == 'gcc' or cc.get_id() == 'clang'
> +     '-Werror=sequence-point',
> +     '-Werror=return-type',
> +     '-Werror=trigraphs',
> +-    '-Werror=array-bounds',
> +     '-Werror=write-strings',
> +     '-Werror=address',
> +     '-Werror=int-to-pointer-cast',
> +-- 
> +GitLab
> +
> -- 
> 2.42.0
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
