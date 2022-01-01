Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0585DC433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 21:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58B3240131;
	Sat,  1 Jan 2022 21:09:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7qygGihK_dYO; Sat,  1 Jan 2022 21:09:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4678940184;
	Sat,  1 Jan 2022 21:09:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A64FA1BF376
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 21:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9500060A9C
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 21:09:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I37EBOtcJAwE for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 21:09:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EAD6F60745
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 21:09:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4fc:e29e:bbe2:a373])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 1C8FB20039F;
 Sat,  1 Jan 2022 22:08:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641071342;
 bh=iD+qkfPwlC2TIZDUXpUb0pEszUK3Jfuux7wjknAQomE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PuLD0QJ9OBYWY6sbE7mJxrVTJA2ni2Se9McVWsZu4mWQMcS7DgEoZtdMV/LYuSooB
 yn99DJc4RFjGxmwY1Vui8eTPWvJXi0Yb6B39k58HkiOHxuMBI1PAZJH/EqBH3b42l1
 vavGvDIvKWjaOL6QkbspOVVqo4pGBlzUBBYZckAcW3Wb5SMTdMnA3NSQX9ydqqtzdi
 VvENA8Yhv+JH1zCIjQq5rQAzRn/WNPHFf5zUj7sUiDiNwLY9xKaw+W3RXou8sRK/u7
 Xkduu2fatDFhTo/h2tv8QeY2edIk3duNC44Ls3n3Yzj5e1xIqEvD/llC4pdavOPnwa
 GgB+kOtfUdNtg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jan 2022 22:08:57 +0100
Date: Sat, 1 Jan 2022 22:08:57 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Matthew Weber <matthew.weber@collins.com>
Message-ID: <20220101210857.GA69135@scaer>
References: <20211201230827.35080-1-matthew.weber@collins.com>
 <20211201230827.35080-2-matthew.weber@collins.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211201230827.35080-2-matthew.weber@collins.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 2/3] utils/test-pkg: add ability to fail
 when skipped
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

Matthew, All,

On 2021-12-01 17:08 -0600, Matthew Weber via buildroot spake thusly:
> Add flag to allow the return value to be incremented when a skip
> happens, treating the overall run as a failure.
> 
> This flag could be used when using test-pkg for local validation of
> downstream packages, for example in a user's br2-external. An example of
> this could be a user choosing to use test-pkg as part of a CI
> infrastructure where the fragment and toolchains are tightly controlled
> to test a package against multiple toolchains easily.
> 
> In this case, the user would want to lower the rate of false-positives
> of that fragment/toolchain configuration if a build is instead skipped
> (which may happen in the case of buildroot version bumps where
> dependencies could change).

I am a bit skeptical about this use-case.

As I understand it, wht is most interesting in a CI setup for internal
development, is that *all* internal packages do build togetrher and form
a working sysem *as a whole*.

As such, a CI setup would build the defconfig file(s) for a project (and
run the integration test-suite), rather than build each package
individually

Building each package individually with test-pkg would have the
disadvantage that it takes more time overall, as all the common deps are
build as many times as there are packages to test, and package are also
dependencies one of the others, so most packages would be built more
than once as well...

So, I am really not convinced...

Regards,
Yann E. MORIN.

> Signed-off-by: Matthew Weber <matthew.weber@collins.com>
> ---
>  utils/test-pkg | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/utils/test-pkg b/utils/test-pkg
> index d0472f176b..97957008fa 100755
> --- a/utils/test-pkg
> +++ b/utils/test-pkg
> @@ -18,8 +18,8 @@ main() {
>      local -a toolchains
>      local pkg_br_name
>  
> -    o='hakc:d:n:p:r:t:e:'
> -    O='help,all,keep,prepare-only,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:,externals:,'
> +    o='hakc:d:n:p:r:t:e:f'
> +    O='help,all,keep,prepare-only,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:,externals:,fail-on-skip'
>      opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
>      eval set -- "${opts}"
>  
> @@ -29,6 +29,7 @@ main() {
>      number=0
>      mode=0
>      prepare_only=0
> +    fail_on_skip=0
>      toolchains_csv="${TOOLCHAINS_CSV}"
>      while [ ${#} -gt 0 ]; do
>          case "${1}" in
> @@ -65,6 +66,9 @@ main() {
>          (-e|--externals)
>              BR2_EXTERNALS="${2}"; shift 2
>              ;;
> +        (-f|--fail-on-skip)
> +            fail_on_skip=1; shift 1
> +            ;;
>          (--)
>              shift; break
>              ;;
> @@ -147,7 +151,12 @@ main() {
>      printf "%d builds, %d skipped, %d build failed, %d legal-info failed\n" \
>          ${nb} ${nb_skip} ${nb_fail} ${nb_legal}
>  
> -    return $((nb_fail + nb_legal))
> +    nb_result=$((nb_fail + nb_legal))
> +    if [ ${fail_on_skip} ]; then
> +        nb_result=$((nb_result + nb_skip))
> +    fi
> +
> +    return $nb_result
>  }
>  
>  build_one() {
> @@ -279,6 +288,9 @@ Options:
>          Externals to be used as part of the build process. Packages from
>          within these externals may be tested.
>  
> +    -f, --fail-on-skip
> +        If any builds are skipped, return a negative exit value.
> +
>  Example:
>  
>      Testing libcec would require a config snippet that contains:
> -- 
> 2.17.1
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
