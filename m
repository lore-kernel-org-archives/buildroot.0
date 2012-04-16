From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 16 Apr 2012 17:17:52 +0200
Subject: [Buildroot] util-linux builds and installs lots of unwanted binaries
Message-ID: <1334589472.13607.15.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

recently udev started to depend on util-linux for libblkid. Since then
there are lots of binaries built and installs that did not asked for.
Here's an incomplete list of such binaries:

blockdev, fdformat, fsck.minix, isosize, mkfs, mkfs.bfs, mkfs.minix,
mkswap, swaplabel, sfdisk, getopt, getopt-parse.bash, getopt-parse.tcsh,
cal logger look mcookie namei whereis

Now I am wondering about the best way to change this so that only the
libraries are built and installed unless util-linux is configured
otherwise. I am looking for a solution that can be accepted in buildbot.
And if changes to util-linux are needed, then those should have a chance
to be accepted upstream in util-linux. What would you advice?


Regards,
Sven
