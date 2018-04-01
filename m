From: Ezequiel Garcia <ezequiel@collabora.com>
Date: Sun, 01 Apr 2018 19:44:28 -0300
Subject: [Buildroot] [PATCH] board/ci20: Fix U-Boot build failure
In-Reply-To: <1522621901.1665.1.camel@collabora.com>
References: <20180401135035.29655-1-ezequiel@collabora.com>
 <20180401160555.36587bd1@windsurf> <1522621901.1665.1.camel@collabora.com>
Message-ID: <1522622668.1665.2.camel@collabora.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2018-04-01 at 19:31 -0300, Ezequiel Garcia wrote:
> On Sun, 2018-04-01 at 16:05 +0200, Thomas Petazzoni wrote:
> > Hello,
> > 
> > On Sun,  1 Apr 2018 10:50:35 -0300, Ezequiel Garcia wrote:
> > > Given there is no upstream U-Boot for CI20, the defconfig
> > > sets an ancient version, with old libfdt headers.
> > > 
> > > Enable DTC, so U-Boot can pick Buildroot's libfdt headers
> > > instead of those installed by the host.
> > > 
> > > Fixes multiple errors looking like this:
> > > 
> > > In file included from ../include/libfdt.h:54:0,
> > >                  from fdt_host.h:11,
> > >                  from mkimage.h:22,
> > >                  from aisimage.c:8:
> > > /usr/include/libfdt_env.h:70:30: error: conflicting types for
> > > ?fdt64_t?
> > >  typedef uint64_t FDT_BITWISE fdt64_t;
> > 
> > Which Buildroot version are you using ? We fixed errors like that
> > recently, and I built ci20_defconfig yesterday, and it worked fine
> > for
> > me.
> > 
> 
> I was testing on top of a recent master:
> 
> commit 53e1b222533fd110ab9472480ded126a4762db5e (origin/master,
> origin/HEAD)
> Author: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Date:   Sat Mar 31 15:27:36 2018 +0200
> 
>     package/docker-proxy: convert to golang infrastructure
> 
> ... just tested on top of current master, same error is thrown if
> there
>  are no output/host/include/libfdt* files.
> 
> Can you point me at the recent fixes?
> 

I guess you mean bf733342324b414a1142b57781504111f81c97ea.
Let me take a look at it.
