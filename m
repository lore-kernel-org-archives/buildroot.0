From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 19:03:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/trace-cmd: bump to version 2.9.1
In-Reply-To: <87blitqxva.fsf@posteo.net>
References: <20200829134529.17445-1-egorenar-dev@posteo.net>
 <20200829163048.38790541@windsurf.home> <87blitqxva.fsf@posteo.net>
Message-ID: <20200829190301.270130ba@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Aug 2020 17:23:53 +0200
Alexander Egorenkov <egorenar@posteo.net> wrote:

> Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
> 
> >> - This also fixes gcc 10 issues  
> >
> > Do we have autobuilder reports of those build issues ?
> >  
> 
> Not sure but i'm getting a multiple definitions error with binutils 2.34
> and gcc 10.2 which wasn't there with gcc 9.

http://autobuild.buildroot.net/index.php?symbols%5BBR2_PACKAGE_TRACE_CMD%5D=y&symbols%5BBR2_TOOLCHAIN_GCC_AT_LEAST_10%5D=y

gives the list of configurations that had BR2_PACKAGE_TRACE_CMD=y and
are using gcc 10.x. And it turns out that all of them failed for other
reasons, most likely before even reaching the point where trace-cmd
would be built.

> >> --- a/package/trace-cmd/trace-cmd.hash
> >> +++ b/package/trace-cmd/trace-cmd.hash
> >> @@ -1,4 +1,4 @@
> >>  # Locally computed
> >> -sha256 3b3f564cc6ee30341051ccb7589b42f3abe4e676a21c029c7c127c7edf5bdcf0  trace-cmd-trace-cmd-v2.7.tar.gz
> >> -sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> >> +sha256 f7d591ac13ac3de004aa69fa3c2d333f620bb29ad0fec064ec215f488588b333  trace-cmd-trace-cmd-v2.9.1.tar.gz
> >> +sha256 b1d04b850c1c7471b0f0896f6c6f0fcfc9f07e2dd183a5f5826af269fe9e88fb  COPYING  
> >
> > The hash of COPYING has changed, what are the changes ?
> 
> The license didn't change, it has been moved to the files
> LICENSES/GPL-2.0 and LICENSES/LGPL-2.1 instead. And the file COPYING
> contains now references to those files. Not sure why it wasn't done for
> COPYING.LIB though.

At least the hash changed, so we normally want to explain that in the
commit log.

Could you at least rework the patch fixing the cross-compilation issue
to have a proper commit log + Signed-off-by, and be generated using git
format-patch ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
