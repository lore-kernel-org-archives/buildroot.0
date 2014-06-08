From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 8 Jun 2014 22:13:56 +0200
Subject: [Buildroot] Patchwork cleanup #9: submitter notification
Message-ID: <CAAXf6LWRDv-B9Hijq6_xH_Q+t3zno2_QRTdx2Q57C1qeRcd27A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

People in To,

The buildroot community is trying to clean up the backlog of unhandled
patches sent to the mailing list (logged in patchwork [1]). We are
starting from the oldest patches and working our way up towards the
present.

In this mail, one or more patches you sent to the buildroot list are
put in one of four categories:
A. to be refreshed and resent to the list
B. rejected
C. we're unsure, your feedback is requested
D. more thorough changes needed instead of the current patch

If one of your patches falls into category A, it will be added to the
buildroot todo list, meaning that someone will eventually take the
time to refresh and resend the patch. However, if you can spare some
time to do it yourself, then this will greatly accelerate the
inclusion of your patch in buildroot.

If one of your patches falls into category B, you can either accept
the reasons given, or you may disagree in which case we invite you to
discuss the matter with us. In this case, please explain why you think
the patch should still be accepted.

If one of your patches falls into category C, please provide more
feedback. For some patches, our question to you may be if you are
still interested in getting this patch in buildroot or not. Other
patches may be in this category because we don't fully understand its
purpose (yet). Your feedback will help us in making the right choice.

If one of your patches falls into category D, the buildroot developers
accept the problem that the patch is addressing, but believe it should
be fixed in a different way, possibly requiring some changes in the
buildroot core infrastructure.

We propose a two-week period to give you some time to respond with
your feedback.

For this cleanup session, here are the patches:

[1/1] Option to copy Linaro gconv libs to target
Stanislav Vasic <svlasic@gmail.com>
http://patchwork.ozlabs.org/patch/288022

This patch has been marked as Superseded (by someone else, presumably
Yann E. Morin), as a new patch covering the same problem has been
introduced: http://patchwork.ozlabs.org/patch/357067/. The discussion
is ongoing and hopefully we'll soon have a solution to the problem.


[RFC] core: Download all package sources
Clayton Shotwell <clshotwe@rockwellcollins.com>
http://patchwork.ozlabs.org/patch/288224

B. Rejected for now, as per feedback of Clayton.


perf: libelf is required to compile perf
Andi Shyti <andi@etezian.org>
http://patchwork.ozlabs.org/patch/288534

B reject. Manually selecting libelf if you're using older kernel
versions works fine.


[1/1] add support for congatec conga-qmx6
Fabien Lahoudere (ECASINTERS) <fabien.lahoudere@openwide.fr>
http://patchwork.ozlabs.org/patch/288951

A accept (to be refreshed)


gcc: use generic infrastructure for patches
Arnout Vandecappelle <arnout@mind.be>
http://patchwork.ozlabs.org/patch/289052

C unsure. In the 'triaging proposal' Arnout gave more feedback, also
requesting feedback from ThomasP and Peter. No feedback received after
that...


[1/2] util-linux: nommu: Add patch to use vfork in nommu arch.
Sonic Zhang <sonic.adi@gmail.com>
http://patchwork.ozlabs.org/patch/290234

[v2,1/3] e2fsprogs: nommu: Add patch to use vfork in nommu arch.
Sonic Zhang <sonic.adi@gmail.com>
http://patchwork.ozlabs.org/patch/291514

All two patches: C unsure: the first patch has received several
comments but does not seem to have a follow-up version. What to do
with all these Blackfin vfork patches is also unclear to me: should we
wait for upstream to accept them or not?


audiofile: needs dynamic library
Simon Dawson <spdawson@gmail.com>
http://patchwork.ozlabs.org/patch/290552

C unsure: the autobuild problem this patch is supposed to fixed is
still present (http://autobuild.buildroot.org/?reason=audiofile-0.3.6)
but the correctness of the patch has been under discussion. Gustavo
acknowledged the problem. I marked the patch as delegated to him.


[v2,2/3] e2fsprogs: flat: Add patch to append uuid link flag after the
blkid link flags when checking the blkid library in the FLAT binary
mode.
Sonic Zhang <sonic.adi@gmail.com>
http://patchwork.ozlabs.org/patch/291515

B reject: according to me this patch is superseded by commit
http://git.buildroot.org/buildroot/commit/?id=a8da3cd61aafd3e2fd44b87725fcc14b60b93be8.
ThomasP: could you confirm?


[v2] util-linux: flat: Add patch to skip creating dynamic libraries
Sonic Zhang <sonic.adi@gmail.com>
http://patchwork.ozlabs.org/patch/291522

C unsure, is this still relevant? Is the solution correct? I couldn't
answer it...


[2/2] mpg123: use code optimized for ARM NEON SIMD engine if available
Sven Neumann <neumann@teufel.de>
http://patchwork.ozlabs.org/patch/293605

Now superseded by commit 1cf2c6ea93d3bd855df7c9883d3882034f0568fa.

Thanks,
Thomas
