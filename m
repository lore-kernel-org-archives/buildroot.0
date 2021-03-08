From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 8 Mar 2021 23:01:56 +0100
Subject: [Buildroot] Segmentation fault for ICU-68 on LTS 2021.02
In-Reply-To: <CAJe_jjBKPYHrLyOPU=Kji9s6yT1O1u9rRgQTRJ0ODwq77bC2Qg@mail.gmail.com>
References: <CAJe_jjBKPYHrLyOPU=Kji9s6yT1O1u9rRgQTRJ0ODwq77bC2Qg@mail.gmail.com>
Message-ID: <20210308230156.5b234e34@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 7 Mar 2021 19:28:54 +0100, primeroz <primeroznl@gmail.com> wrote:

> Hi,
>
> I just tried building one of my projects on LTS 2021.02 and ICU-68 is
> getting a very strange segmentation fault
>
> note, this is running in a ubuntu:18.04 docker container ( hence as root
> user )
>
> ```
> make[2]: Entering directory
> '/root/buildroot/output/build/icu-68-1/source/data'
> /bin/bash ../mkinstalldirs
>  /root/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib
> LD_LIBRARY_PATH=/root/buildroot/output/build/host-icu-68-1/source/stubdata:/root/buildroot/output/build/host-icu-68-1/source/tools/ctestfw:/root/buildroot/output/build/host-icu-68-1/source/lib:$LD_LIBRARY_PATH
>  /root/buildroot/output/build/host-icu-68-1/source/bin/pkgdata -O
> ../data/icupkg.inc -q -c -s
> /root/buildroot/output/build/icu-68-1/source/data/out/build/icudt68l -d
> ../lib -m dll -r 68.1 -e icudt68  -T ./out/tmp -s ./out/build/icudt68l -p
> icudt68l -L icudata ./out/tmp/icudata.lst -I
> /root/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib
> pkgdata: cd ../lib/ && /usr/bin/install -c libicudata.so.68.1
> /root/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libicudata.so.68.1
> pkgdata: cd
> /root/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib &&
> rm -f libicudata.so.68 && ln -s libicudata.so.68.1 libicudata.so.68
> Segmentation fault (core dumped)
> -- return status = 35584
> Error creating symbolic links. Failed command: cd
> /root/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib &&
> rm -f libicudata.so.68 && ln -s libicudata.so.68.1 libicudata.so.68
> Makefile:184: recipe for target 'install-local' failed
> make[2]: *** [install-local] Error 1
> make[2]: Leaving directory
> '/root/buildroot/output/build/icu-68-1/source/data'
> Makefile:153: recipe for target 'install-recursive' failed
> make[1]: *** [install-recursive] Error 2
> make[1]: Leaving directory '/root/buildroot/output/build/icu-68-1/source'
> package/pkg-generic.mk:286: recipe for target
> '/root/buildroot/output/build/icu-68-1/.stamp_staging_installed' failed
> make: *** [/root/buildroot/output/build/icu-68-1/.stamp_staging_installed]
> Error 2
> ```
>
> Anyone else getting the same ?

Something maybe similar(?) was reported in January, see [1]...

Can you provide your failing config/defconfig?

Can your try get a core dump file and try to analyze it?

Regards,
Peter


[1] http://lists.busybox.net/pipermail/buildroot/2021-January/300457.html
