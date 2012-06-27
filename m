From: Michael J. Hammel <buildroot@graphics-muse.org>
Date: Tue, 26 Jun 2012 20:55:00 -0600
Subject: [Buildroot] RPC and Busybox
In-Reply-To: <20120627000701.506f534e@skate>
References: <20120627000701.506f534e@skate>
Message-ID: <1340765700.13686.18.camel@kepler.gfxmuse.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2012-06-27 at 00:07 +0200, Thomas Petazzoni wrote:
> And we unconditionally enable RPC support in the package (for example,
> we tune the Busybox configuration file or other customization).
> 
> Other suggestions? Thoughts?

I'm not sure which direction is best, but I have a possibly related
issue.  I have a Busybox 1.20.1 configuration that builds correctly
using an external toolchain when built on its own, but when built under
buildroot I get the following:

In file included from util-linux/mount.c:134:0:
/home/mjhammel/src/ximba/bb/src/../bld/buildroot-2012.05.bld/staging//usr/arm-unknown-linux-gnueabi/sysroot/usr/in
clude/rpc/rpc.h:2:28: fatal error: sunrpc/rpc/rpc.h: No such file or
directory
compilation terminated.
make[3]: *** [util-linux/mount.o] Error 1

I'm not sure what to look for here.  I'm using glibc toolchain built
with Crosstool-NG 1.15.1, Busybox 1.20.1, Buildroot 2012.05.  It doesn't
look like there is a sunrpc/rpc/rpc.h in the toolchain.  

Any thoughts on what I should look at here?
-- 
Michael J. Hammel <buildroot@graphics-muse.org>
