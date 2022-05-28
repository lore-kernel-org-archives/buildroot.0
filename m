Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0258C433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 20:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D42460EBE;
	Sat, 28 May 2022 20:10:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r2I99jnL71ut; Sat, 28 May 2022 20:10:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52FAB600C4;
	Sat, 28 May 2022 20:10:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 951EA1BF962
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 20:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83798600C4
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 20:10:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MsrAmChvYAQU for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 20:10:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 99AF06005E
 for <buildroot@buildroot.org>; Sat, 28 May 2022 20:10:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:882a:25de:8723:774f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 8689A19F553;
 Sat, 28 May 2022 22:10:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1653768653;
 bh=E6Zx6fsnYs9X8zrFxDjsUp+t+Q3pxCEfB+vB6IBXtIw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=njCqL+u1Tt6KwSD+lkgeOEGDJkkBe9hY/FMhY57uleV9R1uSGkb3Akwz5SmIj+qC5
 9EsBeAOSAUKiNrZygF7SQefADS6bD9qyJBVPdZZWx5XGTK4cnzm1J+/Rv0YqpHtffX
 qR/igElXleho4MqNEKN8vaPLM3kyn5YhJtU6YCwxIqo9fG36y1Z9c2xv3mu2vEqzyH
 8kKMxRgSDchUL7i1AYj1mkmNDs4S81aKukIIGqQI/7jn0AeVamkOT7imqU7+2BFdTM
 HKrQK9GGXlRk6viTFXlzYHKldx32v7TJxfcSBIsmAWPFBmpJGr/cFniu7F61ROHATf
 KJ11jX2+XJG1w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 28 May 2022 22:10:49 +0200
Date: Sat, 28 May 2022 22:10:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220528201049.GI301044@scaer>
References: <20220524170911.2350456-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220524170911.2350456-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libostree: fix build without
 systemd
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-05-24 19:09 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure without systemd raised since bump to
> version 2022.03 in commit 0eb073ca2ba89dad2e531644fd33f693d228ef94:
> 
> src/libostree/ostree-sysroot-deploy.c: In function 'child_setup_fchdir':
> src/libostree/ostree-sysroot-deploy.c:2837:19: error: 'uintptr_t' undeclared (first use in this function); did you mean 'intptr_t'?
>  2837 |   int fd = (int) (uintptr_t) data;
>       |                   ^~~~~~~~~
>       |                   intptr_t
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c134d849e7942911cb6bd13869dd2f3aefd8c21c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...y-add-a-missing-include-for-stdint-h.patch | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 package/libostree/0001-lib-ostree-sysroot-deploy-add-a-missing-include-for-stdint-h.patch
> 
> diff --git a/package/libostree/0001-lib-ostree-sysroot-deploy-add-a-missing-include-for-stdint-h.patch b/package/libostree/0001-lib-ostree-sysroot-deploy-add-a-missing-include-for-stdint-h.patch
> new file mode 100644
> index 0000000000..35f92c37ff
> --- /dev/null
> +++ b/package/libostree/0001-lib-ostree-sysroot-deploy-add-a-missing-include-for-stdint-h.patch
> @@ -0,0 +1,24 @@
> +From 4b7fc4f1e90bbeac89d2f939cde3070e69b4787a Mon Sep 17 00:00:00 2001
> +From: Luca BRUNO <luca.bruno@coreos.com>
> +Date: Fri, 6 May 2022 10:07:23 +0000
> +Subject: [PATCH] lib/ostree-sysroot-deploy: add a missing include for stdint.h
> +
> +[Retrieved from:
> +https://github.com/ostreedev/ostree/commit/4b7fc4f1e90bbeac89d2f939cde3070e69b4787a]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/libostree/ostree-sysroot-deploy.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/libostree/ostree-sysroot-deploy.c b/src/libostree/ostree-sysroot-deploy.c
> +index 404f336fb5..96cc07531e 100644
> +--- a/src/libostree/ostree-sysroot-deploy.c
> ++++ b/src/libostree/ostree-sysroot-deploy.c
> +@@ -22,6 +22,7 @@
> + #include <gio/gunixinputstream.h>
> + #include <gio/gunixoutputstream.h>
> + #include <glib-unix.h>
> ++#include <stdint.h>
> + #include <sys/mount.h>
> + #include <sys/statvfs.h>
> + #include <sys/socket.h>
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
