From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Nov 2016 21:41:07 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-11-05
In-Reply-To: <20161106224801.GA2354@tungsten.ozlabs.ibm.com>
References: <20161106073024.E75F820798@mail.free-electrons.com>
 <20161106150623.2b7fd549@free-electrons.com>
 <20161106224801.GA2354@tungsten.ozlabs.ibm.com>
Message-ID: <20161111214107.35d5e256@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sam,

On Mon, 7 Nov 2016 09:48:01 +1100, Sam Bobroff wrote:

> > >    powerpc64 |       docker-containerd-v0.2.4 | NOK | http://autobuild.buildroot.net/results/eb2722d0d771e828697a4a7eb3e64663e1b19fb6  
> > 
> > PowerPC64 support in Go is not good, I propose to disable it since we
> > didn't get any feedback from Geoff.  
> 
> Just a note here: From that thread I posted earlier, Go is supporting
> powerpc64le (which is reasonable given that it's likely what everyone is
> using from Power 8 onwards) fairly well, it's just big endian that's not
> working. I tested a build of docker-containerd on little endian and it
> worked fine.

I've pushed a commit that disables Go on PowerPC64 big-endian:

  https://git.buildroot.org/buildroot/commit/?id=b1a2f09e6956f880c9f56d8be27e38adaca3179f

Could you have a look at the other PowerPC64 build failures, listed at:

  http://autobuild.buildroot.net/?arch=powerpc64&status=NOK

Of course, you should ignore the build failures on flannel,
docker-containerd, docker-engine and runc. But it leaves a bunch of
failures on openblas, libdvbcsa, hwloc (this one might be a parallel
build issue unrelated to ppc64), host-qemu.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
