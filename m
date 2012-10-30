From: Alexander Khryukin <alexander@mezon.ru>
Date: Tue, 30 Oct 2012 14:26:10 +0300
Subject: [Buildroot] Problem building curlftpfs within buildroot
In-Reply-To: <508FB158.1090205@mail.ru>
References: <508FB158.1090205@mail.ru>
Message-ID: <CABtOAfxR4LQnWRRfr7_MrjA=+pw7hH-L8U2M0vweivkkw19_zQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/10/30 Alexander Varnin <fenixk19@mail.ru>

> Hello. I'm trying to build self-made package curlftpfs within buildroot.
> It is simple autotools based package. Build fails with pthread error:
>
> /home/varnin/buildroot/output/**host/usr/lib/gcc/arm-unknown-**
> linux-uclibcgnueabi/4.5.4/../.**./../../arm-unknown-linux-**uclibcgnueabi/bin/ld:
> note: 'pthread_create' is defined in DSO /home/varnin/buildroot/output/**
> host/usr/arm-unknown-linux-**uclibcgnueabi/sysroot/lib/**libpthread.so.0
> so try adding it to the linker command line
> /home/varnin/buildroot/output/**host/usr/arm-unknown-linux-**
> uclibcgnueabi/sysroot/lib/**libpthread.so.0: could not read symbols:
> Invalid operation
> collect2: ld returned 1 exit status
>
> I'm using buildroot toolchain to build my application that uses threads,
> and it compiles and works normally. What could be the problem?
> I'm attaching build log.
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



You forgot add -lpthread to linker flags.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121030/146a2288/attachment.html>
