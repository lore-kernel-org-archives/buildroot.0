From: Lijun QIN <lijun.qin2008@gmail.com>
Date: Sun, 12 Feb 2017 16:28:40 -0600
Subject: [Buildroot] bison-2.4.3 compiling issue
Message-ID: <CALD51P_KryQ2hGeqZqYj_vEt6d_Pmcn39aL=p9p6KrW534UGTw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have two projects  using buildroot.

Project one - buildroot-2011.05 + 32-Bit Ubuntu Linux 12.04 works,
Project two - buildroot-2015.11 + 32-Bit Ubuntu Linux 16.04 works
I moved buildroot-2011.05 to Ubuntu Linux 16.04, intending to use Single
build machine for both projects.

But buildroot-2011.05 + 32-Bit Ubuntu Linux 16.04 works fails at
host-bison-2.4.3
Could someboy could offer any adivce ? Using single really helps me
increase efficiency.
Thank you so much,
Lijun Qin


A portion of log attached:

In file included from yyerror.c:20:0:
./stdio.h:458:1: error: 'gets' undeclared here (not in a function)
 _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
 ^
depbase=`echo dup-safer-flag.o | sed 's|[^/]*$|.deps/&|;s|\.o$||'`;\
/usr/bin/gcc  -I.     -O2
-I/home/dfvsmdev/workspace/obi/obi-eval/rootfs/buildroot-2011.05-sdk5.1.2/output/host/include
-I/home/dfvsmdev/workspace/obi/obi-eval/rootfs/buildroot-2011.05-sdk5.1.2/output/host/usr/include
-MT dup-safer-flag.o -MD -MP -MF $depbase.Tpo -c -o dup-safer-flag.o
dup-safer-flag.c &&\
mv -f $depbase.Tpo $depbase.Po
Makefile:1303: recipe for target 'yyerror.o' failed
make[6]: *** [yyerror.o] Error 1
make[6]: *** Waiting for unfinished jobs....
make[6]: Leaving directory
'/home/dfvsmdev/workspace/obi/obi-eval/rootfs/buildroot-2011.05-sdk5.1.2/output/build/host-bison-2.4.3/lib'
Makefile:1325: recipe for target 'all-recursive' failed
make[5]: *** [all-recursive] Error 1
make[5]: Leaving directory
'/home/dfvsmdev/workspace/obi/obi-eval/rootfs/buildroot-2011.05-sdk5.1.2/output/build/host-bison-2.4.3/lib'
Makefile:1100: recipe for target 'all' failed
make[4]: *** [all] Error 2
make[4]: Leaving directory
'/home/dfvsmdev/workspace/obi/obi-eval/rootfs/buildroot-2011.05-sdk5.1.2/output/build/host-bison-2.4.3/lib'
Makefile:1002: recipe for target 'all-recursive' failed
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory
'/home/dfvsmdev/workspace/obi/obi-eval/rootfs/buildroot-2011.05-sdk5.1.2/output/build/host-bison-2.4.3'
Makefile:933: recipe for target 'all' failed
make[2]: *** [all] Error 2
make[2]: Leaving directory
'/home/dfvsmdev/workspace/obi/obi-eval/rootfs/buildroot-2011.05-sdk5.1.2/output/build/host-bison-2.4.3'
package/Makefile.package.in:295: recipe for target
'/home/dfvsmdev/workspace/obi/obi-eval/rootfs/buildroot-2011.05-sdk5.1.2/output/build/host-bison-2.4.3/.stamp_built'
failed
make[1]: ***
[/home/dfvsmdev/workspace/obi/obi-eval/rootfs/buildroot-2011.05-sdk5.1.2/output/build/host-bison-2.4.3/.stamp_built]
Error 2
make[1]: Leaving directory
'/home/dfvsmdev/workspace/obi/obi-eval/rootfs/buildroot-2011.05-sdk5.1.2'
Makefile:343: recipe for target 'rootfs.all' failed
make: *** [rootfs.all] Error 2
dfvsmdev at dfvsmdev-PowerEdge-R530:~/workspace/obi/obi-eval$
/host-bison-2.4.3/.stamp_built' failed
> ^C
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170212/a0eab943/attachment.html>
