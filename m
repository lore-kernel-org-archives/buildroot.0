Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF90EB64DD
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 18:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80ED5612FE;
	Wed, 12 Jul 2023 18:43:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80ED5612FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oomHWl0z6qU5; Wed, 12 Jul 2023 18:43:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F179612F7;
	Wed, 12 Jul 2023 18:43:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F179612F7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8AD951BF3BA
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 18:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71043612FB
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 18:43:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71043612FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i-xbxKW59kBE for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 18:43:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4E13612DA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4E13612DA
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 18:43:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:e245:939f:c022:28d9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D39BC13F8AA;
 Wed, 12 Jul 2023 20:42:59 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 12 Jul 2023 20:42:59 +0200
Date: Wed, 12 Jul 2023 20:42:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230712184259.GG188780@scaer>
References: <20230712171342.1204890-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230712171342.1204890-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1689187383;
 bh=P3vROa2C4+6gospyLltqCUOaZg5LPAB0dgMbr2gV0NM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uNMsQDoEw0+6xpFA8GKqBIZj/kpauUigW6N5mtHW+eexxmOs8wav7C5akJyddSJba
 AHVTPGK6RDEVv0Cx8YHAIZnkVV3yma+NCPpIPTPIdLFVpQ6MFCP+iF8RAD3OyYcHHy
 tZtabWQXl6SLLR8wOKNmIuLyCRRoNjNL2wcLylxRYVe5XZ4Daxo0ZO/KIciUWsHF55
 5Id1IOHIZk647MxtsjSAAffRyrF+R4lfwD4l0vHmYK/aqpe7Z5FW0A7DbXOX38ZlWP
 RVLdWVTJFsqrFn/IJ7i0Yswh7RelJmZmtTm3Hqhx/PjGFdLN77DnjS9DLj+Ad2wBZ1
 I6S3Poy6XDf8g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uNMsQDoE
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d-demos: fix glx-detection
 without glvnd
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
Cc: Spenser Gilliland <spenser@gillilanding.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2023-07-12 19:13 +0200, Bernd Kuhls spake thusly:
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4621046326
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...eson-fix-glx-detection-without-glvnd.patch | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 package/mesa3d-demos/0002-meson-fix-glx-detection-without-glvnd.patch
> 
> diff --git a/package/mesa3d-demos/0002-meson-fix-glx-detection-without-glvnd.patch b/package/mesa3d-demos/0002-meson-fix-glx-detection-without-glvnd.patch
> new file mode 100644
> index 0000000000..37a60efdd7
> --- /dev/null
> +++ b/package/mesa3d-demos/0002-meson-fix-glx-detection-without-glvnd.patch
> @@ -0,0 +1,47 @@
> +From e16117fc92688d76a042ad2c590c77d5a987a4ac Mon Sep 17 00:00:00 2001
> +From: Erik Faye-Lund <erik.faye-lund@collabora.com>
> +Date: Fri, 24 Mar 2023 13:31:58 +0100
> +Subject: [PATCH] meson: fix glx-detection without glvnd
> +
> +When build without GLVND, Mesa provides GLX as a part of libGL, just
> +like XQuartz does on MacOS. There's nothing really macOS specific about
> +this fallback, so let's drop the condition.
> +
> +And just for good measure, let's add in dep_gl as a dependency for
> +the header-check here, in case some one decides to install libGL outside
> +of the default include directory.
> +
> +Fixes: 34300551 ("meson: explicitly check for glx dependency")
> +Closes: https://gitlab.freedesktop.org/mesa/demos/-/issues/36
> +Reviewed-by: Hoe Hao Cheng <haochengho12907@gmail.com>
> +
> +Upstream: https://gitlab.freedesktop.org/mesa/demos/-/commit/e16117fc92688d76a042ad2c590c77d5a987a4ac
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + meson.build | 9 +++++----
> + 1 file changed, 5 insertions(+), 4 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index c1853f94..bc3278e1 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -99,10 +99,11 @@ if not dep_glu.found() and host_machine.system() != 'darwin'
> + endif
> + 
> + dep_glx = dependency('glx', required: false, disabler : true)
> +-if not dep_glx.found() and host_machine.system() == 'darwin'
> +-  # xquartz doesn't have a glx.pc, but it does have the header. And all the
> +-  # symbols reside in libGL, so let's just use that.
> +-  if cc.check_header('GL/glx.h', dependencies: dep_x11)
> ++if not dep_glx.found()
> ++  # Both Mesa build without GLVND and XQuartz lacks a glx.pc, but does
> ++  # provide the header. And all the symbols reside in libGL, so let's
> ++  # just use that.
> ++  if cc.check_header('GL/glx.h', dependencies: [dep_x11, dep_gl])
> +     dep_glx = dep_gl
> +   endif
> + endif
> +-- 
> +GitLab
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
