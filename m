Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA7DC636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 11:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61575408A8;
	Tue,  7 Feb 2023 11:48:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61575408A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TfHAxiDzzI-j; Tue,  7 Feb 2023 11:48:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 812564061D;
	Tue,  7 Feb 2023 11:48:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 812564061D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6492A1BF2AF
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 11:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BC98410C4
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 11:48:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BC98410C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FTwSuG0QGk0Q for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 11:48:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C660D402AF
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C660D402AF
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 11:48:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 91DF413F86A;
 Tue,  7 Feb 2023 12:48:42 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 07 Feb 2023 12:48:42 +0100
Date: Tue, 7 Feb 2023 12:48:42 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <20230207114842.GE4124@scaer>
References: <20230207112644.2467564-1-vfazio@xes-inc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230207112644.2467564-1-vfazio@xes-inc.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675770526;
 bh=2B5uDQSLR+z6zBV1hgHsNqmFe6g0WtdyAQz+mxYyEBI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aPpCANfKoxQExXSvGnqVklbA0Rgc3KyYY6i66N2zXXQkHwRaXy25Dreg+wcXvJT/t
 9YnOobgoqHFDZYTP/Oqk0lCDjt9dI2phTapnq0DLN5CwuY/3+lI1rgIjBMFtD6rMkH
 3kwb8mKficaoBr3OSfLfu2N6Au3zPxLc5Fa2VlZ2ToBh3RVqozu8ydAp7UMmIHr/yq
 k8WDgh+R+DxEhz4TOqNTovhkHlygmOU/vLk/jQVK7axgKXAiTXoLVHLQCIg5x2G6ta
 pX4m226OmlcwINWZDi/pMFOMy7LzsdEBe7LcDKZC7eIc5wRAiMhC2X+w5D+vLSg4EF
 weSKHiSu1v2Gw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aPpCANfK
Subject: Re: [Buildroot] [PATCH 1/1] package/bash: fix strtoimax builtin
 inclusion logic
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
Cc: Vincent Fazio <vfazio@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Vincent, All,

On 2023-02-07 05:26 -0600, Vincent Fazio spake thusly:
> From: Vincent Fazio <vfazio@gmail.com>
> 
> Backport fixes from upstream to fix an issue where the strtoimax builtin
> got built when not necessary.
> 
> This resolves bash static builds issues when using musl and uClibc.
> 
> Fixes:
>  http://autobuild.buildroot.org/results/f8c/f8cb91f7f9ac6a46bb2ecfc22c1e42cf699f28d3//
>  http://autobuild.buildroot.org/results/b0e/b0e5fcab9eeb799e31bca27fcb7280b728349bc6//
> 
> Upstream:
>   https://git.savannah.gnu.org/cgit/bash.git/commit/?h=devel&id=43e861c2cd840946a81dfd0386966eb4f3a17ce9
> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>

As seen IRL, I've done some small changes:

  - patch configure after the m4 file
  - add blurb in commit log to explain that

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...vert-condition-for-strtoimax-builtin.patch | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 package/bash/0003-configure-invert-condition-for-strtoimax-builtin.patch
> 
> diff --git a/package/bash/0003-configure-invert-condition-for-strtoimax-builtin.patch b/package/bash/0003-configure-invert-condition-for-strtoimax-builtin.patch
> new file mode 100644
> index 0000000000..2ee9e1ad5a
> --- /dev/null
> +++ b/package/bash/0003-configure-invert-condition-for-strtoimax-builtin.patch
> @@ -0,0 +1,60 @@
> +From 754e0d1edc1c01b18f4890de7c58f7610e589d76 Mon Sep 17 00:00:00 2001
> +From: Vincent Fazio <vfazio@gmail.com>
> +Date: Tue, 7 Feb 2023 03:55:28 -0600
> +Subject: [PATCH] configure: invert condition for strtoimax builtin
> +
> +Previously, bash would attempt to build a replacement for strtoimax if
> +it found that the C library had the function already declared.
> +
> +This caused build errors when linking against static libraries that did
> +not define the function as a weak alias but, in reality, was a logic
> +error since bash should only provide it's own implementation if one is
> +not provided by the C library.
> +
> +Now, fix this by inverting the logic.
> +
> +Upstream:
> +  https://git.savannah.gnu.org/cgit/bash.git/commit/?h=devel&id=43e861c2cd840946a81dfd0386966eb4f3a17ce9
> +
> +Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> +---
> + configure       | 6 +++++-
> + m4/strtoimax.m4 | 5 ++++-
> + 2 files changed, 9 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure b/configure
> +index 47313753..6039cee7 100755
> +--- a/configure
> ++++ b/configure
> +@@ -20443,7 +20443,11 @@ fi
> + 
> + { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $bash_cv_func_strtoimax" >&5
> + printf "%s\n" "$bash_cv_func_strtoimax" >&6; }
> +-if test $bash_cv_func_strtoimax = yes; then
> ++if test "$ac_cv_have_decl_strtoimax" = "yes" ; then
> ++printf "%s\n" "#define HAVE_DECL_STRTOIMAX 1" >>confdefs.h
> ++
> ++fi
> ++if test $bash_cv_func_strtoimax = no; then
> + case " $LIBOBJS " in
> +   *" strtoimax.$ac_objext "* ) ;;
> +   *) LIBOBJS="$LIBOBJS strtoimax.$ac_objext"
> +diff --git a/m4/strtoimax.m4 b/m4/strtoimax.m4
> +index 30985723..fa43ac7b 100644
> +--- a/m4/strtoimax.m4
> ++++ b/m4/strtoimax.m4
> +@@ -29,7 +29,10 @@ AC_CACHE_VAL(bash_cv_func_strtoimax,
> +   fi
> + ])
> + AC_MSG_RESULT($bash_cv_func_strtoimax)
> +-if test $bash_cv_func_strtoimax = yes; then
> ++if test "$ac_cv_have_decl_strtoimax" = "yes" ; then
> ++AC_DEFINE([HAVE_DECL_STRTOIMAX], [1])
> ++fi
> ++if test $bash_cv_func_strtoimax = no; then
> + AC_LIBOBJ(strtoimax)
> + fi
> + ])
> +-- 
> +2.25.1
> +
> -- 
> 2.25.1
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
