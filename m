From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 18 Jul 2014 22:11:52 +0200
Subject: [Buildroot] Patchwork cleanup #10: submitter notification
Message-ID: <CAAXf6LVC4dUWS5kVzx53dRK_4Qo77y1cMOhrKJ14OK_532KY7Q@mail.gmail.com>
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

qemu: add to host utilities menu
Frank Hunleth <fhunleth@troodon-software.com>
http://patchwork.ozlabs.org/patch/299014

D needs more work: there are also some qemu-system patches in
patchwork, and we would like these to get merged.
Moreover, if this patch gets applied, it should go together with
http://patchwork.ozlabs.org/patch/319108/


mono runtime porting to buildroot
Alexander Varnin <fenixk19@mail.ru>
http://patchwork.ozlabs.org/patch/299488

There is a newer patch that not only adds the runtime part, but also
the host part, see http://patchwork.ozlabs.org/patch/351871/


udev: Set the default action to "add" in the startup script
Paul Cercueil <paul@crapouillou.net>
http://patchwork.ozlabs.org/patch/301972

Paul stated that this is really needed.
ThomasP checked that the change is done for OpenEmbedded too, but not
so for ptxDist.
My feeling is to add it, but then again, udev is unknown terrain for me.


[1/2] uclibc: add a missing function member to siginfo.h
Vicente Olivert Riera <Vincent.Riera@imgtec.com>
http://patchwork.ozlabs.org/patch/308384

[2/2] uclibc: Make __SIGEV_PAD_SIZE to take __WORDSIZE into account
Vicente Olivert Riera <Vincent.Riera@imgtec.com>
http://patchwork.ozlabs.org/patch/308383

Both patches are in the problematic uClibc area. It is unclear what to
do with them. If we accept them and thus improve the internal uClibc
support, we diverge more from 'mainline' uClibc (if you could call it
that way) and people using external uClibc toolchains.
I think this is a topic for the upcoming Buildroot Developer Days...
For now I will keep the patches around in patchwork.


[2/2] package: add paragui package
H Hartley Sweeten <hsweeten@visionengravers.com>
http://patchwork.ozlabs.org/patch/309336

Feedback from ThomasP is that this is dead upstream, so we will mark
this as Rejected.


[v2,1/1] gst-ffmpeg: add option for LGPL build
Danomi Manchego <danomimanchego123@gmail.com>
http://patchwork.ozlabs.org/patch/312360

I will keep this patch around, but we need someone familiar in this
area to review and test this patch...


Best regards,
Thomas
