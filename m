Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B53C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 10:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA35D80AB6;
	Fri,  7 Jan 2022 10:36:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MXCo21pMT-J0; Fri,  7 Jan 2022 10:36:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 030DF80AE0;
	Fri,  7 Jan 2022 10:36:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2CB841BF2EC
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 10:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B4EC6FC32
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 10:36:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MYpzgWU6AeI1 for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 10:36:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C9146FBDE
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 10:36:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5148:b9c:d8ec:b3b5])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 01DBE78037F;
 Fri,  7 Jan 2022 11:36:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641551780;
 bh=Lbf3YOH02cqie999OvY1A0iH570E2Ip1SzL0hok4Arw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EJ7TROEHAAtWeSBTqIl1S3t2kXfUrMtcDDbqRNoX1HwlgUdNJulKRA0zha0820nXH
 fp5RACFs/OzdoDITdC5mGP3tk7NVXH4cB6IoSkIouAtti5ghbvYbkSKshuiWA5iY4q
 9CC4Ly4M/loatAwbywvzEOCaS10Oi3jxrVk8Nn3qHMFca2QuhFdfNgWBp7rvawkwVH
 DbTgAZYi79i159P0G+kqO5ZleUdQBSOlQHZfgh1GPEA3ZGS4gom3sU2c6sQL4ovgtC
 ULtxPHXhHn2lPf0z0E4i6dIzQ/7wVH+oBDkRES9Rk02dlTltENjv3I0iU65mgMmHnN
 04J6xSQ4RePAQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 07 Jan 2022 11:36:13 +0100
Date: Fri, 7 Jan 2022 11:36:13 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220107103613.GC1268635@scaer>
References: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
 <20220106210000.397694-4-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220106210000.397694-4-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 03/11]
 support/download/post-process-helpers: add helper function for post process
 scripts
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
Cc: Matt Weber <Matthew.Weber@rockwellcollins.com>,
 Patrick Havelange <patrick.havelange@essensium.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-01-06 21:59 +0100, Thomas Petazzoni spake thusly:
> download post process scripts will often need to unpack the source
> code tarball, do some operation, and then repack it. In order to help
> with this, post-process-helpers provide an unpack() function and a
> repack() function.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/download/helpers | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/support/download/helpers b/support/download/helpers
> index 40d5eea591..4c5eb466cc 100755
> --- a/support/download/helpers
> +++ b/support/download/helpers
> @@ -72,5 +72,27 @@ mk_tar_gz() {
>      popd >/dev/null
>  }
>  
> +post_process_unpack() {
> +    local dest="${1}"
> +    local tarball="${2}"
> +    local one_file
> +
> +    mkdir "${dest}"
> +    tar -C "${dest}" --strip-components=1 -xf "${tarball}"
> +    one_file="$(find "${dest}" -type f -print0 |LC_ALL=C sort -z |head -z -n1 |tr -d "\0")"
> +    touch -r "${one_file}" "${dest}.timestamp"
> +}
> +
> +post_process_repack() {
> +    local in_dir="${1}"
> +    local base_dir="${2}"
> +    local out="${3}"
> +    local date
> +
> +    date="@$(stat -c '%Y' "${in_dir}/${base_dir}.timestamp")"
> +
> +    mk_tar_gz "${in_dir}/${base_dir}" "${base_dir}" "${date}" "${out}"
> +}
> +
>  # Keep this line and the following as last lines in this file.
>  # vim: ft=bash
> -- 
> 2.33.1
> 

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
