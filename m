Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DFBC05027
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 15:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 186754027D;
	Sun, 29 Jan 2023 15:31:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 186754027D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AwqgKYF5Ht2C; Sun, 29 Jan 2023 15:31:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69EB240986;
	Sun, 29 Jan 2023 15:31:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69EB240986
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 96E9E1BF3DB
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 15:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6948F8132F
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 15:31:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6948F8132F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c9HIs1ynRW5T for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 15:31:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92D52812D7
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 92D52812D7
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 15:31:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3C3F15FF9D;
 Sun, 29 Jan 2023 16:31:46 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Jan 2023 16:31:45 +0100
Date: Sun, 29 Jan 2023 16:31:45 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: carrier.nicolas0@gmail.com
Message-ID: <20230129153145.GE2632@scaer>
References: <20230117110440.3405234-1-carrier.nicolas0@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230117110440.3405234-1-carrier.nicolas0@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675006309;
 bh=GpfT3VI7BU4ncnsF/AAlGN6Epyo/Y+rJtCxJ5E24/DM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eJo5yexO8963bJg778kSt5GDjJGtUjplqGKaOlEVB4RPxvWRUMBv9IOeWJm66toK8
 qAMYTkxJKoDjxgALmU8RtoQPrBAOktsRhDnGoK4oI7837E8EeeI/fR7HGx3SXqLSRJ
 t7Qb4ADYi6RyTgTNXU2BnHKy7hh8yA3/2ygI/J8GSfGqIa9sqbnCm9h4z241RJ5wQ0
 bdr4Ujq8n76dEIXnLhdUIZJw5gBhBvzSYNsoLtTlcJzXsPYb+RkMLrqNo1b8GmH/g5
 ZrdMMo6tmwqxPQxS3GudjUUGyKMtN95JEOMqC0Vg+w98esx2P6wysZDVoTJdGSatAY
 fwFNZ/Q+bBpbw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eJo5yexO
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: local and
 override support in legal-info
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Nicolas, All,

Sorry for replying much later than I promised I would do...

On 2023-01-17 12:04 +0100, carrier.nicolas0@gmail.com spake thusly:
> From: Nicolas Carrier <carrier.nicolas0@gmail.com>
> 
> Sources of packages which are using the 'local' _METHOD_SITE or
> which declare an _OVERRIDE_SRC_DIR are not archived when generating
> the legal-info target.

That packages with an override-srcdir are not saved, is indeed
on-purpose. An override-srcdir is meant as a way to develop on a
package, rather than use its official download location.

During development, such packages are most often stored in a local
directory that is not tracked by the VCS (git, svn, etc...) and so
are not reproducible, and thus such a build can't be meaningful as
a production build, and thus we should not be able to produce a
legal-info content in such a case, quite the opposite in fact: we do
want to actually log that override packages are being used and that
they were not saved.

Some people do use that as a safeguard when generating the legal-info
and passing it for publication, to ensure that there are actually no
use of an override-srcdir package and that all the build is actually
reproducible without local hacks. Changing the behaviour as you suggest
would break for those users.

Now, I do understand that you are (ab)using override-srcdir to use
locally modified versions of packages that Buildroot would otherwise
fetch from their remote locations.

In that case, I would advise that you carry the necessary changes on
your Buildroot tree, that change such packages from whatever site and
site method Buildroot uses, to a path as the site, and "local" as the
site method. Yes, this means you need to patch Buildroot, and probably
carry that forever, but that is a very minor change [0].

As for getting in compliance for such local sources, my first comment
would be to point to the statement that the Buildroot developers made
a while back, and that was committed to the manual:

    https://buildroot.org/downloads/manual/manual.html#legal-info-buildroot

    Nevertheless, the general view of the Buildroot developers is that
    you should release the Buildroot source code along with the source
    code of other packages when releasing a product that contains
    GPL-licensed software. This is because the GNU GPL defines the
    "complete source code" for an executable work as "all the source
    code for all modules it contains, plus any associated interface
    definition files, plus the scripts used to control compilation
    and installation of the executable". Buildroot is part of the
    _scripts used to control compilation and installation of the
    executable_, and as such it is considered part of the material
    that must be redistributed.

Indeed, Buildroot contains the recipes that are used to configure,
build, and then install the packages, and in some cases, even hack
into the packages sources (with sed, awk...), and so Buildroot falls
under the _scripts used to control compilation and installation of
the executable_, and providing just the tarball and the patches would
not be enough for those packages.

Also, just providing the Buildroot source tree would not be enough
either, as you'd need to also provide the .config (or defconfig) that
was used to define the build, as that contains options that will
ultimately have an impact on the artifacts (like the -mcpu setting, or
the -O level...), and thus should also be considered as part of the
aforementioned scripts.

With that in mind, if you have packages that are "local" (either by
their _SITE_METHOD or by being _OVERRIDE_SRCDIR), then you hopefully
have them as part of the same VCS tree (or sub-tree, submodule...)
as your Buildroot tree, in which case you should just need to provide
the checkout of that tree that was used to do the build, and be in
compliance for those packages.

