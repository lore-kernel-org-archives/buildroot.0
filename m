From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu,  2 Aug 2007 15:37:39 +0200
Subject: [Buildroot] staging_dir/usr/lib vs staging_dir/lib
Message-ID: <5LDKl419Lxv1.q7fVdVwY@mailout.dof.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On Wed, Aug 01, 2007 at 07:59:56AM +0200, Hans-Christian Egtvedt wrote:

>Weird, because staging_dir/usr is a symlink to staging_dir/.

This means that you don't use a toolchain that supports sysroot.

For non-sysroot enabled toolchains we currently symlink staging_dir/usr
to staging_dir because the old, deprecated gcc had quite some trouble
otherwise and i don't care to fix them up (since the current stable
series of gcc work fine for me).

Please note that i, personally didn't enable sysroot support for 4.0.x
 but skhill did (IIRC) so you're better off to use 4.2.1 for this.

=> Will work when we have
    an AVR32 4.2.x.
    Highest revision is 4.1.2
    at the moment.

Best Regards
Ulf Samuelsson
