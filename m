Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68308C76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 16:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF8A181F88;
	Mon, 10 Apr 2023 16:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF8A181F88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pmHvSPl1OZzs; Mon, 10 Apr 2023 16:52:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F41AA81F1E;
	Mon, 10 Apr 2023 16:52:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F41AA81F1E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 67DA61BF314
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 16:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D9C34063C
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 16:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D9C34063C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HzqYwhxZo7F8 for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 16:52:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C3F54013F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C3F54013F
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 16:52:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id E2BC75FFA6;
 Mon, 10 Apr 2023 18:51:57 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 10 Apr 2023 18:51:57 +0200
Date: Mon, 10 Apr 2023 18:51:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20230410165157.GD2819@scaer>
References: <20230409210814.496117-1-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230409210814.496117-1-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681145520;
 bh=PqW4cJ04ySjc8+wVn9dsr/a1skofNLQwEO91VG4yA/s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PrLHjBee6y+FIsGGYAX4FP+GQ1FJC9NyqVH6NVVQjaICNXFcIJqpV4sQFdZwaq3UH
 5oXkSMqnGqTCKVNdM7IHvQKkABbP28Z5VRsSHyO2iGUCbaRyf0n9OvtWtP4k8K8plK
 zlFCrWtfECLFXGNIaWwyL2N4Rbz2hfbyb2nAqebvCtgMjBu3fx0cFv+RakzPnJ+cs0
 bn+5VKWGs7nJ5n1rKskw9GI8F1TkC/+9BcRILZ6xrosNbeZ08XiYvfasja528WaLVB
 LE/wWD6FCH7784DGBtP0XK1FFTxoxTpGo08TUGSoCe2PCspELI5LBDkyiAuFkO9Y+i
 8T+aV69CGu7Dg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PrLHjBee
Subject: Re: [Buildroot] [PATCH] package/skeleton: drop $(HOST_DIR)/usr
 compatibility symlink
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

Arnout, All,

On 2023-04-09 23:08 +0200, Arnout Vandecappelle spake thusly:
> It has been years that we removed $(HOST_DIR)/usr. Because of this
> symlink, however, there are still packages that install things in
> $(HOST_DIR)/usr. Remove the symlink so those packages will start to
> fail.
> 
> Note that there's now a check-package check to detect such incorrectly
> instaled things, so this should only affect external packages.
> 
> Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
> ---
>  package/skeleton/skeleton.mk | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
> index 634c76e437..186cb60189 100644
> --- a/package/skeleton/skeleton.mk
> +++ b/package/skeleton/skeleton.mk
> @@ -11,11 +11,7 @@
>  SKELETON_ADD_TOOLCHAIN_DEPENDENCY = NO
>  SKELETON_ADD_SKELETON_DEPENDENCY = NO
>  
> -# We create a compatibility symlink in case a post-build script still
> -# uses $(HOST_DIR)/usr
>  define HOST_SKELETON_INSTALL_CMDS
> -# check-package DoNotInstallToHostdirUsr
> -	$(Q)ln -snf . $(HOST_DIR)/usr

Should we have a kind of post-isntall test that checks that a package
did not create that (e.g. because their makefile hard-codes something
like DESTDIR/usr)?

This is probably a good candidate for GLOBAL_INSTRUMENTATION_HOOKS, no?

Regards,
Yann E. MORIN.

>  	$(Q)mkdir -p $(HOST_DIR)/lib
>  	$(Q)mkdir -p $(HOST_DIR)/include
>  	$(Q)case $(HOSTARCH) in \
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
