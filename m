Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E95E748E9
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 17:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAD4381E9D;
	Sun,  1 Oct 2023 17:08:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAD4381E9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AqRmpBIVmnFa; Sun,  1 Oct 2023 17:08:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A262881E9F;
	Sun,  1 Oct 2023 17:08:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A262881E9F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E440E1BF479
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 17:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC35E418B9
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 17:08:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC35E418B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rFSAUq77ZyeR for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 17:08:08 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2B33B418A5
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 17:08:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B33B418A5
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb04:4ad:b00:7d3f:173d:28ec:8590])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 40459B00563;
 Sun,  1 Oct 2023 19:08:02 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 01 Oct 2023 19:08:02 +0200
Date: Sun, 1 Oct 2023 19:08:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: AndreiCherniaev <cherniaev.andrei@kairo.space>
Message-ID: <20231001170802.GN2579@scaer>
References: <20230109074202.12012-2-cherniaev.andrei@kairo.space>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230109074202.12012-2-cherniaev.andrei@kairo.space>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696180085;
 bh=KwWJW/ydFq6WS1mWXYJ5TKz/PYzvCU0fOJm23Ez6ceg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qmwBa/c9AH8qfJdxVgTYwPx6IjnA0Ms7jGhz8Mw2/B3hfvHSXU2N1Gq3OFNfeS5bV
 bGXefr245HmLDEjFbV1IVKFITl/LF0tiWBi+RSiTvLWl79bFoqq+uFlFboic8sA3vh
 TdyCubhoAA1S9qyAsjspiUFwvuVypKliSjGaY0+Ztha4MpXIpvC0qcvgIJxxnrvXly
 FczDadA7nDn5IYjhKnuQ0NScte7zXpTaI2Y4IjlSgr9bLNRyzt1BYlr/2AgTX6QbqX
 Jaht8jFI30NV4LMg4lXXDujEYYVGnXXrrNEq3vtq4KnJBIw/rVaidN2lV4YX6obN4+
 wygVQvv474OGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qmwBa/c9
Subject: Re: [Buildroot] [PATCH 2/2] board/pc/post-build.sh: allow to use
 grub config file
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

Andrei, All,

Sorry to come back so alte on that patch...

On 2023-01-09 16:42 +0900, AndreiCherniaev spake thusly:
> Allow to use grub config file with set timeout not default. Before this set timeout always was 5s and can't be changed, any set timeout from BR2_TARGET_GRUB2_BUILTIN_CONFIG_PC was ignored

Please properly format your commit log, wrapped at ~72 chars wide lines.

The files in board/ are meant to be used with the defconfigs in
Buildroot, and together are meant as examples and startkng point for
frther custmisations.

We can't add support for everything up to the kitchen sink in those
scripts; we want to keep them simple so that it is easy to see what they
are doing on how they can be extended.

It is your responsibility to adapt those files to match your use-case,
potentially duplicating them on hyour side to create a new board
definition.

As such, I've maked this patch as rejected.

Regards,
Yann E. MORIN.

> Signed-off-by: AndreiCherniaev <cherniaev.andrei@kairo.space>
> ---
>  board/pc/post-build.sh | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/board/pc/post-build.sh b/board/pc/post-build.sh
> index c76dee2676..8538faa7eb 100755
> --- a/board/pc/post-build.sh
> +++ b/board/pc/post-build.sh
> @@ -9,7 +9,22 @@ if [ -d "$BINARIES_DIR/efi-part/" ]; then
>      cp -f "$BOARD_DIR/grub-efi.cfg" "$BINARIES_DIR/efi-part/EFI/BOOT/grub.cfg"
>  else
>      cp -f "$BOARD_DIR/grub-bios.cfg" "$TARGET_DIR/boot/grub/grub.cfg"
> -
>      # Copy grub 1st stage to binaries, required for genimage
>      cp -f "$TARGET_DIR/lib/grub/i386-pc/boot.img" "$BINARIES_DIR"
>  fi
> +
> +# When post-build script is runing $BR2_TARGET_GRUB2_BUILTIN_CONFIG_PC is unset, so parce Buildroot .config file again
> +GRUB2_BUILTIN_CONFIG_PC="`grep --only-matching --perl-regex "(?<=BR2_TARGET_GRUB2_BUILTIN_CONFIG_PC\=).*" $BR2_CONFIG`"
> +# Using the native shell prefix/suffix removal feature (see also qstrip)
> +GRUB2_BUILTIN_CONFIG_PC="${GRUB2_BUILTIN_CONFIG_PC%\"}"
> +GRUB2_BUILTIN_CONFIG_PC="${GRUB2_BUILTIN_CONFIG_PC#\"}"
> +if [ -z "$GRUB2_BUILTIN_CONFIG_PC" ]; then #if user doesn't use his .config for grub
> +    # Set time to wait 5 s for keyboard input before booting by default
> +    sed -i -e '1 s/^/set default="0"\nset timeout="5"\n\n/;' "$TARGET_DIR/boot/grub/grub.cfg"
> +#else if user use his .config for grub
> +# to configure bootloader put something like
> +#  set default="0"
> +#  set timeout="5"
> +# to your file located $BR2_TARGET_GRUB2_BUILTIN_CONFIG_PC 
> +# More info https://www.gnu.org/software/grub/manual/grub
> +fi
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
