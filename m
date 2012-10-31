From: Alexander Khryukin <alexander@mezon.ru>
Date: Wed, 31 Oct 2012 15:56:26 +0400
Subject: [Buildroot] RPC.h and busybox
In-Reply-To: <20121031114118.GF30343@sapphire.tkos.co.il>
References: <CABtOAfwBq_mbzxnaBd8s0Wu4PeYOiVWUr5AXoZCcaxL5o=T4MQ@mail.gmail.com>
 <20121031114118.GF30343@sapphire.tkos.co.il>
Message-ID: <1351684586.28325.2.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

? ??., 31/10/2012 ? 13:41 +0200, Baruch Siach ?????:
> Hi Alexander,
> 
> On Wed, Oct 31, 2012 at 02:32:08PM +0300, Alexander Khryukin wrote:
> > I'm trying to build busybox with glibc
> > and faced with error
> > 
> > util-linux/mount.c:140:22: fatal error: rpc/rpc.h: No such file or directory
> 
> glibc version newer than 2.13 omits built time support for RPC. See 
> http://sourceware.org/ml/crossgcc/2011-09/msg00005.html.
> 
> > Does anybody have any solution?
> 
> This is a toolchain level problem. Either downgrade to a toolchain with 2.13 
> glibc, or use a toolchain with tirpc.
> 
> baruch
> 


Hi, thanks for answer.
I compiled toolchain via crosstool-ng


[me at kvm-host crosstool-ng-linaro]$ find . -name rpc.h
./.build/src/gcc-linaro-4.7-2012.09/fixincludes/tests/base/rpc/rpc.h
./.build/src/glibc-2.14.1/sunrpc/rpc/rpc.h
./.build/src/glibc-2.14.1/include/rpc/rpc.h


Seems to be rpc.h headers exist in glibc dir
but buildroot not understand it.
