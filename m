Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07158C001B0
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 21:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8118681D5A;
	Mon,  7 Aug 2023 21:02:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8118681D5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6STSzkEiqLz2; Mon,  7 Aug 2023 21:02:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 818B481D68;
	Mon,  7 Aug 2023 21:02:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 818B481D68
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B9011BF287
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 21:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63F7B4048E
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 21:02:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63F7B4048E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sgsw8Bi725iT for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 21:02:39 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 319A440168
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 21:02:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 319A440168
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:d6ff:7cb6:900b:4575])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 36D39B0053A;
 Mon,  7 Aug 2023 23:02:34 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 07 Aug 2023 23:02:33 +0200
Date: Mon, 7 Aug 2023 23:02:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Victor Dumas <dumasv.dev@gmail.com>
Message-ID: <20230807210233.GZ421096@scaer>
References: <20230806213037.58D4B84612@busybox.osuosl.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230806213037.58D4B84612@busybox.osuosl.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691442156;
 bh=DIaXfllck1PhJ9IMUB6gD98YflQALoAUI6mZf/hZlfM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a4hduSb2Q1JGQYpqysZYtTpjiOngtUkmEvspiH0L6oMP3M6rkBNo5vqgHYEQ+4xp/
 Z9gaPIfUvY8xOWdRJ20fMSWrnOnS38kj5OZ8SjEaoqxOAyuA+WAG1UqcTNUeVxJW33
 CRDelELqzBtE+NI2oSjXOJ8n6g31q0KGCo/VKav2pUaEPuDmM4PV++cZJqYNFcUNaj
 xtpB4FgPm9/BWGQP1Gq4+m+T557YJat64rxDt9Taj8+6otCDJwTd5VIqmfJbXeQgap
 lBQK53pY/RCT4rkYeCJnlVoulZCLlycIjOpFUXL0lhi44vjcFpqouuzfbh8i+3HM9X
 eib0E+bHPSkOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=a4hduSb2
Subject: Re: [Buildroot] [git commit branch/next] support/scripts/fix-rpath:
 parallelize patching files
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

Victor, All,

On 2023-08-06 23:27 +0200, Thomas Petazzoni via buildroot spake thusly:
> commit: https://git.buildroot.net/buildroot/commit/?id=134900401f0831f893ddd4f358e499f548d66433
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next
> 
> Using "xargs" instead of "while read" loop allows for the patching of
> files to be parallelized. This significantly reduces the amount of
> time it takes to fix all the paths.  On a larger RFS(~300MB) this
> script was taking 5 minutes, it now only takes about 30s on a 12 core
> machine.

This commit is not working, and breaks fix-rpath. See below...

[--SNIP--]
> diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
> index 3e67e770e5..a9b348e189 100755
> --- a/support/scripts/fix-rpath
> +++ b/support/scripts/fix-rpath

