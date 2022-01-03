Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C756BC433F5
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 20:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EAD560B3A;
	Mon,  3 Jan 2022 20:59:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tO_0JfLHLDlz; Mon,  3 Jan 2022 20:59:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2641607C1;
	Mon,  3 Jan 2022 20:59:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 57B371BF282
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 20:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46736607C1
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 20:59:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A4LXQRPVIhfW for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 20:59:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 338BB60615
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 20:59:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6d4f:8674:7dd0:6c06])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id DC6C413F87E;
 Mon,  3 Jan 2022 21:59:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641243576;
 bh=pJkH1lU7lcEQkiBQXpEpT690WZ/TFuIOIKpajqdHFb4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a34YCErbVImRMXazomYpXKqrWSgQPqlgdH0tYlAJmeuseUefsyEaIDADI1H2L1w/k
 MmmGR/napQ1uX1TOGooEjw0KdCCH2s3X+CfGlUI3CeAXz6It45Lb72LvO9dkkZLLzu
 Q11nAQrvYnAqgpCTBo8bXCJATsS/3Is1qrJYL4Qy3eO/l5MZz2NliQ7GhyoJHpSabh
 mtLR0l8X1C0EUesoGK0A5hB4QW154WhyVgquXFTHWpQizAZBwxOpWy0E0YrMSlQ3aW
 99XqdO6YpbLGpr96Bei4MCAD+CKQL7HG9+zcYfviBalth5NVE6qrFlaBbwGvtx6qlu
 ym/sDpCFTw/7A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 03 Jan 2022 21:59:31 +0100
Date: Mon, 3 Jan 2022 21:59:31 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Matthew Weber <matthew.weber@collins.com>
Message-ID: <20220103205931.GN69135@scaer>
References: <20211201230827.35080-1-matthew.weber@collins.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211201230827.35080-1-matthew.weber@collins.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/3] utils/test-pkg: add support for
 externals
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
> Add support to test-pkg to allow the usage br2-externals, so that
> it may be leveraged for packages outside of upstream buildroot as well.

Why is it even needed? Just pass BR2_EXTERNAL in the environment:

    BR2_EXTERNAL=/path/to/foo:/path/to/bar ./utils/test-pkg

Maybe we should change the manual to state that BR2_EXTERNAL can be set
in the environment as well, and the help for ./utils/test-pkg could also
mention that.

Oh, and by the way: we should not have added the -e option to
support/kconfig/merge_config.sh either, because even in that case,
BR2_EXTERNAL in the environment works as well.

Regards,
Yann E. MORIN.

> Signed-off-by: Matthew Weber <matthew.weber@collins.com>
> ---
>  utils/test-pkg | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/utils/test-pkg b/utils/test-pkg
> index 526b95b1fb..d0472f176b 100755
> --- a/utils/test-pkg
> +++ b/utils/test-pkg
> @@ -3,6 +3,7 @@ set -e
>  
>  TOOLCHAINS_CSV='support/config-fragments/autobuild/toolchain-configs.csv'
>  TEMP_CONF=""
> +BR2_EXTERNALS=""
>  
>  do_clean() {
>      if [ ! -z "${TEMP_CONF}" ]; then
> @@ -17,8 +18,8 @@ main() {
>      local -a toolchains
>      local pkg_br_name
>  
> -    o='hakc:d:n:p:r:t:'
> -    O='help,all,keep,prepare-only,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:'
> +    o='hakc:d:n:p:r:t:e:'
> +    O='help,all,keep,prepare-only,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:,externals:,'
>      opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
>      eval set -- "${opts}"
>  
> @@ -61,6 +62,9 @@ main() {
>          (-t|--toolchains-csv)
>              toolchains_csv="${2}"; shift 2
>              ;;
> +        (-e|--externals)
> +            BR2_EXTERNALS="${2}"; shift 2
> +            ;;
>          (--)
>              shift; break
>              ;;
> @@ -155,7 +159,7 @@ build_one() {
>  
>      mkdir -p "${dir}"
>  
> -    CONFIG_= support/kconfig/merge_config.sh -O "${dir}" \
> +    CONFIG_= support/kconfig/merge_config.sh -e "${BR2_EXTERNALS}" -O "${dir}" \
>          "${toolchainconfig}" "support/config-fragments/minimal.config" "${cfg}" \
>          >> "${dir}/logfile" 2>&1
>      # We want all the options from the snippet to be present as-is (set
> @@ -181,7 +185,7 @@ build_one() {
>      fi
>  
>      if [ -n "${pkg}" ]; then
> -        if ! make O="${dir}" "${pkg}-dirclean" >> "${dir}/logfile" 2>&1; then
> +        if ! make BR2_EXTERNAL="${BR2_EXTERNALS}" O="${dir}" "${pkg}-dirclean" >> "${dir}/logfile" 2>&1; then
>              return 2
>          fi
>      fi
> @@ -193,14 +197,14 @@ build_one() {
>  
>      # legal-info done systematically, because some packages have different
>      # sources depending on the configuration (e.g. lua-5.2 vs. lua-5.3)
> -    if ! make O="${dir}" legal-info >> "${dir}/logfile" 2>&1; then
> +    if ! make BR2_EXTERNAL="${BR2_EXTERNALS}" O="${dir}" legal-info >> "${dir}/logfile" 2>&1; then
>          return 3
>      fi
>  
>      # If we get here, the build was successful. Clean up the build/host
>      # directories to save disk space, unless 'keep' was set.
>      if [ ${keep} -ne 1 ]; then
> -        make O="${dir}" clean >> "${dir}/logfile" 2>&1
> +        make BR2_EXTERNAL="${BR2_EXTERNALS}" O="${dir}" clean >> "${dir}/logfile" 2>&1
>      fi
>  }
>  
> @@ -271,6 +275,10 @@ Options:
>          Only prepare the .config files, but do not build them. Output the
>          list of build directories to stdout, and the status on stderr.
>  
> +    -e, --externals
> +        Externals to be used as part of the build process. Packages from
> +        within these externals may be tested.
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
