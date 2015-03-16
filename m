From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 16 Mar 2015 15:45:22 +0000
Subject: [Buildroot] gdbserver located outside *SYSROOT
Message-ID: <1426520722.19530.26.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I just realized that in pre-built ARC GNU tools gdbserver resides
outside of SYSROOT_DIR/ARCH_SYSROOT_DIR.

Historically we put gdbserver in top-level "target-bin" folder.

And I'm wondering how to deal with it to get proper copy of it onto
target if BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY is selected.

 [1] Do we really need to re-consider placement of gdbserver for our
next release of GNU tools for ARC? Then what could be the best location?

 [2] Will setup of TOOLCHAIN_EXTERNAL_FIXUP_CMDS to cp gdbserver to some
related location be a good solution of the problem (if so then maybe
forget about [1] at least until we have multilibbed tools for ARC)?

-Alexey
