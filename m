From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 07 Apr 2014 08:27:31 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-04-05
In-Reply-To: <20140406110837.45baff8e@skate>
References: <20140406063010.119BC100CBA@stock.ovh.net>
 <20140406110837.45baff8e@skate>
Message-ID: <53428BA3.3010908@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/06/2014 06:08 AM, Thomas Petazzoni wrote:
>>        arm |                     php-5.5.11 | NOK | http://autobuild.buildroot.net/results/0dadb182d7550f5a7bf86005aef3528165c5b1ec/
> 
> checking for fork... no
> configure: error: pcntl: fork() not supported by this platform
> make: *** [/home/test/test/2/output/build/php-5.5.11/.stamp_configured] Error 1
> 
> Gustavo ?

Hi.
Can't seem to reproduce it here, on gentoo it builds up until the end.
On a debian chroot it fails before on luajit:

make[3]: Entering directory
`/home/gustavoz/b/php/output/build/luajit-2.0.3/src'
HOSTCC    host/minilua.o
HOSTCC    host/buildvm_peobj.o
HOSTCC    host/buildvm_asm.o
In file included from /usr/include/features.h:378,
                 from /usr/include/sys/types.h:27,
                 from host/buildvm.h:9,
                 from host/buildvm_peobj.c:9:
/usr/include/gnu/stubs.h:7:27: error: gnu/stubs-32.h: No such file or
directory
In file included from /usr/include/features.h:378In file included from
/usr/include/features.h:378,
                 from /usr/include/sys/types.h:27,
                 from host/buildvm.h:9,
                 from host/buildvm_asm.c:6:
/usr/include/gnu/stubs.h:7:27: error: gnu/stubs-32.h: No such file or
directory
,
                 from /usr/include/limits.h:27,
                 from
/usr/lib/gcc/x86_64-linux-gnu/4.4.5/include-fixed/limits.h:122,
                 from
/usr/lib/gcc/x86_64-linux-gnu/4.4.5/include-fixed/syslimits.h:7,
                 from
/usr/lib/gcc/x86_64-linux-gnu/4.4.5/include-fixed/limits.h:11,
                 from host/minilua.c:33:
/usr/include/gnu/stubs.h:7:27: error: gnu/stubs-32.h: No such file or
directory
make[3]: *** [host/buildvm_peobj.o] Error 1
make[3]: *** Waiting for unfinished jobs....
make[3]: *** [host/buildvm_asm.o] Error 1
make[3]: *** [host/minilua.o] Error 1
make[3]: Leaving directory
`/home/gustavoz/b/php/output/build/luajit-2.0.3/src'
make[2]: *** [amalg] Error 2
make[2]: Leaving directory
`/home/gustavoz/b/php/output/build/luajit-2.0.3/src'
make[1]: *** [amalg] Error 2
make[1]: Leaving directory `/home/gustavoz/b/php/output/build/luajit-2.0.3'
make: *** [/home/gustavoz/b/php/output/build/luajit-2.0.3/.stamp_built]
Error 2

Regards.
