From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Fri, 22 Oct 2010 15:53:14 +0200
Subject: [Buildroot] Can't compile lsof: no rpc.h ?
In-Reply-To: <201010221340.41660.dargaud@lpsc.in2p3.fr>
References: <201010221340.41660.dargaud@lpsc.in2p3.fr>
Message-ID: <201010221553.14210.dargaud@lpsc.in2p3.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry about that, a make clean solved it.

On Friday 22 October 2010 13:40:41 Guillaume Dargaud wrote:
> Hello all,
> I can't compile lmbench or lsof, it complains that it cannot find rpc.h...
> RPC is enabled in the .config
> 
> /home/dargaud/Devel/buildroot-2010.08/output/staging/usr/bin/powerpc-unknow
> n- linux-uclibc-gcc --
> sysroot=/home/dargaud/Devel/buildroot-2010.08/output/staging -pipe -Os  -
> mtune=405 -msoft-float -
> I/home/dargaud/Devel/buildroot-2010.08/output/staging/usr/include -
> I/home/dargaud/Devel/buildroot-2010.08/output/staging/include   -c -o
> isfn.o isfn.c
> In file included from ../lsof.h:195,
>                  from isfn.c:67:
> ../dlsof.h:59:21: error: rpc/rpc.h: No such file or directory
> ../dlsof.h:60:27: error: rpc/pmap_prot.h: No such file or directory
> make[2]: *** [isfn.o] Error 1
> make[2]: Leaving directory
> `/home/dargaud/Devel/buildroot-2010.08/output/build/lsof_4.81/lsof_4.81_src
> /lib' make[1]: *** [lib/liblsof.a] Error 2
> make[1]: Leaving directory
> `/home/dargaud/Devel/buildroot-2010.08/output/build/lsof_4.81/lsof_4.81_src
> ' make: ***
> [/home/dargaud/Devel/buildroot-2010.08/output/build/lsof_4.81/lsof_4.81_src
> /lsof] Error 2

-- 
Guillaume Dargaud
http://www.gdargaud.net/
