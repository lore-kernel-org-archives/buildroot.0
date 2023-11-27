Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055EBC4167B
	for <buildroot@archiver.kernel.org>; Mon, 27 Nov 2023 16:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 302544056D;
	Mon, 27 Nov 2023 16:10:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 302544056D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bWVOkpYVZaeP; Mon, 27 Nov 2023 16:10:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D36540743;
	Mon, 27 Nov 2023 16:10:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D36540743
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 015441BF405
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 16:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEF5B80F6B
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 16:10:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEF5B80F6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PqpmM8oLu1VA for <buildroot@lists.busybox.net>;
 Mon, 27 Nov 2023 16:10:38 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21CE180F66
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 16:10:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21CE180F66
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:7618:50d5:c153:9a40])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E16C2B00583;
 Mon, 27 Nov 2023 17:10:32 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 27 Nov 2023 17:10:32 +0100
Date: Mon, 27 Nov 2023 17:10:32 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Leo <info.leo@widler.de>
Message-ID: <20231127161032.GQ3177259@scaer>
References: <20231126214357.3376407-1-info.leo@widler.de>
 <20231126215644.GO3177259@scaer>
 <9CB2714C-64FC-4E32-BD7D-12F72EC7EC34@widler.de>
 <20231127064813.GP3177259@scaer>
 <0A422087-89C4-4C88-8263-E05CC5BA1FB8@widler.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0A422087-89C4-4C88-8263-E05CC5BA1FB8@widler.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701101435;
 bh=dT9zVxG+XJGqhQodHL77kDS4Do8OL4CDLpC+ECUtP30=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ty42ssfUSmgCF7COUqx8NG94fwDNVeaoHPByWL7Ja6w8aP/qdqmxfWeF9kl2/1Yt4
 FaHwX272m1zrvedDj+irrmGpis15NyRAcnXYUeF0qCXMMrRGmwMVKVh5xP6O+Vaqg8
 ZCzerR2ZS6I0ZDoH3+4k+jHBxTzV6hX5VKbm9JM8qfeHjR913DGFsEVIb06mPwehj4
 GbFeAdiXy1FacqCQUQ5ekV4MrEje9xt0TTHtXyASnqUInqWbT7uQOueABX9WeSNH43
 jUFC0DB1QH6yJQToEZ/iYp8c4/L4QaY6WpT8jGjlGuQWEuxbizvATch8TgZVdrFs3a
 STHOEzVhXTyGg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ty42ssfU
Subject: Re: [Buildroot] [PATCH 1/1] package/attr: add --enable-multilib to
 fix build error for BL808 based boards
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

Leo, All,

On 2023-11-27 08:07 +0100, Leo spake thusly:
> defconfig can be found here: [1]https://github.com/openbouffalo/buildroot_bouffalo/blob/main/configs/pine64_ox64_full_defconfig
> The link to the tool chain is also in there.
> Sure it would be better to get to the root of the problem. My solution was just a quick and dirty fix.

Thanks for the links.

I tried to reproduce locally, after following the instructions in the
buildroot_bouffalo readme file, but attr does build properly here with
the aforementioned defconfig.

I also tried to reproduce in a container using the reference image by
Buildroot (./utils/docker-run) and it also succeeds.

I also tried to run with the ubuntu:22.04 that is used in the github
worflows for buildroot_bouffalo, and (after installing the necessary
dependencies as visible in .github/workflows/buildroot.yml), it also
succeeds.

I also tried without using ccache, and it also succeeded.

Thus, it comforts my opinion that using --enable-multilib when
configuring attr, is not the proper solution.

However, I do see that your have workflows failing with that issue,
indeed, but of all the tests I did, none could reproduce it.

I see that you are using a cached ccache for your workflows; I wonder if
somehow that cache did get corrupted. Can you try and run a workflow
without ccache?

Regards,
Yann E. MORIN.

