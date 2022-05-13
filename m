Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D00DC433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 19:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BED11405D7;
	Fri, 13 May 2022 19:09:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UPO83P3Ud8T6; Fri, 13 May 2022 19:09:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC5AA404A8;
	Fri, 13 May 2022 19:09:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 746141BF5B4
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 19:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70494404A8
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 19:09:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7gahYY2RZSH9 for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 19:09:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3F36F4014C
 for <buildroot@buildroot.org>; Fri, 13 May 2022 19:09:13 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:71f3:9479:94db:16e0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1DFBC13F854;
 Fri, 13 May 2022 21:09:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652468950;
 bh=ipHCJy/i6uYmEfWIa+qfT2oBk9wczDz/08bW8HE/WrU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bh0ijd9zeiAlpyTiVaLa21WoZDVslNk2JUlnDACfq/udKNRaI9DIe7YCMsE/0ktge
 Sjg4nT5Khsu5A33CBghdMQWtDzLftFDeKLD5h9UPh2INZ71Tqq0mQzqApwVS0/OmxR
 jDROO51SKfXA5I0cW9UJ7hGyuyZ/YR4l+eu2tZZt/Syr/sm/rRRdFRzVsu0bdDFxtj
 kn3I54BIUB9NMX5BjAW496UNXWONcnVQpXZzgkzhVM0JTQbcBImbF6Ii6WHXM/ThmJ
 wPjU+Q/+zezP3dps28Bii8ZA9Rw0IdgKc9sGHvZzQJtVvOJV78H6M4gNitEaCZso0/
 yPyycXDbmc4Yg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 13 May 2022 21:09:06 +0200
Date: Fri, 13 May 2022 21:09:06 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220513190906.GV1597494@scaer>
References: <20220512204944.94312-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220512204944.94312-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] support/testing: test_lxc: bump kernel
 version to 5.15.38 for complete pidfds support
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

Romain, Al,

On 2022-05-12 22:49 +0200, Romain Naour spake thusly:
> As reported by [1], the lxc test is broken since lxc >= 4.0.11.
> A patch was added to lxc 4.0.11 to use the new mount api for devpts
> setup [2] but the fall back code doesn't work when this new mount
> API is not supported. This API was added in kernel 5.6.
> 
> (kernel 5.5)
> DEBUG conf - conf.c:lxc_setup_devpts_child:1682 - No new devpts instance will be
> mounted since no pts devices are required
> lxc-start lxc_iperf3  DEBUG conf - conf.c:lxc_setup_dev_console:1966 - Cleared
> all (0) mounts from "/dev/console"
> lxc-start lxc_iperf3  ERROR mount_utils - mount_utils.c:mount_at:661 - No such
> file or directory - Failed to mount "/proc/self/fd/44" to "/proc/self/fd/43"
> lxc-start lxc_iperf3  ERROR conf - conf.c:lxc_setup_dev_console:1988 - No such
> file or directory - Failed to mount "10(/dev/pts/0)" on "43"
> lxc-start lxc_iperf3  ERROR conf - conf.c:lxc_setup_console:2143 - No such file
> or directory - Failed to setup console
> 
> (kernel 5.6)
> lxc-start lxc_iperf3  TRACE mount_utils - mount_utils.c:can_use_mount_api:582 -
> Kernel supports mount api
> lxc-start lxc_iperf3  TRACE mount_utils - mount_utils.c:move_detached_mount:328
> - Attach detached mount 45 to filesystem at 43
> lxc-start lxc_iperf3  TRACE conf - conf.c:lxc_setup_dev_console:1990 - Setup
> console "/dev/pts/0"
> 
> Bump the kernel to the current LTS 5.15.38 version that fully support the
> mount API needed by lxc.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2429013708
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2022-January/635251.html
> [2] https://github.com/lxc/lxc/commit/be606e16fd0fa967219d890745a425625eafe251
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/testing/tests/package/test_lxc.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/package/test_lxc.py b/support/testing/tests/package/test_lxc.py
> index d98bed8761..f66b31f3ba 100644
> --- a/support/testing/tests/package/test_lxc.py
> +++ b/support/testing/tests/package/test_lxc.py
> @@ -12,7 +12,7 @@ class TestLxc(infra.basetest.BRTest):
>              BR2_TOOLCHAIN_EXTERNAL=y
>              BR2_LINUX_KERNEL=y
>              BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -            BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
> +            BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.38"
>              BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
>              BR2_LINUX_KERNEL_DTS_SUPPORT=y
>              BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
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