there are tons of shellcheck errors in that script, which is what
prompted me to look into that and notice the breakage.

    $ ./utils/docker-run shellcheck support/scripts/fix-rpath
    In support/scripts/fix-rpath line 56:
    : ${PATCHELF:=${HOST_DIR}/bin/patchelf}
      ^-- SC2223: This default assignment may cause DoS due to globbing. Quote it.


    In support/scripts/fix-rpath line 84:
        changed_rpath=$(echo ${rpath} | sed "s@${PER_PACKAGE_DIR}/[^/]\+/host@${HOST_DIR}@")
                        ^-- SC2001: See if you can use ${variable//search/replace} instead.
                             ^------^ SC2086: Double quote to prevent globbing and word splitting.

    Did you mean:
        changed_rpath=$(echo "${rpath}" | sed "s@${PER_PACKAGE_DIR}/[^/]\+/host@${HOST_DIR}@")


    In support/scripts/fix-rpath line 86:
            ${PATCHELF} --set-rpath ${changed_rpath} "${file}"
                                    ^--------------^ SC2086: Double quote to prevent globbing and word splitting.

    Did you mean:
            ${PATCHELF} --set-rpath "${changed_rpath}" "${file}"


    In support/scripts/fix-rpath line 90:
        ${PATCHELF} --make-rpath-relative "${rootdir}" ${sanitize_extra_args[@]} "${file}"
                                                       ^-----------------------^ SC2068: Double quote array expansions to avoid re-splitting elements.


    In support/scripts/fix-rpath line 164:
        find "${rootdir}" ${find_args[@]} | xargs -0 -r -P ${PARALLEL_JOBS} -I {} bash -c "patch_file '${PATCHELF}' '${rootdir}' '${sanitize_extra_args}' $@" _ {}
                          ^-------------^ SC2068: Double quote array expansions to avoid re-splitting elements.
                                                           ^--------------^ SC2086: Double quote to prevent globbing and word splitting.
                                                                                                                                  ^--------------------^ SC2128: Expanding an array without an index only gives the first element.
                                                                                                                                                          ^-- SC2145: Argument mixes string and array. Use * or separate argument.

    Did you mean:
        find "${rootdir}" ${find_args[@]} | xargs -0 -r -P "${PARALLEL_JOBS}" -I {} bash -c "patch_file '${PATCHELF}' '${rootdir}' '${sanitize_extra_args}' $@" _ {}


    In support/scripts/fix-rpath line 173:
    main ${@}
         ^--^ SC2068: Double quote array expansions to avoid re-splitting elements.

    For more information:
      https://www.shellcheck.net/wiki/SC2068 -- Double quote array expansions to ...
      https://www.shellcheck.net/wiki/SC2145 -- Argument mixes string and array. ...
      https://www.shellcheck.net/wiki/SC2128 -- Expanding an array without an ind...

So a few of those reported issues are harmless, or at least were OK-ish
before the parallelisation.

> @@ -46,6 +46,8 @@ Environment:
>      TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR
>                   (default HOST_DIR/opt/ext-toolchain)
>  
> +    PARALLEL_JOBS number of parallel jobs to run
> +
>  Returns:         0 if success or 1 in case of error
>  
>  EOF
> @@ -58,6 +60,38 @@ HOST_EXCLUDEPATHS="/share/terminfo"
>  STAGING_EXCLUDEPATHS="/usr/include /usr/share/terminfo"
>  TARGET_EXCLUDEPATHS="/lib/firmware"
>  
> +patch_file() {

I've stuck a 'set -x' here to see how this function was called and what
it did, once it got called from a sub-bash, and I also tweaked the xargs
call with '-t -P1'  (verbose and mt parralel, just to have a clean
output). Here's what it says for the first entry:

    bash -c "patch_file '/home/ymorin/dev/buildroot/O/next/host/bin/patchelf' '/home/ymorin/dev/buildroot/O/next/target' '--no-standard-lib-dirs' target" _ /home/ymorin/dev/buildroot/O/next/target/lib/udev/cdrom_id
    + PATCHELF=/home/ymorin/dev/buildroot/O/next/host/bin/patchelf
    + rootdir=/home/ymorin/dev/buildroot/O/next/target
    + sanitize_extra_args=--no-standard-lib-dirs
    + file=target
    ++ /home/ymorin/dev/buildroot/O/next/host/bin/patchelf --print-rpath target
    + rpath='patchelf: getting info about '''target''': No such file or directory'
    + test 1 -ne 0
    + return 0

So what's going on here? Why does it look at 'target', and not at the
actual file 'cdrom_id' ?

That's because it is actually told to look at 'target'. See that the $@
has been replaced by 'target'. See below [0]...

> +    PATCHELF="${1}"
> +    rootdir="${2}"
> +    sanitize_extra_args="${3}"

In the caller, this is an array, but here it's a string. That's not
going to cut it, but it works by accident: we only ever put a single
item in the array, so we're lucky. But we can't rely on luck alone.

[--SNIP--]
> @@ -123,34 +157,11 @@ main() {
[--SNIP--]

(I've split the following line so that it is easier to read and comment on).

> +    find "${rootdir}" ${find_args[@]} \
> +    | xargs -0 -r -P ${PARALLEL_JOBS} -I {} \
> +            bash -c "patch_file '${PATCHELF}' '${rootdir}' '${sanitize_extra_args}' $@" _ {}
                                                                                       ^^
That $@ is double-quoted, so it is expanded in the context of the
caller, i.e. it expands to the postional parameters passed when calling
main(), the current function, i.e.... 'target', as we noticed in the
log, above...

I've fixed all this and will push that shortly.

Regards,
Yann E. MORIN.

>  
>      # Restore patched patchelf utility
>      test "${tree}" = "host" && mv "${PATCHELF}.__to_be_patched" "${PATCHELF}"
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
