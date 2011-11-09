From: Vellemans, Noel <Noel.Vellemans@visionBMS.com>
Date: Wed, 9 Nov 2011 09:26:38 +0100
Subject: [Buildroot] Cygwin build - MPC
Message-ID: <1531E53627F1F749B4FE809BF2A4EB6702C398EE@WETMEX10.loepfe.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Peter, Thomas....


While testing the current git-tree under Linux and cygwin, I have run
into the following build-problem.

Host-mpc fails to build on a windows host (on Cygwin).

It took me a while to understand what was going on, after digging into
1001 things, I finally came up to the point that is may be a mistake
into one of the source files.

[ some steps of the toolchain-build-process, are like black magic to
me... so it took a while to get there... LOL, you can compare this to
people driving a car, they do but there is only 1% op the people that
know all details ... ]

And of course once found... I very quickly ended up with 'googeling' for
the same problem and yes... there was indeed someone that also has
discovered this...

http://lists.gforge.inria.fr/pipermail/mpc-discuss/attachments/20110430/
9b6dfa4b/attachment.obj

http://lists.gforge.inria.fr/pipermail/mpc-discuss/2011-April/000898.htm
l

I don't know how-to fix this for real into the buildroot-git-tree, so
please have a look at it... and maybe you can insert this patch into the
buildroot-tree as well (I know it is officially not supported.. But is
nice to have this working as well).

At this time the cygwin build (for the toolchain only) is still running
(this is very slow compared to the real Linux build and can take up to
20 hours, at least this was how long it took before on the same
virtual-windows-machine) .. So I'm not 100% sure it will reach the end
for the w32-cygwin-toolchain-build.
But host-mpc is being build correctly with the previous named patch,
that's for sure.



Kind regards,
Noel.

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111109/c3461e5d/attachment.html>
