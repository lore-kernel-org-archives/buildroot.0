Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB4BC76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 21:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E62C7417D2;
	Mon, 10 Apr 2023 21:14:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E62C7417D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mtRdZ7PNjxhm; Mon, 10 Apr 2023 21:14:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C03BB408AE;
	Mon, 10 Apr 2023 21:14:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C03BB408AE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 632171BF255
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 21:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47C06408AE
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 21:14:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47C06408AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id htESwasRSxgp for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 21:14:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1DEF4028F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1DEF4028F
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 21:14:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D5CB45FFA9;
 Mon, 10 Apr 2023 23:14:22 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 10 Apr 2023 23:14:22 +0200
Date: Mon, 10 Apr 2023 23:14:22 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Knight <james.d.knight@live.com>
Message-ID: <20230410211422.GP2819@scaer>
References: <20230407052108.1696-1-james.d.knight@live.com>
 <SN4P221MB0682FA7512F62AE3C071BCA8A0969@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN4P221MB0682FA7512F62AE3C071BCA8A0969@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681161266;
 bh=i1endO+G10Z4AGS3kynsw0ZexQFNJ3DxBdjRSsxHoXY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vw/ZZ4yYCGyGhlEHmC6/4/rymMZ475SNpw2dqOPdWwjlQmcnUFQLaBktiAwHUxonR
 w9oEc2PFjYqdgxBDjf7SNcKp8JWdLzoeikL+76SZsrdMJQPLovgJZIUr7KY7bT6m38
 9YJ9vLnYaTytgcJxtFuID8lE3uUzZ1XZswYAzvNdjzlJt0kP4vcOqpvF/UZg3XpI+o
 XEC8XKeV69NNfdXFkvp5/Dr9zhZ14Q+9EsKsDqIYsHUwoa4fr++Jb6rQDifjxbrPLL
 2QdhxE0JEqQ2jUEeKhlLBFwOy2jWuE98H4hN+fBIhOPqfPjF5SCqiCJBJApm714WHV
 HK3uaKCvrDGYg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Vw/ZZ4yY
Subject: Re: [Buildroot] [PATCH v2 2/3] board/qemu/start-qemu.sh.in: rework
 argument handling
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
> Provides the ability to forward command line options directly to QEMU.
> When invoking `start-qemu.sh`, users can forward arguments by adding a
> double dash (`--`) into the argument set, and any trailing arguments
> will be forwarded into QEMU. For example, `start-qemu.sh -- --help`.
> 
> The original implementation supported a "serial-only" command line
> argument to help run in a non-graphical mode for some use cases. These
> changes try to promote a newly added `--serial-only` argument to drive
> this mode; that being said, a `serial-only` argument will still be
> accepted for backwards compatibility.
> 
> Since this script is primarily for CI-related testing, a warning is
> generated for users if any unsupported options are provided.
> 
> Signed-off-by: James Knight <james.d.knight@live.com>
> ---
> Changes v1 -> v2:
>   - From the original patch, this second patch now only contains changes
>     related to argument processing.
>   - Add unsupported warning with custom options (suggested by Romain)
>   - Ensure sh compliant in the argument parsing (while condition).
>   - Properly handle legacy `serial-only` check in argument processing by
>     not cycling just on dash-prefixed arguments.
> ---
>  board/qemu/start-qemu.sh.in | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/board/qemu/start-qemu.sh.in b/board/qemu/start-qemu.sh.in
> index c2d77734c7a6b318a5f7adedfd9b0b5875e84f59..dd387507f8867778ec73f49d769679dcd0956fd4 100644
> --- a/board/qemu/start-qemu.sh.in
> +++ b/board/qemu/start-qemu.sh.in
> @@ -3,12 +3,25 @@
>  BINARIES_DIR="${0%/*}/"
>  cd ${BINARIES_DIR}
>  
> -if [ "${1}" = "serial-only" ]; then
> +mode_serial=0
> +while [ "$1" ]; do
> +    case "$1" in
> +    --serial-only|serial-only) mode_serial=1; shift;;

I like to use false/true for booleans, first because this is exactly
what mode_serial is, and second because we can directly call them to
test truthness...

> +    --) shift; break;;
> +    *) echo "unknown option: $1" 1>&2; exit 1;;
> +    esac
> +done
> +
> +if [ $mode_serial -eq 1 ]; then

... here, as:

    if ${mode_serial}; then
        ...

>      EXTRA_ARGS='VAR_SERIAL_ARGS'
>  else
>      EXTRA_ARGS='VAR_DEFAULT_ARGS'
>  fi
>  
> +if [ "$*" ]; then
> +    echo "(warning) unsupported options: $*"
> +fi

This warning is not going to be usefull, is it? If the user does pass
extra variables for qemu, $* will not be empty, and this is expected.

OTOH, if there were options the script did not recognise for itself, it
would have already errored out becasue of 'exit 1' earlier.

So, I dropped the warning.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  export PATH="${HOST_DIR}/bin:${PATH}"
> -exec VAR_QEMU_CMD_LINE ${EXTRA_ARGS}
> +exec VAR_QEMU_CMD_LINE ${EXTRA_ARGS} "$@"
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
