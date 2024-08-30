Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A73CA101A
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 21:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96A6E61490;
	Fri, 30 Aug 2024 21:39:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ywauq-wuMgG2; Fri, 30 Aug 2024 21:39:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94F9361453
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94F9361453;
	Fri, 30 Aug 2024 21:39:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C3C8B1BF295
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 21:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B134B846B9
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 21:39:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rd2G1uX_tGtA for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 21:38:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 895E181763
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 895E181763
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 895E181763
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 21:38:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7300B13F89A;
 Fri, 30 Aug 2024 23:38:52 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 30 Aug 2024 23:38:52 +0200
Date: Fri, 30 Aug 2024 23:38:52 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <ZtI77POZD4CRpV5C@landeda>
References: <20240713192207.873065-1-fiona.klute@gmx.de>
 <20240713192207.873065-2-fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240713192207.873065-2-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725053937;
 bh=uMFVZfDzLvrbBS5/A85+pRGoF1cWvAM0kJbCRtS66jY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o45VBd1I5YhzROroPkmU0bsHgRPtA7eUYepwHQMPg3yna+E0+/P4Eh532R8kLSdee
 LMQ8ll5bXFoqX1NHPLQsBWiw4H/8dLkZsRU6VO42Ov58evBSwPX7iAZXrlpFPQdynG
 Llddhhzdjfl3EgjL0EWYfDxJPQqypFlHN8/uEEWragokGH9qgj6GRaHbdJctgyVg6V
 jtitbWiGJNOm0O8mp9Q8rvVPOXTdvXXPUOtV2tqAmA7SJTvlZLapkdEra/HjFnd+s0
 ceg+5EyPfv7zIhgw/nhzzaeSjSEHA6/E0QDUEFR9YNRJH4+/svkfQOJn1pgXX1kecT
 AKtn0DWhTvWsg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=o45VBd1I
Subject: Re: [Buildroot] [PATCH v3 2/2] support/scripts/br2-external: allow
 spaces in dirname
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Brandon Maier <brandon.maier@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fiona, All,

On 2024-07-13 21:22 +0200, Fiona Klute via buildroot spake thusly:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> "make list-defconfigs" and "make nconfig" work in the container used
> by utils/docker-run with external trees with spaces in the directory
> name. Other build steps may or may not work.

As you state yourself, "Other build steps may or may not work". And
indeed, that's probably not going to work, as BR2_EXTERNAL is expected
to be a space-separated list, that will be split on spaces from Makefile
context. So, no amount of quoting will make br2-external trees with
spaces actually work (AFAICS).

Regards,
Yann E. MORIN.

> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
> This is mostly a proof-of-concept to show the previous patch works,
> there might still be things that break in other parts of the build. I
> have not checked if "printf '%q'" works in Bash 3.1 (like a comment
> claims the script needs to support, not sure if still current).
> 
> Changes v1 -> v2:
> * Added this patch
> 
>  support/scripts/br2-external | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/support/scripts/br2-external b/support/scripts/br2-external
> index 8aea479d20..b8b6179aa8 100755
> --- a/support/scripts/br2-external
> +++ b/support/scripts/br2-external
> @@ -34,7 +34,8 @@ main() {
>      trap "error 'unexpected error while generating ${ofile}\n'" ERR
> 
>      mkdir -p "${outputdir}"
> -    do_validate "${outputdir}" ${@//:/ }
> +    IFS=":" read -r -a br2_extdirs <<< "${@}"
> +    do_validate "${outputdir}" "${br2_extdirs[@]}"
>      do_mk "${outputdir}"
>      do_kconfig "${outputdir}"
>  }
> @@ -144,9 +145,9 @@ do_mk() {
>              eval br2_ver="\"\${BR2_EXT_VERS_${br2_name}}\""
>              printf '\n'
>              printf 'BR2_EXTERNAL_NAMES += %s\n' "${br2_name}"
> -            printf 'BR2_EXTERNAL_DIRS += %s\n' "${br2_ext}"
> -            printf 'BR2_EXTERNAL_MKS += %s/external.mk\n' "${br2_ext}"
> -            printf 'export BR2_EXTERNAL_%s_PATH = %s\n' "${br2_name}" "${br2_ext}"
> +            printf 'BR2_EXTERNAL_DIRS += %q\n' "${br2_ext}"
> +            printf 'BR2_EXTERNAL_MKS += %q/external.mk\n' "${br2_ext}"
> +            printf 'export BR2_EXTERNAL_%s_PATH = %q\n' "${br2_name}" "${br2_ext}"
>              printf 'export BR2_EXTERNAL_%s_DESC = %s\n' "${br2_name}" "${br2_desc}"
>              printf 'export BR2_EXTERNAL_%s_VERSION = %s\n' "${br2_name}" "${br2_ver}"
>          done
> --
> 2.45.2
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
