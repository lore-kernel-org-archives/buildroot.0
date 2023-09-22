Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143C0E6FE52
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 16:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1987610E5;
	Fri, 22 Sep 2023 16:01:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1987610E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ba2Q4eGamDVG; Fri, 22 Sep 2023 16:01:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F4BF6110F;
	Fri, 22 Sep 2023 16:01:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F4BF6110F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 741B91BF997
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 16:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56034834F5
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 16:01:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56034834F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PnKLhoQm_7bQ for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 16:01:12 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8590283083
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 16:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8590283083
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:94e1:f2dc:4d87:6249])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 207DC13FA59;
 Fri, 22 Sep 2023 18:01:05 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 22 Sep 2023 18:01:04 +0200
Date: Fri, 22 Sep 2023 18:01:04 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20230922160104.GP512384@scaer>
References: <20230909075753.7471-1-thomas@devoogdt.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230909075753.7471-1-thomas@devoogdt.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695398469;
 bh=qgZLeyOMatqQeutuVdhIJGqi6SxguSG7CBnWhJTZRRI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gaa9aDn6PsjvMEtsfIAQ9W8J45bztNDbE0fYUYS3NgxosxoUzczDuqAFYNpZAU+uq
 zO8WKzfTyLz3cbNoXedySThtfVKFYRn+Oi3e7qdAfrpZTYwyZn9j99QjnAtncDlo9S
 eHJnLf3LgplyuVZocBjogOGjWRrAyz/z4Oiu8ZIBJIHN6Ih6PyRX7obpDoYOjM2VZ8
 V50RjK+kuMWSJDOkz4D4kysJ6s4OMIIRKyMOjG0Tz9PD5G9dORVGsh6rqcYWIxW4cL
 JbJHRk8cn9s/0OJjpB2ajuHrnO5lfHPs4RIWKZ/6aBoU2c3tPsaaTPNIhV3PZNcHcl
 2C/YPMl9yywrg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gaa9aDn6
Subject: Re: [Buildroot] [PATCH v2 1/4] package/webkitgtk: security bump to
 version 2.40.5
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, Adrian, All,

On 2023-09-09 09:57 +0200, Thomas Devoogdt spake thusly:
> Bugfix release with many security fixes, including (but not limited to)
> patches for CVE-2023-37450, CVE-2023-38133, CVE-2023-38572, CVE-2023-38592,
> CVE-2023-38594, CVE-2023-38595, CVE-2023-38597, CVE-2023-38599,
> CVE-2023-38600, and CVE-2023-38611.
> 
> Release notes:
> 
>   https://webkitgtk.org/2023/07/21/webkitgtk2.40.4-released.html
>   https://webkitgtk.org/2023/08/01/webkitgtk2.40.5-released.html
> 
> Accompanying security advisory:
> 
>   https://webkitgtk.org/security/WSA-2023-0006.html
>   https://webkitgtk.org/security/WSA-2023-0007.html
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> v2: no change
> ---
>  ...e-when-gstreamer-support-is-disabled.patch | 36 +++++++++++++++++++
>  package/webkitgtk/webkitgtk.hash              |  6 ++--
>  package/webkitgtk/webkitgtk.mk                |  2 +-
>  3 files changed, 40 insertions(+), 4 deletions(-)
>  create mode 100644 package/webkitgtk/0001-Fix-build-failure-when-gstreamer-support-is-disabled.patch
> 
> diff --git a/package/webkitgtk/0001-Fix-build-failure-when-gstreamer-support-is-disabled.patch b/package/webkitgtk/0001-Fix-build-failure-when-gstreamer-support-is-disabled.patch
> new file mode 100644
> index 0000000000..3fa23b215b
> --- /dev/null
> +++ b/package/webkitgtk/0001-Fix-build-failure-when-gstreamer-support-is-disabled.patch
> @@ -0,0 +1,36 @@
> +From 9b31965cdf362768e86f7e592e59e68fb3351261 Mon Sep 17 00:00:00 2001
> +From: Matt Turner <mattst88@gmail.com>
> +Date: Tue, 8 Aug 2023 16:51:25 -0700
> +Subject: [PATCH] Fix build failure when gstreamer support is disabled
> + https://bugs.webkit.org/show_bug.cgi?id=259931 https://bugs.gentoo.org/911663
> +
> +Reviewed by Carlos Alberto Lopez Perez.
> +
> +* Source/WebCore/loader/MixedContentChecker.cpp:
> +
> +Canonical link: https://commits.webkit.org/260527.429@fix-build
> +
> +(cherry picked from commit f5ceef5bf2e3c4d7203a37b9e2d2fdd9b1bb2732)
> +
> +Upstream: https://github.com/WebKit/WebKit/commit/f5ceef5bf2e3c4d7203a37b9e2d2fdd9b1bb2732
> +Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> +---
> + Source/WebCore/loader/MixedContentChecker.cpp | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/Source/WebCore/loader/MixedContentChecker.cpp b/Source/WebCore/loader/MixedContentChecker.cpp
> +index 9b4c7fe62020..ac4733bc08bc 100644
> +--- a/Source/WebCore/loader/MixedContentChecker.cpp
> ++++ b/Source/WebCore/loader/MixedContentChecker.cpp
> +@@ -33,6 +33,8 @@
> + #include "ContentSecurityPolicy.h"
> + #include "Document.h"
> + #include "Frame.h"
> ++#include "FrameLoader.h"
> ++#include "FrameLoaderClient.h"
> + #include "SecurityOrigin.h"
> + 
> + namespace WebCore {
> +-- 
> +2.42.0
> +
> diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
> index 756ac13ec2..7f50f1aa7b 100644
> --- a/package/webkitgtk/webkitgtk.hash
> +++ b/package/webkitgtk/webkitgtk.hash
> @@ -1,6 +1,6 @@
> -# From https://www.webkitgtk.org/releases/webkitgtk-2.40.3.tar.xz.sums
> -sha1  74ee7241f2add46897019e22bd4f8e19e09027bb  webkitgtk-2.40.3.tar.xz
> -sha256  cc0aa83f40dbc64c1c6ae42ec6b85af4be2a9dbf524cfcb95f89a367fb5098dd  webkitgtk-2.40.3.tar.xz
> +# From https://www.webkitgtk.org/releases/webkitgtk-2.40.5.tar.xz.sums
> +sha1  2f4d06b021115eb4106177f7d5f534f45b5d3b2e  webkitgtk-2.40.5.tar.xz
> +sha256  7de051a263668621d91a61a5eb1c3771d1a7cec900043d4afef06c326c16037f  webkitgtk-2.40.5.tar.xz
>  
>  # Hashes for license files:
>  sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> index 32f6102797..71599477f2 100644
> --- a/package/webkitgtk/webkitgtk.mk
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WEBKITGTK_VERSION = 2.40.3
> +WEBKITGTK_VERSION = 2.40.5
>  WEBKITGTK_SITE = https://www.webkitgtk.org/releases
>  WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
>  WEBKITGTK_INSTALL_STAGING = YES
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
