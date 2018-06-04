From: Dan Walkes <danwalkes@trellis-logic.com>
Date: Mon, 4 Jun 2018 15:37:52 -0600
Subject: [Buildroot] [PATCH v2] package/mender: new package
Message-ID: <CAAhKrJ04tvAMGuhPsTjPo-56FvD+Pt0BRBuKysveTTLMHoM1Tg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo,
Thanks for providing this patch.  I'm also interested in buildroot
support for mender.

>> I'm wondering whether this is a real dependency (i.e they are linked
>> with systemd libraries), or whether it is just that they have only
>> tested their integration with systemd.

> BTW, I will look into this if there is the requirement.

I expect it's just that they only test integration with systemd and
systemd is not a requirement.  See the comment at [1] from Mirza Krak
on the Mender dev team.

> Mender does not have a hard-requirement on systemd (BR2_INIT_SYSTEMD),  there is only a conveniently provided systemd service by default.

I've started with the patch at [2], then made a few small changes to
get the package running on an x86 qemu virtual machine with default
sysv init scripts.  See the project at [3] and branch at [4] for
details.

For some reason I don't understand, I needed to add a step to
specifically install the binary after the golang build, it wasn't
happening by default for me.  See the patch at [5].

I've noticed the current mender patches do not have support for
mender-artifact today.  In order to build the mender artifact utility
I think I'd need to build a host golang package based on mender
artifact [6] but it looks like only target packages are currently
supported today with pkg-golang buildroot [7], is that correct?  How
should I build the mender-artifact utility for the host?  What would
be the correct way to invoke the mender-artifact utility to actually
generate the artifact?  Would this be done through a custom post-image
script?

Has work already started on mender-artifact support in another patch
or on a branch somewhere?

Thanks!
Dan

[1] https://groups.google.com/a/lists.mender.io/d/msg/mender/9xQbUpDot5Q/_Ir6FpxAAAAJ
[2] https://patchwork.ozlabs.org/patch/908627/
[3] https://github.com/Trellis-Logic/buildroot-external/tree/add-mender-wip
[4] https://github.com/Trellis-Logic/buildroot/tree/add-mender-wip
[5] https://github.com/Trellis-Logic/buildroot/commit/1be4c0c6a09526de6cfa164476bf42b0dd40617d
[6] https://github.com/mendersoftware/mender-artifact
[7] https://github.com/buildroot/buildroot/blob/c4c85c12eb7f39d2faf54f080de973f7d69224f0/docs/manual/adding-packages-golang.txt#L53
