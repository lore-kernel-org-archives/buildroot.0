Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60701C4332F
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 09:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02D3F81FA4;
	Sun, 20 Nov 2022 09:17:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02D3F81FA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hqnVr8ycGObt; Sun, 20 Nov 2022 09:17:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3344F81F6C;
	Sun, 20 Nov 2022 09:17:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3344F81F6C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 894111BF40E
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 09:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F62740412
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 09:17:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F62740412
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ECz9ugpZjR4K for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 09:17:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6872B4014A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6872B4014A
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 09:17:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c0a9:eda8:8a8b:60c8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 84420B00576;
 Sun, 20 Nov 2022 10:17:06 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Nov 2022 10:17:06 +0100
Date: Sun, 20 Nov 2022 10:17:06 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Alexander Lukichev <alexander.lukichev@gmail.com>
Message-ID: <20221120091706.GR2123054@scaer>
References: <20221120090654.312078-1-alexander.lukichev@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221120090654.312078-1-alexander.lukichev@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1668935829;
 bh=ajfoSJD4W6nqI0xSSo8ZjhbWHcXVOvRBkaGtkgcJEOw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QdVZA9F0P1EaEvc4X2Fizx+AdIXjVGsvywtpWZIsH+1X834/jx1C18NC3kzpf9I5C
 3ZdwkNLikQR93hWJq2xVzN8YpM+qR+WZkaJbLRGJlutFkPbDWO+WCfISewTMxRCJhy
 nRvnHdE7UlrznFHri1U8dmfj/QGKXXJKsTws+lBF4xV8sTAUKtfa9b5E0yxDWvxJ94
 zEX4p3H9VHWgjlg4/Lj4jHwUxk2MvQA/JUBVGMJoWzA5nBZAMyqrvxpbrGa2pbI/2I
 cu82bNpICPDCfe9Q9IQMadfXCkve4Z8g2/hL98je8CWyVX2/RR7tyA9Ob78gsSd7vx
 1R2EHOxVD3d7A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QdVZA9F0
Subject: Re: [Buildroot] [PATCH 1/1] package/openpgm: fix build for non-x86
 targets
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Alexander, All,

On 2022-11-20 11:06 +0200, Alexander Lukichev spake thusly:
> openpgm-5-3-128 has assembly code for x86 that is not guarded by
> architecture defines. A patch to fix that has been merged upstream
> some time ago, and the next release will have it. This includes
> that patch for the time being.
> 
> Fixes: http://autobuild.buildroot.net/results/338291e5bf0671cb7ed7a32cc10e546c7a521acc
> Fixes: http://autobuild.buildroot.net/results/3ab6d7f9ee841fa18c1c220d722b1c06ca1fff30
> Fixes: http://autobuild.buildroot.net/results/68e840b1fec8f14775cef0b6a14d9b847337324b
> 
> Signed-off-by: Alexander Lukichev <alexander.lukichev@gmail.com>

Applied to master, thanks.

But see below for a little nit...

> ---
>  .../openpgm/0003-fix-build-on-macOS-ARM.patch | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/openpgm/0003-fix-build-on-macOS-ARM.patch
> 
> diff --git a/package/openpgm/0003-fix-build-on-macOS-ARM.patch b/package/openpgm/0003-fix-build-on-macOS-ARM.patch
> new file mode 100644
> index 0000000000..be52fb27a6
> --- /dev/null
> +++ b/package/openpgm/0003-fix-build-on-macOS-ARM.patch
> @@ -0,0 +1,34 @@
> +From 43dfc3e3a66b8e4584eb46219b129197a2428181 Mon Sep 17 00:00:00 2001
> +From: Michael Cho <cho-m@tuta.io>
> +Date: Thu, 10 Mar 2022 22:46:29 -0800
> +Subject: [PATCH] fix build on macOS ARM
> +
> +Signed-off-by: Alexander Lukichev <alexander.lukichev@gmail.com>
> +[Upstream status: https://github.com/steve-o/openpgm/pull/71]

Pointing to a PR hints that the patch is still pending, but as your
commit log said it was applied, that did not match. So I checked, and
indeed the patch is an actual backport.

So I slightly tweaked it to make it obvious it is a backport rather than
a pending patch.

Thanks!

Regards,
Yann E. MORIN.

> +---
> + openpgm/pgm/cpu.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/openpgm/pgm/cpu.c b/openpgm/pgm/cpu.c
> +index cbcc988..f5da471 100644
> +--- a/openpgm/pgm/cpu.c
> ++++ b/openpgm/pgm/cpu.c
> +@@ -33,6 +33,7 @@
> + //#define CPU_DEBUG
> + 
> + 
> ++#if defined(__i386__) || defined(__x86_64__)
> + #ifndef _MSC_VER
> + static
> + void
> +@@ -59,7 +60,6 @@ _xgetbv(uint32_t xcr) {
> + #endif
> + 
> + 
> +-#if defined(__i386__) || defined(__x86_64__)
> + PGM_GNUC_INTERNAL
> + void
> + pgm_cpuid (pgm_cpu_t* cpu)
> +-- 
> +2.37.2
> +
> -- 
> 2.37.2
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