> Regards,
> Leonard Widler
> 
> Am 27. November 2023 07:48:13 MEZ schrieb "Yann E. MORIN" <yann.morin.1998@free.fr>:
> 
>  Leo, All,
> 
>  On 2023-11-26 23:17 +0100, Leo spake thusly:
> 
>  I'll change my name, thanks for letting me know
> 
>  The failure is on none of the auto builders. I have uploaded the config.log here: [1]https://pastebin.com/ZzP6pNvx
> 
> 
>  Can you also provide the Buildroot defconfig, please?
> 
>  (Also, I see you are running as root; this is not required to run
>  Buildroot, and is even dangerous and not really supported; please run as
>  a non-root user.)
> 
> 
>  And to fix this issue I added the --enable-multilib option which resolves the problem.
> 
> 
>  The issue looks like a misconfiguration somewhere:
> 
>      .../crti.o: can't link double-float modules with soft-float modules
>      ...//ld: failed to merge target specific data of file .../crti.o
> 
>  So, we want to understand the problem rather than paper-over it.
> 
>  Where did you get your toolchain (Xuantie-900 linux-5.10.4 glibc gcc
>  Toolchain V2.6.1 B-20220906)? Is it public, so we can try and reproduce
>  the issue?
> 
>  Regards,
>  Yann E. MORIN.
> 
> 
>  Regards,
>  Leonard Widler
> 
>  Am 26. November 2023 22:56:44 MEZ schrieb "Yann E. MORIN" <yann.morin.1998@free.fr>:
> 
>   leow149, All,
> 
>   Thank you for your contribution! Here is a quick review.
> 
>   First, we'll need you to use your real name as the author of the patch;
>   we do not accept annonymous (od pseduonymou) contributions.
> 
>   On 2023-11-26 22:43 +0100, leow149 spake thusly:
> 
>   This commit fixes a build error which specifically happens for Bouffallo Labs BL808 based boards, but might also happen on other RiscV64 Boards.
> 
> 
>   Please wrap your commit log to ~72 chars.
> 
>   Waht is the error that you see? Could you see if there is a similar
>   build failure on out autobulders:
> 
>   [2]http://autobuild.buildroot.org/?static=1&reason=attr-%
> 
> 
>   The last build error for attr was more than a year ago now, so it is
>   relatively surprising to see that attr does not build. So we'll need a
>   bit more context.
> 
> 
>   Signed-off-by: leow149 <info.leo@widler.de>
> 
>   --------------------------------------------------------------------------------------------------------------------------------
> 
>    package/attr/attr.mk | 5 +++--
>    1 file changed, 3 insertions(+), 2 deletions(-)
> 
>   diff --git a/package/attr/attr.mk b/package/attr/attr.mk
>   index 0327497e1e..89f7d21f0c 100644
>   --- a/package/attr/attr.mk
>   +++ b/package/attr/attr.mk
>   @@ -13,7 +13,8 @@ ATTR_CPE_ID_VENDOR = attr_project
> 
>    ATTR_INSTALL_STAGING = YES
> 
>   -ATTR_CONF_OPTS = --disable-nls
>   -
>   +ATTR_CONF_OPTS = \
>   +       --disable-nls \
>   +       --enable-multilib
> 
> 
>   Buildroot does not generate multilib toolchains, and when using an
>   external toolchain that is multilib, the proper multilib diretory is
>   copies over to the sysroot.
> 
>   So, --eanble-multilib looksa like the wrong approach, at least without
>   more explanations.
> 
>   Can you elaborate on the issue you encounter, and what makes you think
>   --enable-multilib is the correct solution?
> 
>   Thanks!
> 
>   Regards,
>   Yann E. MORIN.
> 
> 
>    $(eval $(autotools-package))
>    $(eval $(host-autotools-package))
>   --
>   2.30.2
> 
>   --------------------------------------------------------------------------------------------------------------------------------
> 
>   buildroot mailing list
>   buildroot@buildroot.org
>   [3]https://lists.buildroot.org/mailman/listinfo/buildroot
> 
>  Links:
>  1.
>  [2]https://pastebin.com/ZzP6pNvx
>  2.
>  [3]http://autobuild.buildroot.org/?static=1&reason=attr-%
> 
>  3.
>  [4]https://lists.buildroot.org/mailman/listinfo/buildroot
> 
> 
> 
> 
>   --------------------------------------------------------------------------------------------------------------------------------
> 
>  buildroot mailing list
>  buildroot@buildroot.org
>  [5]https://lists.buildroot.org/mailman/listinfo/buildroot
> 
> Links:
> 1. https://github.com/openbouffalo/buildroot_bouffalo/blob/main/configs/pine64_ox64_full_defconfig
> 2. https://pastebin.com/ZzP6pNvx
> 3. http://autobuild.buildroot.org/?static=1&reason=attr-%
> 4. https://lists.buildroot.org/mailman/listinfo/buildroot
> 5. https://lists.buildroot.org/mailman/listinfo/buildroot

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
