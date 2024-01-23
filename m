Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C312C47258
	for <buildroot@archiver.kernel.org>; Tue, 23 Jan 2024 21:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07EAF4EBAF;
	Tue, 23 Jan 2024 21:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07EAF4EBAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jaAvBxzuYbsW; Tue, 23 Jan 2024 21:39:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21CE04EBB0;
	Tue, 23 Jan 2024 21:39:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21CE04EBB0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9F6B61BF362
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 21:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0B988532D
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 21:28:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0B988532D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QwAfr9Ipy94V for <buildroot@lists.busybox.net>;
 Tue, 23 Jan 2024 21:28:09 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 17DE784D1E
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 21:28:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17DE784D1E
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 489F113F880;
 Tue, 23 Jan 2024 22:28:03 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 23 Jan 2024 22:28:03 +0100
Date: Tue, 23 Jan 2024 22:28:03 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <ZbAvYy3t4myBLwto@landeda>
References: <20240122223037.889955-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240122223037.889955-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706045287;
 bh=to5efjHFneKngCNDnQM1ZQjTJMxXqpSYwrTh2M+ZIes=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aAr25f6n5IBwRFlI5BV3NnpvxF43Hs94HJ5cVpc+PFJ6sMIl0RvIAJiPm7eMM+uuS
 IIHRKif0l1jk4x58MKxlV4XwnKxLcfeek0bnrqOm7+p0laHlGR+uUryIexA00YXur/
 WEK0IWfIemQJa8rqO9/xzGbWRI1uVFRcOYFNz8RtEJlE7zxeQ49oCqSrWjwEzZFWt+
 vLW7LBgq1HJpKLfkeSqvzXvKasv7aMAQCRfrdHdkUTr8yW/smVx0c2+Wy8SkUYSG1l
 KhqqYpPyh/nTJu6YrqkuLYCbVSJZuVXPHuGlbfnODZoacjoXxsTX/u210TF+1XlZYV
 MYb3R4VSIAcaQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aAr25f6n
Subject: Re: [Buildroot] [PATCH] package/uuu: fix build failure with host
 gcc 13.x
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
Cc: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2024-01-22 23:30 +0100, Giulio Benetti spake thusly:
> From: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
> 
> With gcc version >= 13.x stdint.h must be explicitly included according to
> [0] so add local patch to explicitly include stdint.h.

When I read "local patch", it is not immediately obvious that this is a
backport, or that the patch has been upstreamd, and I am wary of such
situations.

But here, this is an actual backport, so a better phrasing would have
been "so backport a commit that...", which I have done when applying.

> [0]: https://gcc.gnu.org/gcc-13/porting_to.html
> 
> Fixes:
> still not happened
> 
> Signed-off-by: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/uuu/0001-Fix-missing-references.patch | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/uuu/0001-Fix-missing-references.patch
> 
> diff --git a/package/uuu/0001-Fix-missing-references.patch b/package/uuu/0001-Fix-missing-references.patch
> new file mode 100644
> index 0000000000..140c9755c7
> --- /dev/null
> +++ b/package/uuu/0001-Fix-missing-references.patch
> @@ -0,0 +1,40 @@
> +From 24fd043225903247f71ac10666d820277c0b10b1 Mon Sep 17 00:00:00 2001
> +From: nixgnauhcuy <nixgnauhcuy@gmail.com>
> +Date: Tue, 9 May 2023 14:32:33 +0800
> +Subject: [PATCH] Fix missing references
> +
> +Upstream: https://github.com/nxp-imx/mfgtools/commit/24fd043225903247f71ac10666d820277c0b10b1
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + libuuu/libcomm.h | 1 +
> + uuu/buildincmd.h | 1 +
> + 2 files changed, 2 insertions(+)
> +
> +diff --git a/libuuu/libcomm.h b/libuuu/libcomm.h
> +index 0afdfa3..38d622d 100644
> +--- a/libuuu/libcomm.h
> ++++ b/libuuu/libcomm.h
> +@@ -28,6 +28,7 @@
> + * POSSIBILITY OF SUCH DAMAGE.
> + *
> + */
> ++#include <stdint.h>
> + #include <string>
> + #include <stdarg.h>
> + #include <locale>
> +diff --git a/uuu/buildincmd.h b/uuu/buildincmd.h
> +index 9415117..46286cc 100644
> +--- a/uuu/buildincmd.h
> ++++ b/uuu/buildincmd.h
> +@@ -31,6 +31,7 @@
> + 
> + #pragma once
> + 
> ++#include <stdint.h>
> + #include <map>
> + #include <string>
> + #include <vector>
> +-- 
> +2.34.1
> +
> -- 
> 2.34.1
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
