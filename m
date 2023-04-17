Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50065C77B76
	for <buildroot@archiver.kernel.org>; Mon, 17 Apr 2023 19:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8C7D81212;
	Mon, 17 Apr 2023 19:58:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8C7D81212
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pdWng4IrosWA; Mon, 17 Apr 2023 19:58:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0293B8214B;
	Mon, 17 Apr 2023 19:58:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0293B8214B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 267941C420D
 for <buildroot@lists.busybox.net>; Mon, 17 Apr 2023 19:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06BE061112
 for <buildroot@lists.busybox.net>; Mon, 17 Apr 2023 19:58:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06BE061112
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d8SJ4bHUGScd for <buildroot@lists.busybox.net>;
 Mon, 17 Apr 2023 19:58:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C74DC60B32
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C74DC60B32
 for <buildroot@buildroot.org>; Mon, 17 Apr 2023 19:58:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 987F25FF96;
 Mon, 17 Apr 2023 21:58:16 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 17 Apr 2023 21:58:16 +0200
Date: Mon, 17 Apr 2023 21:58:16 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <20230417195816.GN2819@scaer>
References: <20220927221133.594071-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220927221133.594071-1-f.fainelli@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681761498;
 bh=qIC32y6pmqb1ad4KYVzhrWmAdozksq4OYFrvMkn2Y8M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nCe5jUIvYWQqByPh4xXzzrDk77hqTSvDk/UxHbwJAKLShetd1+0Ag43s3jzrGnJEO
 MfT2+15gLmp3Q50LGa3SvHIgznOUFC30oQWQWlQvDS4ad2+hatnGaYNUsSaFkMza8n
 soUiQ154qPl6mfgMbwcOxGmn7FBVddlNI58z7zvs/w3YKzC9fegLsfDNSdItZE5A4M
 F5T0kOjJKBDUT6mffjVAfJceUOyBmIZ7kUgYsC/up3BuV4DAao180p/dlecqQ3cXaZ
 HrkDpLeiCDzsYMvzzW3JUDnVeoEAt44P57IM4gMEpVkuRYKWzM3oE60U7UvsA6dFZm
 vppK1fq9xjh/g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nCe5jUIv
Subject: Re: [Buildroot] [PATCH] package/linux-tools: Exclude checking PE
 binaries from perf test
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

Florian, All,

On 2022-09-27 15:11 -0700, Florian Fainelli spake thusly:
> Since upstream Linux commit ed21d6d7c48e6e96c2d617e304a7ebfbd17b1807
> ("perf tests: Add test for PE binary format support") present in >=
> v5.10 there is an unconditional installation of PE binaries which will
> be rejected by the check-bin-arch script.
> 
> Make sure that these binaries are excluded from being checked to allow
> the installation of the perf tests.
> 
> Fixes: 6fcdaa4c5096 ("package/linux-tools: Allow installation of perf scripts")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

I've finally applied to master, thanks.

However, I wonder if we could not be a bit more robust in check-bin-arch
itself, something like:

    diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
    index 27cc59bca0..2920a95ae3 100755
    --- a/support/scripts/check-bin-arch
    +++ b/support/scripts/check-bin-arch
    @@ -58,6 +58,9 @@ exitcode=0
     IFS="
     "
     
    +# ELF magic
    +ELF_MAGIC="$(printf "\x7f\x45\x4c\x46")"
    +
     while read f; do
     	for ignore in "${IGNORES[@]}"; do
     		if [[ "${f}" =~ ^"${ignore}" ]]; then
    @@ -71,13 +74,19 @@ while read f; do
     		continue
     	fi
     
    +	# Check if it looks like it is an ELF file
    +	read -N 4 magic <"${TARGET_DIR}/${f}"
    +	if [ "${magic}" != "${ELF_MAGIC}" ]; then
    +		continue
    +	fi
    +
     	# Get architecture using readelf. We pipe through 'head -1' so
     	# that when the file is a static library (.a), we only take
     	# into account the architecture of the first object file.
     	arch=$(LC_ALL=C ${readelf} -h "${TARGET_DIR}/${f}" 2>&1 | \
     		       sed -r -e '/^  Machine: +(.+)/!d; s//\1/;' | head -1)
     
    -# If no architecture found, assume it was not an ELF file
    +# If no architecture found, assume it was in fact not an ELF file
     	if test "${arch}" = "" ; then
     		continue
     	fi

(with the read -N 4 trick as discussed in [0])

Thoughts?

[0] https://lore.kernel.org/buildroot/10267_1663749711_632ACE4F_10267_83_8_20220921084149.GB2398274@tl-lnx-nyma7486/

Regards,
Yann E. MORIN.

> ---
>  package/linux-tools/linux-tool-perf.mk.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
> index dda63cccecb4..c22097316264 100644
> --- a/package/linux-tools/linux-tool-perf.mk.in
> +++ b/package/linux-tools/linux-tool-perf.mk.in
> @@ -169,6 +169,10 @@ define PERF_INSTALL_REMOVE_SCRIPTS
>  	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/scripts/
>  	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/tests/
>  endef
> +
> +LINUX_TOOLS_BIN_ARCH_EXCLUDE += \
> +	/usr/libexec/perf-core/tests/pe-file.exe \
> +	/usr/libexec/perf-core/tests/pe-file.exe.debug
>  endif
>  
>  define PERF_INSTALL_TARGET_CMDS
> -- 
> 2.25.1
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
