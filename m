From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Mar 2014 17:07:12 +0100
Subject: [Buildroot] Patchwork cleanup #7: triaging proposal
In-Reply-To: <CAAXf6LWP0FX4AAGP_ACZHgoxEAEwarpEdHchukxE+V=WJnXROg@mail.gmail.com>
References: <CAAXf6LWP0FX4AAGP_ACZHgoxEAEwarpEdHchukxE+V=WJnXROg@mail.gmail.com>
Message-ID: <20140316160712.GA3267@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-03-16 08:48 +0100, Thomas De Schampheleire spake thusly:
> Here is a first patchwork cleanup based on the new patchwork cleanup
> proposal [1]. Let's see how this goes and evaluate after one or more
> sessions.
[--SNIP--]

Thanks for putting up this list! :-)

> A. Patches to keep:
> -------------------
> 
> directfb-lua: new package
> http://patchwork.ozlabs.org/patch/262971/

    Vote: A, keep.

> [v2] Standardisation of $(BUILD)/.root name
> http://patchwork.ozlabs.org/patch/265680/

    Vote C: unsure.

> [2/2] arch/Config.in: Allow ARM to select BR2_BINFMT_FLAT
> http://patchwork.ozlabs.org/patch/272450/
>
> arch/Config.in: Allow arm7tdmi to select BR2_BINFMT_FLAT
> http://patchwork.ozlabs.org/patch/273066/
> 
> [Note: the above two patches are related. The feedback in the patch is
> to introduce a split between ARCH_HAS_MMU and BR2_USE_MMU, and thus
> requires quite some work in the core infrastructure.]

As Thomas said, they can't go in as-is. It would be better to add
generic config options (_HAS_MMU, _USE_MMU et al.) first.

So I'd rather say:
    Vote: C, unsure: we do not want _these_ patches, but a better way
    to express such a configuration.
 
> [RFC] uclibc: Don't build shared library if !HAVE_SHARED
> http://patchwork.ozlabs.org/patch/273175/

    Vote: A, keep.

> Add pyside + shiboken packages
> http://patchwork.ozlabs.org/patch/275929/

    Vote: A, keep. Needs heavy refresh, though.

> [v2,1/1] package: remove the trailing slash sign from $(PKG)_SITE variable
> http://patchwork.ozlabs.org/patch/276237/

    Vote: A, keep. Needs heavy refresh, though. Pretty trivial to do,
    and very easy to automate. I'll take.

> [v2,1/1] u-boot: allow to pass a custom configuration file
> http://patchwork.ozlabs.org/patch/276286/

    Vote: C, unsure. This is likely to overwrite a uboot source file
    with a local file, so we won't be able to generate conpliant
    legal-info when a custom comnfig file is used.

> [v3,01/11] udev: explicitly include pthreads
> http://patchwork.ozlabs.org/patch/278298

    Vote: C, unsure. There was no feedback on the reason why the change
    was needed in the first place (Peter tested and it worked).
 
> [v3,02/11] sunxi-mali: add explicit pthread/dl/rt dependencies
> http://patchwork.ozlabs.org/patch/278295

    Vote: C, unsure. Same as above.

> [v3,05/11] sunxi-cedarx: bump to newer version, use armel2 binaries, add demo
> http://patchwork.ozlabs.org/patch/278299

    Vote: A, keep.

> [v3,08/11] libpng12: new package
> http://patchwork.ozlabs.org/patch/278300
> 
> [v3,09/11] libpng: ensure libpng12 is installed before libpng
> http://patchwork.ozlabs.org/patch/278301

    Vote: A, keep both.

> [v3,10/11] glmark2: new package
> http://patchwork.ozlabs.org/patch/278304

    Vote: A, keep.

> [v3,11/11] mesa3d-demos: new package
> http://patchwork.ozlabs.org/patch/278305

    Vote: A, keep.

> B. Patches to reject:
> ---------------------
> 
> infra: display current task as title of the term window
> http://patchwork.ozlabs.org/patch/265214/

    Vote: B, reject.

> C. Unsure / need more investigation:
> ------------------------------------
> 
> [RESEND] package/Makefile.in: Fix dependency for selecting uclinux as TARGET_OS
> http://patchwork.ozlabs.org/patch/277119/

    Vote: C, unsure. It looks related to the two other patches above:
        [2/2] arch/Config.in: Allow ARM to select BR2_BINFMT_FLAT
        arch/Config.in: Allow arm7tdmi to select BR2_BINFMT_FLAT

> libgcc erroneously built as armv5 for arm920t(armv4t)
> http://patchwork.ozlabs.org/patch/278212/

    Vote: B, reject. Should be fixed by:
    d3539dd5: arch: pass cpu option instead of tune option on ARM

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
