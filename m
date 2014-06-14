From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 14 Jun 2014 22:02:31 +0200
Subject: [Buildroot] Patchwork cleanup #10: triaging proposal
Message-ID: <CAAXf6LX2ma3KGuJvskRdLapnev6S2_honVsYaQ5RCzkizbs9OQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This is the first part of patchwork cleanup session #10.

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


Triage proposal for this (short) session:

qemu: add to host utilities menu
Frank Hunleth <fhunleth@troodon-software.com>
http://patchwork.ozlabs.org/patch/299014

A accept


mono runtime porting to buildroot
Alexander Varnin <fenixk19@mail.ru>
http://patchwork.ozlabs.org/patch/299488

B reject/superseded
There is a newer patch that not only adds the runtime part, but also
the host part, see http://patchwork.ozlabs.org/patch/351871/
For the same reason, I already marked
http://patchwork.ozlabs.org/patch/323246/ as Superseded.


udev: Set the default action to "add" in the startup script
Paul Cercueil <paul@crapouillou.net>
http://patchwork.ozlabs.org/patch/301972

C unsure: I asked for more feedback on this patch from the community
but no feedback yet. I don't know if this is correct or not.


[1/2] uclibc: add a missing function member to siginfo.h
Vicente Olivert Riera <Vincent.Riera@imgtec.com>
http://patchwork.ozlabs.org/patch/308384

Based on the feedback from Thomas Petazzoni on this patch, I would say:
B reject


[2/2] uclibc: Make __SIGEV_PAD_SIZE to take __WORDSIZE into account
Vicente Olivert Riera <Vincent.Riera@imgtec.com>
http://patchwork.ozlabs.org/patch/308383

I would guess the same decision as the previous patch applies here:
B reject


[2/2] package: add paragui package
H Hartley Sweeten <hsweeten@visionengravers.com>
http://patchwork.ozlabs.org/patch/309336

Although this package could use a good review because it has some
issues, in general we accept new packages so I would mark this as
A accept


[v2,1/1] gst-ffmpeg: add option for LGPL build
Danomi Manchego <danomimanchego123@gmail.com>
http://patchwork.ozlabs.org/patch/312360

I assume this should be
A accept
but the patch needs review and testing I think.


Thanks for the feedback,
Thomas
