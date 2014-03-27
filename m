From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 27 Mar 2014 21:01:44 +0100
Subject: [Buildroot] Patchwork cleanup #7: submitter notification
 (feedback deadline: April 12)
In-Reply-To: <CAAXf6LW5stEOk84f-SiPvnYSxazu7vBgM-cNpQStV7j+dcMrbw@mail.gmail.com>
References: <CAAXf6LW5stEOk84f-SiPvnYSxazu7vBgM-cNpQStV7j+dcMrbw@mail.gmail.com>
Message-ID: <CAAXf6LUAvi_C5NvSa6=mEhcipkBYM6XwPLHhRCZtxBccq05i0g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[stupid me, forgot to put the buildroot list in copy...]

On Thu, Mar 27, 2014 at 9:00 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> People in To,
>
> The buildroot community is trying to clean up the backlog of unhandled
> patches sent to the mailing list (logged in patchwork [1]). We are
> starting from the oldest patches and working our way up towards the
> present.
>
> In this mail, one or more patches you sent to the buildroot list are
> put in one of four categories:
> A. to be refreshed and resent to the list
> B. rejected
> C. we're unsure, your feedback is requested
> D. more thorough changes needed instead of the current patch
>
> If one of your patches falls into category A, it will be added to the
> buildroot todo list, meaning that someone will eventually take the
> time to refresh and resend the patch. However, if you can spare some
> time to do it yourself, then this will greatly accelerate the
> inclusion of your patch in buildroot.
>
> If one of your patches falls into category B, you can either accept
> the reasons given, or you may disagree in which case we invite you to
> discuss the matter with us. In this case, please explain why you think
> the patch should still be accepted.
>
> If one of your patches falls into category C, please provide more
> feedback. For some patches, our question to you may be if you are
> still interested in getting this patch in buildroot or not. Other
> patches may be in this category because we don't fully understand its
> purpose (yet). Your feedback will help us in making the right choice.
>
> If one of your patches falls into category D, the buildroot developers
> accept the problem that the patch is addressing, but believe it should
> be fixed in a different way, possibly requiring some changes in the
> buildroot core infrastructure.
>
> We propose a two-week period to give you some time to respond with
> your feedback.
>
> For this cleanup session, here are the patches:
>
> A. To be refreshed and resent to the list
>
> [RFC] uclibc: Don't build shared library if !HAVE_SHARED
> http://patchwork.ozlabs.org/patch/273175/
> Axel Lin
>
> Add pyside + shiboken packages
> http://patchwork.ozlabs.org/patch/275929/
> Thierry Bultel
>
> [v2,1/1] package: remove the trailing slash sign from $(PKG)_SITE variable
> http://patchwork.ozlabs.org/patch/276237/
> Jerzy Grzegorek
>
> [v3,05/11] sunxi-cedarx: bump to newer version, use armel2 binaries, add demo
> http://patchwork.ozlabs.org/patch/278299
> [v3,08/11] libpng12: new package
> http://patchwork.ozlabs.org/patch/278300
> [v3,09/11] libpng: ensure libpng12 is installed before libpng
> http://patchwork.ozlabs.org/patch/278301
> [v3,10/11] glmark2: new package
> http://patchwork.ozlabs.org/patch/278304
> [v3,11/11] mesa3d-demos: new package
> http://patchwork.ozlabs.org/patch/278305
> Spenser Gilliland
>
> B. Rejected
>
> [v2] Standardisation of $(BUILD)/.root name
> http://patchwork.ozlabs.org/patch/265680/
> Jerome Pouiller
> The stamp directory, that this patch is using, is no longer present.
> Either the patch is to be rejected completely, or a new location for
> .root to be found.
>
> infra: display current task as title of the term window
> http://patchwork.ozlabs.org/patch/265214/
> Francois Perrad
> [Reason: as stated in the patch discussion, there is a problem when
> interrupting the build. An alternative has been suggested: update the
> MESSAGEs with a progress indication instead. The patch submitter could
> send a new patch implementing this proposal if he is interested.]
>
> libgcc erroneously built as armv5 for arm920t(armv4t)
> http://patchwork.ozlabs.org/patch/278212/
> Adam Hussein
> Adam: the problem is supposed to be fixed with the following commit:
> d3539dd5: arch: pass cpu option instead of tune option on ARM
> Please try this instead and let us know if the problem remains...
>
>
> C. Unsure, your feedback is requested
>
> directfb-lua: new package
> http://patchwork.ozlabs.org/patch/262971/
> Ezequiel Garcia
> As discussed, Ezequiel is willing to refresh the patch, but it may not
> be needed if no-one is actually using the tool. Up to Ezequiel to
> decide what to do with this patch.
>
> [v2,1/1] u-boot: allow to pass a custom configuration file
> http://patchwork.ozlabs.org/patch/276286/
> Eric Jarrige
> Yann Morin gave the feedback that this patch allows to overwrite
> u-boot sources, rendering the declared license possible invalid.
> Eric: are you still interested in pursuing this patch? If so, I think
> some further discussion on it should be ignited.
>
> [v3,01/11] udev: explicitly include pthreads
> http://patchwork.ozlabs.org/patch/278298
> [v3,02/11] sunxi-mali: add explicit pthread/dl/rt dependencies
> http://patchwork.ozlabs.org/patch/278295
> Spenser Gilliland
> Spenser: the feedback on these patches was that it was unclear why the
> added dependencies could actually fix the problem. If you still
> believe these changes are necessary, could you restart the discussion
> providing more details?
>
> [RESEND] package/Makefile.in: Fix dependency for selecting uclinux as TARGET_OS
> http://patchwork.ozlabs.org/patch/277119/
> Axel Lin
> Axel: do you still think this patch is necessary? Could you restart
> the discussion on this patch? It is unclear to us whether this is the
> right solution.
>
> D. More thorough changes needed instead of the current patch
>
> [2/2] arch/Config.in: Allow ARM to select BR2_BINFMT_FLAT
> http://patchwork.ozlabs.org/patch/272450/
> arch/Config.in: Allow arm7tdmi to select BR2_BINFMT_FLAT
> http://patchwork.ozlabs.org/patch/273066/
> Axel Lin
> This problem should be handled by introducing a split between
> ARCH_HAS_MMU and ARCH_USE_MMU, as discussed in replies on the patches.
> This requires some work in the core infrastructure.
> Axel: you are welcome to propose a patch, or discuss the issue further with us.
> In the mean time, the topic has been added to the buildroot todo list [2].
>
> Thanks all for your feedback,
>
> Best regards,
> Thomas
>
>
> [1] http://patchwork.ozlabs.org/project/buildroot/list/
> [2] http://www.elinux.org/Buildroot#Todo_list
