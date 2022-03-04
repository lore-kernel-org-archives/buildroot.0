Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984C3C433EF
	for <buildroot@archiver.kernel.org>; Fri,  4 Mar 2022 20:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BB01833AE;
	Fri,  4 Mar 2022 20:59:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b9ZAk43G82AF; Fri,  4 Mar 2022 20:59:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56B1081A30;
	Fri,  4 Mar 2022 20:59:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5EA601BF82F
 for <buildroot@lists.busybox.net>; Fri,  4 Mar 2022 20:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 563FE80CEA
 for <buildroot@lists.busybox.net>; Fri,  4 Mar 2022 20:58:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Wv6ABXe3bnU for <buildroot@lists.busybox.net>;
 Fri,  4 Mar 2022 20:58:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDF7780C2B
 for <buildroot@buildroot.org>; Fri,  4 Mar 2022 20:58:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c060:e225:3767:1339])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 908CF20039E;
 Fri,  4 Mar 2022 21:58:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1646427523;
 bh=pJaeycQo05kfrvNW8ljLqVbamMNyuxzpB5gIiKVHH1Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NQjKCQNyH1fZcBDOron7WUeZ88uLvpVen1IvnQpZQxsZ3bn3Ks7qhnz3yNB7zGtWY
 PTd3ltygawb2AF/8UC1x+4twv4ocKzUl4RJYz/PJgOS2kfo0jSYDFYDKKMMFiQqwcX
 7IhArzGXKZ4kfIpU9l7COjhdvCMwAa2gYm2SnDNPBD/UxOnHtEwztpS/tZ5u7qAvoZ
 69UOAKNW9geYssTO3GyFYMyl3rk7Sf3R1rVc0JO+ZLiyACmPdSCRcqLkDC7EB/z9RV
 w0S4se35nNstET0Sjy04jVlzUoy6iDT76yHWQFtuwAq5WK8Mf3m8BtFWyPINSxNTGA
 6eHfU8iWjBGtw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 04 Mar 2022 21:58:40 +0100
Date: Fri, 4 Mar 2022 21:58:40 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220304205840.GA228549@scaer>
References: <20220304190600.4021243-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220304190600.4021243-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/weston: fix build without
 shell-desktop
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-03-04 20:06 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure without shell-desktop raised since bump
> to version 10.0.0 in commit f67a6e9b7a7be9adbc405b3126000056120a01af and
> https://gitlab.freedesktop.org/wayland/weston/-/commit/9e90760ab054db2234f73374600489fa5584ad7c:
> 
> In file included from ../tests/weston-test-client-helper.c:43:
> ../tests/weston-test-client-helper.h:40:10: fatal error: weston-screenshooter-client-protocol.h: No such file or directory
>    40 | #include "weston-screenshooter-client-protocol.h"
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/8ece588f52fc1b4e422f8bce9b106d9d3822f1a1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...ncy-on-screenshooter-client-protocol.patch | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/weston/0001-tests-Add-dependency-on-screenshooter-client-protocol.patch
> 
> diff --git a/package/weston/0001-tests-Add-dependency-on-screenshooter-client-protocol.patch b/package/weston/0001-tests-Add-dependency-on-screenshooter-client-protocol.patch
> new file mode 100644
> index 0000000000..927215380e
> --- /dev/null
> +++ b/package/weston/0001-tests-Add-dependency-on-screenshooter-client-protocol.patch
> @@ -0,0 +1,38 @@
> +From 2ac6b6b084a877adde64db7faff2ed22eb3ea97a Mon Sep 17 00:00:00 2001
> +From: Daniel Stone <daniels@collabora.com>
> +Date: Tue, 8 Feb 2022 22:39:42 +0000
> +Subject: [PATCH] tests: Add dependency on screenshooter client protocol
> +
> +Given that the test-helper code relies on the screenshooter protocol,
> +make sure it's available for us to build, and the dependency ensures we
> +build in order.
> +
> +Fixes: #588
> +
> +Signed-off-by: Daniel Stone <daniels@collabora.com>
> +
> +[Retrieved from:
> +https://gitlab.freedesktop.org/wayland/weston/-/commit/2ac6b6b084a877adde64db7faff2ed22eb3ea97a]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + tests/meson.build | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/tests/meson.build b/tests/meson.build
> +index 2d464ddcc..222091cd1 100644
> +--- a/tests/meson.build
> ++++ b/tests/meson.build
> +@@ -29,8 +29,9 @@ lib_test_client = static_library(
> + 		'weston-test-client-helper.c',
> + 		'weston-test-fixture-compositor.c',
> + 		weston_test_client_protocol_h,
> +-		weston_screenshooter_protocol_c,
> + 		weston_test_protocol_c,
> ++		weston_screenshooter_client_protocol_h,
> ++		weston_screenshooter_protocol_c,
> + 		viewporter_client_protocol_h,
> + 		viewporter_protocol_c,
> + 		'color_util.h',
> +-- 
> +GitLab
> +
> -- 
> 2.34.1
> 

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
