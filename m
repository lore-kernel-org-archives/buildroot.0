Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E13BC38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 16:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38B5740330;
	Sun, 30 Oct 2022 16:03:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38B5740330
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xVowjzTA9G_s; Sun, 30 Oct 2022 16:03:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16B13402B3;
	Sun, 30 Oct 2022 16:03:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16B13402B3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6CE821BF47A
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47FDB606EC
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:03:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47FDB606EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rsj1D7pZkdlw for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 16:03:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F7626005E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F7626005E
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 16:03:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6ffe:83e9:a65c:45ae])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3C00F13F8C6;
 Sun, 30 Oct 2022 17:03:40 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 30 Oct 2022 17:03:39 +0100
Date: Sun, 30 Oct 2022 17:03:39 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221030160339.GG1058960@scaer>
References: <20221015210940.4002212-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221015210940.4002212-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667145823;
 bh=VsApE6Gvob0FcU9BhldLu6kmElzvqvxB3GlOTCk+d0o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D6uQ1nlzx//2af2nsS3CQEQpf2mhO+Rz1GoY58Vj85D4tV6sKO9dDbLuIjlsV33AR
 nKVdlH8jbhtmBYYG7ql8qt3YctBU0XsKOmVTotgIiyNSNm7TNFjSPgQG9Kkyf3Un+R
 0/hBd7dHAtoSELElp5T6Cx5FATTvTMVXNahg6wFdSUOqq4vgBUeXnRDkYC+xTXOVRB
 CzlXyStPJfOCO/TQeU+tQ6IykYJvyzT+5FqXfFMvORiPfWjJnoaWO9Zqik9p3rCc95
 Ux0vPOWR7edWB6SsEvJRtb5TAOyKWSwt69x2e4eWtNhnCiJLcA0D5OJx1Zaq9LKotl
 0wPfn+DB4mG2A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=D6uQ1nlz
Subject: Re: [Buildroot] [PATCH v2 1/1] package/brltty: fix infinite loop in
 configure
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
Cc: Mario Lang <mlang@blind.guru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-10-15 15:09 -0600, James Hilliard spake thusly:
> Backport a patch to fix an infinite loop bug in configure.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/82a/82af705f7ca282495461cb3994f5a7e6f64273e1
>  - http://autobuild.buildroot.net/results/06c/06c9414a1ecbc1a147bc8dfddced03fc659af694
>  - http://autobuild.buildroot.net/results/59e/59e36093f7e437a5a37037f7fa50ce2443c47fd3
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - backport patch instead of revert
> ---
>  ...unProgramTerminationCommands-used-a-.patch | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/brltty/0002-shell-prologue-runProgramTerminationCommands-used-a-.patch
> 
> diff --git a/package/brltty/0002-shell-prologue-runProgramTerminationCommands-used-a-.patch b/package/brltty/0002-shell-prologue-runProgramTerminationCommands-used-a-.patch
> new file mode 100644
> index 0000000000..0f81254e08
> --- /dev/null
> +++ b/package/brltty/0002-shell-prologue-runProgramTerminationCommands-used-a-.patch
> @@ -0,0 +1,29 @@
> +From 4503c2cbd3981ba1b50ec7ce287ab48c772b3a7f Mon Sep 17 00:00:00 2001
> +From: Dave Mielke <Dave@Mielke.cc>
> +Date: Sat, 15 Oct 2022 15:20:38 -0400
> +Subject: [PATCH] shell prologue: runProgramTerminationCommands used a bash
> + command. (dm)
> +
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +[james.hilliard1@gmail.com: backport from upstream commit
> +4503c2cbd3981ba1b50ec7ce287ab48c772b3a7f]
> +---
> + brltty-prologue.sh | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/brltty-prologue.sh b/brltty-prologue.sh
> +index 05b817742..6d1faf983 100644
> +--- a/brltty-prologue.sh
> ++++ b/brltty-prologue.sh
> +@@ -102,7 +102,7 @@ runProgramTerminationCommands() {
> +    while [ "${programTerminationCommandCount}" -gt 0 ]
> +    do
> +       set -- $(getVariable "programTerminationCommand${programTerminationCommandCount}")
> +-      let "programTerminationCommandCount -= 1"
> ++      programTerminationCommandCount=$((programTerminationCommandCount - 1))
> + 
> +       local process="${1}"
> +       local directory="${2}"
> +-- 
> +2.34.1
> +
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
