From: Gilles Talis <gilles.talis@gmail.com>
Date: Wed, 20 Feb 2013 14:58:29 -0800
Subject: [Buildroot] libmad and AVR32 optimisations
Message-ID: <CAKcgs2zty=9pybVT7FwDMmSK0omc1x9tgwmDkgiMbixjFkv-oA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

There is small issue in the AVR32 optimization patch [1]. This is root
cause for autobuild failures: e01f5a5484299dce1797966445f3972583c67b22
and 7ed0563fbbfc19c93ec5be35d3b6a95e496b4c5d.
Reason is that some fixed-point math routines are implemented in
architecture-specific files. If "architecture-specific optimizations"
option is disabled from the build configuration, these routines are not
compiled, but libmad is built with references to these functions though.

My question is: is this issue worth fixing? I assume that libmad users will
usually enable all possible architecture-specific optimizations.

Thanks
Gilles.

[1] package/libmad/libmad-0.15.1b-optimization.patch.avr32
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130220/7e8a19c1/attachment.html>