If you need to be able to separate FLOSS packages from proprietary ones,
then Buildroot already helps you in that respect, by allowing you to use
more than one br2-external trees at once, for example one with your
FLOSS packages, and one with your proprietary sources; just exclude from
the BR2_EXTERNAL variable, the br2-external tree(s) with your proprietary
stuff, when you prepare your legal-info, and exclude them from the
tarball you generate. If you have no proprietary source, then the point
is moot; you can redistribute everything (but can still use more than
one br2-external for other reasons, of course!).

Bottom line: 1. I am opposed to making it possible to generate local
archives from override-srcdir, and 2. I am not in favour of making it
possible for local packages either.

> This is problematic since those packages are the most likely to
> require being published, because it's highly probable that their
> sources have been modified.

This is totally irrelevant: whether the sources are changed or not does
not drive whether a package sources should be published. Believing so
would be a gross misconception on how licenses such as the GPL work.
Indeed, the GPL requires that the C&CS be published for any covered
work; it does not condition that publication to it having been locally
modified, or not, from wherever you got it from.

[0] The alternative is of course that you push your changes to the
corresponding upstreams, and carry those patches in a global-patch-dir;
for those that are not upstreamable, you'd have to carry them for ever
as well. And I see how it could be cumbersom for the kernel, which is
the reason why we already have a wide range of solution for how to get
the kernel source trees (arbitrary tarball URL, git, mercurial, or svn
trees...).

Regards,
Yann E. MORIN.

> This patch generates a tar.gz archive on the fly, containing the
> result of the rsync of the package's source directory, using the
> same arguments as during the preparation of a build.
> Note that is not possible to archive the builddir, since it may
> contain artifacts of previous compilations.
> 
> It is not possible to consider rsync as a "normal" download method
> either (which would have solved the initial problem), because if we
> do that:
>  * the DL dir's content would be altered improperly
>  * the rsync + tar gz overhead would be paid on compilation and is
>    significant, for example, for a linux kernel
>  * a hash file would be necessary, which would be a burden to
>    maintain, for sources frequently modified
> 
> Signed-off-by: Nicolas Carrier <carrier.nicolas0@gmail.com>
> ---
>  package/pkg-generic.mk | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 2f8ba39edf..a8760f40d4 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -660,6 +660,12 @@ $$(error $(1) has local site method, but `$(2)_SITE` is not defined)
>  endif
>  endif
>  
> +# for legal-info sources archival
> +ifneq ($$($(2)_OVERRIDE_SRCDIR),)
> +$(2)_OVERRIDE_RSYNC_DIR = $$($(2)_BUILDDIR)/$$($(2)_BASENAME_RAW)
> +$(2)_OVERRIDE_RSYNC_ARCHIVE = $$($(2)_OVERRIDE_RSYNC_DIR).tar.gz
> +endif
> +
>  ifndef $(2)_LICENSE
>   ifdef $(3)_LICENSE
>    $(2)_LICENSE = $$($(3)_LICENSE)
> @@ -1146,13 +1152,16 @@ else
>  endif # license files
>  
>  ifeq ($$($(2)_REDISTRIBUTE),YES)
> -ifeq ($$($(2)_SITE_METHOD),local)
> -# Packages without a tarball: don't save and warn
> -	@$$(call legal-warning-nosource,$$($(2)_RAWNAME),local)
> -
> -else ifneq ($$($(2)_OVERRIDE_SRCDIR),)
> -	@$$(call legal-warning-nosource,$$($(2)_RAWNAME),override)
> -
> +ifneq ($$($(2)_OVERRIDE_SRCDIR),)
> +# Packages without a tarball: create one on the fly
> +	@echo "Package is of type local or override, archive sources"
> +	$$(Q)rm -rf $$($(2)_OVERRIDE_RSYNC_DIR) $$($(2)_OVERRIDE_RSYNC_ARCHIVE)
> +	$$(Q)rsync -au --chmod=u=rwX,go=rX $$(RSYNC_VCS_EXCLUSIONS) $(call qstrip,$$($(2)_OVERRIDE_SRCDIR))/ $$($(2)_OVERRIDE_RSYNC_DIR)/
> +	$$(Q)tar -zcf $$($(2)_OVERRIDE_RSYNC_ARCHIVE) -C $$($(2)_OVERRIDE_RSYNC_DIR) $$$$(ls -A $$($(2)_OVERRIDE_RSYNC_DIR)/)
> +	$$(Q)rm -rf $$($(2)_OVERRIDE_RSYNC_DIR)
> +	$$(Q)support/scripts/hardlink-or-copy \
> +			$$($(2)_OVERRIDE_RSYNC_ARCHIVE) \
> +			$$($(2)_REDIST_SOURCES_DIR)$$(sep)
>  else
>  # Other packages
>  
> -- 
> 2.30.2
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
