From: Bryce Schober <bryce.schober@gmail.com>
Date: Mon, 9 Jan 2012 14:54:13 -0800
Subject: [Buildroot] Can't use output/host/ as "SDK" with external toolchain
Message-ID: <CAJpxd07HP8j=A15yW-PKg_SbMVw3tCeMvTodx2BdcCjR7-7rmQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

What I mean by "SDK" is the ability to compile external programs using the
buildroot toolchain and libraries on any reasonably-compatible host. I'm
assuming that the toolchain itself is built properly static for its own
host independence (which in my case, it is). Ideally the toolchain in the
output/host directory would be capable of standing alone, when built
properly

I'm having two issues w/ archving the output/host dir for extraction and
usage in a different host directory. I'm using a custom-built crosstool-ng
built externally and independent of buildroot.

The external toolchain import results in three distinct problems that I can
see:
1. The symbolic links for binutils binaries in use absolute paths to link
to the external toolchain instead of copying them in.
2. The ext-toolchain-wrapper uses an absolute path for the sysroot
directory.
3. The ext-toolchain-wrapper seems to point to the old (import-from) bin
directory, not the path to which the toolchain has been copied.

I'm not particularly familiar with the relocatability of toolchains or
buildroot's method thereof, and so am not sure where to start with a
proposal, let alone a patch. If I could get some direction as to how best
to tackle this, I'd be grateful.

--
Bryce Schober
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120109/c3ac3fdc/attachment.html>
