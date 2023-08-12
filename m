Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF300C0015E
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 14:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35E73607AA;
	Sat, 12 Aug 2023 14:04:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35E73607AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WSMGd7iP6vDf; Sat, 12 Aug 2023 14:04:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DD1A607DE;
	Sat, 12 Aug 2023 14:04:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DD1A607DE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 78E5B1BF344
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 14:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FB2140166
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 14:04:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FB2140166
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vEuXUtJyYqPm for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 14:04:36 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4664B40003
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 14:04:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4664B40003
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:a00a:6044:1314:a80a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id A830019F5B6;
 Sat, 12 Aug 2023 16:04:30 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 12 Aug 2023 16:04:30 +0200
Date: Sat, 12 Aug 2023 16:04:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230812140430.GL421096@scaer>
References: <ZNYwAHizfBKfreRi@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZNYwAHizfBKfreRi@waldemar-brodkorb.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691849072;
 bh=Sm+EsWkUhH4tK5uPfLfzaNQAfrfP7tdVSmXx7hLmUYE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UzmjbAAINMosDgft2+xiU4y4CTKBqPSnv258zhgaqlc9qqyzxxJKWkMsvpMmgHP8j
 xcQX2KZER/HmZD5/OCM5cU7ZWPSTXuhC69wtgu8a5aGoBD3rEKt1Wc0vT6C+c3E4Zt
 ShX0MELnAp+7L1F3J2gjBwo4MXQ6xh8H7Kc9PZOw8gWGXJZvsD0BsXst9yBg1iSQJc
 WGOM1LVTO42g4hQtcK7FV79u9W4z29xxggncy5GOdAvGDJA8ZDL7x7bOKspwTt/TPg
 lGUqHz04fSZUOhwLKWnB6GhFtOwQ4WH+GJbChbs7xu3v38yyOpJ+tmnbs4ocyVCZ44
 uT3WMj6UCZU5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UzmjbAAI
Subject: Re: [Buildroot] [PATCH] package/util-linux: fix compile issue with
 older kernel headers
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

Waldemar, All,

On 2023-08-11 14:56 +0200, Waldemar Brodkorb spake thusly:
> Linux added mnt_id member to struct statx in commit:
> fa2fcf4f1df1559a0a4ee0f46915b496cc2ebf60
> 
> Linux 5.4.0 was released on 24. November 2019, but it seems this change
> never got backported to 5.4.252.
> 
> Upstream added a patch to guard the use of the member in commit:
> https://github.com/util-linux/util-linux/commit/c0136ac0c98b18208508fbcfac31a843e0bb8a37
> 
> Add the patch to fix an autobuild failure.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/d50/d502bc9236b577e2470a30ffc39c21579b038a1c
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.

I tries to look when this strted to appear, but we do have quite a few
different kind of failrues for util-linux. But upstream added use of
mnt_id back in 2.38, so we can backport this to our maintenace branches,
which all have util-linux 2.38.

Regards,
Yann E. MORIN.

> ---
>  .../0001-libmount-ifdef-statx-call.patch      | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 package/util-linux/0001-libmount-ifdef-statx-call.patch
> 
> diff --git a/package/util-linux/0001-libmount-ifdef-statx-call.patch b/package/util-linux/0001-libmount-ifdef-statx-call.patch
> new file mode 100644
> index 0000000000..ba44650bd3
> --- /dev/null
> +++ b/package/util-linux/0001-libmount-ifdef-statx-call.patch
> @@ -0,0 +1,57 @@
> +From c0136ac0c98b18208508fbcfac31a843e0bb8a37 Mon Sep 17 00:00:00 2001
> +From: Karel Zak <kzak@redhat.com>
> +Date: Thu, 3 Aug 2023 12:39:19 +0200
> +Subject: [PATCH] libmount: ifdef statx() call
> +
> +In this case the statx() is use to get mount ID. It's optional and not
> +required. Let's #ifdef the statx() call and also check for stx_mnt_id
> +struct member.
> +
> +Fixes: https://github.com/util-linux/util-linux/issues/2415
> +Signed-off-by: Karel Zak <kzak@redhat.com>
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> +Upstream: https://github.com/util-linux/util-linux/commit/c0136ac0c98b18208508fbcfac31a843e0bb8a37
> +---
> + configure.ac              | 5 ++++-
> + libmount/src/hook_mount.c | 2 ++
> + 2 files changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index a3cf330b5..ae721c7ac 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -525,7 +525,10 @@ AC_CHECK_MEMBERS([struct termios.c_line],,,
> +     [[#include <termios.h>]])
> + 
> + AC_CHECK_MEMBERS([struct stat.st_mtim.tv_nsec],,,
> +-	[#include <sys/stat.h>])
> ++    [[#include <sys/stat.h>]])
> ++
> ++AC_CHECK_MEMBERS([struct statx.stx_mnt_id],,,
> ++    [[#include <linux/stat.h>]])
> + 
> + AC_CHECK_DECLS([_NL_TIME_WEEK_1STDAY],[],[],[[#include <langinfo.h>]])
> + 
> +diff --git a/libmount/src/hook_mount.c b/libmount/src/hook_mount.c
> +index d69a018ec..056338c49 100644
> +--- a/libmount/src/hook_mount.c
> ++++ b/libmount/src/hook_mount.c
> +@@ -294,6 +294,7 @@ static int hook_create_mount(struct libmnt_context *cxt,
> + 		/* cleanup after fail (libmount may only try the FS type) */
> + 		close_sysapi_fds(api);
> + 
> ++#if defined(HAVE_STRUCT_STATX) && defined(HAVE_STRUCT_STATX_STX_MNT_ID)
> + 	if (!rc && cxt->fs) {
> + 		struct statx st;
> + 
> +@@ -306,6 +307,7 @@ static int hook_create_mount(struct libmnt_context *cxt,
> + 				fs->id = cxt->fs->id;
> + 		}
> + 	}
> ++#endif
> + 
> + done:
> + 	DBG(HOOK, ul_debugobj(hs, "create FS done [rc=%d, id=%d]", rc, cxt->fs ? cxt->fs->id : -1));
> +-- 
> +2.39.2
> +
> -- 
> 2.39.2
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
