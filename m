Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09A2C76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 21:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 799A641833;
	Mon, 10 Apr 2023 21:15:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 799A641833
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aHtUvJgxY-xc; Mon, 10 Apr 2023 21:15:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 667EE41912;
	Mon, 10 Apr 2023 21:15:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 667EE41912
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F6C51BF255
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 21:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 691E681BF5
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 21:15:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 691E681BF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZnAodlEyVhR9 for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 21:15:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8704A81C26
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8704A81C26
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 21:15:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id CA5D35FFA8;
 Mon, 10 Apr 2023 23:15:24 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 10 Apr 2023 23:15:24 +0200
Date: Mon, 10 Apr 2023 23:15:24 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Knight <james.d.knight@live.com>
Message-ID: <20230410211524.GQ2819@scaer>
References: <20230407052108.1696-1-james.d.knight@live.com>
 <SN4P221MB06829533040263705CA5B624A0969@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN4P221MB06829533040263705CA5B624A0969@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681161327;
 bh=Dn2B8o575tAbHxC8JneN3Phs2911mnViL//YU6VQzKk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YyYfDB/Wrnwjd2ojBe5i7CEITliYRNAV7pIwSMiH4+tgb5Sl7jJBJLkUelBrBYx6L
 0PTxrfgf1ceERlTrAULx1NHeIUNtTAxHAhCKlu1dKYR8U72Q01J8wa+3nNJS5acA5C
 Iw765qw63YgISEIkiqdEV9C8no7u/o+BH3BFq6SbQhj/2ZtHLEBus9R3s1yvAW/soK
 SN8YKTyq9dQutyq96FPgbFqRA21ZxOXCVWFIM6Zy26BKGKxL373YaEF1XsRjrRWiDv
 xALI1Bmi9fqj5U+Jc0/BLHAbDZYyujtf6qaNnb5HfGAK+DNsXG2PwIXf7+Xk2Z/7Nn
 /+C5OwyvBt7mQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YyYfDB/W
Subject: Re: [Buildroot] [PATCH v2 3/3] board/qemu/start-qemu.sh.in: support
 launching with host system's qemu
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-04-07 01:21 -0400, James Knight spake thusly:
> Provides the ability to use a host system's QEMU. While a Buildroot
> generated QEMU should work for most cases, a developer may wish to use
> the system's QEMU for options which may not have been configured in the
> Buildroot's QEMU build (e.g. configuring a different display mode).
> 
> Signed-off-by: James Knight <james.d.knight@live.com>
> ---
> Changes v1 -> v2:
>   - From the original patch, this third patch now only contains changes
>     related to permitting a system QEMU usage.
>   - Change from `--host` to `--use-system-qemu` (suggested by Romain).
> ---
>  board/qemu/start-qemu.sh.in | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/board/qemu/start-qemu.sh.in b/board/qemu/start-qemu.sh.in
> index dd387507f8867778ec73f49d769679dcd0956fd4..51f15b3ecdfdc8151caeae90582ad1142d122e69 100644
> --- a/board/qemu/start-qemu.sh.in
> +++ b/board/qemu/start-qemu.sh.in
> @@ -4,9 +4,11 @@ BINARIES_DIR="${0%/*}/"
>  cd ${BINARIES_DIR}
>  
>  mode_serial=0
> +mode_sys_qemu=0
>  while [ "$1" ]; do
>      case "$1" in
>      --serial-only|serial-only) mode_serial=1; shift;;
> +    --use-system-qemu) mode_sys_qemu=1; shift;;

I also swotched to false/true here...

>      --) shift; break;;
>      *) echo "unknown option: $1" 1>&2; exit 1;;
>      esac
> @@ -22,6 +24,9 @@ if [ "$*" ]; then
>      echo "(warning) unsupported options: $*"
>  fi
>  
> -export PATH="${HOST_DIR}/bin:${PATH}"
> +if [ $mode_sys_qemu -ne 1 ]; then

... and here.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +    export PATH="${HOST_DIR}/bin:${PATH}"
> +fi
> +
>  exec VAR_QEMU_CMD_LINE ${EXTRA_ARGS} "$@"
>  )
> -- 
> 2.39.1.windows.1
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
