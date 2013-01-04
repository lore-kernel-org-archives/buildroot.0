From: Steve Calfee <stevecalfee@gmail.com>
Date: Thu, 3 Jan 2013 23:26:37 -0800
Subject: [Buildroot] building a fully configured project
Message-ID: <CAJJ6jxt9Y0hZGAXNQ==U_y1ugUJvRmfmzBEQCFQD0_ZxRcawoA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have a Dockstar and a Raspberry Pi where I build Buildroot test
systems. I put my custom stuff in the current buildroot tree and jump
branches with git etc and things are fine.

I am trying to allow other people to reproduce the build. The current
Buildroot raspberry pi system (http://www.bsquask.com/) just cloned
the entire buildroot tree and did some really weird stuff to get it to
build and be useable as a local gcc compiler etc. This hurts my sense
of elegance and minimization to just clone something as large and
moving as fast as buildroot.

It is current Buildroot policy to have the hardware support packages
be minimal, to just build the tools and a minimal busybox system. This
is good and makes sense to keep the complexity of a distribution for a
particular hardware as small as possible. However that small a config
is too small to be useful and even to show how to expand to a full set
of packages.

The ideal solution is to have another git tree with all the custom
skeleton and private applications and other packages added, like a web
server and html files, php configured etc. This tree would not be part
of Buildroot and would be specific to a particular need. Modifying the
buildroot tree for this will go back into the problems of freezing on
a particular Buildroot version. So again, ideally, another tree could
exist that contains a person's own distribution and configuration, but
outside of the Buildroot git tree, so moving to new versions is
easier.

My question is how do I make a (github or local or something) tree
that is parallel to buildroot to minimize the size of my custom
configuration that is basically a configuration, expansion and
customization of the base buildroot tree?

Regards, Steve
