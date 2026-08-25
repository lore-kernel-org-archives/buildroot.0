Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97231C5DF94
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 08:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53F5A60608;
	Tue, 25 Aug 2026 08:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XOt3aikfrybr; Tue, 25 Aug 2026 08:19:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787645998;
	bh=1IrmmfbCO4JrzqG8CfTrOQP8+ibIJdOh3yXJJGLhEpI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oWgVTk543sV5KqYvn9OucjPdaWM+Tiewfb4j0bz8jGbCVnxzFpjDCbuqlC4+p3P3K
	 Oi7EwNTcyHA+g/liITNdO9WlF11ImZHbPN/po2edRXTl1JoCY+I/Y8MGjJ2Q3zsDSI
	 uQmsYRrS0hQMeDmHhe2iArSi2McGh5YoPGlTHxQ1JbMVh6JT2Akc/9ctbIvyGK975i
	 9S8mFEp0HfW7dV2TItn6JvIojUeYhzsK16eZH2EsOTSTO9kb8gkU8MK+D++VIISB/y
	 boUsMqWKa4Db6vFcjq19s6+XTWUBMauZQ6e0hEl8rsDAmrpar1LOBHKY4M7uXFFjbS
	 D05Vg//1jXh4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DAAE6060B;
	Tue, 25 Aug 2026 08:19:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 90DC535E
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8ED6E405FB
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RX0YzNyRnL0i for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 08:19:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81465405F6
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:19:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A22D34E412E1;
 Tue, 25 Aug 2026 08:19:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6C408604C4;
 Tue, 25 Aug 2026 08:19:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AC2CC11C7A0F0; 
 Tue, 25 Aug 2026 10:19:45 +0200 (CEST)
Date: Tue, 25 Aug 2026 10:19:44 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org, 
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 David Laight <David.Laight@aculab.com>
Message-ID: <ao1Pks3_H87lajHF@windsurf>
References: <20260824213435.3324692-1-thomas.petazzoni@bootlin.com>
 <ao1E7m-2c4BbHUt9@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ao1E7m-2c4BbHUt9@landeda>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] support/scripts/check-host-libs: add new
 check on host binaries/libs
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, Aug 25, 2026 at 09:31:58AM +0200, Yann E. MORIN wrote:

> I was wondering why you would not extend check-host-rpath, see my
> tentative, totally untested patch at the end...
> 
> Also, check-host-rpath is run after each package install, so it will
> catch executables installed without their dependent libraries, should
> they later be installed.

Ah, good idea. Then maybe check-host-rpath should be renamed into
check-host-bins or something like that, because it would no longer
check just RPATH, but other aspects of host-installed bins and libs?

> > +HOST_DIR=$1
> 
> Double-quote variable expansion (shellcheck should have reported that
> one, I think).

I just passed "./utils/docker-run shellcheck" on it, maybe there's
some additional shellcheck options to pass to have stricter checks.

> There is a construct that I tend to use nowadas, which is to use
> true/false, rather than 0/1 or yes/no, because that can be reused
> without a test;
> 
>     success=true
>     for loop; do
>         if [ conditiion ]; then
>             success=false
>         fi
>     done
>     ${success}

OK, nice.

> And here's a tentative, totally untested patch to introduce that in
> check-host-rpath (indented so that patchwork does not see it):
> 
>     diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
>     index 41aa0aa1ed..e1fdf16829 100755
>     --- a/support/scripts/check-host-rpath
>     +++ b/support/scripts/check-host-rpath
>     @@ -21,6 +21,14 @@ main() {
>          while read file; do
>              is_elf "${file}" || continue
>              elf_needs_rpath "${file}" "${hostdir}" || continue
>     +        missing_libs="$(get_missing_libs "${file}" "${hostdir}")"
>     +        if [ "${missing_libs}" ]; then
>     +            ret=1
>     +            printf "***\n"
>     +            printf "*** ERROR: package %s uses libs not in HOST_DIR:\n" "${pkg}"
>     +            # shellcheck disable=SC2086 # we need the word splitting
>     +            printf '  - %s\n' ${missing_libs}
>     +        fi
>              check_elf_has_rpath "${file}" "${hostdir}" "${perpackagedir}" && continue
>              if [ ${ret} -eq 0 ]; then
>                  ret=1
>     @@ -57,16 +65,44 @@ is_elf() {
>      elf_needs_rpath() {
>          local file="${1}"
>          local hostdir="${2}"
>     +
>     +    [ -n "$(get_libs "${file}" "${hostdir}")" ]
>     +}
>     +
>     +# This function returns all non-toolchain libs tha tare not in HOST_DIR
>     +get_missing_libs() {
>     +    local file="${1}"
>     +    local hostdir="${2}"
>     +    local lib
>     +
>     +    get_libs "${file}" "${hostdir}" \
>     +    | while read lib; do
>     +        if [ -not -e "${hostdir}/lib/${lib}" ]; then
>     +            printf '%s\n' "${lib}"
>     +        fi
>     +    done
>     +}
>     +
>     +# This function returns the list of non-toolchain libraries that an ELF
>     +# file has as DT_NEEDED
>     +get_libs() {
>     +    local file="${1}"
>     +    local hostdir="${2}"
>          local lib
> 
>          while read lib; do
>     -        [ -e "${hostdir}/lib/${lib}" ] && return 0
>     +        case "${lib}" in
>     +            libc.so*|libm.so*|libstdc++.so*|libpthread.so*|libgcc_s.so*|libdl.so*|ld-*|libgomp.so*|libcrypt.so*|libcrypto.so*|libatomic.so*|librt.so*|libutil.so*|libresolv.so*)
>     +                continue
>     +                ;;
>     +            *)
>     +                printf '%s\n' "${lib}"
>     +                ;;
>     +        esac
>          done < <( readelf -d "${file}" 2>/dev/null                             \
>                    |sed -r -e '/^.* \(NEEDED\) .*Shared library: \[(.+)\]$/!d;' \
>                           -e 's//\1/;'                                          \
>                  )
>     -
>     -    return 1
>      }

OK, I'll review this and try to get back with a v3... hopefully
earlier than in 4 years!

Thanks for the prompt review and feedback!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
