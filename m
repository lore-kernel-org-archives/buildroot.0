From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 16 Mar 2014 08:48:52 +0100
Subject: [Buildroot] Patchwork cleanup #7: triaging proposal
Message-ID: <CAAXf6LWP0FX4AAGP_ACZHgoxEAEwarpEdHchukxE+V=WJnXROg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here is a first patchwork cleanup based on the new patchwork cleanup
proposal [1]. Let's see how this goes and evaluate after one or more
sessions.

Quick recap:
- in this mail, a decision for a number of patches (exact number can
vary) is already proposed. Buildroot developers should provide
feedback stating their agreement/disagreement with this proposed
decision.

- patches are triaged into three categories:
    A. We want this patch and someone should refresh and resend it.
    B. We don't want this patch as it goes against Buildroot principles.
    C. we're not sure and want to know if the submitter is still
interested in pursuing this patch.

- after the brief agreement/disagreement phase, patch submitters are
notified and get two weeks to provide feedback and/or fight the
decision. Patchwork is already updated at the beginning of these two
weeks, but closed patches can always be reopened.

- during this two week cool-off period, new cleanup sessions can already start.


Triage proposal for this session:

A. Patches to keep:
-------------------

directfb-lua: new package
http://patchwork.ozlabs.org/patch/262971/

[v2] Standardisation of $(BUILD)/.root name
http://patchwork.ozlabs.org/patch/265680/

[2/2] arch/Config.in: Allow ARM to select BR2_BINFMT_FLAT
http://patchwork.ozlabs.org/patch/272450/

arch/Config.in: Allow arm7tdmi to select BR2_BINFMT_FLAT
http://patchwork.ozlabs.org/patch/273066/

[Note: the above two patches are related. The feedback in the patch is
to introduce a split between ARCH_HAS_MMU and BR2_USE_MMU, and thus
requires quite some work in the core infrastructure.]


[RFC] uclibc: Don't build shared library if !HAVE_SHARED
http://patchwork.ozlabs.org/patch/273175/

Add pyside + shiboken packages
http://patchwork.ozlabs.org/patch/275929/

[v2,1/1] package: remove the trailing slash sign from $(PKG)_SITE variable
http://patchwork.ozlabs.org/patch/276237/

[v2,1/1] u-boot: allow to pass a custom configuration file
http://patchwork.ozlabs.org/patch/276286/

[v3,01/11] udev: explicitly include pthreads
http://patchwork.ozlabs.org/patch/278298

[v3,02/11] sunxi-mali: add explicit pthread/dl/rt dependencies
http://patchwork.ozlabs.org/patch/278295

[v3,05/11] sunxi-cedarx: bump to newer version, use armel2 binaries, add demo
http://patchwork.ozlabs.org/patch/278299

[v3,08/11] libpng12: new package
http://patchwork.ozlabs.org/patch/278300

[v3,09/11] libpng: ensure libpng12 is installed before libpng
http://patchwork.ozlabs.org/patch/278301

[v3,10/11] glmark2: new package
http://patchwork.ozlabs.org/patch/278304

[v3,11/11] mesa3d-demos: new package
http://patchwork.ozlabs.org/patch/278305


B. Patches to reject:
---------------------

infra: display current task as title of the term window
http://patchwork.ozlabs.org/patch/265214/

[Reason: as stated in the patch discussion, there is a problem when
interrupting the build. An alternative has been suggested: update the
MESSAGEs with a progress indication instead. The patch submitter could
send a new patch implementing this proposal if he is interested.]


C. Unsure / need more investigation:
------------------------------------

[RESEND] package/Makefile.in: Fix dependency for selecting uclinux as TARGET_OS
http://patchwork.ozlabs.org/patch/277119/

libgcc erroneously built as armv5 for arm920t(armv4t)
http://patchwork.ozlabs.org/patch/278212/



Thanks for your feedback,
Thomas


[1] http://lists.busybox.net/pipermail/buildroot/2014-March/091677.html
