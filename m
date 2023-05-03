Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5902C77B78
	for <buildroot@archiver.kernel.org>; Wed,  3 May 2023 20:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16A0460B70;
	Wed,  3 May 2023 20:20:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16A0460B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ec47NwldJnz9; Wed,  3 May 2023 20:20:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10D8260B8F;
	Wed,  3 May 2023 20:20:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10D8260B8F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F9BF1BF3E0
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 20:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7608C60B8F
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 20:20:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7608C60B8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vlvSe88NiuTN for <buildroot@lists.busybox.net>;
 Wed,  3 May 2023 20:20:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7925960B70
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7925960B70
 for <buildroot@buildroot.org>; Wed,  3 May 2023 20:20:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7044:c88:9a1c:351c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D72C66013E;
 Wed,  3 May 2023 22:19:59 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 03 May 2023 22:19:59 +0200
Date: Wed, 3 May 2023 22:19:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Knight <james.d.knight@live.com>
Message-ID: <20230503201959.GI2696@scaer>
References: <SN4P221MB0682FFDFA1E4FB65D998ABE5A0699@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN4P221MB0682FFDFA1E4FB65D998ABE5A0699@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683145202;
 bh=bv3BzgqFLlb98MXMq0AmAnMwRqU9zkKl4IC2b44Osiw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PmTK+abS24QiUnSId3pYVz1aa+l22AK/SmvrxLCjGbwfn17fG3P4XsnTmQOU3iQ37
 +YZCj2dGjqwk1a5uCje9t4zF3N3z+uXwIuoN4PolXqDDhf44FXv3Kw8x+z6jkgZWbS
 fZJTlhcHGdFjEu700dPb8UvG9QQ78wOsxRyKi7amNJ+/O889t6cXXzES5DfPr8nra/
 tPqiWp6rsN96ACEBdg304Q0JvnBGoHdi+XJbyj2MDH8g2nSic8MhhyaOpKopxFFA+D
 cVcpqJphXjBf42vpv4enC8B/0eA39/o4YyQGyRPGrayyqteRhbD5E5inXVYraRnphX
 Py0CTxDvH0FvA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PmTK+abS
Subject: Re: [Buildroot] [RFC PATCH] system: introduce rootfs prune support
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

James, All,

On 2023-04-30 15:53 -0400, James Knight spake thusly:
> The following introduces the option `BR2_ROOTFS_PRUNE`, to allow users
> to provide lists of directories and files that should be pruned from the
> file system after a build. This is to provide a simpler means of
> defining and cleaning up paths, instead of manually creating removal
> logic inside a post-build script.
> 
> Users will now be able to define a file of entries to remove and
> register this file as part of a board's configuration. More than one
> file can be provided. Each line in a file will represent a file or
> directory that should be removed. Wildcard values are supported for file
> entries when attempting to remove a group of entries from a folder.
> Comments are also supported in these files, allowing users to document
> reasons for desiring board-specific removals. Sanity checks exists to
> help prevent users from accidentally removing files outside of the
> target directory.
> 
> Signed-off-by: James Knight <james.d.knight@live.com>
> ---
> The goal of this patch is to provide an easy way for users to define
> files to prune from the target file system after a build. Typically,
> projects wanting to prune would have some sort of logic inside a
> post-build script. Managing support to clear out select directories/
> files is not always trivial, especially when wanting to do some wildcard
> patterns on files to remove. Buildroot provides nice device table and
> user table definition files, and having a file with entries of paths to
> remove seems like a nice way to manage such an action. Projects
> performing this type of pruning could have some library logic to support
> a "prune" function to do this, but it would be nice if Buildroot
> provides this support out-of-box (opinion).

I am not convinced.

Writing a post-build script is really easy, and removing files and
directories is also very trivial: just let the shell do the globbing.

Also, we do not want to partially duplicate existing features, so as it
is already possible to easily prune with a post-build script, we don't
want to add yet another way to tweak the rootfs.

Note that we have perm tables, overlays, and post-* scripts, because
that's the order they went in: perm tables could only tweak permissions
of existing files (or create empty ones), so we introduced support for
overlays. That in turn could only add new files, and not do arbitrary
manipulations, so we added post-build scripts. This was also limited, as
it could not do any arbitrary manipulation of the generated images (like
signing, etc) so we introduced post-image scripts. Again, this was also
limited because that could not do arbitrary permission manipulation (or
do any arbitrary root-only manipulation), so we introduced post-fakeroot
scripts.

Now, with the existing set of features, we can do any arbitrary
manipulations of arbitrarily anything; we do not need to add any
restricted feature that is already covered by any existing one.

Besides, I find the new script overly complicated for just removing
files, and is also restrictive (for example, it does not handle
removing foo/bar*/buz*/meh* while a shell would trivially glob that, and
passing the resut to rm -rf would work).

So, no, not convinced...

Regards,
Yann E. MORIN.

