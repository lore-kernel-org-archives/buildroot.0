From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 18 Mar 2017 17:02:25 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-03-17
In-Reply-To: <124f5fc5-6307-f72f-f1be-8f2139dffced@mind.be>
References: <20170318072841.AF04B20775@mail.free-electrons.com>
 <124f5fc5-6307-f72f-f1be-8f2139dffced@mind.be>
Message-ID: <20170318160225.GL23128@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,
Arnout Vandecappelle wrote,

> 
> 
> On 18-03-17 08:28, Thomas Petazzoni wrote:
> > microblazeel |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/240cfb0497b1dd7b5b33b8f64635cca435d49f05
> 
>  I looked at this one and I'm a bit stumped. This is the error:
> .../sysroot/usr/lib/libc.a(clnt_simple.os): In function `callrpc':
> (.text+0x0): multiple definition of `callrpc'
> .../sysroot/usr/lib/libtirpc.a(libtirpc_la-rpc_soc.o):(.text+0x784): first
> defined here
> (and many more like that).
> 
>  It's a bit weird that this object file from the C library even gets linked in.
> The Map file says:
> 
> .../sysroot/usr/lib/libc.a(rpc_thread.os)
> 	.../sysroot/usr/lib/libc.a(cancel.os) (__rpc_thread_destroy)
> (skipping a few levels of indirection here).
> 
>  So somehow the pthread library is pulling in the RPC support from uClibc, which
> obviously conflicts with tirpc.

But if BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y is active, isn't uClibc-ng
build with RPC support? If this is the case, you end up with two RPC
implememtations. That should be handled by Buildroot.

Do you have support for use either libtirpc or uClibc-ng internal
RPC support?

best regards
 Waldemar
