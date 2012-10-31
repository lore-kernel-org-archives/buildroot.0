From: Alexander Khryukin <alexander@mezon.ru>
Date: Wed, 31 Oct 2012 16:28:43 +0400
Subject: [Buildroot] RPC.h and busybox
In-Reply-To: <20121031121347.GG30343@sapphire.tkos.co.il>
References: <CABtOAfwBq_mbzxnaBd8s0Wu4PeYOiVWUr5AXoZCcaxL5o=T4MQ@mail.gmail.com>
 <20121031114118.GF30343@sapphire.tkos.co.il>
 <1351684586.28325.2.camel@localhost>
 <20121031121347.GG30343@sapphire.tkos.co.il>
Message-ID: <1351686523.28325.5.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

? ??., 31/10/2012 ? 14:13 +0200, Baruch Siach ?????:
> Hi Alexander,
> 
> On Wed, Oct 31, 2012 at 03:56:26PM +0400, Alexander Khryukin wrote:
> > ? ??., 31/10/2012 ? 13:41 +0200, Baruch Siach ?????:
> > > Hi Alexander,
> > > On Wed, Oct 31, 2012 at 02:32:08PM +0300, Alexander Khryukin wrote:
> > > > I'm trying to build busybox with glibc
> > > > and faced with error
> > > > 
> > > > util-linux/mount.c:140:22: fatal error: rpc/rpc.h: No such file or directory
> > > 
> > > glibc version newer than 2.13 omits built time support for RPC. See 
> > > http://sourceware.org/ml/crossgcc/2011-09/msg00005.html.
> > > 
> > > > Does anybody have any solution?
> > > 
> > > This is a toolchain level problem. Either downgrade to a toolchain with 2.13 
> > > glibc, or use a toolchain with tirpc.
> > 
> > Hi, thanks for answer.
> > I compiled toolchain via crosstool-ng
> > 
> > [me at kvm-host crosstool-ng-linaro]$ find . -name rpc.h
> > ./.build/src/gcc-linaro-4.7-2012.09/fixincludes/tests/base/rpc/rpc.h
> > ./.build/src/glibc-2.14.1/sunrpc/rpc/rpc.h
> > ./.build/src/glibc-2.14.1/include/rpc/rpc.h
> 
> I any of these the standard include path?
> 
> > Seems to be rpc.h headers exist in glibc dir
> > but buildroot not understand it.
> 
> glibc 2.14 still includes run-time RPC support. Only build time support has 
> been removed. This might be the reason you have these headers. However, if 
> these headers are not in the standard includes search path, they are not 
> visible to the code you build with this toolchain.
> 
> baruch
> 


>that updates glibc to 2.16.0 in buildroot

I mean ct-ng of course
