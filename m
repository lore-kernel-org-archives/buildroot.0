From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 5 Jun 2011 00:28:16 +0200
Subject: [Buildroot] libnl 3.0 build failure
In-Reply-To: <001f01cc1d7d$291e7080$7b5b5180$@zuerker.org>
References: <001f01cc1d7d$291e7080$7b5b5180$@zuerker.org>
Message-ID: <BANLkTikVzyN5K+v2v0a+KBZZkJjCJS__Mg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I?m using an external toolchain (older ct-ng), with glibc 2.12.1,kernel
> 2.6.38.7 and try to compile for x86_64.
>
> I keep getting this error:
>
>>>> libnl 3.0 Building
>
> PATH="/data/devil-linux/output/host/bin:/data/devil-linux/output/host/usr/bin:/data/devil-linux/output/host/usr/sbin/:/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/tools/bin"
> PERLLIB="/data/devil-linux/output/host/usr/lib/perl"? /usr/bin/make -j1? -C
> /data/devil-linux/output/build/libnl-3.0/
>
> make[1]: Entering directory `/data/devil-linux/output/build/libnl-3.0'
>
> Making all in include
>
> make[2]: Entering directory
> `/data/devil-linux/output/build/libnl-3.0/include'
>
> make[2]: Nothing to be done for `all'.
>
> make[2]: Leaving directory
> `/data/devil-linux/output/build/libnl-3.0/include'
>
> Making all in lib
>
> make[2]: Entering directory `/data/devil-linux/output/build/libnl-3.0/lib'
>
> /usr/bin/make? all-am
>
> make[3]: Entering directory `/data/devil-linux/output/build/libnl-3.0/lib'
>
> ? CC???? route/pktloc.lo
>
> route/pktloc.c: In function 'read_pktlocs':
>
> route/pktloc.c:127: error: 'YY_BUF_SIZE' undeclared (first use in this
> function)
>
> route/pktloc.c:127: error: (Each undeclared identifier is reported only once
>
> route/pktloc.c:127: error: for each function it appears in.)
>
> route/pktloc.c:97: warning: ignoring return value of 'asprintf', declared
> with attribute warn_unused_result
>
> make[3]: *** [route/pktloc.lo] Error 1
>
> make[3]: Leaving directory `/data/devil-linux/output/build/libnl-3.0/lib'
>
> make[2]: *** [all] Error 2

Could you solve the problem? What happens if you run make again? How
many jobs are you using for compilation (aka make -jx)? Have you tried
the latest BR version from git?

Regards,
Yegor
