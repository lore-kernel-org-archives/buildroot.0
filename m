From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 14 Nov 2016 14:34:01 +0000
Subject: [Buildroot] [PATCH] config: bump linux kernel to 4.8.6 in
 synopsys defconfigs
In-Reply-To: <20161114150740.394bdd02@free-electrons.com>
References: <1478793207-31255-1-git-send-email-vzakhar@synopsys.com>
 <20161111151832.1649d24e@free-electrons.com>
 <1479126748.3874.28.camel@synopsys.com>
 <20161114150740.394bdd02@free-electrons.com>
Message-ID: <1479133987.4408.48.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2016-11-14 at 15:07 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 14 Nov 2016 12:32:29 +0000, Vlad Zakharov wrote:
> 
> > 
> > We apologize for coming late with that update.
> > But could you please apply it on master as it is important for us to come up with latest kernel in upcoming
> > Buildroot release.
> > Updated configs were build- and run tested on corresponding platforms, so there shouldn't be any regressions there.
> 
> Once -rc1 has passed, we don't apply version bumps (be it to packages
> or defconfigs), unless they fix a specific issue.
> 
> What is the issue with having this update part of 2017.02 ?

Obviously since we live in upstream everything that could not be applied to
stable branches (i.e. is not a trivial fix and longer than 200 lines) get
merged in newer kernels.

In particular following commit was not accepted in
backports:

http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=840c054fd0efb048df6fceb0c46385ec5b66dfe6

See discussion here?http://www.spinics.net/lists/stable/msg143544.html

The problem is in GCC v6.x newer ABI is used for ARCv2 and so only kernels v4.8+
will work. I.e. existing 4.7 will fail to run user-space apps built with GCC 6.x.

Indeed we may add mentioned off-the-tree patch in BR for 4.7 but I'd rather bump
kernel version here with which we get more fixes across the tree for our users.

-Alexey
