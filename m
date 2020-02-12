From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Feb 2020 22:34:06 +0100
Subject: [Buildroot] udisks situation
In-Reply-To: <4669dcc6-5080-22fc-702e-74f145a1a936@benettiengineering.com>
 (Giulio Benetti's message of "Wed, 12 Feb 2020 21:52:58 +0100")
References: <4669dcc6-5080-22fc-702e-74f145a1a936@benettiengineering.com>
Message-ID: <87sgjffq29.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > Hi All,
 > during bump of udisks package from version 1.0.5(the last known 1.x
 > version) to version 2.8.4 lot of heavy dependencies have been added:
 > - gobject-introspection(upcoming from Adam Duskett[1])
 > - libblockdev(upcoming from me) => libbytesize, volume_key(upcoming from me)
 > - parted
 > - polkit
 > - sg3-utils
 > - libxslt
 > then it needs:
 > - toolchain w/ glibc
 > - nls enabled

 > Adam Duskett, while testing(and fixing) my udisks branch[2] against
 > its gobject-introspection patchset[1], found out that currently Fedora
 > provides both udisks[3] and udisks2[4]. udisks(1) is considered
 > obsolete but they still offer it as a package.

 > Upstream didn't create a dedicated 1.x branch, but considering the
 > amount of dependencies for version 2.x, maybe we could imitate Fedora
 > and keep package "udisks" as it is(since its development stopped on
 > version 1.0.5), and package "udisks2" that will follow upstream.

 > The meaning to keep both packages is to have different memory
 > footprints, but most of all retro-fitting. udisks2 provides
 > "udisksctrl" tool, while udisks(1) provides "udisks" tool that are not
 > compatible.

 > I have already discussed about this in IRC with Thomas Petazzoni and
 > we ended up to keep udisks2 to follow upstream, but udisks(1) seems to
 > be still used.

I don't feel strongly about either, but long term we have to follow
upstream.

Out of interest, why this focus on udisks? We don't have any packages
with reverse dependencies to udisks in Buildroot?

-- 
Bye, Peter Korsgaard
