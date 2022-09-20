Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99E0C54EE9
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 07:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F2AB819D2;
	Tue, 20 Sep 2022 07:46:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F2AB819D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yfo_hxvawX8o; Tue, 20 Sep 2022 07:46:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC55E81971;
	Tue, 20 Sep 2022 07:46:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC55E81971
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 39D3D1BF338
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 07:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EA5B60DFE
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 07:46:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EA5B60DFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1NQU_XYBR1W3 for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 07:46:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85A8560DCA
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 85A8560DCA
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 07:46:28 +0000 (UTC)
Received: from opfednr07.francetelecom.fr (unknown [xx.xx.xx.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr26.francetelecom.fr (ESMTP service) with ESMTPS id 4MWtsG1R3Wz10hV; 
 Tue, 20 Sep 2022 09:46:26 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Tue, 20 Sep 2022 09:46:24 +0200
Date: Tue, 20 Sep 2022 09:46:24 +0200
From: <yann.morin@orange.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20330_1663659985_63296FD1_20330_21_1_20220920074624.GC3551@tl-lnx-nyma7486>
References: <20220920064550.520645-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220920064550.520645-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX104.corporate.adroot.infra.ftgroup (10.115.26.5)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1663659986;
 bh=GKf85cWH5HbqvKjIpbPvk/h5DfP4S38X/hIzAvgFMPQ=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=co6J57LfQoWA2UKGwOLb+hGT3Fml+C1idzk+TPixDh1P3B+OPvqsA58BCs/EWI+8D
 5bRhyg2MAESvuuRsS1Epebl0KVhLHt5FlY4gd9A70Cse4xNxavgthOEk0hvvo9gX7D
 bDKrKuYmCZaOoOSsUSU4kI4Og60zJghQQhFdPnwOVjyfu8zJYrwwqph8jcmNtyEPqw
 vZktZUJp+A9p6wZnm8CiECx0DxvfR16vXGiJ+sGmiXRiXNVy7EBiqdmYcm6Z8720hb
 4m2sGGgTt75n5CQPnWNpA/w/aYM0V8+T3mYQ6qZkWrPhsUThHWuJMpGLypDQkkWw8/
 qy2kXrN+PROrQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=co6J57Lf
Subject: Re: [Buildroot] [PATCH] support/scripts/check-host-libs: add new
 check on host binaries/libs
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

Thomas, All,

On 2022-09-20 08:45 +0200, Thomas Petazzoni spake thusly:
> One frequent issue in Buildroot is that when building host libraries
> or applications, the build system of the package detects some
> libraries provided by the system, and happily links to them, without
> Buildroot knowing. Sometimes this doesn't cause any problem, but
> sometimes this causes issues, and we're regularly eliminating such
> mis-detection by forcing those packages to not detect the system
> libraries that have not been built by Buildroot.
> 
> The new script check-host-libs added in this commit, which is executed
> during the host-finalize step at the end of the build is an attempt at
> detecting at least some of these situations.
> 
> What it does is that at the end of the build, it verifies that all
> binaries and libraries in $(HOST_DIR) only have shared library
> dependencies on libraries that are in Buildroot $(HOST_DIR), to the
> exception of the C library, for which we of course use the system C
> library.
> 
> For example, if the binary output/host/bin/plop is linked against
> libpng, but libpng was not built and installed by Buildroot, the build
> will now fail with:
> 
> ERROR: in /home/thomas/projets/buildroot/output/host/bin/plop, libpng16.so.16 unknown
> make: *** [Makefile:715: host-finalize] Error 1

I'm afraid this is going to be too big a hammer, at least if that's a
hard error.

Indeed, when the build environment is reproducible (like, it is a
container image), and there are no package in Buildroot, and the host
directory will not be distributed (i.e. one does not care about doing an
SDK), then it is usually good-enough to use the system-installed
libraries, rather than add a Buildroot package.

> The script includes an allowlist of libraries provided by the C
> library. It is potentially possible that this list might need to be
> extended to cover all systems/distributions/C libraries, but only
> wider testing of this script will help detect such cases.

There are at least missing entries already:
    librt.so.1
    libutil.so.1
    libresolv.so.2

Also, there are error messages for some go stuff:
    ==> HOST_DIR/lib/go/src/debug/elf/testdata/go-relocation-test-gcc930-ranges-no-rela-x86-64
    readelf: Error: no .dynamic section in the dynamic segment

    ==> HOST_DIR/lib/go/src/debug/elf/testdata/go-relocation-test-gcc930-ranges-with-rela-x86-64
    readelf: Error: no .dynamic section in the dynamic segment

Finally, this script takes more than a minute to run on our build, about
a 10% increase from ~12min. This is not nice at all.

    $ find host/*bin host/lib* -type f |wc -l
    16186

    $ find host/*bin host/lib* -type f |(keep just libs + execs) |wc -l
    339

That last command, though, is what takes time: there is a huge ton of go
junk installed in HOST_DIR, and this takes ages to filter-out.

So, although I understand the rationale, this should probably be opt-in.

Or it should only be ran when doing an SDK?

Regards,
Yann E. MORIN.

> It is worth mentioning that for now this script is executed only once
> at the end of the build. This means that if a package A gets built,
> detects and uses a system library libfoo and uses it, and then by
> chance later Buildroot package B builds and installs libfoo into
> HOST_DIR/lib, this script will believe that package A is correct, as
> it finds libfoo in HOST_DIR/lib, even though while package A was being
> built, the libfoo being detected was the system one. Detecting this
> would require running check-host-libs at the end of each package
> build, but that would imply re-checking over and over again all host
> binaries/libraries, which could have a noticeable impact on the build
> time. So for now, we simply check at the end of the build, which
> should already help to detect a lot of interesting bogus situations.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> It would be very useful if a few people could apply this patch to
> their local tree, run their usual build, and see how it behaves. This
> way, I can get some feedback to address the most obvious issues before
> it gets merged and starts causing build failures in the autobuilders.
> ---
>  Makefile                        |  1 +
>  support/scripts/check-host-libs | 36 +++++++++++++++++++++++++++++++++
>  2 files changed, 37 insertions(+)
>  create mode 100755 support/scripts/check-host-libs
> 
> diff --git a/Makefile b/Makefile
> index ec7c034ac1..7ba8ccd535 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -712,6 +712,7 @@ STAGING_DIR_FILES_LISTS = $(sort $(wildcard $(BUILD_DIR)/*/.files-list-staging.t
>  host-finalize: $(PACKAGES) $(HOST_DIR) $(HOST_DIR_SYMLINK)
>  	@$(call MESSAGE,"Finalizing host directory")
>  	$(call per-package-rsync,$(sort $(PACKAGES)),host,$(HOST_DIR))
> +	./support/scripts/check-host-libs $(HOST_DIR)
>  
>  .PHONY: staging-finalize
>  staging-finalize: $(STAGING_DIR_SYMLINK)
> diff --git a/support/scripts/check-host-libs b/support/scripts/check-host-libs
> new file mode 100755
> index 0000000000..ef307bb6dd
> --- /dev/null
> +++ b/support/scripts/check-host-libs
> @@ -0,0 +1,36 @@
> +#!/bin/bash
> +
> +HOST_DIR=$1
> +
> +if test -z "${HOST_DIR}" ; then
> +    echo "usage: check-host-libs HOST_DIR"
> +    exit 1
> +fi
> +
> +bailout="no"
> +
> +for f in $(find ${HOST_DIR}/*bin ${HOST_DIR}/lib* -type f); do
> +    mime=$(file -b --mime-type ${f})
> +    if test "${mime}" != "application/x-sharedlib" -a \
> +	    "${mime}" != "application/x-executable" ; then
> +        continue
> +    fi
> +    for lib in $(LC_ALL=C readelf -d ${f} | grep NEEDED | sed 's,.*Shared library: \[\(.*\)\].*,\1,'); do
> +        case ${lib} in
> +        libc.so*|libm.so*|libstdc++.so*|libpthread.so*|libgcc_s.so*|libdl.so*|ld-*|libgomp.so*|libcrypt.so*|libcrypto.so*|libatomic.so*)
> +            continue
> +            ;;
> +        *)
> +            if test -e ${HOST_DIR}/lib/${lib} ; then
> +                continue
> +            fi
> +            echo "ERROR: in ${f}, ${lib} unknown"
> +            bailout="yes"
> +            ;;
> +        esac
> +    done
> +done
> +
> +if test "${bailout}" = "yes" ; then
> +    exit 1
> +fi
> -- 
> 2.37.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
