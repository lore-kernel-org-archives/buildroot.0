Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D76C54EBD
	for <buildroot@archiver.kernel.org>; Sun,  8 Jan 2023 15:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFEC840463;
	Sun,  8 Jan 2023 15:43:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFEC840463
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N_pp2THxzCnw; Sun,  8 Jan 2023 15:43:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1AA0C40201;
	Sun,  8 Jan 2023 15:43:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AA0C40201
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DA5CD1BF360
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 15:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B58C66059F
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 15:43:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B58C66059F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rKFQGepkhhJT for <buildroot@lists.busybox.net>;
 Sun,  8 Jan 2023 15:43:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67BE8600C7
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 67BE8600C7
 for <buildroot@buildroot.org>; Sun,  8 Jan 2023 15:43:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C37CF5FF9D;
 Sun,  8 Jan 2023 16:43:38 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 08 Jan 2023 16:43:38 +0100
Date: Sun, 8 Jan 2023 16:43:38 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230108154338.GC151997@scaer>
References: <20221230174646.409970-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221230174646.409970-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673192620;
 bh=48m9UA4D8sCpVtf4Wke9HBjFH9JXayQLefBnBip83n4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d4TcVJGt1jPOwCRw9XcrSotLGsB0lcyV8CEBPJ1XOD74aNxlpPkDUPdtevwqSR1fT
 Lvyn1NqkFn3thRPHh+9e1N9FuUVM3gknTcvh+lfaRDJcztxe/Qvy1pPrDfG/EAeFuA
 hNFhry3IMG07EWvUqcdButAWvbhPci2zg00k/xEQwd3v1vahA/znfgi5/RnTDqlslT
 EkSiI+B3wnpik5aFotMc3JkEUiznjdIrXi+R6iJrjlE51y8GmGylMaBNwpgYaE4kDV
 ei+VY08M2FEJvweO72GPdawP9kRaPxK8s1TDZchQaRiLxjb0pjmmyEtBSudCjzVne4
 2N4wD3UCo6A8g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=d4TcVJGt
Subject: Re: [Buildroot] [PATCH 1/1] package/crun: fix static build
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

On 2022-12-30 18:46 +0100, Fabrice Fontaine spake thusly:
> Fix the following static build failure raised since bump to version
> 1.7.2 in commit 6987b92da510a8c8b9534a22506850c163d0f035 and
> https://github.com/containers/crun/commit/5837234e9840cd067edd9f6cd2ed9cae9a0e6570:
> 
> src/crun.c:26:10: fatal error: dlfcn.h: No such file or directory
>    26 | #include <dlfcn.h>
>       |          ^~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a5f52a7ee757c92c9571261c0ed884d05caeaf2f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...src-crun.c-fix-build-without-dlfcn.h.patch | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/crun/0001-src-crun.c-fix-build-without-dlfcn.h.patch
> 
> diff --git a/package/crun/0001-src-crun.c-fix-build-without-dlfcn.h.patch b/package/crun/0001-src-crun.c-fix-build-without-dlfcn.h.patch
> new file mode 100644
> index 0000000000..3e8d3f4c4b
> --- /dev/null
> +++ b/package/crun/0001-src-crun.c-fix-build-without-dlfcn.h.patch
> @@ -0,0 +1,39 @@
> +From 278b9b447bec3fb81bf252eb2fe2c856892ec802 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 30 Dec 2022 18:40:15 +0100
> +Subject: [PATCH] src/crun.c: fix build without dlfcn.h
> +
> +Fix the following build failure without dlfcn.h raised since version 1.7
> +and
> +https://github.com/containers/crun/commit/5837234e9840cd067edd9f6cd2ed9cae9a0e6570:
> +
> +src/crun.c:26:10: fatal error: dlfcn.h: No such file or directory
> +   26 | #include <dlfcn.h>
> +      |          ^~~~~~~~~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/a5f52a7ee757c92c9571261c0ed884d05caeaf2f
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/containers/crun/pull/1110]
> +---
> + src/crun.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/crun.c b/src/crun.c
> +index cbfe900..af0cc97 100644
> +--- a/src/crun.c
> ++++ b/src/crun.c
> +@@ -23,7 +23,9 @@
> + #include <string.h>
> + #include <libgen.h>
> + 
> ++#ifdef HAVE_DLOPEN
> + #include <dlfcn.h>
> ++#endif
> + 
> + #include "crun.h"
> + #include "libcrun/utils.h"
> +-- 
> +2.35.1
> +
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
