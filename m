From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 9 Mar 2020 13:52:29 +0100
Subject: [Buildroot] Cross compiling iperf 2 for mips
In-Reply-To: <1276833545.526853.1583756829124@mail1.libero.it>
References: <1276833545.526853.1583756829124@mail1.libero.it>
Message-ID: <20200309135229.26dde92e@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 9 Mar 2020 13:27:09 +0100 (CET), absolutely_free at libero.it wrote:

> Hi,
>
> I am trying to cross compile iperf (version 2) for MIPS big endian (uclibc).
>
> I used buildroot-2019.05.1, set correct TARGET MIPS (big endian) and C library uClibc-ng.
>
> I successfully compiled iperf3 with this command:
>
> $ ./configure --enable-static --disable-shared --target=mips-buildroot-linux-gnu --host=mips-buildroot-linux-gnu CC=/home/user/buildroot-2019.05.1/output/host/bin/mips-linux-gcc --with-openssl=no --disable-profiling --prefix=/opt/iperf3

Why do it outside of buildroot? Why not use the package/iperf3 (BR2_PACKAGE_IPERF3=y) package?

>
> $ make
>
>
> With iperf2, anyawy, I get this error:
>
>
> g++ -Wall -O2 -O2 -DHAVE_CONFIG_H -o iperf Client.o Extractor.o isochronous.o Launch.o List.o Listener.o Locale.o PerfSocket.o ReportCSV.o ReportDefault.o Reporter.o Server.o Settings.o SocketAddr.o gnu_getopt.o gnu_getopt_long.o histogram.o main.o service.o sockets.o stdio.o tcp_window_size.o pdfs.o checksums.o ../compat/libcompat.a -lrt
> /usr/bin/ld: Extractor.o: Relocations in generic ELF (EM: 8)
> /usr/bin/ld: Extractor.o: Relocations in generic ELF (EM: 8)
> Extractor.o: error adding symbols: File in wrong format
> collect2: error: ld returned 1 exit status
> make[2]: *** [iperf] Error 1
> make[2]: Leaving directory `/home/user/src/iperf-2.0.13/src'
> make[1]: *** [all-recursive] Error 1
> make[1]: Leaving directory `/home/user/src/iperf-2.0.13'
> make: *** [all] Error 2
>
>
> my guess (I am pretty neophite :) is that make is using "system" ld, not the one from toolchain.
>
> Anyway, I tried to manually export LD variable to /home/user/buildroot-2019.05.1/output/host/bin/mips-buildroot-linux-uclibc-ld but I got exactly same error.

Why do it outside of buildroot? Why not use the package/iperf (BR2_PACKAGE_IPERF=y) package?

Regards,
Peter

>
>
> Any suggestion? Thank you!
>
>
>
