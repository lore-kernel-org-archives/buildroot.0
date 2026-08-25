Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0E0C61DB6
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 07:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E780D80C9D;
	Tue, 25 Aug 2026 07:32:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tzE7-FeFyvLg; Tue, 25 Aug 2026 07:32:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787643142;
	bh=COibQ/0+zbC/tb19No0W7LaMKm9NjLqlOcb4n9RU3dg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KluZZXx4GVnnkZFAjyn3HlnncXN2LwwoJIztayAVOKB68mpFPrRcT/FGds//d4l9Q
	 xJIZ+9Lu1CAsb18sTo9TooN9pfKDgt6RWauTej3xddz0zrPhulpNBvZBzH+ZzEA61g
	 FClkWUuncouc4JMcLAwoTxtXFrHJ9tl/u7JKhrwj8psearOEGAaI8Lstj64rToIE3w
	 5RO0L8By6YFP+c/ru5RVQx23yXgAgYtpZG0Cej4EUC9ZYBfCzn0ysa4yTAffOkjpZa
	 dM41zJB98ibfg5u5lZ+D2sk0DTmH2iAlJuiUgvjnQF1uAVj9eSXdXIgdb8GDQigHgQ
	 PcoHfTWQ85oEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D2DD80CA4;
	Tue, 25 Aug 2026 07:32:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 90701279
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 07:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7987F405AC
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 07:32:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 36iBKl9onPmL for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 07:32:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 533E340560
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 07:32:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 8C41219F5A5;
 Tue, 25 Aug 2026 09:32:11 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 25 Aug 2026 09:31:58 +0200
Date: Tue, 25 Aug 2026 09:31:58 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 David Laight <David.Laight@aculab.com>
Message-ID: <ao1E7m-2c4BbHUt9@landeda>
References: <20260824213435.3324692-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260824213435.3324692-1-thomas.petazzoni@bootlin.com>
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2026-08-24 23:34 +0200, Thomas Petazzoni spake thusly:
[--SNIP--]
> What it does is that at the end of the build, it verifies that all
> binaries and libraries in $(HOST_DIR) only have shared library
> dependencies on libraries that are in Buildroot $(HOST_DIR), to the
> exception of the C library, for which we of course use the system C
> library.
[--SNIP--]

I was wondering why you would not extend check-host-rpath, see my
tentative, totally untested patch at the end...

Also, check-host-rpath is run after each package install, so it will
catch executables installed without their dependent libraries, should
they later be installed.

Otherwise, some comments below...

> diff --git a/support/scripts/check-host-libs b/support/scripts/check-host-libs
> new file mode 100755
> index 0000000000..79f60024c4
> --- /dev/null
> +++ b/support/scripts/check-host-libs
> @@ -0,0 +1,37 @@
> +#!/bin/bash
> +
> +HOST_DIR=$1

Double-quote variable expansion (shellcheck should have reported that
one, I think).

[--SNIP--]
> +bailout="no"

There is a construct that I tend to use nowadas, which is to use
true/false, rather than 0/1 or yes/no, because that can be reused
without a test;

    success=true
    for loop; do
        if [ conditiion ]; then
            success=false
        fi
    done
    ${success}

[--SNIP--]
> +        case ${lib} in

Ditto, double-quote around variable expansion.

And here's a tentative, totally untested patch to introduce that in
check-host-rpath (indented so that patchwork does not see it):

    diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
    index 41aa0aa1ed..e1fdf16829 100755
    --- a/support/scripts/check-host-rpath
    +++ b/support/scripts/check-host-rpath
    @@ -21,6 +21,14 @@ main() {
         while read file; do
             is_elf "${file}" || continue
             elf_needs_rpath "${file}" "${hostdir}" || continue
    +        missing_libs="$(get_missing_libs "${file}" "${hostdir}")"
    +        if [ "${missing_libs}" ]; then
    +            ret=1
    +            printf "***\n"
    +            printf "*** ERROR: package %s uses libs not in HOST_DIR:\n" "${pkg}"
    +            # shellcheck disable=SC2086 # we need the word splitting
    +            printf '  - %s\n' ${missing_libs}
    +        fi
             check_elf_has_rpath "${file}" "${hostdir}" "${perpackagedir}" && continue
             if [ ${ret} -eq 0 ]; then
                 ret=1
    @@ -57,16 +65,44 @@ is_elf() {
     elf_needs_rpath() {
         local file="${1}"
         local hostdir="${2}"
    +
    +    [ -n "$(get_libs "${file}" "${hostdir}")" ]
    +}
    +
    +# This function returns all non-toolchain libs tha tare not in HOST_DIR
    +get_missing_libs() {
    +    local file="${1}"
    +    local hostdir="${2}"
    +    local lib
    +
    +    get_libs "${file}" "${hostdir}" \
    +    | while read lib; do
    +        if [ -not -e "${hostdir}/lib/${lib}" ]; then
    +            printf '%s\n' "${lib}"
    +        fi
    +    done
    +}
    +
    +# This function returns the list of non-toolchain libraries that an ELF
    +# file has as DT_NEEDED
    +get_libs() {
    +    local file="${1}"
    +    local hostdir="${2}"
         local lib

         while read lib; do
    -        [ -e "${hostdir}/lib/${lib}" ] && return 0
    +        case "${lib}" in
    +            libc.so*|libm.so*|libstdc++.so*|libpthread.so*|libgcc_s.so*|libdl.so*|ld-*|libgomp.so*|libcrypt.so*|libcrypto.so*|libatomic.so*|librt.so*|libutil.so*|libresolv.so*)
    +                continue
    +                ;;
    +            *)
    +                printf '%s\n' "${lib}"
    +                ;;
    +        esac
         done < <( readelf -d "${file}" 2>/dev/null                             \
                   |sed -r -e '/^.* \(NEEDED\) .*Shared library: \[(.+)\]$/!d;' \
                          -e 's//\1/;'                                          \
                 )
    -
    -    return 1
     }

     # This function checks whether at least one of the RPATH of the given

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
