Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9496C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 16:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DDCE60E56;
	Sat, 12 Mar 2022 16:52:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PQlPCDslwMvO; Sat, 12 Mar 2022 16:52:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24B3B60864;
	Sat, 12 Mar 2022 16:52:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5F9301BF3FF
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 16:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45102403AA
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 16:52:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3q9CSTsTI_z3 for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 16:52:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0A654023D
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 16:52:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9481:d19c:460:d0b4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 99F2F19F4F3;
 Sat, 12 Mar 2022 17:52:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647103948;
 bh=8i40ABy2FxfuC0qswRJzo4KZTzaGHtt2WjvVOjU1oqs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KptyyOTWikIsPKfbQz21zPf3+Wh9AYE//aE9D+UJpBHybxvpoH27F6FRU6TPl5Ryz
 5UrclsHJLyO6Pza8WdH7fsf1sTOQv8/90YHNzstM5A7rzwMUUM1vldIL1gT2Y+FXWG
 qe/HPrM/Pq5ItoPgVTO5KZDXHEzBPNboPH7xE9Yvp/La4Hcz2NIaQOuxW6d44w57TQ
 KXLEfq6MMdE8H9LflAqIs7/+4cL4LWvFC+9a0TI2CB7ujGWwiRtN3k2aluUFxbYrl9
 Lo9NP0Ysg8smgQh6jkk9L6KW73hbMqLXZjY5X6Ew17Cpe0K6Pa9i7AoyjZonan+bE5
 QcK1+FiQBb7cg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 12 Mar 2022 17:52:26 +0100
Date: Sat, 12 Mar 2022 17:52:26 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Mathieu Mirmont <mat@parad0x.org>
Message-ID: <20220312165226.GH283544@scaer>
References: <20220310101826.GA2353@parad0x.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220310101826.GA2353@parad0x.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] fs/common.mk: use find instead of shell
 glob patterns
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

Mathieu, All,

On 2022-03-10 11:18 +0100, Mathieu Mirmont via buildroot spake thusly:
> Different shells can have different behaviours when it comes to
> globbing patterns. The dash shell (/bin/sh) on Debian testing switched
> to a different fnmatch/glob implementation that results in this new
> behaviour:
> 
> Using bash:
> $ mkdir /tmp/foo
> $ echo /tmp/foo/.[^.]*
> /tmp/foo/.[^.]*
> 
> Using dash:
> $ mkdir /tmp/foo
> $ echo /tmp/foo/.[^.]*
> /tmp/foo/..
> 
> The current FAKEROOT script uses this shell glob pattern which now
> fails on recent Debian testing systems:
> 
> rm: refusing to remove '.' or '..' directory: skipping '/build/buildroot-fs/cpio/target/run/..'
> rm: refusing to remove '.' or '..' directory: skipping '/build/buildroot-fs/cpio/target/tmp/..'
> 
> It seems safer to use `find | xargs rm` here instead of relying on
> shell globbing patterns.
> 
> Signed-off-by: Mathieu Mirmont <mat@parad0x.org>

I applied to master, after adding a little blurb about the ..foo files
that would be missed with globs.

> ---
>  fs/common.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/common.mk b/fs/common.mk
> index 45beb5ae7b..37eafac4f7 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -186,7 +186,8 @@ $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): $$(ROOTFS_$(2)_DEPENDENCIES)
>  
>  	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),\
>  		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
> -	echo "rm -rf $$(TARGET_DIR)/run/* $$(TARGET_DIR)/run/.[^.]* $$(TARGET_DIR)/tmp/* $$(TARGET_DIR)/tmp/.[^.]*" >> $$(FAKEROOT_SCRIPT)
> +	echo "find $$(TARGET_DIR)/run/ -mindepth 1 -prune -print0 | xargs -0r rm -rf --" >> $$(FAKEROOT_SCRIPT)
> +	echo "find $$(TARGET_DIR)/tmp/ -mindepth 1 -prune -print0 | xargs -0r rm -rf --" >> $$(FAKEROOT_SCRIPT)

That could have been a single call to find:

    find $$(TARGET_DIR)/run/ $$(TARGET_DIR)/tmp/ -mindepth 1 [...]

but there not much loss calling it twice, and the lines are shorter,
which is nicer too, so I kept it as is.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  	$$(call PRINTF,$$(ROOTFS_REPRODUCIBLE)) >> $$(FAKEROOT_SCRIPT)
>  	$$(call PRINTF,$$(ROOTFS_SELINUX)) >> $$(FAKEROOT_SCRIPT)
>  	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
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
