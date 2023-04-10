Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E13C76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 21:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9717E417B3;
	Mon, 10 Apr 2023 21:11:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9717E417B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IGz0Zac2d26b; Mon, 10 Apr 2023 21:11:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D44541776;
	Mon, 10 Apr 2023 21:11:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D44541776
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B0B01BF255
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 21:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DDB760BCF
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 21:11:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DDB760BCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z7H6W_xUIOTM for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 21:11:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FFE560671
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0FFE560671
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 21:11:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 1FD7C5FF3F;
 Mon, 10 Apr 2023 23:11:07 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 10 Apr 2023 23:11:06 +0200
Date: Mon, 10 Apr 2023 23:11:06 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Knight <james.d.knight@live.com>
Message-ID: <20230410211106.GO2819@scaer>
References: <SN4P221MB0682D9AC28AB53863A652575A0969@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN4P221MB0682D9AC28AB53863A652575A0969@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681161070;
 bh=U7vhcHWm5vsptMHq/bk01ysAWwFDJzj8mpNvDrsvsas=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AiBuJBbzm6LqIznzf+ci7f6+MnnFpQyt80Jy9pK03dWR/DcBJWZlNIhN+fq+VhR3q
 Lfa1cdhzNakJ9CbiDdPIUrhg6Wm4GQzS+qlMf5kZZhY2oOsUkZr9kqFfDTEt4YlCSA
 04+P7/l/scR6bcAmhco+O8CHr6K+Bimmlr2Jd/AYRtVI1PTtk8HIbCfd83mLtD5xkI
 kQ9hsexOP2HtGeNdLH1LVOMcl92ZpSikAgeuQIlpKowAkk6wQ8FUr4soP3q5NzOgnA
 CXCr8rymQ6ViLCJ8wt7Qlv2CcT4b+W0cTkcjl5UnS2+8Wo2DUhZd0bb+v6w6/oVJ4+
 5gZ+kkqMLe+aw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AiBuJBbz
Subject: Re: [Buildroot] [PATCH v2 1/3] board/qemu: define start qemu script
 outside of post-image script
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
> The following moves the definition of the QEMU board's `start-qemu.sh`
> helper script from being inlined in the post-image script into its own
> file. This should, in theory, make it easier to maintain the script in
> the future.
> 
> Signed-off-by: James Knight <james.d.knight@live.com>
> ---
> Changes v1 -> v2:
>   - Split original into three patches (suggested by Arnout).
>   - This patch moves cat script into a new 'start-qemu.sh.in'
>     file (suggested by Arnout).
>   - Script template dropped escape characters; uses VAR_ prefixes.

Why? The usual way to sed-n-replace is by using a placeholder for the
variable, like:

    do something @VARIABLE@

which gets replaced with something like:

    sed "s|@VARIABLE@|${VARIABLE}|"

and since we are already doing this in numerous places in Buildroot, it
is only logical to do it here too.

> ---
>  board/qemu/post-image.sh    | 21 ++++-----------------
>  board/qemu/start-qemu.sh.in | 14 ++++++++++++++
>  2 files changed, 18 insertions(+), 17 deletions(-)
>  create mode 100644 board/qemu/start-qemu.sh.in
> 
> diff --git a/board/qemu/post-image.sh b/board/qemu/post-image.sh
> index 88f04134961ea7a105e506045ca16a0d9b810925..c9043a1364e8e03dbfa9ff3370d4e4a34357bef5 100755
> --- a/board/qemu/post-image.sh
> +++ b/board/qemu/post-image.sh
> @@ -41,21 +41,8 @@ case ${DEFCONFIG_NAME} in
>      ;;
>  esac
>  
> -cat <<-_EOF_ > "${START_QEMU_SCRIPT}"
> -	#!/bin/sh
> -	(
> -	BINARIES_DIR="\${0%/*}/"
> -	cd \${BINARIES_DIR}
> -
> -	if [ "\${1}" = "serial-only" ]; then
> -	    EXTRA_ARGS='${SERIAL_ARGS}'
> -	else
> -	    EXTRA_ARGS='${DEFAULT_ARGS}'
> -	fi
> -
> -	export PATH="${HOST_DIR}/bin:\${PATH}"
> -	exec ${QEMU_CMD_LINE} \${EXTRA_ARGS}
> -	)
> -_EOF_
> -
> +cp "${QEMU_BOARD_DIR}/start-qemu.sh.in" "${START_QEMU_SCRIPT}"
> +sed -i "s|VAR_DEFAULT_ARGS|${DEFAULT_ARGS}|g" "${START_QEMU_SCRIPT}"
> +sed -i "s|VAR_QEMU_CMD_LINE|${QEMU_CMD_LINE}|g" "${START_QEMU_SCRIPT}"
> +sed -i "s|VAR_SERIAL_ARGS|${SERIAL_ARGS}|g" "${START_QEMU_SCRIPT}"

This can all be done with a single call to sed, without cp either:

    sed "s|@SERIAL_ARGS@|${SERIAL_ARGS}|g" \
        "s|@DEFAULT_ARGS@|${DEFAULT_ARGS}|g" \
        "s|@QEMU_CMD_LINE@|${QEMU_CMD_LINE}|g" \
        <"${QEMU_BOARD_DIR}/start-qemu.sh.in" \
        >"${START_QEMU_SCRIPT}"

>  chmod +x "${START_QEMU_SCRIPT}"
> diff --git a/board/qemu/start-qemu.sh.in b/board/qemu/start-qemu.sh.in
> new file mode 100644
> index 0000000000000000000000000000000000000000..c2d77734c7a6b318a5f7adedfd9b0b5875e84f59
> --- /dev/null
> +++ b/board/qemu/start-qemu.sh.in
> @@ -0,0 +1,14 @@
> +#!/bin/sh
> +(

No need for a sub-shell.

> +BINARIES_DIR="${0%/*}/"
> +cd ${BINARIES_DIR}

    $ shellcheck board/qemu/start-qemu.sh.in
    In board/qemu/start-qemu.sh.in line 4:
    cd ${BINARIES_DIR}
    ^----------------^ SC2164: Use 'cd ... || exit' or 'cd ... || return' in case cd fails.
       ^-------------^ SC2086: Double quote to prevent globbing and word splitting.

The first is spurious (BINARIES_DIR is eaxctly where the running shell
is), so ignoreit , but the second is valid, so:
    # shellcheck disable=SC2164
    cd "${BINARIES_DIR}"

> +if [ "${1}" = "serial-only" ]; then
> +    EXTRA_ARGS='VAR_SERIAL_ARGS'
> +else
> +    EXTRA_ARGS='VAR_DEFAULT_ARGS'
> +fi
> +
> +export PATH="${HOST_DIR}/bin:${PATH}"

This is the pain point: what is going to set HOST_DIR when this script
is called? I think it should be substituted like the other variables, so
this is what I did. The script can't be easily relocated, but that was
not the goal for this script to be relocatable so far (it was only ever
used in our CI), so making it relocatable can be done later (if
possible).

Applied to master with all the above fixed, thanks.

Regards,
Yann E. MORIN.

> +exec VAR_QEMU_CMD_LINE ${EXTRA_ARGS}
> +)
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
