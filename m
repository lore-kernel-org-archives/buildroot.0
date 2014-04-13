From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 13 Apr 2014 21:43:20 +0200
Subject: [Buildroot] Patchwork cleanup #8: triaging proposal
Message-ID: <CAAXf6LUKOuGpMV0uzR3gDM++pOu9Ldtb=6FfTGHqXjMdpvCfSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This is the first part of patchwork cleanup session #8. This session
holds a limited number of patches (12) due to time constraints on my
side. I hope to start a new session soon (which can run in parallel to
this one).

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

[RFC,5/7] python-linaro-dashboard-bundle: new package
ludovic.desroches at atmel.com
http://patchwork.ozlabs.org/patch/282728

[RFC,6/7] lava-tool: new package
ludovic.desroches at atmel.com
http://patchwork.ozlabs.org/patch/282729

[RFC,7/7] lava-test: new package
ludovic.desroches at atmel.com
http://patchwork.ozlabs.org/patch/282730

Proposal: A, keep (all three patches)


package/makedevs: add "l" type for symlinks ownership change
angelo dureghello <angelo70@gmail.com>
http://patchwork.ozlabs.org/patch/283015

Proposal: C unsure: what is the reason for this patch?


[v9] espeak: new package
Arnaud Aujon <arnaud.aujon@gmail.com>
http://patchwork.ozlabs.org/patch/284229

python-sip: new package
Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
http://patchwork.ozlabs.org/patch/284873

python-pyqt: new package
Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
http://patchwork.ozlabs.org/patch/284874

Proposal: A keep (above three patches)


[RFC,1/2] host-xxd: new package
Ryan Barnett <rjbarnet@rockwellcollins.com>
http://patchwork.ozlabs.org/patch/285936

[RFC,2/2] uboot: introduce u-boot.pbl format
Ryan Barnett <rjbarnet@rockwellcollins.com>
http://patchwork.ozlabs.org/patch/285937

Although the patch on uboot is quite large, my general feeling is to
triage this in A: keep.


[1/3] ccache: change compilercheck to use compiler and toolchain info
Danomi Manchego <danomimanchego123@gmail.com>
http://patchwork.ozlabs.org/patch/287383

[2/3] ccache: change default cache directory path to match config setting
Danomi Manchego <danomimanchego123@gmail.com>
http://patchwork.ozlabs.org/patch/287384

[3/3] ccache: provide capability to do initial ccache setup
Danomi Manchego <danomimanchego123@gmail.com>
http://patchwork.ozlabs.org/patch/287385

Proposal for the above 3: D more work needed. Looking at Arnout's
comments on the first patch, this needs to be thought through, and a
final solution is to be implemented. I really think we should improve
ccache in buildroot, though, so I hope a proper solution can be found.


Thanks for your feedback,
Thomas