> These changes would also need to include some manual updates. Held off
> this work if this feature is not something desired.
> ---
>  Makefile              |   6 +++
>  support/scripts/prune | 122 ++++++++++++++++++++++++++++++++++++++++++
>  system/Config.in      |  10 ++++
>  3 files changed, 138 insertions(+)
>  create mode 100755 support/scripts/prune
> 
> diff --git a/Makefile b/Makefile
> index 95959daab2296a5e1c19a36b0a9d356175aeba81..44d9a44b1ad6a423999341ccd4a576ae87adc671 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -794,6 +794,12 @@ endif # merged /usr
>  	$(Q)$(if $(STAGING_DIR_FILES_LISTS), \
>  		cat $(STAGING_DIR_FILES_LISTS)) > $(BUILD_DIR)/packages-file-list-staging.txt
>  
> +	$(foreach s, $(call qstrip,$(BR2_ROOTFS_PRUNE)), \
> +		@$(call MESSAGE,"Pruning $(s)")$(sep) \
> +		$(Q)$(TOPDIR)/support/scripts/prune $(TARGET_DIR) $(s) \
> +		$(if $(wildcard $(BUILD_DIR)/.br2-pruned),--ignore-missing)$(sep))
> +	@touch $(BUILD_DIR)/.br2-pruned
> +
>  	$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
>  		@$(call MESSAGE,"Executing post-build script $(s)")$(sep) \
>  		$(Q)$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
> diff --git a/support/scripts/prune b/support/scripts/prune
> new file mode 100755
> index 0000000000000000000000000000000000000000..aaafdd378631199e465e3b768662e7ce4fcc463c
> --- /dev/null
> +++ b/support/scripts/prune
> @@ -0,0 +1,122 @@
> +#!/usr/bin/env bash
> +#
> +# This script accepts a target directory and multiple "prune files". Each
> +# prune file will be parsed for lines which indicate paths to be removed from
> +# the target directory. An example prune file list is as follows:
> +#
> +#  etc/libfoo.d/03-checks.sh
> +#  usr/bin/test-libfoo
> +#  usr/lib/libfootest.*
> +#  # always ensure opt is empty
> +#  opt/
> +#
> +# This script will not prune outside of the target directory.
> +
> +dry_run=false
> +files=()
> +ignore_missing=false
> +target=
> +vflag=false
> +while [[ $# -gt 0 ]]; do
> +    case $1 in
> +    --dry-run) dry_run=true ;;
> +    --ignore-missing) ignore_missing=true ;;
> +    --verbose) vflag=true ;;
> +    -*)
> +        echo "unknown argument: $1"
> +        exit 1
> +        ;;
> +    *)
> +        if [ -z "$target" ]; then
> +            target="$1"
> +        else
> +            files+=("$1")
> +        fi
> +        ;;
> +    esac
> +
> +    shift
> +done
> +
> +function msg() {
> +    echo "(prune) $1"
> +}
> +function verbose() {
> +    $vflag && echo "(prune-verbose) $1"
> +}
> +
> +target=$(realpath "$target" 2>/dev/null)
> +verbose "target: $target"
> +
> +if [ ! -d "$target" ] ; then
> +    echo "Error: invalid target $target"
> +    exit 1
> +elif [ ${#files[@]} -eq 0 ]; then
> +    echo "Error: no prune files provided"
> +    exit 1
> +fi
> +
> +# extract all prune entries from the provided files
> +for f in "${files[@]}"; do
> +    if [ ! -f "$f" ]; then
> +        msg "Error: missing prune file: $f"
> +        exit 1
> +    fi
> +
> +    verbose "processing file: $f"
> +    while IFS= read -r entry; do
> +        # trim and ignore empty lines and comments
> +        entry="${entry#"${entry%%[![:space:]]*}"}"
> +        entry="${entry%"${entry##*[![:space:]]}"}"
> +        [[ -z "$entry" || $entry == "#"* ]] && continue
> +
> +        verbose "processing entry: $entry"
> +        is_dir=
> +        [[ "$entry" == *"/" ]] && is_dir=1
> +        path=$(realpath -m "$target/$entry")
> +
> +        # fail if the entry matches the target or leaves the target
> +        if [[ $path == "$target" ]] || [[ "$path" != "$target"* ]]; then
> +            msg "Error: invalid entry: $entry"
> +            exit 1
> +        fi
> +
> +        paths=("$path")
> +
> +        # if this is not a directory with a wildcard hint, look for any
> +        # files on this path matching the wildcard
> +        if [[ $is_dir -eq 0 ]]; then
> +            basename=${path##*/}
> +            if [[ "$basename" == *"*"* ]]; then
> +                dirname=${path%/*}
> +                verbose "finding files in ($basename): $dirname"
> +                paths=()
> +                while read -r -d $'\0'; do
> +                    verbose "found: $REPLY"
> +                    paths+=("$REPLY")
> +                done < <(find "$dirname" -maxdepth 1 -name "$basename" \
> +                    -print0 2>/dev/null)
> +
> +                if [ ${#paths[@]} -eq 0 ] && ! $ignore_missing; then
> +                    msg "missing: $path"
> +                fi
> +            fi
> +        fi
> +
> +        # process paths to remove
> +        for p in "${paths[@]}"; do
> +            if [ -e "$p" ]; then
> +                if $dry_run; then
> +                    msg "removed (dryrun): $p"
> +                elif rm -rf "$p"; then
> +                    msg "removed: $p"
> +                else
> +                    msg "failed to remove: $p"
> +                    exit 1
> +                fi
> +            elif ! $ignore_missing; then
> +                msg "missing: $p"
> +            fi
> +        done
> +    done <"$f"
> +done
> diff --git a/system/Config.in b/system/Config.in
> index 1ca7690ea3ba7de72618d4597dfe19abdfc68cb8..14125a50e7b17080201c91207408997b7f9dde56 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -587,6 +587,16 @@ config BR2_ROOTFS_OVERLAY
>  	  They are copied as-is into the rootfs, excluding files ending
>  	  with ~ and .git, .svn and .hg directories.
>  
> +config BR2_ROOTFS_PRUNE
> +	string "Root filesystem prune entries"
> +	default ""
> +	help
> +	  Specify a list of files which contain prune entries of files
> +	  or directories that should be removed from the root
> +	  filesystem. This occurs after the build is finished and any
> +	  configured overlays are applied, but before the post build
> +	  script is triggered.
> +
>  config BR2_ROOTFS_PRE_BUILD_SCRIPT
>  	string "Custom scripts to run before commencing the build"
>  	default ""
> -- 
> 2.40.1.windows.1
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
