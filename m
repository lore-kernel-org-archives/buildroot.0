Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CABC77B76
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 11:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C66908212F;
	Sun, 23 Apr 2023 11:07:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C66908212F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZD-T0X6k-ON2; Sun, 23 Apr 2023 11:07:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1D32818C2;
	Sun, 23 Apr 2023 11:07:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1D32818C2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD9D31BF859
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 11:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C42B240B5B
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 11:07:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C42B240B5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UaB_S-u64Li8 for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 11:07:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5F2F4059F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5F2F4059F
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 11:07:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:f69d:4ee8:8d2a:132a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 13202B00548;
 Sun, 23 Apr 2023 13:07:50 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Apr 2023 13:07:49 +0200
Date: Sun, 23 Apr 2023 13:07:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Knight <james.d.knight@live.com>
Message-ID: <20230423110749.GG2696@scaer>
References: <SN4P221MB06822B245A5155FE545F0362A0609@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
 <SN4P221MB0682F66DD9BCC6100721CB41A0609@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN4P221MB0682F66DD9BCC6100721CB41A0609@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1682248073;
 bh=a0tRIbp+glzzXV4nz81szznEu5BOPX/bT4B2vqypQ4o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j63+7GjwVt3T8tKtVwgJFDEYo3qmP3ihJLrGASaF93XOWfp5sjrhzM36fKEAIgUa1
 PBZJttlzg3gcn0y7g9/S/JRn0pOoy1RNMernAbPMruqCShkveMZG1WIJEprbOU61AR
 nV/JA7LeRAjzOJEAMw0q3PVSjJTswOheXrhWMw7rHxg2xbnJ0dumNWIDcliNG4sh8E
 7HDJ/bPRat2BFx3w5OIbWDWr+G55xZp99MswMTs3cy9kYlScMsIv6usDsEfZAh703e
 n+muos24UIjkxUJZ1G34m0WDEuwYXhXU5xerF+JVKCb7OFAraRPnMwVUizgx+ZgQca
 dmUdLp0oBlApQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=j63+7Gjw
Subject: Re: [Buildroot] [PATCH 4/4] .checkpackageignore: drop legacy
 ignores (glib2)
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

James, All,

On 2023-04-21 10:12 -0400, James Knight spake thusly:
> Dropping old patch ignores for the `libglib2` and `glib-networking`
> packages, as they have been dropped/updated.
> 
> Signed-off-by: James Knight <james.d.knight@live.com>

I've instead regenerated .checkpackageignore with each patch.

Indeed, should we backport one patch (e.g. to backport a security fix),
then we also want to backport the checkpackage fix at the same time,
otherwise that could be omitted, and would trigger CI failures.

Regards,
Yann E. MORIN.

> ---
>  .checkpackageignore | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 02c892c1b3144a14abbc2a0f3d0b3cbfbf7efca7..a072afe70989e36b1c5d033a7621820c36c71663 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -606,7 +606,6 @@ package/giblib/0001-fix-imlib2-detection.patch Upstream
>  package/giflib/0001-Makefile-add-targets-to-manage-static-building.patch Upstream
>  package/git-crypt/0001-fix-build-with-libressl-3.5.0.patch Upstream
>  package/gli/0001-Optional-building-tests.patch Upstream
> -package/glib-networking/0001-meson-change-std-to-gnu99.patch Upstream
>  package/glmark2/0001-wscript-use-find_program-to-find-wayland-scanner.patch Upstream
>  package/glmark2/0002-libmatrix-Add-missing-utility-include.patch Upstream
>  package/glog/0001-added-emscripten-support.patch Upstream
> @@ -801,10 +800,6 @@ package/libgdiplus/0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.pat
>  package/libgit2/0001-sysdir-Do-not-declare-win32-functions-on-non-win32-p.patch Upstream
>  package/libglfw/0001-Wayland-Remove-extra-cmake-modules-dependency.patch Upstream
>  package/libglfw/0002-src-CMakeLists.txt-allow-override-of-wayland-pkgdata.patch Upstream
> -package/libglib2/0001-fix-compile-time-atomic-detection.patch Upstream
> -package/libglib2/0002-remove-cpp-requirement.patch Upstream
> -package/libglib2/0003-Add-Wno-format-nonliteral-to-compiler-arguments.patch Upstream
> -package/libglib2/0004-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch Upstream
>  package/libgpgme/0001-Fix-build-without-threads.patch Upstream
>  package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch Upstream
>  package/libgsm/0001-misc-fixes-from-archlinux.patch Upstream
> -- 
> 2.39.1.windows.1
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
