From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Jul 2018 23:07:24 +0200
Subject: [Buildroot] [PATCH] btrfs-progs: adjust install-static patch to
 install headers under $(prefix)/include/btrfs
In-Reply-To: <20180701183408.7305-1-peter@korsgaard.com>
References: <20180701183408.7305-1-peter@korsgaard.com>
Message-ID: <20180702230724.5b3ccf06@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Jul 2018 20:34:08 +0200, Peter Korsgaard wrote:
> Fixes:
> http://autobuild.buildroot.net/results/15cc6523a42bf66508b2b37fd1fcb74625561ec2/
> 
> btrfs-progs 'make install' installs headers under $(prefix)/include/btrfs,
> but our patch to also install headers for 'install-static' installed
> directly into $(prefix)/include, confusing other packages as btrfs-progs
> headers have very common names such as version, sizes.h, list.h, ioctl.h, ..

Wow, nasty stuff indeed with lots of weird consequences.

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
