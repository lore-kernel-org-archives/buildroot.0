From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 24 Apr 2014 21:46:47 +0200
Subject: [Buildroot] Patchwork cleanup #9: triaging proposal
Message-ID: <CAAXf6LW5GPZ_vegt_jO=xr0e5Qfzjt4Uq7yye6jF3si6qyycBQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This is the first part of patchwork cleanup session #9.

Quick recap:
- in this mail, a decision for a number of patches (exact number can
vary) is already proposed. Buildroot developers should provide
feedback stating their agreement/disagreement with this proposed
decision.

- patches are triaged into four categories:
    A. We want this patch and someone should refresh and resend it.
    B. We don't want this patch as it goes against Buildroot principles.
    C. We're not sure and want to know if the submitter is still
interested in pursuing this patch.
    D. We accept the problem that the patch is fixing, but the patch
can't be integrated in its current state. More work is needed, for
example on the core buildroot infrastructure. Therefore, the patch
will be added to the buildroot TODO list.

- after the brief agreement/disagreement phase, patch submitters are
notified and get two weeks to provide feedback and/or fight the
decision. Patchwork is already updated at the beginning of these two
weeks, but closed patches can always be reopened.

- during this two week cool-off period, new cleanup sessions can already start.


Triage proposal for this session:


[1/1] Option to copy Linaro gconv libs to target
Stanislav Vasic <svlasic@gmail.com>
http://patchwork.ozlabs.org/patch/288022

C unsure: the commit message mentions this is needed for xbmc, but
xbmc has been merged now without this change.


[RFC] core: Download all package sources
Clayton Shotwell <clshotwe@rockwellcollins.com>
http://patchwork.ozlabs.org/patch/288224

C unsure: there was some debate as to this patch is the right way to
proceed, or whether the buildroot mirror should contain more packages,
or provide a way to create a local buildroot mirror.


perf: libelf is required to compile perf
Andi Shyti <andi@etezian.org>
http://patchwork.ozlabs.org/patch/288534

B reject. Manually selecting libelf if you're using older kernel
versions works fine.


[1/1] add support for congatec conga-qmx6
Fabien Lahoudere (ECASINTERS) <fabien.lahoudere@openwide.fr>
http://patchwork.ozlabs.org/patch/288951

A accept


gcc: use generic infrastructure for patches
Arnout Vandecappelle <arnout@mind.be>
http://patchwork.ozlabs.org/patch/289052

C unsure. There has been some discussion on this, and it's unclear to
me if we want this and what the final solution should be. Arnout can
probably provide more input.


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
may possibly provide more details.


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

C unsure: Peter asked a question about this patch that never got answered.


Thanks for the feedback,
Thomas
