Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED22C3DA79
	for <buildroot@archiver.kernel.org>; Mon, 26 Dec 2022 21:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E948A80C58;
	Mon, 26 Dec 2022 21:04:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E948A80C58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ls1EZbk5DM1; Mon, 26 Dec 2022 21:04:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2716F80C4D;
	Mon, 26 Dec 2022 21:04:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2716F80C4D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CBD241BF3B9
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 21:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3CBC4067F
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 21:04:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3CBC4067F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HLksyX-aGD3W for <buildroot@lists.busybox.net>;
 Mon, 26 Dec 2022 21:04:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2133C404F5
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2133C404F5
 for <buildroot@buildroot.org>; Mon, 26 Dec 2022 21:04:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.110.42])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 93168780340;
 Mon, 26 Dec 2022 22:04:14 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 26 Dec 2022 22:04:13 +0100
Date: Mon, 26 Dec 2022 22:04:13 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221226210413.GE2893@scaer>
References: <20221226130207.649502-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221226130207.649502-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672088658;
 bh=duq1N/E/feOR9YR77AS1uW2CE6X94LU5IfbDY7bJFWQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iHPBOB7ok9pdVQlAHOfRAkUvx2mBQhB2ozRN7sdwR3/gNicbqJSlw/ovB4jXeHlRo
 mHv7RZJ/33G1+9SAQt+Cam81SDd70hlvmptIa+ct8a314lDMlfRwRZ7JzXkVIh9A8B
 C1Z9oYiY0Bcf+4KhcP9wJ8GGxlFtcbHkO/dUuhYCY9WYwbHX8bLjCqA+mRq3UeoBLI
 9TRei9mmUaegjRy1pohJ9FXhmyVNGPHg4D8V8opQ58ojCWJXSTxErXRHAEXYu5PbBB
 ENkFivhDKIgpZz8dvCv7JRpxkmGetPRF7utSxSkRcas0O4KrELW79gRNXldTDvr80t
 Ggx+DJfL9eoKw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iHPBOB7o
Subject: Re: [Buildroot] [PATCH 1/1] package/multipath-tools: drop patch
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
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-12-26 14:02 +0100, Fabrice Fontaine spake thusly:
> Drop path and set SYSTEMD="" if needed following upstream feedback:
> https://github.com/opensvc/multipath-tools/pull/34
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...ble-systemd-if-ENABLE_SYSTEMD-is-def.patch | 35 -------------------
>  package/multipath-tools/multipath-tools.mk    |  3 +-
>  2 files changed, 2 insertions(+), 36 deletions(-)
>  delete mode 100644 package/multipath-tools/0001-Makefile.inc-Enable-systemd-if-ENABLE_SYSTEMD-is-def.patch
> 
> diff --git a/package/multipath-tools/0001-Makefile.inc-Enable-systemd-if-ENABLE_SYSTEMD-is-def.patch b/package/multipath-tools/0001-Makefile.inc-Enable-systemd-if-ENABLE_SYSTEMD-is-def.patch
> deleted file mode 100644
> index 133094a7f7..0000000000
> --- a/package/multipath-tools/0001-Makefile.inc-Enable-systemd-if-ENABLE_SYSTEMD-is-def.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 8370da992c752e4238de7a8b02ce0e179353c959 Mon Sep 17 00:00:00 2001
> -From: Alexander Egorenkov <egorenar-dev@posteo.net>
> -Date: Sun, 6 Sep 2020 10:37:41 +0200
> -Subject: [PATCH] Makefile.inc: Enable systemd if ENABLE_SYSTEMD is defined
> -
> -systemd is disabled by default, to activate it set ENABLE_SYSTEMD.
> -
> -Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
> ----
> - Makefile.inc | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/Makefile.inc b/Makefile.inc
> -index d4d1e0dd..32bc1846 100644
> ---- a/Makefile.inc
> -+++ b/Makefile.inc
> -@@ -35,6 +35,7 @@ ifndef RUN
> - 	endif
> - endif
> - 
> -+ifdef ENABLE_SYSTEMD
> - ifndef SYSTEMD
> - 	ifeq ($(shell pkg-config --modversion libsystemd >/dev/null 2>&1 && echo 1), 1)
> - 		SYSTEMD = $(shell pkg-config --modversion libsystemd)
> -@@ -45,6 +46,7 @@ ifndef SYSTEMD
> - 		endif
> - 	endif
> - endif
> -+endif
> - 
> - ifndef SYSTEMDPATH
> - 	SYSTEMDPATH=usr/lib
> --- 
> -2.28.0
> -
> diff --git a/package/multipath-tools/multipath-tools.mk b/package/multipath-tools/multipath-tools.mk
> index df3d5138e8..d6abf68ca0 100644
> --- a/package/multipath-tools/multipath-tools.mk
> +++ b/package/multipath-tools/multipath-tools.mk
> @@ -31,7 +31,8 @@ MULTIPATH_TOOLS_MAKE_OPTS = \
>  
>  ifeq ($(BR2_PACKAGE_SYSTEMD),y)
>  MULTIPATH_TOOLS_DEPENDENCIES += systemd
> -MULTIPATH_TOOLS_MAKE_OPTS += ENABLE_SYSTEMD=1
> +else
> +MULTIPATH_TOOLS_MAKE_OPTS += SYSTEMD=""
>  endif
>  
>  define MULTIPATH_TOOLS_BUILD_CMDS
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
