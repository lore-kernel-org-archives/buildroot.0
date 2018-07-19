From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 12:16:31 +0200
Subject: [Buildroot] [PATCH] btrfs-progs: adjust install-static patch to
 install headers under $(prefix)/include/btrfs
In-Reply-To: <20180719104200.39029242@windsurf> (Thomas Petazzoni's message of
 "Thu, 19 Jul 2018 10:42:00 +0200")
References: <20180701183408.7305-1-peter@korsgaard.com>
 <20180719104200.39029242@windsurf>
Message-ID: <87zhyncyyo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello Peter,
 > On Sun,  1 Jul 2018 20:34:08 +0200, Peter Korsgaard wrote:
 >> Fixes:
 >> http://autobuild.buildroot.net/results/15cc6523a42bf66508b2b37fd1fcb74625561ec2/
 >> 
 >> btrfs-progs 'make install' installs headers under $(prefix)/include/btrfs,
 >> but our patch to also install headers for 'install-static' installed
 >> directly into $(prefix)/include, confusing other packages as btrfs-progs
 >> headers have very common names such as version, sizes.h, list.h, ioctl.h, ..
 >> 
 >> Fix it by adjusting the patch to also install under $(prefix)/include/btrfs.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Could you backport this patch to 2018.05.x. Indeed, the version.h
 > installed by btrfs-progs confuses the U-Boot build system, which is the
 > reason for the following build failures:

 >   http://autobuild.buildroot.net/?reason=uboot-tools%&branch=2018.05.x

 > The problem doesn't seem to exist on 2018.02.x, because back then, the
 > btrfs-progs version was older and was not installing those headers in
 > bogus locations. At least the specific uboot-tools problem cannot be
 > reproduced on 2018.02.x.

Sure, backported to 2018.05.x. Thanks for the heads up!

-- 
Bye, Peter Korsgaard
