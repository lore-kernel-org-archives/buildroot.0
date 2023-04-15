Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8064C7619A
	for <buildroot@archiver.kernel.org>; Sat, 15 Apr 2023 12:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8239240A2F;
	Sat, 15 Apr 2023 12:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8239240A2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JhPLJchMcDDz; Sat, 15 Apr 2023 12:51:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A73B240143;
	Sat, 15 Apr 2023 12:51:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A73B240143
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8DA811BF3A8
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 12:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67E1A84582
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 12:51:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67E1A84582
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FSGZmHOa3ZTs for <buildroot@lists.busybox.net>;
 Sat, 15 Apr 2023 12:51:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 583B28457B
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 583B28457B
 for <buildroot@buildroot.org>; Sat, 15 Apr 2023 12:51:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 559395FFA6;
 Sat, 15 Apr 2023 14:51:14 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Apr 2023 14:51:13 +0200
Date: Sat, 15 Apr 2023 14:51:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Stefan Ott <stefan@ott.net>
Message-ID: <20230415125113.GJ2819@scaer>
References: <20230412224038.109749-1-stefan@ott.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230412224038.109749-1-stefan@ott.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681563078;
 bh=6SaD7Cq/zKTZjVdh51Dary45P25yQ1B2PhE4zx/bNA0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KsD/fDnb9N9VRrHAcTxYsXqPuvcqiswx4PFXqL6eonBWh6AaV9WZgl+mWOM5EHHW6
 WHMh9vYodY/wOoJfATHFWLTsWyX+ovyknqZWtFSat/eodWAHgkrEypqbC1p9nky02F
 lJ34zBkc3VuHp1KBjoOEJWZNi7I9w2K7s7AmoK44vqrO0KR24tj7wS+k6N+6mUuQAh
 UuO0zGLwpQxBZMvmAdkJaoV83cu6aCx2fHukpsln+702cs53Swmqel8hFKWvrpypri
 gsDVGMWL+GWcDuUGU5co8D19yP+AsCv//L00vRCynWF085xAf622CQpo6+Q1ueejKY
 evIU+BIsvgqDw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KsD/fDnb
Subject: Re: [Buildroot] [PATCH v2 1/1] package/eudev: fix compile-time
 issue with very old kernel headers
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Stefan, All,

On 2023-04-13 00:40 +0200, Stefan Ott via buildroot spake thusly:
> Kernel versions prior to 3.4 did not have V4L2_CAP_DEVICE_CAPS and
> compiling against such a kernel will fail.
> 
> This patch introduces a version check and makes eudev fall back to
> v2cap.capabilities on these kernels.
> 
> Upstream: https://github.com/eudev-project/eudev/pull/247

I've moved the upstream reference into the patch itself, since that's
where it'll be easier to find when we need to asses the patch status
next time we bump the package.

And since the PR was accepted and merged, I've changed the reference to
the commit URL.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Stefan Ott <stefan@ott.net>
> ---
> Changes v1 -> v2 (suggested by Arnout Vandecappelle):
> - Clarified description to talk about kernel *headers*
> - Use a git-formatted patch instead
> - Added a Signed-off-by line
> - Added upstream reference
> 
>  ...mpile-time-issue-on-very-old-kernels.patch | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 package/eudev/0002-Fix-compile-time-issue-on-very-old-kernels.patch
> 
> diff --git a/package/eudev/0002-Fix-compile-time-issue-on-very-old-kernels.patch b/package/eudev/0002-Fix-compile-time-issue-on-very-old-kernels.patch
> new file mode 100644
> index 0000000000..c18ce2ad5a
> --- /dev/null
> +++ b/package/eudev/0002-Fix-compile-time-issue-on-very-old-kernels.patch
> @@ -0,0 +1,43 @@
> +From 09b536e0b9d0964674936901ab9d2954f935c8b4 Mon Sep 17 00:00:00 2001
> +From: Stefan Ott <stefan@ott.net>
> +Date: Wed, 5 Apr 2023 18:20:37 +0200
> +Subject: [PATCH] Fix compile-time issue on very old kernels
> +
> +Kernel versions prior to 3.4 did not have V4L2_CAP_DEVICE_CAPS and
> +compiling against such a kernel will fail.
> +
> +This patch introduces a version check and makes eudev fall back to
> +v2cap.capabilities on these kernels.
> +
> +Signed-off-by: Stefan Ott <stefan@ott.net>
> +---
> + src/v4l_id/v4l_id.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/src/v4l_id/v4l_id.c b/src/v4l_id/v4l_id.c
> +index 6bf45effe..702d5b687 100644
> +--- a/src/v4l_id/v4l_id.c
> ++++ b/src/v4l_id/v4l_id.c
> +@@ -28,6 +28,7 @@
> + #include <sys/types.h>
> + #include <sys/time.h>
> + #include <sys/ioctl.h>
> ++#include <linux/version.h>
> + #include <linux/videodev2.h>
> + 
> + #include "util.h"
> +@@ -71,9 +72,11 @@ int main(int argc, char *argv[]) {
> +                 printf("ID_V4L_VERSION=2\n");
> +                 printf("ID_V4L_PRODUCT=%s\n", v2cap.card);
> +                 printf("ID_V4L_CAPABILITIES=:");
> ++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3,4,0)
> +                 if (v2cap.capabilities & V4L2_CAP_DEVICE_CAPS)
> +                         capabilities = v2cap.device_caps;
> +                 else
> ++#endif
> +                         capabilities = v2cap.capabilities;
> +                 if ((capabilities & V4L2_CAP_VIDEO_CAPTURE) > 0 ||
> +                     (capabilities & V4L2_CAP_VIDEO_CAPTURE_MPLANE) > 0)
> +-- 
> +2.40.0
> +
> -- 
> 2.40.0
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
