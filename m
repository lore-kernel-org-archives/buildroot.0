From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Oct 2012 12:03:16 +0100
Subject: [Buildroot] Problem building curlftpfs within buildroot
In-Reply-To: <508FB158.1090205@mail.ru>
References: <508FB158.1090205@mail.ru>
Message-ID: <20121030120316.0faf8a0e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexander Varnin,

On Tue, 30 Oct 2012 14:52:08 +0400, Alexander Varnin wrote:
> Hello. I'm trying to build self-made package curlftpfs within buildroot. 
> It is simple autotools based package. Build fails with pthread error:
> 
> /home/varnin/buildroot/output/host/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.5.4/../../../../arm-unknown-linux-uclibcgnueabi/bin/ld: 
> note: 'pthread_create' is defined in DSO 
> /home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/lib/libpthread.so.0 
> so try adding it to the linker command line
> /home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/lib/libpthread.so.0: 
> could not read symbols: Invalid operation
> collect2: ld returned 1 exit status
> 
> I'm using buildroot toolchain to build my application that uses threads, 
> and it compiles and works normally. What could be the problem?
> I'm attaching build log.

For some reason -lpthread is missing on the link command line.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
