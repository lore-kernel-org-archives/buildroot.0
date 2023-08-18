Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0743EE4998
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 22:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5264040519;
	Fri, 18 Aug 2023 22:11:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5264040519
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EQbFRjiY_iA8; Fri, 18 Aug 2023 22:11:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4EF1C405C6;
	Fri, 18 Aug 2023 22:11:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EF1C405C6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4AE531BF301
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 22:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22B2160EF4
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 22:11:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22B2160EF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ckodjRJ_3vQC for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 22:11:12 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA7FF60EF3
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 22:11:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA7FF60EF3
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:104e:727c:a742:4ed7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id C40242003D0;
 Sat, 19 Aug 2023 00:11:01 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 19 Aug 2023 00:11:01 +0200
Date: Sat, 19 Aug 2023 00:11:01 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jamie Gibbons <jamie.gibbons@microchip.com>
Message-ID: <20230818221101.GE1134940@scaer>
References: <20230818104301.403429-1-jamie.gibbons@microchip.com>
 <20230818104301.403429-4-jamie.gibbons@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230818104301.403429-4-jamie.gibbons@microchip.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692396669;
 bh=9o4+PsjSn5/GCz0gLQyC9Y8H3fwwWzOYdYrGVSt1Y/0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E0BMK8XzvQAC5HK7rEe/ExlzBG4rBzhaF+IQs4s80rXAqPWr6r12RsRbB1yqA9HWX
 EuKeJ7XJCCzx4shsUu+13FFtZ35CRQPP1NgSgJgZ2Ip7np2CpAxB/Ne8apGg/S27XF
 8Ra7PxE6buHn5gu2erwHrFjfaVNyfxnQzZmJg9eW8Lk2whndB5yVxFtpSUKkSkYg7M
 PGPcd760jFyAuopINwXH7dUxW8riVhKXajd3YZD2e3dGR8q6/m2lI8MS3hRd2MPiCE
 VceTIYANmhuBQDUdxTEf5O3rdRad7SZoFkUdmtpCbr1GkaXRL97uzhtA8fNg4/3On9
 Y4bCrqmGQgm7w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=E0BMK8Xz
Subject: Re: [Buildroot] [PATCH v3 3/3] board/microchip/mpfs_icicle: update
 post-image script
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Conor Dooley <Conor.Dooley@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Jamie, All,

On 2023-08-18 11:43 +0100, Jamie Gibbons via buildroot spake thusly:
> The hss-payload-generator could not find where u-boot.bin was when
> looking for it using the config.yaml. This needs to be ran in the
> same directory as the u-boot.bin file to enable it to find it. Fix the
> post image script to allow an image to get built.
> 
> Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
> ---
>  board/microchip/mpfs_icicle/post-image.sh | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/board/microchip/mpfs_icicle/post-image.sh b/board/microchip/mpfs_icicle/post-image.sh
> index 04b34bbd40..2368aa42f6 100755
> --- a/board/microchip/mpfs_icicle/post-image.sh
> +++ b/board/microchip/mpfs_icicle/post-image.sh
> @@ -2,7 +2,9 @@
>  HSS_PAYLOAD_GENERATOR=${HOST_DIR}/bin/hss-payload-generator
>  MKIMAGE=${HOST_DIR}/bin/mkimage

The HOST_DIR expansions here are not quoted, and it's weird that
shellcheck does not whine about it...

Can you fix those, please?

> -"${HSS_PAYLOAD_GENERATOR}" -c board/microchip/mpfs_icicle/config.yaml "${BINARIES_DIR}"/payload.bin
> -cp board/microchip/mpfs_icicle/mpfs_icicle.its "${BINARIES_DIR}"/mpfs_icicle.its
> +cd "${BINARIES_DIR}" || exit

BINARIES does exist when a post-image sctript is run.

But if you really want to exit on error, just add 'set -e' at the top of
the script (below the shabang).

> +"${HSS_PAYLOAD_GENERATOR}" -c "${CONFIG_DIR}"/board/microchip/mpfs_icicle/config.yaml payload.bin

Ditto, this is CONFIG_DIR is incorrect, because it does not work for
out-of-tree builds.

Since that yaml file is in the same directory as the post-image.sh, it
is better to write;

    #!/bin/bash
    set -e

    BOARD_DIR="${0%/*}"

    "${HSS_PAYLOAD_GENERATOR}" -c "${BOARD_DIR}"/config.yaml payload.bin

> +cd "${CONFIG_DIR}" || exit

CONFIG_DIR is not the correct location to return to. Indeed, it is the
directory where the .config file is, not necessarily the top directory
of the buildroot tree, like out-of-tree builds.

Instead you should probably use the pushd/popd construct:

    pushd "${BINARIES_DIR}"
    "${HSS_PAYLOAD_GENERATOR}" -c "${BOARD_DIR}"/config.yaml payload.bin
    popd

> +cp "${CONFIG_DIR}"/board/microchip/mpfs_icicle/mpfs_icicle.its "${BINARIES_DIR}"/mpfs_icicle.its
>  (cd "${BINARIES_DIR}" && "${MKIMAGE}" -f mpfs_icicle.its mpfs_icicle.itb)

Maybe we can include this MKIMAGE call in the pushd/popd section:

    pushd "${BINARIES_DIR}"
    "${HSS_PAYLOAD_GENERATOR}" -c "${BOARD_DIR}"/config.yaml payload.bin
    cp "${BOARD_DIR}"/mpfs_icicle.its "${BINARIES_DIR}"/mpfs_icicle.its
    "${MKIMAGE}" -f mpfs_icicle.its mpfs_icicle.itb)
    popd

I've marked this patch as changes requested (too much changes that I
can't test without spawning a build, which takes too long here...)

Regards,
Yann E. MORIN.

>  support/scripts/genimage.sh -c board/microchip/mpfs_icicle/genimage.cfg
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
