From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 19:07:50 +0200
Subject: [Buildroot] [PATCH v7 1/2] dieharder: new package
In-Reply-To: <1486589873-29117-1-git-send-email-julien@vdg.name>
References: <1486589873-29117-1-git-send-email-julien@vdg.name>
Message-ID: <20170401190750.647ecc26@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  8 Feb 2017 22:37:52 +0100, Julien Viard de Galbert wrote:
> Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
> ---
> Changes v6 -> v7
>   - reword comments to try to better explain what's going on
>   - drop patch to not install includes
>   - refresh patches
>   - separated patch to DEVELOPERS
> Changes v5 -> v6
>   - regenerated patched with git format-patch -N
>   - fix dieharder.hash:3: empty line at end of file
>   - fix dieharder.mk:18: expected indent with tabs
> Changes v4 -> v5 (Following Romain's comments)
>   - added comments and signoff to patches
>   - removed select BR2_PACKAGE_LIBTOOL as target libtool is not needed
>   - fixed _LICENSE_FILES path
>   - adding myself to DEVELOPERS for the dieharder package
> Changes v3 -> v4
>   - wrap description to 72 columns (Thomas Petazoni)
>   - fix licence description (Thomas Petazoni)
>   - use _ENV instead of _OPTS for configure tweek (Thomas Petazoni)
>   - fix space around = in .mk (Thomas Petazoni)
>   - switched from _SUBDIR to _STRIP_COMPONENTS to ease patching
>   - added 4 patches :
>      - 2 to fix the build system
>      - 1 for c99 type missing
>      - 1 for compiling with musl libc (Romain Naour, Yann E. MORIN)
>   - depending on libtool, replacing missing libtool m4 files
>      and running autoreconf (found this was necessary when libtool is
>      no installed on host as the tarball ships symlinks to m4 files)
>   - added .hash file
> Changes v2 -> v3
>   - remove intermediate variable use (suggested by Baruch Siach)
> Changes v1 -> v2
>   - fixed typo "bin" instead of "big" (thanks Thomas Petazoni)
>   - select gls in config (suggested by Romain Naour)
>   - specified "includedir" to fix unsafe header path

I've applied, with the following changes:

    [Thomas:
     - remove complicated DIEHARDER_POST_PATCH_FIXUP that replaces bogus
       libtool .m4 files: since we are anyway autoreconfiguring the
       package, this is not necessary. And therefore, remove host-libtool
       in the dependencies.
     - use GPL-2.0 instead of GPLv2
     - add entry in DEVELOPERS file.]

Thanks a lot for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
