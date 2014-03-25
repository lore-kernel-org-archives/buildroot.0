From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 25 Mar 2014 21:17:15 +0100
Subject: [Buildroot] Patchwork cleanup #7: triaging proposal
In-Reply-To: <CAAXf6LWP0FX4AAGP_ACZHgoxEAEwarpEdHchukxE+V=WJnXROg@mail.gmail.com>
References: <CAAXf6LWP0FX4AAGP_ACZHgoxEAEwarpEdHchukxE+V=WJnXROg@mail.gmail.com>
Message-ID: <CAAXf6LUkjm0pyg1LTAqLY=+5-B=SAaPq2URdC_5yUu3K66Xn8g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Sun, Mar 16, 2014 at 8:48 AM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Hi all,
>
> Here is a first patchwork cleanup based on the new patchwork cleanup
> proposal [1]. Let's see how this goes and evaluate after one or more
> sessions.
>
> Quick recap:
> - in this mail, a decision for a number of patches (exact number can
> vary) is already proposed. Buildroot developers should provide
> feedback stating their agreement/disagreement with this proposed
> decision.
>
> - patches are triaged into three categories:
>     A. We want this patch and someone should refresh and resend it.
>     B. We don't want this patch as it goes against Buildroot principles.
>     C. we're not sure and want to know if the submitter is still
> interested in pursuing this patch.
>
> - after the brief agreement/disagreement phase, patch submitters are
> notified and get two weeks to provide feedback and/or fight the
> decision. Patchwork is already updated at the beginning of these two
> weeks, but closed patches can always be reopened.
>
> - during this two week cool-off period, new cleanup sessions can already start.
>

A little later than expected, here is the conclusion of this triaging
session. As announced, a two-week cool-off period will be initiated
after notifying the submitters (in a separate mail), allowing them to
provide feedback. In the mean time, new triaging sessions can be
started.

>
> Triage proposal for this session:
>
> A. Patches to keep:
> -------------------
>
> directfb-lua: new package
> http://patchwork.ozlabs.org/patch/262971/

Ezequiel Garcia is no longer actively developing/using this tool. He
is willing to refresh the patch, but as ThomasP pointed out: if no-one
is using the tool it is not really needed to add it as a buildroot
package.
Based on this feedback, I will mark the patch as 'Changes requested'.
Ezequiel can still refresh the patch if/when he wants, but there is no
pressure at all.

>
> [v2] Standardisation of $(BUILD)/.root name
> http://patchwork.ozlabs.org/patch/265680/

With the stamps/ directory being gone after converting the toolchain
packages into the standard package frameworks, this patch no longer
made sense. Arnout submitted a patch removing the last remains of
STAMP_DIR and friends.
The patch as it is is no longer desired, so will be marked as
Rejected. This does not mean the original submitter can submit an
alternate proposal for .root, though.

>
> [2/2] arch/Config.in: Allow ARM to select BR2_BINFMT_FLAT
> http://patchwork.ozlabs.org/patch/272450/
>
> arch/Config.in: Allow arm7tdmi to select BR2_BINFMT_FLAT
> http://patchwork.ozlabs.org/patch/273066/
>
> [Note: the above two patches are related. The feedback in the patch is
> to introduce a split between ARCH_HAS_MMU and BR2_USE_MMU, and thus
> requires quite some work in the core infrastructure.]

Here Yann voted C (unsure) with following explanation:
"As Thomas said, they can't go in as-is. It would be better to add
generic config options (_HAS_MMU, _USE_MMU et al.) first.
So I'd rather say:
    Vote: C, unsure: we do not want _these_ patches, but a better way
    to express such a configuration."

I think we are on the same page regarding the fact that more core work
is needed for this topic. However, my interpretation of category C was
that we'd ask input from the submitter to make a final decision. In
this case, I think we do not need such input: it is clear that work
needs to be done on the core infrastructure. At the same time, neither
A (accept) or B (reject) are good categories, so in fact we really
need a fourth category D (add to todo list).
This is what I did: add an entry to the todo list briefly describing
the problem [1], referring to the patches, and in the mean time keep
the patches around in patchwork as reminder. However, as these are not
patches that 'just' needs to be refreshed like the other patches
marked as 'delegated to pdp', I suggest to use another delegate, like
tpetazzoni to mark the difference. This doesn't mean that ThomasP
needs to do this work, to be clear.

[1] http://elinux.org/Buildroot#Core_Buildroot_infrastructure

>
>
> [RFC] uclibc: Don't build shared library if !HAVE_SHARED
> http://patchwork.ozlabs.org/patch/273175/
>
> Add pyside + shiboken packages
> http://patchwork.ozlabs.org/patch/275929/
>
> [v2,1/1] package: remove the trailing slash sign from $(PKG)_SITE variable
> http://patchwork.ozlabs.org/patch/276237/

Above three marked as 'delegated to pdp', they need to be refreshed and resent.

>
> [v2,1/1] u-boot: allow to pass a custom configuration file
> http://patchwork.ozlabs.org/patch/276286/

C, unsure, as per feedback of Yann. Let's see what the submitter says.

>
> [v3,01/11] udev: explicitly include pthreads
> http://patchwork.ozlabs.org/patch/278298
>
> [v3,02/11] sunxi-mali: add explicit pthread/dl/rt dependencies
> http://patchwork.ozlabs.org/patch/278295

For both the above:
C, unsure: there is some uncertainty regarding the exact cause of the
problem. This should be clarified first.

>
> [v3,05/11] sunxi-cedarx: bump to newer version, use armel2 binaries, add demo
> http://patchwork.ozlabs.org/patch/278299
>
> [v3,08/11] libpng12: new package
> http://patchwork.ozlabs.org/patch/278300
>
> [v3,09/11] libpng: ensure libpng12 is installed before libpng
> http://patchwork.ozlabs.org/patch/278301
>
> [v3,10/11] glmark2: new package
> http://patchwork.ozlabs.org/patch/278304
>
> [v3,11/11] mesa3d-demos: new package
> http://patchwork.ozlabs.org/patch/278305

For all the above: A (delegated to pdp).

>
>
> B. Patches to reject:
> ---------------------
>
> infra: display current task as title of the term window
> http://patchwork.ozlabs.org/patch/265214/
>
> [Reason: as stated in the patch discussion, there is a problem when
> interrupting the build. An alternative has been suggested: update the
> MESSAGEs with a progress indication instead. The patch submitter could
> send a new patch implementing this proposal if he is interested.]

B. Reject

>
>
> C. Unsure / need more investigation:
> ------------------------------------
>
> [RESEND] package/Makefile.in: Fix dependency for selecting uclinux as TARGET_OS
> http://patchwork.ozlabs.org/patch/277119/

C Unsure.

>
> libgcc erroneously built as armv5 for arm920t(armv4t)
> http://patchwork.ozlabs.org/patch/278212/

B Reject: d3539dd5: arch: pass cpu option instead of tune option on
ARM (feedback Yann)


I will try to notify the submitters of these patches soon...

Thanks for the feedback, especially Yann!

Best regards,
Thomas
