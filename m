From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 10 Oct 2013 16:51:41 +0200
Subject: [Buildroot] legal info: saving of external toolchain
Message-ID: <CAAXf6LXAP+nsmMm7fp0_xvzLNT8cAYof4DECUYhpSs1RzE3Zeg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Luca, all,

The legal info infrastructure currently does not do anything for the
toolchain, for 'technical reasons'. I can't recall what these
technical reasons where. At least for external toolchains I don't see
a big problem to copy the toolchain also in the sources/ subdirectory.
The developer then still has the obligation to also provide the
sources that accompany this binary distribution of the toolchain
(which is impossible for buildroot to do), but at least the binary
version is already taken care of.

In fact, the legal-info target already calls toolchain-legal-info, but
it does not do anything really.

What do you think about implementing this for external toolchains (at
least)? The fact that the toolchain is now using the package
infrastructure probably makes that a tad easier.

Thanks,
Thomas
