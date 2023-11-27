Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A342DC4167B
	for <buildroot@archiver.kernel.org>; Mon, 27 Nov 2023 06:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32E21812C8;
	Mon, 27 Nov 2023 06:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32E21812C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pK01JcgkFwl8; Mon, 27 Nov 2023 06:48:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D60F812E4;
	Mon, 27 Nov 2023 06:48:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D60F812E4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 783741BF41B
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 06:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50603402E0
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 06:48:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50603402E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S5tuHwZVC7BI for <buildroot@lists.busybox.net>;
 Mon, 27 Nov 2023 06:48:19 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DBC48402CE
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 06:48:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBC48402CE
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4fcd:aaeb:59ee:6854])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id A338C78035E;
 Mon, 27 Nov 2023 07:48:13 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 27 Nov 2023 07:48:13 +0100
Date: Mon, 27 Nov 2023 07:48:13 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Leo <info.leo@widler.de>
Message-ID: <20231127064813.GP3177259@scaer>
References: <20231126214357.3376407-1-info.leo@widler.de>
 <20231126215644.GO3177259@scaer>
 <9CB2714C-64FC-4E32-BD7D-12F72EC7EC34@widler.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9CB2714C-64FC-4E32-BD7D-12F72EC7EC34@widler.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701067695;
 bh=qvrczGUYDj4j2r5XemIhNyi9PsY8fpbElAuADrXATAU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BooKRiudApipnJz9Ni9Lbpsq2w1VlsdVJVb44Bngq5hdeY27HJhmLjaNHOBEiKEFv
 7ZXXowUD9WlV7gxjuxg5CD18XSvFGS9HlB/wUR/EpN6bqZyFjSBom7LLDbPJpggdSR
 MHPuk9x7IXDDEpfe6AtsOG1/vWmR5xcDaBhXcFgUCej6v1bYMKUT9rlvs/kgTqnty1
 bLnjENyd1xJInMp4nkzW6SlsqM66nYqRb9AKv5u4P9SktmMAJyI5rVvSXTTVmtTv2M
 /Rc1knDaBE1HE4kB5Gfkz8CU/gl7irnLZe0K8XyOCf7Zg1F95N0NEE3Dlha3e1Bv0Z
 3vEjgUsd0rwwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BooKRiud
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

On 2023-11-26 23:17 +0100, Leo spake thusly:
> I'll change my name, thanks for letting me know
> 
> The failure is on none of the auto builders. I have uploaded the config.log here: [1]https://pastebin.com/ZzP6pNvx

Can you also provide the Buildroot defconfig, please?

(Also, I see you are running as root; this is not required to run
Buildroot, and is even dangerous and not really supported; please run as
a non-root user.)

> And to fix this issue I added the --enable-multilib option which resolves the problem.

The issue looks like a misconfiguration somewhere:

    .../crti.o: can't link double-float modules with soft-float modules
    ...//ld: failed to merge target specific data of file .../crti.o

So, we want to understand the problem rather than paper-over it.

Where did you get your toolchain (Xuantie-900 linux-5.10.4 glibc gcc
Toolchain V2.6.1 B-20220906)? Is it public, so we can try and reproduce
the issue?

Regards,
Yann E. MORIN.

> Regards,
> Leonard Widler
> 
> Am 26. November 2023 22:56:44 MEZ schrieb "Yann E. MORIN" <yann.morin.1998@free.fr>:
> 
>  leow149, All,
> 
>  Thank you for your contribution! Here is a quick review.
> 
>  First, we'll need you to use your real name as the author of the patch;
>  we do not accept annonymous (od pseduonymou) contributions.
> 
>  On 2023-11-26 22:43 +0100, leow149 spake thusly:
> 
>  This commit fixes a build error which specifically happens for Bouffallo Labs BL808 based boards, but might also happen on other RiscV64 Boards.
> 
> 
>  Please wrap your commit log to ~72 chars.
> 
>  Waht is the error that you see? Could you see if there is a similar
>  build failure on out autobulders:
> 
>  [2]http://autobuild.buildroot.org/?static=1&reason=attr-%
> 
> 
>  The last build error for attr was more than a year ago now, so it is
>  relatively surprising to see that attr does not build. So we'll need a
>  bit more context.
> 
> 
>  Signed-off-by: leow149 <info.leo@widler.de>
> 
>   --------------------------------------------------------------------------------------------------------------------------------
> 
>   package/attr/attr.mk | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
>  diff --git a/package/attr/attr.mk b/package/attr/attr.mk
>  index 0327497e1e..89f7d21f0c 100644
>  --- a/package/attr/attr.mk
>  +++ b/package/attr/attr.mk
>  @@ -13,7 +13,8 @@ ATTR_CPE_ID_VENDOR = attr_project
> 
>   ATTR_INSTALL_STAGING = YES
> 
>  -ATTR_CONF_OPTS = --disable-nls
>  -
>  +ATTR_CONF_OPTS = \
>  +       --disable-nls \
>  +       --enable-multilib
> 
> 
>  Buildroot does not generate multilib toolchains, and when using an
>  external toolchain that is multilib, the proper multilib diretory is
>  copies over to the sysroot.
> 
>  So, --eanble-multilib looksa like the wrong approach, at least without
>  more explanations.
> 
>  Can you elaborate on the issue you encounter, and what makes you think
>  --enable-multilib is the correct solution?
> 
>  Thanks!
> 
>  Regards,
>  Yann E. MORIN.
> 
> 
>   $(eval $(autotools-package))
>   $(eval $(host-autotools-package))
>  --
>  2.30.2
> 
>   --------------------------------------------------------------------------------------------------------------------------------
> 
>  buildroot mailing list
>  buildroot@buildroot.org
>  [3]https://lists.buildroot.org/mailman/listinfo/buildroot
> 
> Links:
> 1. https://pastebin.com/ZzP6pNvx
> 2. http://autobuild.buildroot.org/?static=1&reason=attr-%
> 3. https://lists.buildroot.org/mailman/listinfo/buildroot

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
