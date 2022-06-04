Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0486DC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 09:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9749F60E87;
	Sat,  4 Jun 2022 09:36:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0J3DbR4-fN9j; Sat,  4 Jun 2022 09:36:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BF7F60E57;
	Sat,  4 Jun 2022 09:36:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB3EA1BF27A
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 09:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB1C4844D9
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 09:36:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JdI6sMxnArHZ for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 09:36:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A7F8844D8
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 09:36:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e086:bc2a:8b9d:c22])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 685D65FFAA;
 Sat,  4 Jun 2022 11:36:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1654335366;
 bh=gy9j4UvmVSgsZrpDPk8FaWGLmU5Fx7xHKq9+qWk5BlI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eXATzTIgTO5/OqK76JaR48gneWPglfNEq1bNAZ3euGWVcPfvv844CquWDKSbre7be
 Wi6QpohNMKkXnfUSkSIoWf58n73g4VyDkp4Gs49ajJPGiWdgOLk7koq76E0XUWXEPU
 CUcwzQ82bGIuTPiNmAP+X9JruUSKMMW71tfHBTf1erzOdfcEoHWp+OiEKNvvd+YgGA
 vpBI1pq/uyg5Qyu8F2BIbu82CXVsMBYWFxb2x69I/m+IKiPY8qKHXeLa7VpbgJRHIp
 5OaI6rnPvUrsfAfsMxUk2rj0KZjEQ8dGfgk6ZRUqCn7o9HGacRah9fXoOL9u51lxBd
 MuBsRuK3TuJ7w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Jun 2022 11:36:02 +0200
Date: Sat, 4 Jun 2022 11:36:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Quentin Schulz <foss+buildroot@0leil.net>
Message-ID: <20220604093602.GG427639@scaer>
References: <20220511110619.1610327-1-foss+buildroot@0leil.net>
 <20220511110619.1610327-2-foss+buildroot@0leil.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220511110619.1610327-2-foss+buildroot@0leil.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 2/2] manual: add LIBFOO_ROOTFS_PRE_CMD_HOOKS
 docs
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2022-05-11 13:06 +0200, Quentin Schulz spake thusly:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> Even though it's barely used in packages, let's list the hook in the
> list of supported hooks.

When this was intriduced, this was not documented on purpose:

    4628b6f3b451 fs: add pre- and post-command hooks
    ...
    Those hooks are not documented on-purpose; they are probably going to
    only ever be used by systemd.

So yes, we now have three places where they are used, but it is still
very systemd-centric. The only exception is eudev, which is still 50%
systemd-specific.

So I still prefer that this is not documented.

If we eventually have more valid users, then we can revisit that later
on.

Regards,
Yann E. MORIN.

> Also add a specific section to explain what's its use and how it
> differs from LIBFOO_TARGET_FINALIZE_HOOKS.
> 
> Cc: Quentin Schulz <foss+buildroot@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>  docs/manual/adding-packages-hooks.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/docs/manual/adding-packages-hooks.txt b/docs/manual/adding-packages-hooks.txt
> index 741b71ca29..9dd77bece3 100644
> --- a/docs/manual/adding-packages-hooks.txt
> +++ b/docs/manual/adding-packages-hooks.txt
> @@ -48,6 +48,8 @@ The following hook points are available:
>  
>  * +LIBFOO_TARGET_FINALIZE_HOOKS+
>  
> +* +LIBFOO_ROOTFS_PRE_CMD_HOOKS+
> +
>  These variables are 'lists' of variable names containing actions to be
>  performed at this hook point. This allows several hooks to be
>  registered at a given hook point. Here is an example:
> @@ -87,3 +89,12 @@ Packages may also register hooks in +LIBFOO_TARGET_FINALIZE_HOOKS+.
>  These hooks are run after all packages are built, but before the
>  filesystem images are generated. They are seldom used, and your
>  package probably do not need them.
> +
> +==== Rootfs pre-hook
> +
> +Packages may also register hooks in +LIBFOO_ROOTFS_PRE_CMD_HOOKS+.
> +These hooks are run after all packages are built, but before the
> +filesystem images are generated. They are run under fakeroot, in a
> +temporary directory and after all +*_TARGET_FINALIZE_HOOKS+ have
> +been run.
> +They are seldom used, and your package probably do not need them.
> -- 
> 2.35.3
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
